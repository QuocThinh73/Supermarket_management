USE Supermarket_Management;

INSERT INTO Category	(CategoryID	, CategoryName					, `Description`					)
VALUES					(1			, 'Thịt, cá, trứng, hải sản'	, ''							),
						(2			, 'Rau, củ, nấm, trái cây'		, ''							),
                        (3			, 'Dầu ăn, nước chấm, gia vị'	, ''							),
                        (4			, 'Mì, miến, cháo, phở'			, ''							),
                        (5			, 'Kem, thực phẩm đông mát'		, ''							),
                        (6			, 'Gạo, bột, đồ khô'			, ''							),
                        (7			, 'Bia, nước giải khát'			, ''							),
                        (8			, 'Sữa các loại'				, ''							),
                        (9			, 'Bánh kẹo các loại'			, ''							),
                        (10			, 'Chăm sóc cá nhân'			, ''							),
                        (11			, 'Sản phẩm cho mẹ và bé'		, ''							),
                        (12			, 'Vệ sinh nhà cửa'				, ''							),
                        (13			, 'Đồ dùng gia đình'			, ''							);
                        
INSERT INTO Supplier	(SupplierID	, SupplierName									, Phone				, Email								, Website					, Address																											)
VALUES					(1			, 'Công ty Cổ phẩn Lương thực Phương Nam'		, '+84909349988' 	, 'nongsansachphuongnam@gmail.com' 	, 'gaophuongnam.vn' 		, '644/4/3 3 tháng 2, Phường 14, Quận 10, Thành phố Hồ Chí Minh'													),
						(2			, 'Công ty Cổ phần Sữa Việt Nam'				, '+842854155555' 	, 'vinamilk@vinamilk.com' 			, 'www.vinamilk.com.vn' 	, 'Số 10 Tân Trào, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh'													),
						(3			, 'Công ty Cổ phần Chăn nuôi C.P. Việt Nam'		, '+842513836251' 	, 'web-info@cp.com.vn' 				, 'www.cp.com.vn' 			, 'Số 2 đường 2A, KCN Biên Hoà II, Phường Long Bình Tân, Thành phố Biên Hòa, Tỉnh Đồng Nai'							),
                        (4			, 'Công ty TNHH Tú Phượng Tony'					, '+89075333354' 	, ''				 				, 'tonyfruit.vn' 			, '19A Mai Chí Thọ, Phường An Khánh, Thành phố Thủ Đức, Thành phố Hồ Chí Minh'										),
                        (5			, 'Công ty Cổ phần Hàng tiêu dùng Masan'		, '+84902662660' 	, 'info@msc.masangroup.com' 		, 'masanconsumer.com' 		, '23 Lê Duẩn, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh'														),
						(6			, 'Công ty Cổ phần Acecook Việt Nam'			, '+84381540643'	, 'info@acecookvietnam.com'			, 'acecookvietnam.vn'		, 'Lô số II-3, Đường số 11, Nhóm CN II, KCN Tân Bình, Phường Tây Thạnh, Quận Tân Phú, Thành phố Hồ Chí Minh'		),
                        (7			, 'Công ty TNHH Thực phẩm Orion'				, '+842835123420'	, ''								, 'orion.vn'				, 'Tầng 22, tòa nhà Pearl Plaza, 561A, Điện Biên Phủ, Phường 25, Quận Bình Thạnh, Thành phố Hồ Chí Minh'			),
                        (8			, 'Công ty TNHH Nestlé Việt Nam'				, '+842839113737'	, 'consumer.services@vn.nestle.com'	, 'www.nestle.com.vn/vi'	, 'Lầu 5, Empress Tower, 138-142 Hai Bà Trưng, Phường Đa Kao, Quận 1, Thành phố Hồ Chí Minh'						),
                        (9			, 'Tập đoàn Trung Nguyên Legend'				, '+842839251845'	, 'cs@trungnguyenlegend.com'		, 'trungnguyenlegend.com'	, '82-84 Bùi Thị Xuân, Phường Bến Thành, Quận 1, Thành phố Hồ Chí Minh'												),
                        (10			, 'Công ty TNHH Nhà Máy Bia HEINEKEN Việt Nam'	, '+84290018452'	, 'contactvn@heineken.com' 			, 'heineken-vietnam.com.vn'	, 'Tầng 18 và 19, tòa nhà Vietcombank, số 5 Công trường Mê Linh, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh'	),
                        (11			, 'Công ty Cổ phần Sữa Quốc tế'					, '+842258021831'	, ''								, 'idp.vn/vi/cong-ty-idp'	, '217 Nguyễn Văn Thủ, Phường Đakao, Quận 1, Thành phố Hồ Chí Minh'													),
                        (12			, 'Công ty Cổ phần Thực phẩm đông lạnh KIDO'	, '+8438270468'		, 'customerservice_kido@kdc.vn'		, 'www.kidofoods.vn'		, '138-142, Hai Bà Trưng, Phường Đakao, Quận 1, Thành phố Hồ Chí Minh'												),
                        (13			, 'Công ty Cổ phần Kỹ nghệ thực phẩm Việt Nam'	, '+8418001097'		, ''								, 'vifon.com.vn'			, '913 Trường Chinh, Phường Tây Thạnh, Quận Tân Phú, Thành phố Hồ Chí Minh'											),
                        (14			, 'Công ty Unilever'							, '+842854135686'	, ''								, 'www.unilever.com.vn'		, '156 Nguyễn Lươn Bằng, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh'												),
                        (15			, 'Công ty Cổ phần P/S'							, '+842837281589'	, 'congtyps@gmail.com'				, 'congtyps.com'			, '513C đường Nam Hòa, Phường Phước Long A, Thành phố Thủ Đức, Thành phố Hồ Chí Minh'								),
                        (16			, 'Công ty TNHH P&G'							, '+8435214555'		, ''								, 'vn.pg.com'				, '11/F, MPlaza, 39 Lê Duẩn , Quận 1, Thành phố Hồ Chí Minh'														),
                        (17			, 'Công ty TNHH Meizan CLV'						, '+842838386611'	, 'info-mcc@vn.wilmar-intl.com'		, 'www.meizanclv.com.vn'	, 'Lô C20a-1, Đường số 14, KCN Hiệp Phước, Xã Hiệp Phước, Huyện Nhà Bè, Thành phố Hồ Chí Minh'						),
                        (18			, 'Tổng Công ty Thương mại Sài Gòn'				, '+842838629629'	, 'info@sieuthisaigon.com.vn'		, 'sieuthisaigon.com.vn'	, 'Số 460 Đường 3 tháng 2, Phường 12, Quận 10, Thành phố Hồ Chí Minh'												),
                        (19			, 'Công ty Cổ phần Thực phẩm Á Châu'			, '+842844500588'	, 'info@asiafoods.vn'				, 'www.asiafoods.vn'		, 'Số 9/2, Đường ĐT 743, Khu phố 1B, Phường An Phú, Thành phố Thuận An, Tỉnh Bình Dương'							),
                        (20			, 'Công ty cổ phần Micoem'						, '+842223714146'	, 'afotech@afotech.vn'				, 'afotech.vn'				, 'Số 8, Đường TS15, KCN Tiên Sơn, Xã Hoàn Sơn, Huyện Tiên Du, Tỉnh Bắc Ninh'										);

