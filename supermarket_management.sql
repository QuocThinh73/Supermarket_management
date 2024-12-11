CREATE DATABASE Supermarket_Management;

USE Supermarket_Management;

CREATE TABLE Category (
	CategoryID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName	NVARCHAR(30) UNIQUE NOT NULL,
    `Description`	NVARCHAR(50)
);

CREATE TABLE Supplier (
	SupplierID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    SupplierName	NVARCHAR(70) NOT NULL,
    Phone			VARCHAR(15) NOT NULL CHECK (Phone REGEXP '^\\+[0-9]{1,3}[0-9]{9,11}$'),
    Email			VARCHAR(40) UNIQUE NOT NULL CHECK (Email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),
    Website			VARCHAR(30) CHECK (Website REGEXP '^(https?:\\/\\/)?[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}.*$'),
    Address			VARCHAR(120)
);

CREATE TABLE Product (
	ProductID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ProductName			NVARCHAR(70) NOT NULL,
    CategoryID			INT UNSIGNED,
    SupplierID			INT UNSIGNED,
    CostPrice			INT UNSIGNED NOT NULL,
    Price				INT UNSIGNED NOT NULL,
    Unit				NVARCHAR(10) NOT NULL,
    ExpirationDate		DATETIME,
    QuantityInStock   	INT UNSIGNED NOT NULL DEFAULT 0,
    FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID) ON DELETE SET NULL,
    FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID) ON DELETE SET NULL
);

