USE Supermarket_Management;

-- ====================================================================
-- CATEGORY
-- Insert Category
DELIMITER $$
CREATE PROCEDURE sp_insert_category(
    IN p_CategoryName NVARCHAR(30),
    IN p_Description NVARCHAR(50)
)
BEGIN
    INSERT INTO Category (CategoryName, `Description`)
    VALUES (p_CategoryName, p_Description);
END$$
DELIMITER ;

-- Update Category
DELIMITER $$
CREATE PROCEDURE sp_update_category(
    IN p_CategoryID INT UNSIGNED,
    IN p_CategoryName NVARCHAR(30),
    IN p_Description NVARCHAR(50)
)
BEGIN
    UPDATE Category
    SET CategoryName = p_CategoryName,
        `Description` = p_Description
    WHERE CategoryID = p_CategoryID;
END$$
DELIMITER ;

-- Delete Category
DELIMITER $$
CREATE PROCEDURE sp_delete_category(
    IN p_CategoryID INT UNSIGNED
)
BEGIN
    DELETE FROM Category
    WHERE CategoryID = p_CategoryID;
END$$
DELIMITER ;

-- ====================================================================
-- SUPPLIER
-- Insert Supplier
DELIMITER $$
CREATE PROCEDURE sp_insert_supplier(
    IN p_SupplierName NVARCHAR(70),
    IN p_Phone VARCHAR(15),
    IN p_Email VARCHAR(40),
    IN p_Website VARCHAR(30),
    IN p_Address VARCHAR(120)
)
BEGIN
    INSERT INTO Supplier (SupplierName, Phone, Email, Website, Address)
    VALUES (p_SupplierName, p_Phone, p_Email, p_Website, p_Address);
END$$
DELIMITER ;

-- Update Supplier
DELIMITER $$
CREATE PROCEDURE sp_update_supplier(
    IN p_SupplierID INT UNSIGNED,
    IN p_SupplierName NVARCHAR(70),
    IN p_Phone VARCHAR(15),
    IN p_Email VARCHAR(40),
    IN p_Website VARCHAR(30),
    IN p_Address VARCHAR(120)
)
BEGIN
    UPDATE Supplier
    SET SupplierName = p_SupplierName,
        Phone = p_Phone,
        Email = p_Email,
        Website = p_Website,
        Address = p_Address
    WHERE SupplierID = p_SupplierID;
END$$
DELIMITER ;

-- Delete Supplier
DELIMITER $$
CREATE PROCEDURE sp_delete_supplier(
    IN p_SupplierID INT UNSIGNED
)
BEGIN
    DELETE FROM Supplier
    WHERE SupplierID = p_SupplierID;
END$$
DELIMITER ;

-- ====================================================================
-- PRODUCT
-- Insert Product
DELIMITER $$
CREATE PROCEDURE sp_insert_product(
    IN p_ProductName NVARCHAR(70),
    IN p_CategoryID INT UNSIGNED,
    IN p_SupplierID INT UNSIGNED,
    IN p_CostPrice INT UNSIGNED,
    IN p_Price INT UNSIGNED,
    IN p_Unit NVARCHAR(10),
    IN p_ExpirationDate DATETIME
)
BEGIN
    INSERT INTO Product (ProductName, CategoryID, SupplierID, CostPrice, Price, Unit, ExpirationDate)
    VALUES (p_ProductName, p_CategoryID, p_SupplierID, p_CostPrice, p_Price, p_Unit, p_ExpirationDate);
END$$
DELIMITER ;

-- Update Product
DELIMITER $$
CREATE PROCEDURE sp_update_product(
    IN p_ProductID INT UNSIGNED,
    IN p_ProductName NVARCHAR(70),
    IN p_CategoryID INT UNSIGNED,
    IN p_SupplierID INT UNSIGNED,
    IN p_CostPrice INT UNSIGNED,
    IN p_Price INT UNSIGNED,
    IN p_Unit NVARCHAR(10),
    IN p_ExpirationDate DATETIME
)
BEGIN
    UPDATE Product
    SET ProductName = p_ProductName,
        CategoryID = p_CategoryID,
        SupplierID = p_SupplierID,
        CostPrice = p_CostPrice,
        Price = p_Price,
        Unit = p_Unit,
        ExpirationDate = p_ExpirationDate
    WHERE ProductID = p_ProductID;
END$$
DELIMITER ;

-- Delete Product
DELIMITER $$
CREATE PROCEDURE sp_delete_product(
    IN p_ProductID INT UNSIGNED
)
BEGIN
    DELETE FROM Product
    WHERE ProductID = p_ProductID;
