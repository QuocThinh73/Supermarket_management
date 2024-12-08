USE Supermarket_Management;

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_CalculateMonthlyPayroll;
CREATE PROCEDURE sp_CalculateMonthlyPayroll(
    IN pYear INT,
    IN pMonth INT
)
BEGIN
    DECLARE v_PayPeriodStart DATE;
    DECLARE v_PayPeriodEnd DATE;
    DECLARE v_MonthDays INT;

    SET v_PayPeriodStart = MAKEDATE(pYear, 1) + INTERVAL (pMonth - 1) MONTH;
    SET v_PayPeriodEnd = LAST_DAY(v_PayPeriodStart);

    SET v_MonthDays = DATEDIFF(v_PayPeriodEnd, v_PayPeriodStart) + 1;

    CREATE TEMPORARY TABLE IF NOT EXISTS TempPayrollResult (
        EmployeeID INT,
        EmployeeName NVARCHAR(50),
        PositionName NVARCHAR(50),
        NetBaseSalary DECIMAL(18,2),
        WorkingDays INT,
        TotalBonuses INT,
        TotalOvertimePay INT,
        TotalDeductions INT,
        NetSalary DECIMAL(18,2)
    ) ENGINE=MEMORY;

    TRUNCATE TABLE TempPayrollResult;

    INSERT INTO TempPayrollResult (
        EmployeeID,
        EmployeeName,
        PositionName,
        NetBaseSalary,
        WorkingDays,
        TotalBonuses,
        TotalOvertimePay,
        TotalDeductions,
        NetSalary
    )
    SELECT 
        e.EmployeeID,
        CONCAT(e.LastName, ' ', e.MiddleName, ' ', e.FirstName) AS EmployeeName,
        pos.PositionName,
        pos.BaseSalary AS NetBaseSalary,
        LEAST(
            v_MonthDays,
            GREATEST(0, DATEDIFF(
                LEAST(IFNULL(ph.EndDate, v_PayPeriodEnd), v_PayPeriodEnd),
                GREATEST(ph.StartDate, v_PayPeriodStart)
            ) + 1)
        ) AS WorkingDays,
        0 AS TotalBonuses,
        0 AS TotalOvertimePay,
        0 AS TotalDeductions,
        0 AS NetSalary
    FROM Employee e
    JOIN (
        SELECT EmployeeID, MIN(StartDate) AS EarliestStartDate
        FROM PositionHistory
        GROUP BY EmployeeID
    ) est ON e.EmployeeID = est.EmployeeID
    JOIN PositionHistory ph ON ph.EmployeeID = e.EmployeeID
       AND ph.StartDate <= v_PayPeriodEnd
       AND (ph.EndDate IS NULL OR ph.EndDate >= v_PayPeriodStart)
    JOIN Position pos ON pos.PositionID = ph.PositionID;

    UPDATE TempPayrollResult tr
    JOIN (
        SELECT EmployeeID, MIN(StartDate) AS EarliestStartDate
        FROM PositionHistory
        GROUP BY EmployeeID
    ) est ON tr.EmployeeID = est.EmployeeID
    SET tr.NetBaseSalary = tr.NetBaseSalary * 
                           (1 + FLOOR(TIMESTAMPDIFF(MONTH, est.EarliestStartDate, v_PayPeriodEnd)/6)*0.1);

    UPDATE TempPayrollResult tr
    LEFT JOIN (
        SELECT EmployeeID, SUM(Amount) AS BonusSum
        FROM Bonus
        WHERE `Date` BETWEEN v_PayPeriodStart AND v_PayPeriodEnd
        GROUP BY EmployeeID
    ) b ON b.EmployeeID = tr.EmployeeID
    SET tr.TotalBonuses = COALESCE(b.BonusSum,0);

    UPDATE TempPayrollResult tr
    LEFT JOIN (
        SELECT EmployeeID, SUM(Hours * OvertimeRate) AS OvertimeSum
        FROM Overtime
        WHERE `Date` BETWEEN v_PayPeriodStart AND v_PayPeriodEnd
        GROUP BY EmployeeID
    ) o ON o.EmployeeID = tr.EmployeeID
    SET tr.TotalOvertimePay = COALESCE(o.OvertimeSum,0);

    UPDATE TempPayrollResult tr
    LEFT JOIN (
        SELECT EmployeeID, SUM(Amount) AS DeductionSum
        FROM Deduction
        WHERE `Date` BETWEEN v_PayPeriodStart AND v_PayPeriodEnd
        GROUP BY EmployeeID
    ) d ON d.EmployeeID = tr.EmployeeID
    SET tr.TotalDeductions = COALESCE(d.DeductionSum,0);

    UPDATE TempPayrollResult
    SET NetSalary = (NetBaseSalary * (WorkingDays / v_MonthDays))
                    + TotalBonuses + TotalOvertimePay - TotalDeductions;

    DELETE FROM TempPayrollResult 
    WHERE WorkingDays <= 0;

    SELECT EmployeeName, PositionName, NetBaseSalary, WorkingDays, TotalBonuses, TotalOvertimePay, TotalDeductions, NetSalary
    FROM TempPayrollResult
    ORDER BY NetSalary DESC;

