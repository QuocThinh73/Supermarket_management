USE Supermarket_Management;

INSERT INTO Category	(CategoryID	, CategoryName	, `Description`					)
VALUES					(1			, 'Thực phẩm'	, 'Các mặt hàng ăn uống'		),
						(2			, 'Điện tử'		, 'Thiết bị điện tử'			),
                        (3			, 'Gia dụng'	, 'Đồ dùng trong gia đình'		),
                        (4			, 'Hóa mỹ phẩm'	, 'Sản phẩm chăm sóc sắc đẹp'	),
                        (5			, 'Quần áo'		, 'Thời trang và phụ kiện'		);
                        
INSERT INTO Supplier	(SupplierID	, SupplierName								, Phone				, Email								, Website						, Street				, District	, City						, Province	, Country		)
VALUES					(1			, 'Công ty Cổ phẩn Lương thực Phương Nam'	, '+84909349988' 	, 'nongsansachphuongnam@gmail.com' 	, 'https://gaophuongnam.vn/' 	, '644/4/3 3 tháng 2' 	, 'Quận 10' , 'Thành phố Hồ Chí Minh' 	, '' 		, 'Việt Nam'	),
						(2			, 'Công ty Cổ phần Sữa Việt Nam'			, '+84234567890' 	, 'foodmart@gmail.com' 				, 'www.foodmart.com' 			, '789 Nguyễn Trãi' 	, 'Quận 7' 	, 'Thành phố Hồ Chí Minh' 	, '' 		, 'Việt Nam'	),
						(3			, 'Công ty FoodMart'						, '+84234567890' 	, 'foodmart@gmail.com' 				, 'www.foodmart.com' 			, '789 Nguyễn Trãi' 	, 'Quận 7' 	, 'Thành phố Hồ Chí Minh' 	, '' 		, 'Việt Nam'	),
                        (4			, 'Công ty FoodMart'						, '+84234567890' 	, 'foodmart@gmail.com' 				, 'www.foodmart.com' 			, '789 Nguyễn Trãi' 	, 'Quận 7' 	, 'Thành phố Hồ Chí Minh' 	, '' 		, 'Việt Nam'	),
                        (5			, 'Công ty FoodMart'						, '+84234567890' 	, 'foodmart@gmail.com' 				, 'www.foodmart.com' 			, '789 Nguyễn Trãi' 	, 'Quận 7' 	, 'Thành phố Hồ Chí Minh' 	, '' 		, 'Việt Nam'	);
                        
CREATE TABLE Product	(ProductID	, ProductName	, CategoryID	, SupplierID	, Price		, CostPrice	, ExpirationDate	)
VALUES					(1			, 'Gạo ST25'	, 1				, 1				, 50000		, 40000		, '2025-12-31'		),
						(2			, 'Bánh mì'		, 1				, 1				, 20000		, 15000		, '2024-12-31'		),

INSERT INTO Voucher (CustomerID, OrderID, VoucherName, VoucherValue, StartDate, EndDate, `Description`) VALUES
(1, 101, 'Giảm giá Tết', 500000, '2023-12-20 08:00:00', '2024-01-20 23:59:59', 'Giảm giá dịp Tết Nguyên Đán'),
(2, 102, 'Mua 2 tặng 1', 200000, '2023-11-01 00:00:00', '2023-12-01 23:59:59', 'Ưu đãi mua 2 sản phẩm'),
(3, 103, 'Khách hàng mới', 300000, '2023-10-01 00:00:00', '2023-11-30 23:59:59', 'Dành cho khách hàng mới'),
(4, 104, 'Giảm 10%', 100000, '2023-09-15 08:00:00', '2023-10-15 23:59:59', 'Ưu đãi giảm 10%'),
(5, 105, 'Black Friday', 150000, '2023-11-24 00:00:00', '2023-11-26 23:59:59', 'Khuyến mãi Black Friday'),
(6, 106, 'Cyber Monday', 250000, '2023-11-27 00:00:00', '2023-11-27 23:59:59', 'Khuyến mãi Cyber Monday'),
(7, 107, 'Giảm giá cuối năm', 400000, '2023-12-15 00:00:00', '2023-12-31 23:59:59', 'Khuyến mãi cuối năm'),
(8, 108, 'Tri ân khách hàng', 500000, '2023-12-01 00:00:00', '2023-12-15 23:59:59', 'Quà tặng tri ân khách hàng'),
(9, 109, 'Giảm giá hè', 200000, '2023-06-01 00:00:00', '2023-06-30 23:59:59', 'Ưu đãi mùa hè'),
(10, 110, 'Quà 8/3', 300000, '2023-03-01 00:00:00', '2023-03-08 23:59:59', 'Ưu đãi ngày Quốc tế Phụ nữ'),
(11, 111, 'Noel Sale', 600000, '2023-12-15 00:00:00', '2023-12-25 23:59:59', 'Giảm giá dịp Noel'),
(12, 112, 'Flash Sale', 100000, '2023-09-01 12:00:00', '2023-09-01 18:00:00', 'Ưu đãi giờ vàng'),
(13, 113, 'Mùa tựu trường', 200000, '2023-08-01 00:00:00', '2023-08-31 23:59:59', 'Giảm giá mùa tựu trường'),
(14, 114, 'Giảm giá trung thu', 250000, '2023-09-15 00:00:00', '2023-09-30 23:59:59', 'Khuyến mãi dịp Trung thu'),
(15, 115, 'Giảm giá VIP', 1000000, '2023-12-01 00:00:00', '2024-01-01 23:59:59', 'Dành cho khách hàng VIP');