CREATE TABLE Customer (
	CustomerID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    LastName		NVARCHAR(10) NOT NULL,
    MiddleName		NVARCHAR(20),
    FirstName		NVARCHAR(10) NOT NULL,
    Phone			VARCHAR(15) UNIQUE CHECK (Phone REGEXP '^\\+[0-9]{1,3}[0-9]{9,11}$'),
    Email			VARCHAR(30) UNIQUE CHECK (Email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'),
    Address			VARCHAR(120)
);

CREATE TABLE Employee (
	EmployeeID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    LastName		NVARCHAR(10) NOT NULL,
    MiddleName		NVARCHAR(20),
    FirstName		NVARCHAR(10) NOT NULL,
    Address			VARCHAR(120),
    Gender			ENUM('Nam', 'Nữ') NOT NULL,
    DoB				DATE NOT NULL,
    ManagerID		INT UNSIGNED,
    FOREIGN KEY(ManagerID) REFERENCES Employee(EmployeeID) ON DELETE SET NULL
);

CREATE TABLE Warehouse (
	WarehouseID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Location		NVARCHAR(40) NOT NULL
);

CREATE TABLE WarehouseEmployee (
	WarehouseID		INT UNSIGNED NOT NULL,
    EmployeeID		INT UNSIGNED NOT NULL,
    PRIMARY KEY(WarehouseID, EmployeeID),
    FOREIGN KEY(WarehouseID) REFERENCES Warehouse(WarehouseID),
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE StockSale (
	WarehouseID		INT UNSIGNED NOT NULL,
    EmployeeID		INT UNSIGNED NOT NULL,
    ProductID		INT UNSIGNED NOT NULL,
    Quantity		INT UNSIGNED NOT NULL,
    `DateTime`		DATETIME NOT NULL,
    `Type`			ENUM('Nhập', 'Xuất') NOT NULL,
    PRIMARY KEY(WarehouseID, EmployeeID, `DateTime`),
    FOREIGN KEY(WarehouseID) REFERENCES Warehouse(WarehouseID),
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE DiscountProduct (
	DiscountProductID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DiscountName			NVARCHAR(30) NOT NULL,
    `Description`			NVARCHAR(50),
    StartDate				DATETIME NOT NULL,
    EndDate					DATETIME NOT NULL,
    DiscountType			ENUM('Phần trăm', 'Số tiền') NOT NULL,
    DiscountValue			INT UNSIGNED DEFAULT 0
);

CREATE TABLE DiscountProduct_Product (
	DiscountProductID		INT UNSIGNED NOT NULL,
    ProductID				INT UNSIGNED NOT NULL,
    PRIMARY KEY(DiscountProductID, ProductID),
    FOREIGN KEY(DiscountProductID) REFERENCES DiscountProduct(DiscountProductID) ON DELETE CASCADE,
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

CREATE TABLE DiscountOrder (
	DiscountOrderID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DiscountName			NVARCHAR(30) NOT NULL,
    `Description`			NVARCHAR(50),
    StartDate				DATETIME NOT NULL,
    EndDate					DATETIME NOT NULL,
    DiscountType			ENUM('Phần trăm', 'Số tiền') NOT NULL,
    DiscountValue			INT UNSIGNED NOT NULL,
	MinimumOrderAmount		INT UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE `Order` (
	OrderID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeID			INT UNSIGNED,
    OrderAmount			INT UNSIGNED NOT NULL DEFAULT 0,
    DiscountAmount		INT UNSIGNED NOT NULL DEFAULT 0,
    `DateTime`			DATETIME NOT NULL,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE SET NULL
);

CREATE TABLE Product_Order (
	ProductID		INT UNSIGNED NOT NULL,
    OrderID			INT UNSIGNED NOT NULL,
    QuantitySold	INT UNSIGNED NOT NULL,
    SubAmount       INT UNSIGNED DEFAULT 0,
    PRIMARY KEY(ProductID, OrderID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY(OrderID) REFERENCES `Order`(OrderID) ON DELETE CASCADE
);

CREATE TABLE Payment (
	PaymentID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    OrderID			INT UNSIGNED NOT NULL,
    CustomerID		INT UNSIGNED,
    PaymentMethod	ENUM('Tiền mặt', 'Thẻ', 'Chuyển khoản') NOT NULL,
    `DateTime`		DATETIME NOT NULL,
    PaymentAmount	INT UNSIGNED NOT NULL DEFAULT 0,
    FOREIGN KEY(OrderID) REFERENCES `Order`(OrderID) ON DELETE CASCADE,
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL
);

CREATE TABLE Voucher (
	VoucherID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CustomerID		INT UNSIGNED NOT NULL,
    OrderID			INT UNSIGNED,
    VoucherName		NVARCHAR(30) NOT NULL,
    VoucherValue	INT UNSIGNED NOT NULL,
    StartDate		DATETIME NOT NULL,
    EndDate			DATETIME NOT NULL,
    `Description`	NVARCHAR(50),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY(OrderID) REFERENCES `Order`(OrderID) ON DELETE CASCADE
);

CREATE TABLE `Position` (
	PositionID 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName	NVARCHAR(20) NOT NULL,
    BaseSalary		INT UNSIGNED NOT NULL
);

CREATE TABLE PositionHistory (
	EmployeeID		INT UNSIGNED NOT NULL,
    PositionID		INT UNSIGNED NOT NULL,
    StartDate		DATETIME NOT NULL,
    EndDate			DATETIME,
    PRIMARY KEY(EmployeeID, PositionID, StartDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

CREATE TABLE Bonus (
	BonusID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Amount			INT UNSIGNED NOT NULL,
    Reason			NVARCHAR(50),
    `Date`			DATE NOT NULL,
    EmployeeID		INT UNSIGNED NOT NULL,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE
);

CREATE TABLE Overtime (
	OvertimeID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    OvertimeRate	INT UNSIGNED NOT NULL,
    Hours			INT UNSIGNED NOT NULL,
    `Date`			DATE NOT NULL,
    EmployeeID		INT UNSIGNED NOT NULL,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE
);

CREATE TABLE Deduction (
	DeductionID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Amount			INT UNSIGNED NOT NULL,
    Reason			NVARCHAR(50),
    `Date`			DATE NOT NULL,
    EmployeeID		INT UNSIGNED NOT NULL,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE
);

DELIMITER $$

CREATE TRIGGER before_product_insert
BEFORE INSERT ON Product
FOR EACH ROW
BEGIN
    IF NEW.Price < NEW.Price THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giá bán phải lớn hơn hoặc bằng giá vốn.';
    END IF;
END$$

CREATE TRIGGER before_product_update
BEFORE UPDATE ON Product
FOR EACH ROW
BEGIN
    IF NEW.Price < NEW.Price THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giá bán phải lớn hơn hoặc bằng giá vốn.';
    END IF;
END$$

CREATE TRIGGER before_discountproduct_insert
BEFORE INSERT ON DiscountProduct
FOR EACH ROW
BEGIN
    IF NEW.EndDate <= NEW.StartDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian kết thúc phải lớn hơn thời gian bắt đầu.';
    END IF;
END$$

CREATE TRIGGER before_discountproduct_update
BEFORE UPDATE ON DiscountProduct
FOR EACH ROW
BEGIN
    IF NEW.EndDate <= NEW.StartDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian kết thúc phải lớn hơn thời gian bắt đầu.';
    END IF;
END$$

CREATE TRIGGER before_discountorder_insert
BEFORE INSERT ON DiscountOrder
FOR EACH ROW
BEGIN
    IF NEW.EndDate <= NEW.StartDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian kết thúc phải lớn hơn thời gian bắt đầu.';
    END IF;
END$$

CREATE TRIGGER before_discountorder_update
BEFORE UPDATE ON DiscountOrder
FOR EACH ROW
BEGIN
    IF NEW.EndDate <= NEW.StartDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian kết thúc phải lớn hơn thời gian bắt đầu.';
    END IF;
END$$

CREATE TRIGGER before_voucher_insert
BEFORE INSERT ON Voucher
FOR EACH ROW
BEGIN
    IF NEW.EndDate <= NEW.StartDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian kết thúc phải lớn hơn thời gian bắt đầu.';
    END IF;
END$$

CREATE TRIGGER before_voucher_update
BEFORE UPDATE ON Voucher
FOR EACH ROW
BEGIN
    IF NEW.EndDate <= NEW.StartDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian kết thúc phải lớn hơn thời gian bắt đầu.';
    END IF;
END$$

CREATE TRIGGER before_insert_discountproduct_product
BEFORE INSERT ON DiscountProduct_Product
FOR EACH ROW
BEGIN
    DECLARE overlap_count INT;

    SELECT COUNT(*)
    INTO overlap_count
    FROM DiscountProduct dp
    WHERE dp.DiscountProductID = NEW.DiscountProductID
      AND EXISTS (
          SELECT 1
          FROM DiscountProduct_Product dpp
          JOIN DiscountProduct dp2 ON dp2.DiscountProductID = dpp.DiscountProductID
          WHERE dpp.ProductID = NEW.ProductID
            AND ((dp.StartDate BETWEEN dp2.StartDate AND dp2.EndDate)
              OR (dp.EndDate BETWEEN dp2.StartDate AND dp2.EndDate)
              OR (dp2.StartDate BETWEEN dp.StartDate AND dp.EndDate)
              OR (dp2.EndDate BETWEEN dp.StartDate AND dp.EndDate))
      );

    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian giảm giá trùng lặp cho sản phẩm này.';
    END IF;
END$$

CREATE TRIGGER before_update_discountproduct_product
BEFORE UPDATE ON DiscountProduct_Product
FOR EACH ROW
BEGIN
    DECLARE overlap_count INT;

    SELECT COUNT(*)
    INTO overlap_count
    FROM DiscountProduct dp
    JOIN DiscountProduct_Product dpp ON dp.DiscountProductID = dpp.DiscountProductID
    WHERE dpp.ProductID = NEW.ProductID
      AND dp.DiscountProductID != NEW.DiscountProductID
      AND EXISTS (
          SELECT 1
          FROM DiscountProduct dp_new
          WHERE dp_new.DiscountProductID = NEW.DiscountProductID
            AND ((dp_new.StartDate BETWEEN dp.StartDate AND dp.EndDate)
              OR (dp_new.EndDate BETWEEN dp.StartDate AND dp.EndDate)
              OR (dp.StartDate BETWEEN dp_new.StartDate AND dp_new.EndDate)
              OR (dp.EndDate BETWEEN dp_new.StartDate AND dp_new.EndDate))
      );

    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian giảm giá trùng lặp cho sản phẩm này.';
    END IF;
END$$

CREATE TRIGGER before_insert_discountorder
BEFORE INSERT ON DiscountOrder
FOR EACH ROW
BEGIN
    DECLARE overlap_count INT;

    SELECT COUNT(*)
    INTO overlap_count
    FROM DiscountOrder
    WHERE (NEW.StartDate BETWEEN StartDate AND EndDate
           OR NEW.EndDate BETWEEN StartDate AND EndDate
           OR StartDate BETWEEN NEW.StartDate AND NEW.EndDate
           OR EndDate BETWEEN NEW.StartDate AND NEW.EndDate);

    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian giảm giá bị trùng lặp với chương trình giảm giá khác.';
    END IF;
END$$

CREATE TRIGGER before_update_discountorder
BEFORE UPDATE ON DiscountOrder
FOR EACH ROW
BEGIN
    DECLARE overlap_count INT;

    SELECT COUNT(*)
    INTO overlap_count
    FROM DiscountOrder
    WHERE DiscountOrderID != NEW.DiscountOrderID
      AND (NEW.StartDate BETWEEN StartDate AND EndDate
           OR NEW.EndDate BETWEEN StartDate AND EndDate
           OR StartDate BETWEEN NEW.StartDate AND NEW.EndDate
           OR EndDate BETWEEN NEW.StartDate AND NEW.EndDate);

    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thời gian giảm giá bị trùng lặp với chương trình giảm giá khác.';
    END IF;
END$$

CREATE TRIGGER Before_Insert_StockSale
BEFORE INSERT ON StockSale
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;

    SELECT QuantityInStock INTO current_stock
    FROM Product
    WHERE ProductID = NEW.ProductID;

    IF NEW.`Type` = 'Xuất' AND NEW.Quantity > current_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số lượng tồn kho không đủ để xuất kho.';
    END IF;
END$$

CREATE TRIGGER Before_Update_StockSale
BEFORE UPDATE ON StockSale
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    DECLARE stock_adjustment INT;

    SELECT QuantityInStock INTO current_stock
    FROM Product
    WHERE ProductID = NEW.ProductID;

    SET stock_adjustment = NEW.Quantity - OLD.Quantity;

    IF NEW.`Type` = 'Xuất' AND stock_adjustment > current_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số lượng tồn kho không đủ để xuất kho.';
    END IF;
END$$

CREATE TRIGGER After_Insert_StockSale
AFTER INSERT ON StockSale
FOR EACH ROW
BEGIN
    IF NEW.`Type` = 'Nhập' THEN
        UPDATE Product
        SET QuantityInStock = QuantityInStock + NEW.Quantity
        WHERE ProductID = NEW.ProductID;
    END IF;

    IF NEW.`Type` = 'Xuất' THEN
        UPDATE Product
        SET QuantityInStock = QuantityInStock - NEW.Quantity
        WHERE ProductID = NEW.ProductID;
    END IF;
END$$

CREATE TRIGGER After_Update_StockSale
AFTER UPDATE ON StockSale
FOR EACH ROW
BEGIN
    IF NEW.`Type` = 'Nhập' THEN
        UPDATE Product
        SET QuantityInStock = QuantityInStock + (NEW.Quantity - OLD.Quantity)
        WHERE ProductID = NEW.ProductID;
    END IF;

    IF NEW.`Type` = 'Xuất' THEN
        UPDATE Product
        SET QuantityInStock = QuantityInStock - (NEW.Quantity - OLD.Quantity)
        WHERE ProductID = NEW.ProductID;
    END IF;
END$$

CREATE TRIGGER Before_ProductOrder_Insert
BEFORE INSERT ON Product_Order
FOR EACH ROW
BEGIN
    DECLARE product_cost INT;
    DECLARE order_datetime DATETIME;
    DECLARE d_value INT;
    DECLARE d_type ENUM('Phần trăm','Số tiền');

    SELECT `DateTime` INTO order_datetime
    FROM `Order`
    WHERE OrderID = NEW.OrderID;

    SELECT Price INTO product_cost
    FROM Product
    WHERE ProductID = NEW.ProductID;

    SELECT dp.DiscountValue, dp.DiscountType
    INTO d_value, d_type
    FROM DiscountProduct dp
    JOIN DiscountProduct_Product dpp ON dp.DiscountProductID = dpp.DiscountProductID
    WHERE dpp.ProductID = NEW.ProductID
      AND order_datetime BETWEEN dp.StartDate AND dp.EndDate
    ORDER BY dp.DiscountValue DESC
    LIMIT 1;

    IF d_value IS NOT NULL THEN
        IF d_type = 'Phần trăm' THEN
            SET product_cost = product_cost - FLOOR(product_cost * d_value / 100);
        ELSE
            SET product_cost = GREATEST(product_cost - d_value, 0);
        END IF;
    END IF;

    SET NEW.SubAmount = NEW.QuantitySold * product_cost;
END$$

CREATE TRIGGER Before_ProductOrder_Update
BEFORE UPDATE ON Product_Order
FOR EACH ROW
BEGIN
    DECLARE product_cost INT;
    DECLARE order_datetime DATETIME;
    DECLARE d_value INT;
    DECLARE d_type ENUM('Phần trăm','Số tiền');

    SELECT `DateTime` INTO order_datetime
    FROM `Order`
    WHERE OrderID = NEW.OrderID;

    SELECT Price INTO product_cost
    FROM Product
    WHERE ProductID = NEW.ProductID;

    SELECT dp.DiscountValue, dp.DiscountType
    INTO d_value, d_type
    FROM DiscountProduct dp
    JOIN DiscountProduct_Product dpp ON dp.DiscountProductID = dpp.DiscountProductID
    WHERE dpp.ProductID = NEW.ProductID
      AND order_datetime BETWEEN dp.StartDate AND dp.EndDate
    ORDER BY dp.DiscountValue DESC
    LIMIT 1;

    IF d_value IS NOT NULL THEN
        IF d_type = 'Phần trăm' THEN
            SET product_cost = product_cost - FLOOR(product_cost * d_value / 100);
        ELSE
            SET product_cost = GREATEST(product_cost - d_value, 0);
        END IF;
    END IF;

    SET NEW.SubAmount = NEW.QuantitySold * product_cost;
END$$

CREATE PROCEDURE UpdateOrderAmounts(IN p_OrderID INT)
BEGIN
    DECLARE total_amount INT DEFAULT 0;
    DECLARE discount_value INT;
    DECLARE discount_type ENUM('Phần trăm', 'Số tiền');
    DECLARE min_amount INT;
    DECLARE order_datetime DATETIME;
    DECLARE tmp_discount_amount INT DEFAULT 0;

    SELECT `DateTime` INTO order_datetime
    FROM `Order`
    WHERE OrderID = p_OrderID;

    SELECT IFNULL(SUM(SubAmount), 0) INTO total_amount
    FROM Product_Order
    WHERE OrderID = p_OrderID;

    SELECT DiscountValue, DiscountType, MinimumOrderAmount
    INTO discount_value, discount_type, min_amount
    FROM DiscountOrder
    WHERE StartDate <= order_datetime
      AND EndDate >= order_datetime
      AND total_amount >= MinimumOrderAmount
    ORDER BY DiscountValue DESC
    LIMIT 1;

    IF discount_value IS NOT NULL THEN
        IF discount_type = 'Phần trăm' THEN
            SET tmp_discount_amount = FLOOR(total_amount * discount_value / 100);
        ELSE
            SET tmp_discount_amount = discount_value;
        END IF;
    ELSE
        SET tmp_discount_amount = 0;
    END IF;

    UPDATE `Order`
    SET OrderAmount = total_amount,
        DiscountAmount = tmp_discount_amount
    WHERE OrderID = p_OrderID;
END$$

CREATE TRIGGER After_ProductOrder_Insert
AFTER INSERT ON Product_Order
FOR EACH ROW
BEGIN
    CALL UpdateOrderAmounts(NEW.OrderID);
END$$

CREATE TRIGGER After_ProductOrder_Update
AFTER UPDATE ON Product_Order
FOR EACH ROW
BEGIN
    CALL UpdateOrderAmounts(NEW.OrderID);
END$$

CREATE TRIGGER After_ProductOrder_Delete
AFTER DELETE ON Product_Order
FOR EACH ROW
BEGIN
    CALL UpdateOrderAmounts(OLD.OrderID);
END$$

CREATE TRIGGER Before_Payment_Insert
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
    DECLARE order_amount INT;
    DECLARE discount_amount INT;

    SELECT OrderAmount, DiscountAmount INTO order_amount, discount_amount
    FROM `Order`
    WHERE OrderID = NEW.OrderID;

    SET NEW.PaymentAmount = order_amount - discount_amount;
END$$

CREATE TRIGGER Before_Payment_Update
BEFORE UPDATE ON Payment
FOR EACH ROW
BEGIN
    DECLARE order_amount INT;
    DECLARE discount_amount INT;

    SELECT OrderAmount, DiscountAmount INTO order_amount, discount_amount
    FROM `Order`
    WHERE OrderID = NEW.OrderID;

    SET NEW.PaymentAmount = order_amount - discount_amount;
END$$

DELIMITER ;

