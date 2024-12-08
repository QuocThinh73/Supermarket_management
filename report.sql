USE Supermarket_Management;

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_CalculateTotalRevenueByPeriod;
CREATE PROCEDURE sp_CalculateTotalRevenueByPeriod(
    IN pPeriodType VARCHAR(10), -- 'month', 'quarter', 'year'
    IN pYear INT,              -- Năm cần tính
    IN pQuarterFilter INT,      -- Lọc theo quý cụ thể (NULL nếu không lọc)
    IN pMonthFilter INT,        -- Lọc theo tháng cụ thể (NULL nếu không lọc)
    IN pCategoryFilter VARCHAR(255) -- Lọc theo danh mục sản phẩm (NULL nếu không lọc)
)
BEGIN
    -- Biến để lưu chuỗi GROUP BY
    DECLARE v_GroupByClause VARCHAR(100);
    DECLARE v_WhereClause VARCHAR(255);

    -- Xác định chuỗi GROUP BY dựa trên loại thời kỳ
    IF pPeriodType = 'month' THEN
        SET v_GroupByClause = "YEAR(s.DateTime), MONTH(s.DateTime)";
    ELSEIF pPeriodType = 'quarter' THEN
        SET v_GroupByClause = "YEAR(s.DateTime), QUARTER(s.DateTime)";
    ELSEIF pPeriodType = 'year' THEN
        SET v_GroupByClause = "YEAR(s.DateTime)";
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid period type. Must be "month", "quarter", or "year".';
    END IF;

    -- Xây dựng câu điều kiện WHERE
    SET v_WhereClause = CONCAT(
        "s.Type = 'Xuất' AND YEAR(s.DateTime) = ", pYear,
        IF(pQuarterFilter IS NOT NULL, CONCAT(" AND QUARTER(s.DateTime) = ", pQuarterFilter), ""),
        IF(pMonthFilter IS NOT NULL, CONCAT(" AND MONTH(s.DateTime) = ", pMonthFilter), ""),
        IF(pCategoryFilter IS NOT NULL, CONCAT(" AND c.CategoryName = '", pCategoryFilter, "'"), "")
    );

    -- Tạo truy vấn động
    SET @query = CONCAT(
        "SELECT ",
        "YEAR(s.DateTime) AS Year, ",
        CASE 
            WHEN pPeriodType = 'month' THEN "MONTH(s.DateTime)" 
            WHEN pPeriodType = 'quarter' THEN "QUARTER(s.DateTime)" 
            ELSE "NULL" 
        END, " AS Period, ",
        "c.CategoryName AS Category, ",
        "SUM(s.Quantity * p.Price) AS TotalRevenue ",
        "FROM StockSale s ",
        "JOIN Product p ON s.ProductID = p.ProductID ",
        "JOIN Category c ON p.CategoryID = c.CategoryID ",
        "WHERE ", v_WhereClause, " ",
        "GROUP BY ", v_GroupByClause, ", c.CategoryName ",
        "ORDER BY Year, Period, TotalRevenue DESC"
    );

    -- Chuẩn bị và thực thi truy vấn
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