INSERT INTO Product		(ProductID	, ProductName													, CategoryID	, SupplierID	, Price		, CostPrice	, Unit 		, ExpirationDate	)
VALUES					(1			, 'Thùng 30 gói mì Hảo Hảo tôm chua cay 75g'					, 4				, 6				, 95000		, 118000	, 'Thùng'	, '2024-12-31'		),
						(2			, 'Mì Hảo Hảo vị tôm chua cay gói 75g'							, 4				, 6				, 3800		, 4400		, 'Gói'		, '2024-12-31'		),
                        (3			, 'Thùng 30 gói mì Hảo Hảo hương vị lẩu kim chi Hàn Quốc 75g'	, 4				, 6				, 98000		, 125000	, 'Thùng'	, '2024-12-31'		),
                        (4			, 'Mì Hảo Hảo hương vị lẩu kim chi Hàn Quốc gói 75g'			, 4				, 6				, 3900		, 4400		, 'Gói'		, '2024-12-31'		),
                        (5			, 'Thùng 30 gói mì Gấu Đỏ tôm và gà 63g'						, 4				, 19			, 63000		, 79000		, 'Thùng'	, '2025-02-27'		),
                        (6			, 'Mì Gấu đỏ tôm và gà gói 63g'									, 4				, 19			, 3000		, 3500		, 'Gói'		, '2025-02-27'		),
                        (7			, 'Thùng 30 gói mì Gấu Đỏ bò bít tết 63g'						, 4				, 19			, 63000		, 79000		, 'Thùng'	, '2025-02-27'		),
                        (8			, 'Mì Gấu Đỏ bò bít tết gói 63g'								, 4				, 19			, 3000		, 3500		, 'Gói'		, '2025-02-27'		),
                        (9			, 'Thùng 30 gói hủ tiếu sườn heo Cung Đình 84g'					, 4				, 20			, 25000		, 288000	, 'Thùng'	, '2025-03-07'		),
                        (10			, 'Hủ tiếu sườn heo Cung Đình gói 84g'							, 4 			, 20			, 8200		, 9600		, 'Gói'		, '2025-03-07'		),
                        (11			, 'Trứng gà sạch hộp 10 quả'									, 1				, 3				, 24000		, 28000		, 'Hộp'		, '2024-11-15'		),
						(12			, 'Thịt ba rọi heo (500g)'										, 1				, 3				, 70000		, 75000		, 'Kg'		, '2024-12-10'		),
						(13			, 'Cá thu tươi (1kg)'											, 1				, 3				, 110000	, 123000	, 'Kg'		, '2024-11-20'		),
						(14			, 'Rau cải ngọt (1kg)'											, 2				, 4				, 14000		, 21000		, 'Kg'		, '2024-10-30'		),
						(15			, 'Nấm bào ngư (200g)'											, 2				, 4				, 15000		, 18000		, 'Gói'		, '2024-11-05'		),
						(16			, 'Táo đỏ nhập khẩu (1kg)'										, 2				, 4				, 80000		, 85000		, 'Kg'		, '2024-11-30'		),
						(17			, 'Dầu ăn Neptune 1L'											, 3				, 5				, 35000		, 38000		, 'Chai'	, '2025-01-10'		),
						(18			, 'Nước mắm Nam Ngư 900ml'										, 3				, 5				, 37000		, 41000		, 'Chai'	, '2025-02-25'		),
						(19			, 'Muối tinh hảo hạng (500g)'									, 3				, 5				, 8000		, 10500		, 'Gói'		, '2025-06-01'		),
						(20			, 'Mì gói 3 Miền lẩu thái chua cay (75g)'						, 4				, 13			, 3500		, 400		, 'Gói'		, '2025-03-01'		),
						(21			, 'Kem Wall\'s hộp 450ml'										, 5				, 12			, 50000		, 55000		, 'Hộp'		, '2024-12-15'		),
						(22			, 'Gạo thơm ST25 (5kg)'											, 6				, 1				, 140000	, 150000	, 'Bao'		, '2025-12-01'		),
						(23			, 'Nước ngọt Coca-Cola lon 330ml'								, 7				, 10			, 8000		, 9000		, 'Lon'		, '2025-04-01'		),
						(24			, 'Bia Heineken lon 330ml'										, 7				, 10			, 15000		, 17000		, 'Lon'		, '2025-05-10'		),
						(25			, 'Sữa tươi Vinamilk không đường 1L'							, 8				, 2				, 30000		, 33000		, 'Hộp'		, '2025-02-10'		),
						(26			, 'Bánh quy Oreo 133g'											, 9				, 7				, 25000		, 27000		, 'Gói'		, '2025-06-15'		),
						(27			, 'Kem đánh răng P/S bảo vệ 123 180g'							, 10			, 15			, 23000		, 22000		, 'Tuýp'	, '2025-11-01'		),
						(28			, 'Tã bỉm Huggies size M (30 miếng)'							, 11			, 16			, 180000	, 200000	, 'Gói'		, '2025-08-01'		),
						(29			, 'Nước lau sàn Sunlight hương hoa thiên nhiên 1L'				, 12			, 14			, 35000		, 40000		, 'Chai'	, '2025-07-20'		),
						(30			, 'Bộ chén sứ trắng 6 cái'										, 13			, 18			, 100000	, 120000	, 'Bộ'		, NULL				),
                        (31			, 'Sữa chua Vinamilk Active 150g'								, 8				, 2				, 12000		, 15000		, 'Hộp'		, '2024-12-20'		),
						(32			, 'Bột giặt OMO màu 1kg'										, 12			, 14			, 40000		, 46000		, 'Gói'		, '2025-08-15'		),
						(33			, 'Khăn giấy Sunfresh 3 lớp 10 cuộn'							, 12			, 14			, 24000		, 30000		, 'Gói'		, '2025-05-30'		),
						(34			, 'Bột giặt Ariel trắng 1kg'									, 12			, 14			, 42000		, 50000		, 'Gói'		, '2025-09-10'		),
						(35			, 'Dầu ăn Omega 5L'												, 3				, 5				, 100000	, 120000	, 'Thùng'	, '2025-12-31'		),
						(36			, 'Nước ép trái cây Toco Toco 1L'								, 7				, 10			, 20000		, 24000		, 'Chai'	, '2025-07-15'		),
						(37			, 'Bia Tiger lon 330ml'											, 7				, 10			, 14000		, 16500		, 'Lon'		, '2025-06-20'		),
						(38			, 'Sữa đặc Hương Liên 397g'										, 8				, 2				, 18000		, 22000		, 'Lon'		, '2025-04-25'		),
						(39			, 'Bánh gạo Sữa Đậu Nành 200g'									, 9				, 7				, 12000		, 15000		, 'Gói'		, '2025-05-05'		),
						(40			, 'Xà phòng Dove 90g'											, 10			, 15			, 30000		, 35000		, 'Tuýp'	, '2025-10-10'		),
						(41			, 'Kem dưỡng da Nivea 200ml'									, 10			, 15			, 100000	, 118000	, 'Chai'	, '2025-11-15'		),
						(42			, 'Tã bỉm Pampers size L (40 miếng)'							, 11			, 16			, 220000	, 250000	, 'Gói'		, '2025-09-01'		),
						(43			, 'Bàn chải đánh răng Oral-B cứng 2 cái'						, 10			, 15			, 34000		, 40000		, 'Set'		, '2026-01-01'		),
						(44			, 'Nước rửa chén Dawn 500ml'									, 12			, 14			, 25000		, 30000		, 'Chai'	, '2025-07-30'		),
						(45			, 'Chảo chống dính Tefal 28cm'									, 13			, 18			, 300000	, 350000	, 'Cái'		, NULL				),
						(46			, 'Nồi áp suất Philips HD2137 4L'								, 13			, 18			, 650000	, 740000	, 'Cái'		, NULL				),
						(47			, 'Máy xay sinh tố Panasonic MX-GT303'							, 13			, 18			, 800000	, 900000	, 'Cái'		, NULL				),
						(48			, 'Bộ dao kéo KitchenAid 6 phần'								, 13			, 18			, 450000	, 499000	, 'Bộ'		, NULL				),
						(49			, 'Máy lọc nước Kangaroo 8 cấp'									, 13			, 18			, 1030000	, 1200000	, 'Cái'		, NULL				),
						(50			, 'Bình giữ nhiệt Thermos 1.2L'									, 13			, 18			, 500000	, 600000	, 'Cái'		, NULL				),
						(51			, 'Gạo Jasmine 5kg'												, 6				, 1				, 40000		, 45000		, 'Bao'		, '2026-12-01'		),
						(52			, 'Sữa tươi Meiji 1L'											, 8				, 3				, 30000		, 35000		, 'Hộp'		, '2025-03-15'		),
						(53			, 'Cá hồi nhập khẩu Premium 1kg'								, 1				, 19			, 180000	, 200000	, 'Kg'		, '2024-12-20'		),
						(54			, 'Bột chiên xù Krispy 500g'									, 3				, 5				, 50000		, 60000		, 'Gói'		, '2025-07-30'		),
						(55			, 'Nước ép dứa Cappy 1L'										, 7				, 11			, 25000		, 30000		, 'Chai'	, '2025-05-25'		),
						(56			, 'Mì Xào Hảo Hảo Thái 75g'										, 4				, 6				, 3500		, 4000		, 'Gói'		, '2025-04-15'		),
						(57			, 'Nước mắm Phú Quốc 1L'										, 3				, 20			, 40000		, 45000		, 'Chai'	, '2025-08-20'		),
						(58			, 'Sữa bột Aptamil 400g'										, 11			, 8				, 70000		, 80000		, 'Hộp'		, '2025-10-10'		),
						(59			, 'Kem dưỡng tóc Dove 200ml'									, 10			, 9				, 30000		, 35000		, 'Tuýp'	, '2026-01-01'		),
						(60			, 'Bia Tiger Heineken 500ml'									, 7				, 10			, 22000		, 25000		, 'Lon'		, '2025-06-30'		),
						(61			, 'Đồ dùng nhà bếp IKEA Set 10 món'								, 13			, 18			, 500000	, 550000	, 'Bộ'		, NULL				),
						(62			, 'Nước ép táo Happy Day 1L'									, 7				, 11			, 23000		, 27000		, 'Chai'	, '2025-07-15'		),
						(63			, 'Xà phòng rửa tay Lifebuoy 150g'								, 10			, 12			, 11500		, 15000		, 'Tuýp'	, '2025-09-20'		),
						(64			, 'Cà rốt hữu cơ 1kg'											, 2				, 4				, 45000		, 50000		, 'Kg'		, '2024-11-25'		),
						(65			, 'Bột giặt Tide trắng 1kg'										, 12			, 14			, 60000		, 70000		, 'Gói'		, '2025-10-05'		),
						(66			, 'Sữa công thức Gerber 800g'									, 11			, 17			, 100000	, 120000	, 'Hộp'		, '2025-12-15'		),
						(67			, 'Dầu oliu Extra Virgin 500ml'									, 3				, 19			, 80000		, 90000		, 'Chai'	, '2026-01-20'		),
						(68			, 'Mì gói Phở bò tái chín 80g'									, 4				, 20			, 3800		, 4500		, 'Gói'		, '2025-05-10'		),
						(69			, 'Sữa đậu nành Vinasoy 1L'										, 8				, 7				, 20000		, 25000		, 'Lon'		, '2025-03-30'		),
						(70			, 'Màng bọc thực phẩm PVC 30cm x 100m'							, 13			, 18			, 68900		, 75000		, 'Gói'		, NULL				),
						(71			, 'Thịt bò nhập khẩu (1kg)'										, 1				, 19			, 302000	, 350000	, 'Kg'		, '2025-04-20'		),
						(72			, 'Trái cây sấy khô MixBerry 200g'								, 2				, 5				, 35000		, 40000		, 'Gói'		, '2025-09-25'		),
						(73			, 'Sữa tắm Johnson\'s Baby 250ml'								, 10			, 16			, 18000		, 21900		, 'Chai'	, '2025-11-10'		),
						(74			, 'Bột ngũ cốc Kashi 500g'										, 9				, 7				, 40000		, 45000		, 'Gói'		, '2025-08-15'		),
						(75			, 'Nước giải khát Sprite 1.5L'									, 7				, 10			, 20000		, 25000		, 'Chai'	, '2025-06-25'		),
						(76			, 'Sữa hạnh nhân Almond Breeze 1L'								, 8				, 8				, 50000		, 60000		, 'Hộp'		, '2025-12-05'		),
						(77			, 'Đồ dùng vệ sinh cá nhân Rexona 150ml'						, 10			, 15			, 25000		, 29000		, 'Tuýp'	, '2025-10-20'		),
						(78			, 'Bột mì đa dụng 5kg'											, 6				, 1				, 35000		, 40000		, 'Bao'		, '2026-02-01'		),
						(79			, 'Nước mắm Nam Ngư Premium 1L'									, 3				, 5				, 50000		, 59000		, 'Chai'	, '2025-09-30'		),
						(80			, 'Cam tươi 2kg'												, 2				, 4				, 80000		, 90000		, 'Kg'		, '2024-12-10'		);
                        