END$$

DELIMITER ;

CALL sp_CalculateMonthlyPayroll(2024, 8);

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_EmployeeMonthlyRanking;
CREATE PROCEDURE sp_EmployeeMonthlyRanking(
    IN pYear INT,
    IN pMonth INT
)
BEGIN
    DECLARE v_StartDate DATE;
    DECLARE v_EndDate DATE;

    SET v_StartDate = MAKEDATE(pYear, 1) + INTERVAL (pMonth - 1) MONTH;
    SET v_EndDate = LAST_DAY(v_StartDate);

    CREATE TEMPORARY TABLE IF NOT EXISTS TempRanking (
        EmployeeID INT,
        EmployeeName NVARCHAR(50),
        OvertimeHours INT,
        BonusCount INT,
        DeductionCount INT,
        Score INT
    ) ENGINE=MEMORY;

    TRUNCATE TABLE TempRanking;

    INSERT INTO TempRanking (EmployeeID, EmployeeName, OvertimeHours, BonusCount, DeductionCount, Score)
    SELECT
        e.EmployeeID,
        CONCAT(e.LastName, ' ', e.MiddleName, ' ', e.FirstName) AS EmployeeName,
        COALESCE(o.OvertimeHours, 0) AS OvertimeHours,
        COALESCE(b.BonusCount, 0) AS BonusCount,
        COALESCE(d.DeductionCount, 0) AS DeductionCount,
        0 AS Score
    FROM Employee e
    LEFT JOIN (
        SELECT EmployeeID, SUM(Hours) AS OvertimeHours
        FROM Overtime
        WHERE Date BETWEEN v_StartDate AND v_EndDate
        GROUP BY EmployeeID
    ) o ON e.EmployeeID = o.EmployeeID
    LEFT JOIN (
        SELECT EmployeeID, COUNT(*) AS BonusCount
        FROM Bonus
        WHERE `Date` BETWEEN v_StartDate AND v_EndDate
        GROUP BY EmployeeID
    ) b ON e.EmployeeID = b.EmployeeID
    LEFT JOIN (
        SELECT EmployeeID, COUNT(*) AS DeductionCount
        FROM Deduction
        WHERE `Date` BETWEEN v_StartDate AND v_EndDate
        GROUP BY EmployeeID
    ) d ON e.EmployeeID = d.EmployeeID;

    UPDATE TempRanking
    SET Score = OvertimeHours + BonusCount - DeductionCount;

    SELECT EmployeeName, OvertimeHours, BonusCount, DeductionCount, Score
    FROM TempRanking
    ORDER BY Score DESC, EmployeeName ASC;

END$$

DELIMITER ;

CALL sp_EmployeeMonthlyRanking(2024, 11);