CALL sp_CalculateTotalRevenueByPeriod('year', NULL, NULL, NULL, 'Bánh kẹo các loại');
CALL sp_CalculateTotalRevenueByPeriod('quarter', 2024, 2, NULL, NULL);
CALL sp_CalculateTotalRevenueByPeriod('month', 2024, NULL, 10, 'Mì, miến, cháo, phở');
CALL sp_CalculateTotalRevenueByPeriod('year', 2024, NULL, NULL, NULL);

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_GetStockReport;
CREATE PROCEDURE sp_GetStockReport(
    IN pYear INT,
    IN pMonth INT,
    IN pDay INT,
    IN pCategoryFilter VARCHAR(255),
    IN pProductFilter VARCHAR(255) -- Lọc theo tên sản phẩm (NULL nếu không lọc)
)
BEGIN
    -- Khai báo các biến
    DECLARE v_Year INT;
    DECLARE v_Month INT;
    DECLARE v_Day INT;

    -- Kiểm tra các tham số đầu vào
    IF (pYear IS NULL AND pMonth IS NULL AND pDay IS NULL) THEN
        -- Nếu không có giá trị nào được cung cấp, dùng ngày hiện tại
        SET v_Year = YEAR(CURRENT_DATE);
        SET v_Month = MONTH(CURRENT_DATE);
        SET v_Day = DAY(CURRENT_DATE);
    ELSEIF (pYear IS NULL OR pMonth IS NULL OR pDay IS NULL) THEN
        -- Nếu thiếu bất kỳ giá trị nào trong năm/tháng/ngày, báo lỗi
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Please provide complete values for year, month, and day.';
    ELSE
        -- Gán giá trị từ tham số đầu vào
        SET v_Year = pYear;
        SET v_Month = pMonth;
        SET v_Day = pDay;
    END IF;

    -- Xây dựng câu điều kiện WHERE
    DECLARE v_WhereClause VARCHAR(500);

    SET v_WhereClause = CONCAT(
        "YEAR(s.DateTime) = ", v_Year, " AND ",
        "MONTH(s.DateTime) = ", v_Month, " AND ",
        "DAY(s.DateTime) = ", v_Day, " ",
        IF(pCategoryFilter IS NOT NULL, CONCAT("AND c.CategoryName = '", pCategoryFilter, "' "), ""),
        IF(pProductFilter IS NOT NULL, CONCAT("AND p.ProductName = '", pProductFilter, "' "), "")
    );

    -- Truy vấn chính
    SET @query = CONCAT(
        "SELECT ",
        "p.ProductID, ",
        "p.ProductName, ",
        "c.CategoryName, ",
        "SUM(CASE WHEN s.Type = 'Nhập' THEN s.Quantity ELSE 0 END) - ",
        "SUM(CASE WHEN s.Type = 'Xuất' THEN s.Quantity ELSE 0 END) AS StockRemaining ",
        "FROM StockSale s ",
        "JOIN Product p ON s.ProductID = p.ProductID ",
        "JOIN Category c ON p.CategoryID = c.CategoryID ",
        "WHERE ", v_WhereClause, " ",
        "GROUP BY p.ProductID, p.ProductName, c.CategoryName ",
        "HAVING StockRemaining > 0 ",
        "ORDER BY StockRemaining DESC"
    );

    -- Thực thi truy vấn động
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

CALL sp_GetStockReport(2024, 10, 7, 'Mì, miến, cháo, phở', NULL);
CALL sp_GetStockReport(2024, 10, 7, NULL, 'Thùng 30 gói mì Hảo Hảo tôm chua cay 75g');
CALL sp_GetStockReport(2024, 10, 7, 'Mì, miến, cháo, phở', 'Thùng 30 gói mì Hảo Hảo tôm chua cay 75g');
CALL sp_GetStockReport(NULL, NULL, NULL, NULL, NULL);

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_GetCustomerAddress;
CREATE PROCEDURE sp_GetCustomerAddress(
    IN p_CustomerID INT
)
BEGIN
    IF p_CustomerID IS NULL THEN
        -- Trường hợp không cung cấp CustomerID, hiển thị tất cả khách hàng
        SELECT 
            CustomerID, 
            LastName, 
            MiddleName, 
            FirstName, 
            Address
        FROM 
            Customer;
    ELSE
        -- Trường hợp cung cấp CustomerID, hiển thị khách hàng cụ thể
        SELECT 
            CustomerID, 
            LastName, 
            MiddleName, 
            FirstName, 
            Address
        FROM 
            Customer
        WHERE 
            CustomerID = p_CustomerID;
    END IF;
END $$

DELIMITER ;

CALL sp_GetCustomerAddress(NULL);
CALL sp_GetCustomerAddress(15);

DELIMITER $$

DROP PROCEDURE IF EXISTS sp_GetReturningCustomers;
CREATE PROCEDURE sp_GetReturningCustomers()
BEGIN
    -- Tính tổng số lần thanh toán (cần cho tỷ lệ quay lại)
    DECLARE totalPayments INT;
    SELECT COUNT(PaymentID) INTO totalPayments FROM Payment;

    -- Báo cáo khách hàng quay lại mua hàng
    SELECT 
        c.CustomerID,
        c.LastName,
        c.MiddleName,
        c.FirstName,
        COUNT(p.PaymentID) AS NumberOfPayments,
        ROUND(((COUNT(p.PaymentID) - 1) / totalPayments) * 100, 2) AS ReturnRate -- Tỷ lệ quay lại (%)
    FROM 
        Customer c
    LEFT JOIN 
        Payment p ON c.CustomerID = p.CustomerID
    GROUP BY 
        c.CustomerID, c.LastName, c.MiddleName, c.FirstName
    HAVING 
        COUNT(p.PaymentID) > 1; -- Chỉ chọn khách hàng có hơn 1 lần thanh toán
END $$

DELIMITER ;

CALL sp_GetReturningCustomers();

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

CALL sp_EmployeeMonthlyRanking(2024, 6);