INSERT INTO Customer 	(CustomerID	, LastName	, MiddleName	, FirstName	, Phone				, Email						, Address																		)
VALUES 					(1			, 'Nguyễn'	, 'Văn'			, 'Anh'		, '+84909123456'	, 'anh.nguyen@gmail.com'	, '123 Đường Lê Lợi, Phường 1, Quận 1, Thành phố Hồ Chí Minh'					),
						(2			, 'Trần'	, 'Thị'			, 'Bích'	, '+84918123456'	, 'bich.tran@gmail.com'		, '456 Đường Nguyễn Huệ, Phường 3, Quận 1, Thành phố Hồ Chí Minh'				),
						(3			, 'Lê'		, 'Minh'		, 'Cường'	, '+84927123456'	, 'cuong.le@gmail.com'		, '789 Đường Võ Văn Kiệt, Phường 5, Quận 1, Thành phố Hồ Chí Minh'				),
						(4			, 'Phạm'	, 'Thị'			, 'Duyên'	, '+84936123456'	, 'duyen.pham@gmail.com'	, '321 Đường Trần Hưng Đạo, Phường 7, Quận 1, Thành phố Hồ Chí Minh'			),
						(5			, 'Vũ'		, 'Ngọc'		, 'Em'		, '+84945123456'	, 'em.vu@gmail.com'			, '654 Đường Lý Thường Kiệt, Phường 9, Quận 1, Thành phố Hồ Chí Minh'			),
						(6			, 'Hoàng'	, 'Quốc'		, 'Phú'		, '+84954123456'	, 'phu.hoang@gmail.com'		, '987 Đường Phan Đình Phùng, Phường 11, Quận 1, Thành phố Hồ Chí Minh'			),
						(7			, 'Đặng'	, 'Hồng'		, 'Giang'	, '+84963123456'	, 'giang.dang@gmail.com'	, '159 Đường Lê Văn Sỹ, Phường 13, Quận 1, Thành phố Hồ Chí Minh'				),
						(8			, 'Bùi'		, 'Văn'			, 'Hải'		, '+84972123456'	, 'hai.bui@gmail.com'		, '753 Đường Phạm Ngũ Lão, Phường 15, Quận 1, Thành phố Hồ Chí Minh'			),
						(9			, 'Ngô'		, 'Thị'			, 'Ivy'		, '+84981123456'	, 'ivy.ngo@gmail.com'		, '852 Đường Nguyễn Thị Minh Khai, Phường 17, Quận 1, Thành phố Hồ Chí Minh'	),
						(10			, 'Võ'		, 'Thị'			, 'Jade'	, '+84990123456'	, 'jade.vo@gmail.com'		, '951 Đường Võ Văn Ngân, Phường 19, Quận 1, Thành phố Hồ Chí Minh'				),
						(11			, 'Dương'	, 'Quốc'		, 'Khoa'	, '+84901123456'	, 'khoa.duong@gmail.com'	, '147 Đường Trịnh Văn Bô, Phường 21, Quận 1, Thành phố Hồ Chí Minh'			),
						(12			, 'Phan'	, 'Hải'			, 'Lan'		, '+84912123456'	, 'lan.phan@gmail.com'		, '258 Đường Trần Phú, Phường 23, Quận 1, Thành phố Hồ Chí Minh'				),
						(13			, 'Bành'	, 'Nhật'		, 'Minh'	, '+84923123456'	, 'minh.banh@gmail.com'		, '369 Đường Lê Quý Đôn, Phường 25, Quận 1, Thành phố Hồ Chí Minh'				),
						(14			, 'Lý'		, 'Thị'			, 'Nhi'		, '+84934123456'	, 'nhi.ly@gmail.com'		, '741 Đường Nguyễn Bỉnh Khiêm, Phường 27, Quận 1, Thành phố Hồ Chí Minh'		),
						(15			, 'Hồ'		, 'Ngọc'		, 'Oanh'	, '+84945123456'	, 'oanh.ho@gmail.com'		, '852 Đường Mai Chí Thọ, Phường 29, Thành phố Hồ Chí Minh'						);

