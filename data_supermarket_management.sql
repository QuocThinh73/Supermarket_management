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
						(3			, '