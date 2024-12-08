DELIMITER $$

DROP PROCEDURE IF EXISTS sp_CalculateMonthlyPayroll;
CREATE PROCEDURE sp_CalculateMonthlyPayroll(
    IN pYear INT,
    IN pMonth INT
)
BEGIN
    DECLARE v_PayPeriodStart DATE;
    DECLARE v_PayPeriodEnd DATE;

    -- Xác định kỳ lương: từ ngày đầu tháng đến ngày cuối tháng
    SET v_PayPeriodStart = MAKEDATE(pYear, 1) + INTERVAL (pMonth - 1) MONTH;
    SET v_PayPeriodEnd = LAST_DAY(v_PayPeriodStart);

    -- Bảng tạm lưu kết quả lương, loại bỏ cột BaseSalary
    CREATE TEMPORARY TABLE IF NOT EXISTS TempPayrollResult (
        EmployeeID INT,
        EmployeeName NVARCHAR(50),
        PositionName NVARCHAR(50),
        NetBaseSalary DECIMAL(18,2),
        ActualWorkingDays INT,
        TotalBonuses INT,
        TotalOvertimePay INT,
        TotalDeductions INT,
        NetSalary DECIMAL(18,2)
    ) ENGINE=MEMORY;

    TRUNCATE TABLE TempPayrollResult;

    -- Chèn dữ liệu vào bảng tạm, không chèn BaseSalary nữa
    INSERT INTO TempPayrollResult (
        EmployeeID,
        EmployeeName,
        PositionName,
        NetBaseSalary,
        ActualWorkingDays,
        TotalBonuses,
        TotalOvertimePay,
        TotalDeductions,
        NetSalary
    )
    SELECT 
        e.EmployeeID,
        CONCAT(e.LastName, ' ', e.MiddleName, ' ', e.FirstName) AS EmployeeName,
        pos.PositionName,
        -- Thay vì BaseSalary, ta chèn luôn giá trị tạm NetBaseSalary bằng công thức hoặc để tạm bằng pos.BaseSalary trước rồi UPDATE sau
        pos.BaseSalary AS NetBaseSalary,
        LEAST(
            DATEDIFF(v_PayPeriodEnd, v_PayPeriodStart) + 1,
            GREATEST(0, DATEDIFF(
                LEAST(IFNULL(ph.EndDate, v_PayPeriodEnd), v_PayPeriodEnd),
                GREATEST(ph.StartDate, v_PayPeriodStart)
            ) + 1)
        ) AS ActualWorkingDays,
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

    -- Tính lại NetBaseSalary dựa trên EarliestStartDate
    UPDATE TempPayrollResult tr
    JOIN (
        SELECT EmployeeID, MIN(StartDate) AS EarliestStartDate
        FROM PositionHistory
        GROUP BY EmployeeID
    ) est ON tr.EmployeeID = est.EmployeeID
    SET tr.NetBaseSalary = tr.NetBaseSalary * 
                           (1 + FLOOR(TIMESTAMPDIFF(MONTH, est.EarliestStartDate, v_PayPeriodEnd)/6)*0.1);

    -- Tính tổng Bonus trong kỳ
    UPDATE TempPayrollResult tr
    LEFT JOIN (
        SELECT EmployeeID, SUM(Amount) AS BonusSum
        FROM Bonus
        WHERE `Date` BETWEEN v_PayPeriodStart AND v_PayPeriodEnd
        GROUP BY EmployeeID
    ) b ON b.EmployeeID = tr.EmployeeID
    SET tr.TotalBonuses = COALESCE(b.BonusSum,0);

    -- Tính tổng Overtime trong kỳ
    UPDATE TempPayrollResult tr
    LEFT JOIN (
        SELECT EmployeeID, SUM(Hours * OvertimeRate) AS OvertimeSum
        FROM Overtime
        WHERE `Date` BETWEEN v_PayPeriodStart AND v_PayPeriodEnd
        GROUP BY EmployeeID
    ) o ON o.EmployeeID = tr.EmployeeID
    SET tr.TotalOvertimePay = COALESCE(o.OvertimeSum,0);

    -- Tính tổng Deduction trong kỳ
    UPDATE TempPayrollResult tr
    LEFT JOIN (
        SELECT EmployeeID, SUM(Amount) AS DeductionSum
        FROM Deduction
        WHERE `Date` BETWEEN v_PayPeriodStart AND v_PayPeriodEnd
        GROUP BY EmployeeID
    ) d ON d.EmployeeID = tr.EmployeeID
    SET tr.TotalDeductions = COALESCE(d.DeductionSum,0);

    -- Tính NetSalary
    UPDATE TempPayrollResult
    SET NetSalary = (NetBaseSalary * (ActualWorkingDays / 30))
                    + TotalBonuses + TotalOvertimePay - TotalDeductions;

    -- Loại bỏ nhân viên không làm việc trong kỳ
    DELETE FROM TempPayrollResult 
    WHERE ActualWorkingDays <= 0;

    -- Xuất kết quả cuối cùng, giờ đây không còn cột BaseSalary
    SELECT * FROM TempPayrollResult;

END$$

DELIMITER ;

CALL sp_CalculateMonthlyPayroll(2023, 9);