INSERT INTO Employee 	(EmployeeID, LastName  , MiddleName , FirstName , Address                                         							, Gender	, DoB        	, ManagerID	)
VALUES					(1 			, 'Nguyễn' , 'Văn'      , 'Thanh'   , '12 Đường Nguyễn Văn Cừ, Phường 1, Quận 1, Thành phố Hồ Chí Minh'      	, 'Nam' 	, '1980-05-15'	, NULL		),
						(2 			, 'Trần'   , 'Thị'      , 'Hương'   , '34 Đường Lê Lợi, Phường 2, Quận 1, Thành phố Hồ Chí Minh'             	, 'Nữ' 		, '1985-08-22'	, NULL		),
						(3 			, 'Lê'     , 'Ngọc'     , 'Tuấn'    , '56 Đường Phan Văn Trị, Phường 3, Quận 1, Thành phố Hồ Chí Minh'       	, 'Nam' 	, '1990-12-05'	, NULL		),
						(4 			, 'Phạm'   , 'Minh'     , 'Minh'    , '78 Đường Trần Hưng Đạo, Phường 4, Quận 1, Thành phố Hồ Chí Minh'      	, 'Nam' 	, '1992-03-10'	, 1			),
						(5 			, 'Vũ'     , 'Hồng'     , 'Lan'     , '90 Đường Võ Văn Kiệt, Phường 5, Quận 1, Thành phố Hồ Chí Minh'        	, 'Nữ' 		, '1995-07-18'	, 1			),
						(6 			, 'Hoàng'  , 'Thanh'    , 'Long'    , '21 Đường Nguyễn Thị Minh Khai, Phường 6, Quận 1, Thành phố Hồ Chí Minh'	, 'Nam' 	, '1988-11-25'	, 2			),
						(7 			, 'Đặng'   , 'Thị'      , 'Hoa'     , '43 Đường Lý Thường Kiệt, Phường 7, Quận 1, Thành phố Hồ Chí Minh'    	, 'Nữ' 		, '1993-04-30'	, 2			),
						(8 			, 'Bùi'    , 'Hải'      , 'Nam'     , '65 Đường Phạm Ngũ Lão, Phường 8, Quận 1, Thành phố Hồ Chí Minh'      	, 'Nam' 	, '1987-09-12'	, 3			),
						(9 			, 'Ngô'    , 'Bích'     , 'Thảo'    , '87 Đường Nguyễn Văn Ngân, Phường 9, Quận 1, Thành phố Hồ Chí Minh'    	, 'Nữ' 		, '1991-02-20'	, 3			),
						(10			, 'Võ'     , 'Duy'      , 'Duy'     , '109 Đường Trịnh Văn Bô, Phường 10, Quận 1, Thành phố Hồ Chí Minh'     	, 'Nam' 	, '1994-06-07'	, 1			),
						(11			, 'Dương'  , 'My'       , 'My'      , '131 Đường Trần Phú, Phường 11, Quận 1, Thành phố Hồ Chí Minh'         	, 'Nữ' 		, '1996-10-14'	, 2			),
						(12			, 'Bành'   , 'Tâm'      , 'Tâm'     , '153 Đường Lê Quý Đôn, Phường 12, Quận 1, Thành phố Hồ Chí Minh'       	, 'Nam' 	, '1989-01-29'	, 3			),
						(13			, 'Lý'     , 'Ngọc'     , 'Trang'   , '175 Đường Nguyễn Bỉnh Khiêm, Phường 13, Quận 1, Thành phố Hồ Chí Minh'	, 'Nữ' 		, '1997-05-03'	, 1			),
						(14			, 'Hồ'     , 'Hà'       , 'Hà'      , '197 Đường Mai Chí Thọ, Phường 14, Quận 1, Thành phố Hồ Chí Minh'      	, 'Nữ' 		, '1998-08-19'	, 2			),
						(15			, 'Phan'   , 'Ngọc'     , 'Bình'    , '219 Đường Nguyễn Văn Cừ, Phường 15, Quận 1, Thành phố Hồ Chí Minh'    	, 'Nam' 	, '1990-11-11'	, 3			);