INSERT INTO Position (PositionName, BaseSalary) VALUES
('Manager', 15000000),
('Developer', 12000000),
('Designer', 11000000),
('Tester', 10000000),
('HR', 9000000),
('Sales', 9500000),
('Marketing', 8800000),
('Accountant', 11000000),
('Consultant', 14000000),
('Technician', 10500000),
('Support', 8000000),
('Researcher', 13000000),
('Analyst', 12000000),
('Intern', 4000000),
('CEO', 30000000);

INSERT INTO PositionHistory (EmployeeID, PositionID, StartDate, EndDate) VALUES
(1, 1, '2023-01-01', '2023-12-31'),
(2, 2, '2023-02-01', NULL),
(3, 3, '2023-03-01', '2023-09-30'),
(4, 4, '2022-10-01', '2023-01-15'),
(5, 5, '2021-06-01', NULL),
(6, 6, '2022-01-01', '2023-11-30'),
(7, 7, '2023-01-01', NULL),
(8, 8, '2022-05-01', NULL),
(9, 9, '2023-06-01', NULL),
(10, 10, '2023-03-01', '2023-09-15'),
(11, 11, '2021-11-01', NULL),
(12, 12, '2023-08-01', NULL),
(13, 13, '2023-04-01', NULL),
(14, 14, '2023-05-01', NULL),
(15, 15, '2023-01-01', NULL);

INSERT INTO Bonus (Amount, Reason, `Date`, EmployeeID) VALUES
(2000000, 'Project Completion', '2023-01-15', 1),
(1500000, 'Performance', '2023-02-20', 2),
(1000000, 'Good Attendance', '2023-03-25', 3),
(500000, 'On-time Delivery', '2023-04-10', 4),
(2500000, 'High Sales', '2023-05-30', 5),
(300000, 'Extra Effort', '2023-06-18', 6),
(200000, 'Team Support', '2023-07-22', 7),
(1000000, 'Innovation', '2023-08-05', 8),
(1500000, 'Leadership', '2023-09-12', 9),
(500000, 'Client Appreciation', '2023-10-01', 10),
(1200000, 'Good Record', '2023-11-15', 11),
(900000, 'Training', '2023-12-05', 12),
(800000, 'Deadline Achievement', '2023-12-20', 13),
(700000, 'Hard Work', '2023-12-25', 14),
(1000000, 'New Initiative', '2023-12-30', 15);

INSERT INTO Overtime (OvertimeRate, Hours, `Date`, EmployeeID) VALUES
(150, 5, '2023-01-10', 1),
(125, 8, '2023-02-14', 2),
(110, 6, '2023-03-20', 3),
(140, 7, '2023-04-18', 4),
(120, 9, '2023-05-15', 5),
(130, 4, '2023-06-22', 6),
(110, 3, '2023-07-05', 7),
(135, 6, '2023-08-25', 8),
(120, 8, '2023-09-08', 9),
(150, 10, '2023-10-12', 10),
(140, 7, '2023-11-20', 11),
(130, 5, '2023-12-03', 12),
(120, 6, '2023-12-07', 13),
(110, 4, '2023-12-13', 14),
(125, 9, '2023-12-19', 15);

INSERT INTO Deduction (Amount, Reason, `Date`, EmployeeID) VALUES
(500000, 'Late Attendance', '2023-01-05', 1),
(300000, 'Policy Violation', '2023-02-10', 2),
(200000, 'Lost Equipment', '2023-03-18', 3),
(400000, 'Low Performance', '2023-04-22', 4),
(250000, 'Leave Without Notice', '2023-05-01', 5),
(350000, 'Misconduct', '2023-06-09', 6),
(300000, 'Late Submission', '2023-07-12', 7),
(200000, 'Improper Documentation', '2023-08-17', 8),
(150000, 'Client Complaint', '2023-09-23', 9),
(450000, 'Policy Breach', '2023-10-11', 10),
(200000, 'Unapproved Leave', '2023-11-08', 11),
(300000, 'Poor Quality', '2023-12-06', 12),
(150000, 'Missed Meeting', '2023-12-12', 13),
(200000, 'Late Reporting', '2023-12-20', 14),
(250000, 'Inadequate Work', '2023-12-27', 15);