END$$
DELIMITER ;

-- ====================================================================
-- CUSTOMER
-- Insert Customer
DELIMITER $$
CREATE PROCEDURE sp_insert_customer(
    IN p_LastName NVARCHAR(10),
    IN p_MiddleName NVARCHAR(20),
    IN p_FirstName NVARCHAR(10),
    IN p_Phone VARCHAR(15),
    IN p_Email VARCHAR(30),
    IN p_Address VARCHAR(120)
)
BEGIN
    INSERT INTO Customer (LastName, MiddleName, FirstName, Phone, Email, Address)
    VALUES (p_LastName, p_MiddleName, p_FirstName, p_Phone, p_Email, p_Address);
END$$
DELIMITER ;

-- Update Customer
DELIMITER $$
CREATE PROCEDURE sp_update_customer(
    IN p_CustomerID INT UNSIGNED,
    IN p_LastName NVARCHAR(10),
    IN p_MiddleName NVARCHAR(20),
    IN p_FirstName NVARCHAR(10),
    IN p_Phone VARCHAR(15),
    IN p_Email VARCHAR(30),
    IN p_Address VARCHAR(120)
)
BEGIN
    UPDATE Customer
    SET LastName = p_LastName,
        MiddleName = p_MiddleName,
        FirstName = p_FirstName,
        Phone = p_Phone,
        Email = p_Email,
        Address = p_Address
    WHERE CustomerID = p_CustomerID;
END$$
DELIMITER ;

-- Delete Customer
DELIMITER $$
CREATE PROCEDURE sp_delete_customer(
    IN p_CustomerID INT UNSIGNED
)
BEGIN
    DELETE FROM Customer
    WHERE CustomerID = p_CustomerID;
END$$
DELIMITER ;

-- ====================================================================
-- ORDER
-- Insert Order
DELIMITER $$
CREATE PROCEDURE sp_insert_order(
    IN p_EmployeeID INT UNSIGNED,
    IN p_DateTime DATETIME
)
BEGIN
    INSERT INTO `Order` (EmployeeID, `DateTime`)
    VALUES (p_EmployeeID, p_DateTime);
END$$
DELIMITER ;

-- Update Order
DELIMITER $$
CREATE PROCEDURE sp_update_order(
    IN p_OrderID INT UNSIGNED,
    IN p_EmployeeID INT UNSIGNED,
    IN p_DateTime DATETIME
)
BEGIN
    UPDATE `Order`
    SET EmployeeID = p_EmployeeID,
        `DateTime` = p_DateTime
    WHERE OrderID = p_OrderID;
END$$
DELIMITER ;

-- Delete Order
DELIMITER $$
CREATE PROCEDURE sp_delete_order(
    IN p_OrderID INT UNSIGNED
)
BEGIN
    DELETE FROM `Order`
    WHERE OrderID = p_OrderID;
END$$
DELIMITER ;

-- ====================================================================

CALL sp_insert_category('Trái cây', 'Các loại trái cây tươi ngon');
CALL sp_insert_category('Rau củ', 'Rau củ sạch');
CALL sp_update_category(1, 'Hoa quả', 'Các loại hoa quả tươi ngon');
CALL sp_delete_category(2);

CALL sp_insert_supplier('Nhà cung cấp A', '+84901234567', 'nccA@example.com', 'http://nccA.vn', 'Địa chỉ A');
CALL sp_update_supplier(1, 'Nhà cung cấp A+', '+84909876543', 'nccAplus@example.com', 'http://nccAplus.vn', 'Địa chỉ A+');
CALL sp_delete_supplier(1);

CALL sp_insert_product('Táo Mỹ', 7, 7, 20000, 25000, 'kg', '2024-12-31 00:00:00');
CALL sp_update_product(1, 'Táo Mỹ Nhập khẩu', 7, 7, 20000, 30000, 'kg', '2024-12-31 00:00:00');
CALL sp_delete_product(1);

CALL sp_insert_customer('Nguyễn', 'Văn', 'A', '+84901234567', 'nguyenvana@example.com', 'ĐC A');
CALL sp_update_customer(1, 'Nguyễn', 'Văn', 'B', '+84909876543', 'nguyenvanb@example.com', 'ĐC B');
CALL sp_delete_customer(5);

CALL sp_insert_order(1, '2024-12-11 10:00:00');
CALL sp_update_order(1, 2, '2024-12-12 11:00:00');
CALL sp_delete_order(1);