INSERT INTO Warehouse 	(WarehouseID	, Location										)
VALUES 					(1				, 'Quận 1, Thành phố Hồ Chí Minh'				),
						(2				, 'Quận 7, Thành phố Hồ Chí Minh'				),
						(3				, 'Quận Bình Thạnh, Thành phố Hồ Chí Minh'		),
						(4				, 'Thành phố Thủ Đức, Thành phố Hồ Chí Minh'	),
						(5				, 'Quận Tân Phú, Thành phố Hồ Chí Minh'			);
                        
INSERT INTO WarehouseEmployee 	(WarehouseID	, EmployeeID	)
VALUES							(1				, 4				),
								(1				, 5				),
								(1				, 10			),
								(2				, 6				),
								(2				, 7				),
								(2				, 11			),
								(3				, 8				),
								(3				, 9				),
								(3				, 15			),
								(4				, 12			),
								(4				, 13			),
								(4				, 14			),
								(5				, 1				),
								(5				, 2				),
								(5				, 3				);

INSERT INTO StockSale (WarehouseID, EmployeeID, ProductID, Quantity, DateTime, Type) VALUES
(1, 4, 2, 85, '2024-10-7', 'Xuất'),
(1, 5, 23, 128, '2024-09-08', 'Nhập'),
(1, 10, 17, 101, '2024-10-31', 'Nhập'),
(2, 6, 36, 76, '2024-11-28', 'Xuất'),
(2, 7, 37, 152, '2024-11-21', 'Nhập'),
(2, 11, 57, 89, '2024-10-19', 'Xuất'),
(3, 8, 45, 40, '2024-11-16', 'Nhập'),
(3, 9, 58, 105, '2024-11-03', 'Xuất'),
(3, 15, 16, 100, '2024-09-30', 'Xuất'),
(4, 12, 72, 92,'2024-10-27', 'Xuất'),
(4, 13, 31, 114, '2024-10-01', 'Nhập'),
(4, 14, 40, 50,	'2024-11-12', 'Nhập'),
(5, 1, 71, 75, '2024-09-25', 'Nhập'),
(5, 2, 68, 80, '2024-09-17', 'Xuất'),
(5, 3, 14, 110, '2024-10-10', 'Nhập');

