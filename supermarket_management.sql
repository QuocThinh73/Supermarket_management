CREATE DATABASE Supermarket_Management;

USE Supermarket_Management;

CREATE TABLE Category (
	CategoryID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName	NVARCHAR(30),
    `Description`	NVARCHAR(50)
);

CREATE TABLE Supplier (
	SupplierID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    SupplierName	NVARCHAR(70),
    Phone			VARCHAR(15),
    Email			VARCHAR(40),
    Website			VARCHAR(30),
    Address			VARCHAR(120)
);

CREATE TABLE Product (
	ProductID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ProductName		NVARCHAR(70),
    CategoryID		INT UNSIGNED,
    SupplierID		INT UNSIGNED,
    CostPrice		INT UNSIGNED,
    Price			INT UNSIGNED,
    Unit			NVARCHAR(10),
    ExpirationDate	DATETIME,
    FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE Customer (
	CustomerID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    LastName		NVARCHAR(10),
    MiddleName		NVARCHAR(20),
    FirstName		NVARCHAR(10),
    Phone			VARCHAR(15),
    Email			VARCHAR(30),
    Address			VARCHAR(120)
);

CREATE TABLE Employee (
	EmployeeID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    LastName		NVARCHAR(10),
    MiddleName		NVARCHAR(20),
    FirstName		NVARCHAR(10),
    Address			VARCHAR(120),
    Gender			ENUM('Nam', 'Nữ'),
    DoB				DATE,
    ManagerID		INT UNSIGNED,
    FOREIGN KEY(ManagerID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Warehouse (
	WarehouseID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Location		NVARCHAR(40)
);

CREATE TABLE WarehouseEmployee (
	WarehouseID		INT UNSIGNED,
    EmployeeID		INT UNSIGNED,
    PRIMARY KEY(WarehouseID, EmployeeID),
    FOREIGN KEY(WarehouseID) REFERENCES Warehouse(WarehouseID),
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE StockSale (
	WarehouseID		INT UNSIGNED,
    EmployeeID		INT UNSIGNED,
    ProductID		INT UNSIGNED,
    Quantity		INT UNSIGNED,
    `DateTime`		DATETIME,
    `Type`			ENUM('Nhập', 'Xuất'),
    PRIMARY KEY(WarehouseID, EmployeeID, `DateTime`),
    FOREIGN KEY(WarehouseID) REFERENCES Warehouse(WarehouseID),
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE DiscountProduct (
	DiscountProductID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DiscountName			NVARCHAR(30),
    `Description`			NVARCHAR(50),
    StartDate				DATETIME,
    EndDate					DATETIME,
    DiscountType			ENUM('Phần trăm', 'Số tiền'),
    DiscountValue			INT UNSIGNED
);

CREATE TABLE DiscountProduct_Product (
	DiscountProductID		INT UNSIGNED,
    ProductID				INT UNSIGNED,
    PRIMARY KEY(DiscountProductID, ProductID),
    FOREIGN KEY(DiscountProductID) REFERENCES DiscountProduct(DiscountProductID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE DiscountOrder (
	DiscountOrderID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DiscountName			NVARCHAR(30),
    `Description`			NVARCHAR(50),
    StartDate				DATETIME,
    EndDate					DATETIME,
    DiscountType			ENUM('Phần trăm', 'Số tiền'),
    DiscountValue			INT UNSIGNED,
    MinimumOrderAmount		INT UNSIGNED
);

CREATE TABLE `Order` (
	OrderID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    EmployeeID			INT UNSIGNED,
    DiscountOrderID		INT UNSIGNED,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY(DiscountOrderID) REFERENCES DiscountOrder(DiscountOrderID)
);

CREATE TABLE Product_Order (
	ProductID		INT UNSIGNED,
    OrderID			INT UNSIGNED,
    QuantitySold	INT UNSIGNED,
    UnitPrice		INT UNSIGNED,
    PRIMARY KEY(ProductID, OrderID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY(OrderID) REFERENCES `Order`(OrderID)
);

CREATE TABLE Payment (
	PaymentID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    OrderID			INT UNSIGNED,
    CustomerID		INT UNSIGNED,
    PaymentMethod	ENUM('Tiền mặt', 'Thẻ', 'Chuyển khoản'),
    `DateTime`		DATETIME,
    FOREIGN KEY(OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Voucher (
	VoucherID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CustomerID		INT UNSIGNED,
    OrderID			INT UNSIGNED,
    VoucherName		NVARCHAR(30),
    VoucherValue	INT UNSIGNED,
    StartDate		DATETIME,
    EndDate			DATETIME,
    `Description`	NVARCHAR(50),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(OrderID) REFERENCES `Order`(OrderID)
);

CREATE TABLE Position (
	PositionID 		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName	NVARCHAR(20),
    BaseSalary		INT UNSIGNED
);

CREATE TABLE PositionHistory (
	EmployeeID		INT UNSIGNED,
    PositionID		INT UNSIGNED,
    StartDate		DATETIME,
    EndDate			DATETIME,
    PRIMARY KEY(EmployeeID, PositionID, StartDate)
);

CREATE TABLE Bonus (
	BonusID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Amount			INT UNSIGNED,
    Reason			NVARCHAR(50),
    `Date`			DATE,
    EmployeeID		INT UNSIGNED,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Overtime (
	OvertimeID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    OvertimeRate	INT UNSIGNED,
    Hours			INT UNSIGNED,
    Date			DATE,
    EmployeeID		INT UNSIGNED,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Deduction (
	DeductionID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Amount			INT UNSIGNED,
    Reason			NVARCHAR(50),
    `Date`			DATE,
    EmployeeID		INT UNSIGNED,
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);