INSERT INTO DiscountProduct (DiscountProductID, DiscountName, 'Description', StartDate, EndDate, DiscountType, DiscountValue) VALUES
(1,	'Black Friday',	'Giảm giá chỉ trong Black Friday', '2024-11-29 00:00:00', '2024-11-29 23:59:59', 'Phần trăm', 50),
(2, 'Giảm giá Tết', 'Giảm giá trong Tết Nguyễn Đán',	'2024-02-08 00:00:00', '2024-02-13 23:59:59', 'Phần trăm', 40),
(3, 'Giảm giá hè', 'Giảm giá trong dịp hè đến', '2024-06-01 00:00:00', '2024-06-07 23:59:59', 'Số tiền', 100000),
(4, 'Christmas Sale', 'Giảm giá trong dịp Giáng Sinh', '2024-12-23 00:00:00', '2024-12-25 23:59:59', 'Phần trăm',	40),
(5, 'Mùa tựu trường', 'Giảm giá trong dịp tựu trường', '2024-08-28 00:00:00', '2024-09-03 23:59:59', 'Số tiền', 50000),
(6, 'Quà 8/3',	'Giảm giá ngày Quốc tế phụ nữ', '2024-03-08 00:00:00', '2024-08-03 23:59:59', 'Số tiền', 40000),
(7, 'Flash Sale', 'Giảm gíá vào khung giờ vàng', '2024-03-15 12:00:00', '2024-03-15 16:00:00', 'Phần trăm', 25),
(8, 'Giảm giá 30/4 và 1/5',	'Giảm giá trong dịp 30/4 và 1/5', '2024-04-29 00:00:00', '2024-05-02 23:59:59', 'Phần trăm', 30),
(9, 'Valentine', 'Giảm giá trong ngày lễ tình nhân', '2024-02-14 00:00:00', '2024-02-14 23:59:59', 'Số tiền', 30000),
(10, 'Cyber Monday', 'Giảm giá chỉ trong Cyber Monday',	'2024-12-02 00:00:00', '2024-12-02 23:59:59', 'Phần trăm', 35),
(11, 'Giảm giá 2/9', 'Giảm giá nhân dịp Quốc Khánh 2/9', '2024-09-01 00:00:00', '2024-09-03 23:59:59', 'Phần trăm', 50),
(12, 'Giảm giá trung thu', 'Giảm giá trong dịp Trung Thu',	'2024-09-15 00:00:00', '2024-09-19 23:59:59', 'Số tiền', 50000),
(13, 'Ngày độc thân 11/11', 'Giảm giá trong ngày lễ độc thân', '2024-11-11 00:00:00', '2024-11-12  23:59:59', 'Phần trăm', 10),
(14, 'Giảm giá cuối năm', 'Giảm giá trong những ngày cuối của năm',	'2024-11-28 00:00:00', '2024-12-31 23:59:59', 'Phần trăm', 25),
(15, 'Giảm giá xuân', 'Giảm giá trong dịp xuân đến', '2024-03-05 00:00:00', '2024-03-08 23:59:59', 'Số tiền', 100000);

INSERT INTO DiscountProduct_Product (DiscountProductID, ProductID) VALUES
(1,	1),
(1,	2),
(2,	3),
(2,	4),
(3,	2),
(4,	8),
(4,	7),
(5,	3),
(6,	9),
(7,	5),
(7,	10),
(8,	1),
(8,	15),
(8,	15),
(9, 10);

INSERT INTO DiscountOrder (DiscountProductID, DiscountName, 'Description', StartDate, EndDate, DiscountType, DiscountValue, MinimumOrderAmount) VALUES
(1,	'Black Friday',	'Ưu dãi trong chỉ trong Black Friday', '2024-11-29 00:00:00', '2024-11-29 23:59:59', 'Phần trăm', 40, 2000000),
(2, 'Giảm giá Tết', 'Khuyến mãi mừng Tết Nguyên Đán',	'2024-02-08 00:00:00', '2024-02-13 23:59:59', 'Phần trăm', 25, 1000000),
(3, 'Giảm giá hè', 'Giảm giá mùa hè cho mọi đơn hàng', '2024-06-01 00:00:00', '2024-06-07 23:59:59', 'Phần trăm', 15, 500000),
(4, 'Christmas Sale', 'Giảm giá mùa Giáng Sinh', '2024-12-23 00:00:00', '2024-12-25 23:59:59', 'Phần trăm', 20,	1000000),
(5, 'Mùa tựu trường', 'Ưu đãi mùa tựu trường cho học sinh, sinh viên', '2024-08-01 00:00:00', '2024-08-31 23:59:59', 'Số tiền', 100000, 800000),
(6, 'Giảm giá VIP',	'Ưu đãi dành cho khách hàng đặt biệt', '2024-01-10 00:00:00', '2024-1-16 23:59:59', 'Phần trăm', 25, 500000),
(7, 'Flash Sale', 'Khuyến mãi vào khung giờ vàng', '2024-09-01 12:00:00', '2024-09-01 18:00:00', 'Phần trăm', 10, 800000),
(8, 'Giảm giá 30/4 và 1/5',	'Giảm giá mọi đơn hàng trong dịp 30/4-1/5', '2024-04-29 00:00:00', '2024-05-02 23:59:59', 'Số tiền', 300000, 500000),
(9, 'Khách hàng mới', 'Ưu đãi dành cho khách hàng mua sắm lần đầu', '2024-10-01 00:00:00', '2024-11-30 23:59:59', 'Phần trăm', 15, 1000000),
(10, 'Cyber Monday', 'Ưu dãi trong chỉ trong Cyber Monday',	'2024-12-02 00:00:00', '2024-12-02 23:59:59', 'Phần trăm', 15, 1500000),
(11, 'Giảm giá 2/9', 'Ưu đãi nhân dịp Quốc Khánh 2/9', '2024-09-01 00:00:00', '2024-09-03 23:59:59', 'Phần trăm', 30, 1500000),
(12, 'Giảm giá trung thu', 'Giảm giá trong dịp Trung Thu',	'2024-09-15 00:00:00', '2024-09-19 23:59:59', 'Số tiền', 25000, 300000),
(13, 'Tri ân khách hàng', 'Quà tặng tri ân khách hàng', '2024-01-12 00:00:00', '2024-01-15 23:59:59', 'Phần trăm', 20, 800000),
(14, 'Giảm giá cuối năm', 'Giảm giá trong những ngày cuối của năm',	'2024-11-28 00:00:00', '2024-12-31 23:59:59', 'Số tiền', 50000, 200000),
(15, 'Giảm giá xuân', 'Giảm giá mùa xuân cho mọi đơn hàng', '2024-03-05 00:00:00', '2024-03-08 23:59:59', 'Số tiền', 100000, 1000000);

INSERT INTO Order (OrderID, EmployeeID, DiscountOrderID) VALUES
(101,	1, 2),
(102,	3, 7),
(103,	4, 9),
(104,	5, 12),
(105,	1, 1),
(106,	2, 10),
(107,	5, 14),
(108, 3, 13),
(109,	4, 3),
(110,	2, 15),
(111,	5, 4),
(112,	3, 7),
(113, 1, 5),
(114, 2, 12),
(115, 4, 6);

INSERT INTO Product_Order (ProductID, OrderID, QuantitySold, UnitPrice) VALUES
(1, 101, 2, 95000),
(18, 101, 2, 37000),
(47, 102,	1, 800000),
(49, 103,	1, 1030000),
(30, 104,	2, 100000),
(45, 104,	1, 300000),
(71, 105,	4, 302000),
(53, 105, 2, 180000),
(12, 105,	8, 70000),
(32, 106,	2, 40000),
(21, 107,	4, 50000),
(48, 108,	2, 450000),
(42, 109, 2, 220000),
(58, 109, 2, 70000),
(49, 110, 1, 1030000);

INSERT INTO Payment (PaymentID, OrderID, CustomerID,  PaymentMethod, `DateTime`) VALUES
(1, 101, 1, 'Tiền mặt', '2024-02-09 15:19:44'),
(2, 102, 2, 'Chuyển khoản', '2024-09-01 17:15:09'),
(3, 103, 3, 'Thẻ', '2024-02-24 11:32:50'),
(4, 104, 4, 'Chuyển khoản', '2024-09-15 19:22:16'),
(5, 105, 5, 'Thẻ', '2024-11-29 18:49:13'),
(6, 106, 6, 'Tiền mặt', '2024-12-02 09:24:39'),
(7, 107, 7, 'Tiền mặt', '2024-12-31 12:45:15'),
(8, 108, 8, 'Chuyển khoản', '2024-12-15 13:59:17'),
(9, 109, 9, 'Thẻ', '2024-06-05 08:30:43'),
(10, 110, 10, 'Thẻ', '2024-03-08 10:27:25'),
(11, 111, 11, 'Tiền mặt', '2024-12-25 14:05:52'),
(12, 112, 12, 'Chuyển khoản', '2024-09-01 15:00:09'),
(13, 113, 13, 'Tiền mặt', '2024-08-31 12:26:34'),
(14, 114, 14, 'Thẻ', '2023-09-15 18:54:13'),
(15, 115, 15, 'Thẻ', '2024-01-11 16:23:36');

INSERT INTO Voucher (CustomerID, OrderID, VoucherName, VoucherValue, StartDate, EndDate, `Description`) VALUES
(1, 101, 'Giảm giá Tết', 500000, '2024-02-08 08:00:00', '2024-02-13 23:59:59', 'Giảm giá dịp Tết Nguyên Đán'),
(2, 102, 'Mua 2 tặng 1', 200000, '2024-09-01 00:00:00', '2024-09-05 23:59:59', 'Ưu đãi mua 2 sản phẩm'),
(3, 103, 'Khách hàng mới', 300000, '2024-02-20 00:00:00', '2024-02-25 23:59:59', 'Dành cho khách hàng mới'),
(4, 104, 'Giảm 10%', 100000, '2023-09-15 08:00:00', '2023-10-15 23:59:59', 'Ưu đãi giảm 10%'),
(5, 105, 'Black Friday', 150000, '2024-11-29 00:00:00', '2024-11-29 23:59:59', 'Khuyến mãi Black Friday'),
(6, 106, 'Cyber Monday', 250000, '2024-12-02 00:00:00', '2024-12-02 23:59:59', 'Khuyến mãi Cyber Monday'),
(7, 107, 'Giảm giá cuối năm', 400000, '2024-12-15 00:00:00', '2024-12-31 23:59:59', 'Khuyến mãi cuối năm'),
(8, 108, 'Tri ân khách hàng', 500000, '2024-01-12 00:00:00', '2024-01-15 23:59:59', 'Quà tặng tri ân khách hàng'),
(9, 109, 'Giảm giá hè', 200000, '2024-06-01 00:00:00', '2024-06-07 23:59:59', 'Ưu đãi mùa hè'),
(10, 110, 'Quà 8/3', 300000, '2024-03-01 00:00:00', '2024-03-08 23:59:59', 'Ưu đãi ngày Quốc tế Phụ nữ'),
(11, 111, 'Noel Sale', 600000, '2023-12-15 00:00:00', '2023-12-25 23:59:59', 'Giảm giá dịp Noel'),
(12, 112, 'Flash Sale', 100000, '2024-09-01 12:00:00', '2024-09-01 18:00:00', 'Ưu đãi giờ vàng'),
(13, 113, 'Mùa tựu trường', 200000, '2024-08-01 00:00:00', '2024-08-31 23:59:59', 'Giảm giá mùa tựu trường'),
(14, 114, 'Giảm giá trung thu', 250000, '2024-09-15 00:00:00', '2024-09-19 23:59:59', 'Khuyến mãi dịp Trung thu'),
(15, 115, 'Giảm giá VIP', 1000000, '2024-01-10 00:00:00', '2024-01-16 23:59:59', 'Dành cho khách hàng VIP');

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
