USE [master]
GO
/****** Object:  Database QLMYPHAM    ***/
CREATE DATABASE QLMYPHAM 
GO

USE QLMYPHAM 

ALTER DATABASE [QLMYPHAM ] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMYPHAM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMYPHAM ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLMYPHAM ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMYPHAM ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMYPHAM ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLMYPHAM ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMYPHAM ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET RECOVERY FULL 
GO
ALTER DATABASE [QLMYPHAM ] SET  MULTI_USER 
GO
ALTER DATABASE [QLMYPHAM ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMYPHAM ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMYPHAM ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMYPHAM ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLMYPHAM ', N'ON'
GO



GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 10/14/2020 2:11:19 PM ******/

CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[Masp] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY ([MaDonHang],[Masp] )
)
	


GO
/****** Object:  Table [dbo].[Thuonghieu]    Script Date: 10/14/2020 2:11:19 PM ******/
go

CREATE TABLE [dbo].[Thuonghieu](
	[Mathuonghieu] [int] IDENTITY(1,1) NOT NULL,
	[Tenthuonghieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY  ([Mathuonghieu])
)

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/14/2020 2:11:19 PM ******/
go
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayGiao] [datetime] NULL,
	[NgayDat] [datetime] NULL,
	[DaThanhToan] [nvarchar](50) NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY ([MaDonHang] )
)
	


GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/14/2020 2:11:19 PM ******/
go
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[DienThoai] [varchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY ([MaKH]) 
)
	

CREATE TABLE [dbo].[NhaXuatXu](
	[Maxuatxu] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaXuatXu] PRIMARY KEY ([Maxuatxu] ASC)
)
GO

GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 10/14/2020 2:11:19 PM ******/

GO
CREATE TABLE [dbo].[Sanpham](
	[Masp] [int] IDENTITY(1,1) NOT NULL  PRIMARY KEY,
	[Tensp] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[AnhBia] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[Mathuonghieu] [int] NULL,
	[Maxuatxu] [int] NULL,
	[Moi] [int] NULL,
  )
GO
	CREATE TABLE [DBO].[CHITIETSANPHAM]
	(
		[Masp] [int] IDENTITY(1,1) NOT NULL  PRIMARY KEY,
		[AnhBia1] [nvarchar](max) NULL,
		[AnhBia2] [nvarchar](max) NULL,
		[AnhBia3] [nvarchar](max) NULL,
		Constraint [FK_CTSP_SP] FOREIGN KEY ([Masp]) references [dbo].[Sanpham]([Masp]),
	)
go 

GO 

SET IDENTITY_INSERT [dbo].[Thuonghieu] ON 
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (1, N'Loreal');
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (2, N'Clinique')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (3, N'MAC')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (4, N' Mỹ phẩm Maybelline')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (5, N'Mỹ phẩm Shu Uemura')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (6, N'Mỹ phẩm SK-II')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (7, N'Mỹ phẩm Olay')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (8, N'Mỹ phẩm Revlon')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (9, N'Mỹ phẩm Estee Lauder')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (10, N'Mỹ phẩm Dove')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (11, N'Covergirl')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (12, N'Maybelline New York')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (13, N'Thương hiệu Estée Lauder')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (14, N'Thương hiệu Revlont')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (15, N'Thương hiệu 3CE Style Nanda')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (16, N'Thương hiệu Urban Decay')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (17, N'Thương hiệu Thefaceshop')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (18, N'Thương hiệu Yves Rocher')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (19, N'Thương hiệu Missha')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (20, N'Thương hiệu Shiseido')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (21, N'Thương hiệu Sebamed')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (22, N'Thương hiệu Kiehl’s')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (23, N'Thương hiệu mỹ phẩm Tom Ford')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (24, N'Thương hiệu mỹ phẩm Mỹ Murad')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (25, N'Thương hiệu mỹ phẩm ELF')
INSERT [dbo].[Thuonghieu] ([Mathuonghieu], [Tenthuonghieu]) VALUES (26, N'Thương hiệu mỹ phẩm cao cấp EltaMD')
SET IDENTITY_INSERT [dbo].[Thuonghieu] off  
go

go
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (1, NULL, CAST(0x0000A3E90018B26F AS DateTime), NULL, NULL, 5)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (2, NULL, CAST(0x0000A3E90019D84A AS DateTime), NULL, NULL, 5)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (3, NULL, CAST(0x0000A3E9001A4A22 AS DateTime), NULL, NULL, 5)
SET IDENTITY_INSERT [dbo].[DonHang] OFF

GO

go


SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (2, N'a', CAST(0x0000836100000000 AS DateTime), N'332', N'3', N'321dsds', N'dd', N'dsa@dsad.com', N'sadsa     ')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (4, N'a', CAST(0x000088C500000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (5, N'dddddddsadsa', CAST(0x0000834200000000 AS DateTime), N'Nam', N'32321321321', N'myclass', N'123123', N'123@yahoo.com', N'32132321  ')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF

go 
SET IDENTITY_INSERT [dbo].[NhaXuatXu] ON
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (1, N'Hàn Quốc ' )
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (2, N'Mỹ ')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (3, N'Nhật Bản')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (4, N'Trung Quốc ')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (5, N'Nga')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (6, N'Pháp')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (7, N'Đài Loan ')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (8, N'Bỉ')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (9, N'Tàu Khựa')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (10, N'Amazon')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (11, N'Git Hub')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (12, N'Châu phi  ')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (13, N'Lào ')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (14, N'Việt Nam')
INSERT [dbo].[NhaXuatXu] ([Maxuatxu], [Ten]) VALUES (15, N'Singa')
SET IDENTITY_INSERT [dbo].[NhaXuatXu] OFF
go


SET IDENTITY_INSERT [dbo].[Sanpham] ON 
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (1, N'Tinh chất dưỡng ẩm Skinceuticals Hydrating B5 30ml', CAST(85000 AS Decimal(18, 0)), N'Skinceuticals Hydrating B5 là sản phẩm luôn nằm trong to đầu serum B5 mà các cô gái tìm kiếm và mong ước được sử dụng. Với hàm lượng vitamin B5 cực cao khiến ai dùng qua đều thấy hữu hiệu và xứng đáng với số tiền bỏ ra :*

Serum dưỡng ẩm da lí tưởng hàng ngày mà không hề gây nhờn hay bít tắc lỗ chân lông nhờ công thức serum dạng gel đặc biệt không chứa dầu. Với thành phần có axit hyaluronic - chất dưỡng và khóa ẩm tự nhiên cùng vitamin B5, sản phẩm giúp cấp nước, khóa ẩm và nuôi dưỡng da cực kì hiệu quả. Da bạn sẽ luôn căng mọng, mướt mịn, hồng hào cả trong những ngày thời tiết khô hanh nhất.

Serum dưỡng ẩm Skinceuticals Hydrating B5 không chứa dầu, không cồn, không paraben, không hương liệu, hoàn toàn tinh khiết tự nhiên, phù hợp với mọi loại da. Đặc biệt là những bạn da dầu mụn - vì hoạt động chính của B5 là phân giải lượng dầu thừa trên da. Vitamin B5 nên bạn ý sẽ giúp ngăn chặn hoàn toàn mụn trứng cá hay những tác nhân gây lên mụn ở da, nhất là những bạn bị mụn nội tiết.

Thúc đẩy sự phục hồi da sau tổn thương do mụn, sau điều trị nặn mụn, kháng viêm, chữa da sau kích ứng.

Sử dụng serum vào mỗi buổi sáng và tối. Thứ tự dùng: Tẩy trang - sữa rửa mặt - Toner - Serum B5 - kem dưỡng.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...', CAST(0x0000A3DE00000000 AS DateTime), N'000001.jpg', 100, 1, 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (2, N'Muối biển tinh khiết 500g', CAST(75000 AS Decimal(18, 0)), N'Thành phần: 100% muối biển nguyên chất, giàu khoáng chất tự nhiên; không tẩy trắng, không tinh chế, không bổ sung iot.
Công dụng: Dùng để nấu ăn hoặc súc rửa đường tiêu hóa (salt water - cleanse) hoặc pha nước rửa rau củ,…
Hướng dẫn súc rửa đường tiêu hóa bằng nước muối biển: Súc rửa đường tiêu hóa bằng muối biển ', CAST(0x0000A02500000000 AS DateTime), N'000002.jpg', 50, 1, 2, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (3, N'Bông ngoáy tai hữu cơ Masmi', CAST(55000 AS Decimal(18, 0)), N'Bông ngoáy tai hữu cơ Masmi làm từ 100% bông hữu cơ nguyên chất, không chứa hóa chất gây hại, đảm bảo sức khỏe người tiêu dùng.
Bông là một trong những loại cây trồng biến đổi gen phổ biến trên thế giới nên hãy lựa chọn những sản phẩm được chứng nhận hữu cơ để đảm bảo sức khỏe.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ...', CAST(0x0000A02500000000 AS DateTime), N'000003.jpg', 10, 1, 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (4, N'Mặt Nạ Tẩy Tế Bào Chết Huxley Scrub Mask Sweet Therapy 30g', CAST(60000 AS Decimal(18, 0)), N'Là mặt nạ tẩy da chết được làm từ các thành phần tự nhiên, dễ dàng loại bỏ da chết mà không làm khô da.
Với chiết xuất từ ​​cây xương rồng lê của Sahara, chứa chất chống oxy hóa có lợi cho da, vitamin E và axit linoleic.
Làm giảm sưng đỏ và giúp thúc đẩy da chết một cách nhẹn nhàng
Phù hợp cho tất cả các loại da, đặc biệt với da dầu tiết nhiê bã nhờn dư thừa và lỗ chân lông bị tắc.
Được sản xuất không có paraben, thuốc nhuộm tổng hợp hoặc dầu khoáng. ', CAST(0x0000A02500000000 AS DateTime), N'000004.jpg', 10, 4, 4, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (5, N'Kem Xả Dove Phục Hồi Hư Tổn 1 Phút Dạng Gel Sữa Dưỡng (150ml)', CAST(62000 AS Decimal(18, 0)), N'Kem xả dành cho tóc hư tổn, thiếu bồng bềnh
Phục hồi các dấu hiệu tóc hư tổn chỉ trong 1 phút
Phù hợp để sử dụng hàng ngày ', CAST(0x0000A02500000000 AS DateTime), N'000005.jpg', 10, 1, 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (6, N'Sữa dưỡng thể Bath & Body Work Dark Kiss', CAST(71000 AS Decimal(18, 0)), N'Giúp duy trì làn da mềm mại tươi trẻ, mà còn ở các loại mùi hương đa dạng và đầy sức hút của bản thân sản phẩm
Không lưu mùi đậm đặc như khi dùng nước hoa, mà sẽ thoang thoảng trên da
Làn da mượt mà, trắng hồng nhờ Vitamin C ', CAST(0x0000A02500000000 AS DateTime), N'000006.jpg', 10, 1, 5, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (7, N'Tẩy da chết đường đen dịu nhẹ, làm sạch mụn đầu đen Klairs Gentle Black Sugar Facial Polish 110g', CAST(18000 AS Decimal(18, 0)), N'Sản phẩm phù hợp cho mọi loại da, đặc biệt là da khô / da có mụn đầu đen vùng mũi.
Giúp loại bỏ tế bào chết hiệu quả, mang lại làn da mềm mại hơn.
Giảm thiểu bít tắc lỗ chân lông, hỗ trợ cải thiện mụn đầu đen vùng mũi.
Giúp lớp make-up “ăn phấn” hơn, giảm hiện tượng cakey.
Thúc đẩy da tái tạo và sản sinh tế bào mới, duy trì làn da tươi trẻ và khỏe mạnh.
Dưỡng ẩm, làm mềm da, giúp da không bị khô căng bong tróc sau khi sử dụng.', CAST(0x0000A02500000000 AS DateTime), N'000007.jpg', 10, 1, 6, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (8, N'Kem dưỡng trắng da Body Cream', CAST(37000 AS Decimal(18, 0)), N'Sản phẩm chiết xuất hoàn toàn tự nhiên với các thành phần dưỡng trắng hiệu quả như:VITAMIN B3,VITAMIN C,đặc biệt là ALPHA ARBUTIN thành phần dưỡng trắng hiệu quả và tốt nhất hiện nay.
Sản phẩm sử dụng hàng ngày nhằm cung cấp và bổ sung các dưỡng chất cần thiết giúp da luôn mềm mịn tự nhiên.
Giúp cải thiện các vấn đề về da như sạm đen, khô và sần sùi, dưỡng da sáng trắng hồng tự nhiên.
Bảo vệ da trước ánh nắng mặt trời, góp phần ngăn ngừa ngăn ngừa lão hóa da.
Có thể dùng cho da mặt và toàn thân.
Thấm cực nhanh ,rất khô thoáng,không đổ hôi,không trôi nước
Độ makeup nhẹ rất tự nhiên
Chất kem mềm mịn,mát lạnh', CAST(0x0000A02500000000 AS DateTime), N'000008.jpg', 10, 1, 7, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (9, N'C# Dành Cho Người Tự Học - Tập 1', CAST(67000 AS Decimal(18, 0)), N'Sách được chia thành 11 bài, từ căn bản đến nâng cao kèm theo CD bài tập thực hành nhằm giúp bạn học một cách nhanh chóng và dễ hiểu như:', CAST(0x0000A02500000000 AS DateTime), N'000009.jpg', 10, 1, 8, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (10, N'C# Dành Cho Người Tự Học - Tập 2', CAST(69000 AS Decimal(18, 0)), N'Trong tập 2 này, các bạn sẽ tìm hiểu ứng dụng C# trong Windows Form qua 2 phần, mỗi phần là một bài tập lớn xây dựng lên ứng dụng Quản lý bán hàng và Quản lý tuyển sinh để bạn đọc hiểu rõ và khai thác có hiệu quả những công cụ và lệnh của C# đã trình bày trong tập 1.', CAST(0x0000A02500000000 AS DateTime), N'000010.jpg', 10, 1, 2, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (11, N'Nghệ Thuật Sống An Lạc ', CAST(69000 AS Decimal(18, 0)), N'"Nghệ thuật sống An lạc là tuyển tập các bài giảng liên quan tới chủ đề nghệ thuật sống của Đức Nhiếp Chính Vương Khamtrul Rinpoche đời thứ IX Jigme Pema Nyinjadh . ', CAST(0x0000A02500000000 AS DateTime), N'000011.jpg', 10, 3, 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (12, N'Phương Pháp Quản Lý Nhân Sự Trong Công Ty', CAST(69000 AS Decimal(18, 0)), N'Những người sử dụng lao động đã hiểu dần các giá trị mà con người tạo ra cho tổ chức của họ. ', CAST(0x0000A02500000000 AS DateTime), N'000012.jpg', 10, 6, 8, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (13, N'Ngọc Sáng Trong Hoa Sen', CAST(69000 AS Decimal(18, 0)), N'Trong nửa thế kỷ qua, số người phương Tây thăm viếng phương Đông không phải là ít nhưng đã có mấy ai lĩnh hội được tinh hoa của phương Đông? ', CAST(0x0000A02500000000 AS DateTime), N'000013.jpg', 10, 3, 7, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (14, N'Hành Trình Về Phương Đông', CAST(18000 AS Decimal(18, 0)), N'"Hành trình về phương đông" kể về những trải nghiệm của một đoàn khoa học gồm các chuyên gia hàng đầu của Hội Khoa Học Hoàng Gia Anh được cử sang Ấn Độ nghiên cứu về huyền học và những khả năng siêu nhiên của con người. ', CAST(0x0000A02500000000 AS DateTime), N'000014.jpg', 10, 3, 6, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (15, N'Lập Bản Đồ Tư Duy - Công Cụ Tư Duy Tối Ưu Sẽ Làm Thay Đổi Cuộc Sống Của Bạn', CAST(18000 AS Decimal(18, 0)), N'Lập Bản Đồ Tư Duy - Công Cụ Tư Duy Tối Ưu Sẽ Làm Thay Đổi Cuộc Sống Của Bạn:', CAST(0x0000A02500000000 AS DateTime), N'000015.jpg', 10, 4, 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (16, N'Đơn Giản Và Thuần Khiết', CAST(18000 AS Decimal(18, 0)), N'Giới thiệu về nội dung Tác phẩm này là tổng hợp của nhiều bài Pháp được giảng từ những năm 1954 đến 1977 của Upasika Kee Nanayon. Mỗi phần có thể là một bài giảng ở một thời điểm khác nhau, vì thế khi tập hợp lại, điều này tạo cho chúng ta cảm tưởng của sự lặp đi lặp lại nhiều ý tưởng. Đó có thể là lý do khiến cho một số độc giả thiếu kiên nhẫn khi theo dõi, riêng đối với những người sơ cơ thì điều đó lại là một ân huệ. Ngoài ra văn phong của Upasika Kee Nanayon rất giản dị, chân tình. Đôi khi chúng ta sẽ có cảm giác như đang nghe những lời nhắc nhở, dạy dỗ của một người thầy, người mẹ, dầu hơi nghiêm khắc, nhưng luôn tràn đầy tâm từ bi, muốn cho người nghe, người đọc phải tinh tấn thêm lên, gấp rút thêm lên trên con đường tu học của mình.', CAST(0x0000A02500000000 AS DateTime), N'000016.jpg', 10, 3, 8, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (17, N'Cách Sống - Từ Bình Thường Trở Nên Phi Thường', CAST(18000 AS Decimal(18, 0)), N'Inamori Kazuo một doanh nhân hết sức thành đạt trong việc sáng lập và điều hành tập đoàn Kyocera lớn mạnh của Nhật Bản. ', CAST(0x0000A02500000000 AS DateTime), N'000017.jpg', 50, 6, 7, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (18, N'Những Quy Luật Mới Trong Bán Lẻ', CAST(18000 AS Decimal(18, 0)), N'Ngành bán lẻ đang chứng kiến một sự thay đổi trọng đại. ', CAST(0x0000A02500000000 AS DateTime), N'000018.jpg', 50, 6, 6, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (19, N'Lavina Và Hầu Tước Elswick (Cuộc Chạy Trốn Nữ Hoàng)', CAST(75000 AS Decimal(18, 0)), N'Khi Hoàng tử Stanislaus của xứ Balkan yêu cầu có một cô dâu của Anh quốc, Nữ hoàng Victoria đã quyết định chọn tiểu thư Lavina gửi cho hắn. Gia đình nàng có quan hệ họ hàng xa với hoàng tộc.', CAST(0x0000A02500000000 AS DateTime), N'000019.jpg', 50, 5, 5, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (20, N'Hành Vi Tổ Chức - Organizational Behavior', CAST(75000 AS Decimal(18, 0)), N'"Vũ trụ cũng không khó hiểu bằng hành động của con người." Marcel Proust Tiến sĩ Timothy A. Judge từng là giáo sư giảng dạy tại trường Đại Học Cornell và đại học Lowa. Ông nghiên cứu chuyên sâu vào các lĩnh vực liên quan đến sự khác biệt cá nhân, thuật lãnh đạo và ảnh hưởng hành vi con người...Ông đã được trao nhiều giải thưởng quan trọng như Emest J.McCormick Award, Larry L. Cummings Award...', CAST(0x0000A02500000000 AS DateTime), N'000020.jpg', 50, 6, 2, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (21, N'17 Nguyên Tắc Vàng Trong Làm Việc Nhóm', CAST(75000 AS Decimal(18, 0)), N'Khi trở thành thành viên của một nhóm nào đó thì vấn đề bạn cần băn khoăn không phải là “Có nên tham gia các hoạt động của nhóm không?” mà là “Những đóng góp của bạn có mang lại thành công cho nhóm không?” Các cá nhân không thể gắn kết với nhau là nguyên nhân làm tan rã nhóm. Một số người nghĩ rằng chìa khoá để thành công là nguyên tắc làm việc rõ ràng. Nhưng trên thực tế, có nhiều người rất siêng năng, khả năng làm việc độc lập rất tốt nhưng lại không thể làm việc cùng nhau để phát huy hết tiềm lực của họ. Thực chất, nhóm phải là nhóm những cá nhân luôn tương trợ, giúp đỡ lẫn nhau, tạo động lực cho nhau phát triển. Giữa các cá nhân phải có sự tương tác với nhau như một chuỗi phản ứng hoá học. Đó là cách thức để xây dựng nhóm của riêng bạn. ', CAST(0x0000A02500000000 AS DateTime), N'000021.jpg', 50, 6, 3, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (22, N'Essential Words For The IELTS (Kèm 1 Đĩa CD)', CAST(75000 AS Decimal(18, 0)), N'Extensive practice in vocabulary building and correct English usage, with emphasis on 600 words that appear frequently on the IELTS.', CAST(0x0000A02500000000 AS DateTime), N'000022.jpg', 50, 2, 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (23, N'Tiếng Hàn Trong Giao Tiếp Hàng Ngày', CAST(75000 AS Decimal(18, 0)), N'Extensive practice in vocabulary building and correct English usage, with emphasis on 600 words that appear frequently on the IELTS.', CAST(0x0000A02500000000 AS DateTime), N'000023.jpg', 50, 2, 6, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (24, N'80 Chiêu Thức Kinh Doanh Thành Công', CAST(75000 AS Decimal(18, 0)), N'Làm sao để nắm bắt và khai thác cơ hội kinh doanh hiệu quả nhất, doanh số tăng, lợi nhuận cao nhưng chi phí giảm? Làm sao để tạo được ấn tượng trong trí nhớ khách hàng? Làm sao để thị trường công nhận rằng bạn cung cấp các sản phẩm tốt nhất, có dịch vụ hậu mãi hoàn hảo nhất? Làm sao để tạo nên một tập thể nhân viên làm việc tích cực và sáng tạo?... Những câu hỏi đó luôn làm trăn trở các nhà quản trị doanh nghiệp, và bí mật sẽ được tiết lộ trong cuốn sách này', CAST(0x0000A02500000000 AS DateTime), N'000024.jpg', 50, 6, 4, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (25, N'Những Công Cụ Thiết Yếu Trong Phân Tích Kỹ Thuật Thị Trường Tài Chính ', CAST(48000 AS Decimal(18, 0)), N'Một cuốn sách nghiêm túc thiết thực, sự giới thiệu tuyệt vời về phát triển kỹ thuật. Chen mang lại cho những người mới bắt đầu những ví dụ rõ ràng về các phương pháp và kinh tế, từ đó người đọc có thể chọn ra một hướng chuyên môn hóa', CAST(0x0000A02500000000 AS DateTime), N'000025.jpg', 50, 5, 4, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (26, N'Nàng Lọ Lem Và Đàn Chuột Mất Tích', CAST(75000 AS Decimal(18, 0)), N'Những chú chuột nhỏ đã trải qua một đêm lạnh cóng trên gác mái của lâu đài, chúng tìm vào phòng Lọ Lem mong được sưởi ấm. ', CAST(0x0000A02500000000 AS DateTime), N'000026.jpg', 50, 5, 8, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (27, N'Công Chúa Aurora Và Chú Rồng Nhỏ', CAST(48000 AS Decimal(18, 0)), N'Hãy thử tưởng tượng xem mình sẽ làm gì nếu kết bạn với một chú rồng nhỏ? Chắc chắn sẽ có những điều rất thú vị phải không? Vậy công chúa Aurora đã làm những gì khi tình cờ gặp chú rồng nhỏ trên đường đi dạo cùng hoàng tử ?', CAST(0x0000A02500000000 AS DateTime), N'000027.jpg', 50, 1, 6, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (28, N'3ds Max 2009 ', CAST(48000 AS Decimal(18, 0)), N'Bộ sách “Dựng Các Mô Hình Kiến Trúc Phức Tạp Và Mô Phỏng Nội Thất - Ngoại Thất 3D” được biên soạn nhằm mục đích hướng dẫn những bạn đọc yêu thích đồ họa 3D thực hiện dễ dàng với chương trình 3ds Max 2009 Pro. Đây là chương trình có nhiều tính năng thiết kế 3D tuyệt vời mà bạn có thể ứng dụng trong kiến trúc xây dựng và trang trí nội ngoại thất.', CAST(0x0000A02500000000 AS DateTime), N'000028.jpg', 50, 1, 2, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (29, N'Công Nghệ Mạng Máy Tính', CAST(48000 AS Decimal(18, 0)), N'Cuốn sách gồm các nội dung chính sau:', CAST(0x0000A02500000000 AS DateTime), N'000029.jpg', 50, 1, 1, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (30, N'Tính Toán Thiết Kế Kết Cấu Với SAP 14', CAST(48000 AS Decimal(18, 0)), N'Extensive practice in vocabulary building and correct English usage, with emphasis on 600 words that appear frequently on the IELTS.', CAST(0x0000A02500000000 AS DateTime), N'000030.jpg', 50, 1, 2, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (31, N'Revit Architecture 2011 Từ A Đến Z - Tập 2', CAST(48000 AS Decimal(18, 0)), N'Revit Architecture 2011 từ A đến Z (Tập 2) là 1 trong những chuyên đề thuộc họ sách CAD trong kiến trúc-xây dựng do nhà sách STK biên soạn dùng làm tài liệu tham khảo, chủ yếu là thực hành hướng dẫn sử dụng chương trình Revit Architecture đã và đang sử dụng rộng rãi trong các trường Cao đẳng, Đại học khối công nghệ chuyên ngành, cũng như tại các văn phòng thiết kế. Nó cung cấp cho học sinh, sinh viên, giáo viên, kiến trúc sư, họa viên những kiến thức và kỹ năng cơ bản nhất về ứng dụng CAD trong thiết kế kiến trúc.', CAST(0x0000A02500000000 AS DateTime), N'000031.jpg', 50, 1, 5, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (32, N'CoreIDraw X5 - Dành Cho Người Tự Học', CAST(48000 AS Decimal(18, 0)), N'Coreldraw X5 dành cho người tự học được biên soạn cho người mới bắt đầu sử dụng coreldraw trong thiết kế, học tập và nhiều hơn nữa. Quyển sách này được minh họa bằng hình ảnh cả lý thuyết lẫn thực hành sẽ giúp bạn dễ dàng tìm hiểu và khám phá các đặc tính của Coreldraw x5 để ứng dụng trong công việc thực tế và hiệu quả nhất.', CAST(0x0000A02500000000 AS DateTime), N'000032.jpg', 50, 1, 6, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (33, N'Chế Bản Điện Tử Với Ilustrator CS5', CAST(15000 AS Decimal(18, 0)), N'Sách cần thiết cho học sinh, sinh viên, những bạn đã biết hoặc chua từng tiếp xúc với chương trình Illustrator cũng như các giáo viên dạy thực hành tại các trung tâm chuyên đồ họa, multimedia, mỹ thuật công nghiệp ...', CAST(0x0000A02500000000 AS DateTime), N'000033.jpg', 50, 1, 7, 1)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (34, N'Cẩm Nang Tin Học Văn Phòng', CAST(15000 AS Decimal(18, 0)), N'Với những tiến bộ của khoa học kỹ thuật, máy vi tính ra đời và được sử dụng trong khắp các văn phòng, công sở, gia đình... đã trở thành công cụ không thể thiếu đối với mỗi người', CAST(0x0000A02500000000 AS DateTime), N'000034.jpg', 50, 1, 8, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (35, N'Xử Lý Ảnh Photoshop CS5 Dành Cho Người Tự Học - Tập 1', CAST(15000 AS Decimal(18, 0)), N'Bộ sách được chia làm nhiều chuyên đề đi sâu vào từng tính năng quan trọng của Photoshop. Chuyên đề đâu tiên này sẽ tập trung trình bày cách tạo vùng chọn. Đây là phần cơ bản nhưng rất quan trọng sách khi sử dụng Photoshop. ', CAST(0x0000A02500000000 AS DateTime), N'000035.jpg', 50, 1, 5, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (36, N'71 Kỹ Thuật Thâm Nhập Windows Vista Pro', CAST(74000 AS Decimal(18, 0)), N'71 Kỹ Thuật Thâm Nhập Windows Vista Pro:', CAST(0x0000A02500000000 AS DateTime), N'000036.jpg', 50, 1, 2, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (37, N'Hướng Dẫn Học Từng Bước Excel 2010 Dành Cho Người Tự Học', CAST(15000 AS Decimal(18, 0)), N'Nội dung sách trình bày những kiến thức không quá sâu, nhằm phục vụ cho những người mới bắt đầu làm quen với điện toán văn phòng, đồng thời là tài liệu tham khảo để giảng dạy liên quan đến chương trình Excel.', CAST(0x0000A02500000000 AS DateTime), N'000037.jpg', 50, 11, 1, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (38, N'SQL Server 2005 - Xây Dựng Ứng Dụng Quản Lý Kế Toán Bằng C# 2005 ', CAST(74000 AS Decimal(18, 0)), N'Giáo trình bao gồm 10 chương và phần phụ lục tham khảo được nhấn mạnh xuyên suốt từ giao diện, hàm, phát biểu SQL động, phát biểu SQL phức tạp, phát biểu điều khiển, thủ tục nội tại, trigger, giúp cho bạn sử dụng chúng trong ứng dụng kế toán cùng với sự kết hợp hoàn hảo bằng ngôn ngữ lập trình C# 2005.', CAST(0x0000A02500000000 AS DateTime), N'000038.jpg', 50, 1, 4, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (39, N'Lập Trình Web Bằng ASP.Net Với Macromedia Dreamweaver MX - Tập 2', CAST(74000 AS Decimal(18, 0)), N'ASP.NET khác biệt rất nhiều so với các công nghệ Web đi trước. Macromedia Dreamweaver MX tuy vẫn duy trì sức mạnh của công cụ thiết kế trang nhã, nhưng đã chuyển từ công nghệ cổ điển sang ASP.NET bằng cách cung cấp nhiều công cụ đơn giản bớt quá trình tự động hoá ứng dụng Web. Nhờ kết hợp sức mạnh của ASP.NET với Dreamweaver, các nhà phát triển sẽ nắm bắt được ASP.NET chỉ trong nháy mắt.', CAST(0x0000A02500000000 AS DateTime), N'000039.jpg', 50, 1, 5, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (40, N'Tạo Website Hướng Database Bằng PHP Và MYSQL - Tập 2', CAST(74000 AS Decimal(18, 0)), N'Nội dung là yếu tố quyết định tất cả! Ừm… nghe thì hơi “kêu” thật, nhưng không thể nào đúng hơn. Chỉ cần nắm vững HTML và học thêm vài bí quyết cơ bản về JavaScript và Dynamic HTML là ta đã có thể thiết kế một Website đầy ấn tượng được rồi. Nhưng muốn thu hút một lượng fan đông đảo thì nội dung của Website phải mới mẻ và liên tục được cập nhật. Trong thiết kế Web truyền thống, nội dung được quyết định bở tập tin HTML…', CAST(0x0000A02500000000 AS DateTime), N'000040.jpg', 50, 1, 4, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (41, N'Tạo Bản Thuyết Trình Trong Microsoft Office PowerPoint 2007 For Windows', CAST(74000 AS Decimal(18, 0)), N'Tạo bản thuyết trình trong Microsoft Office PowerPoint 2007 for Windows mang lại cho bạn phương pháp nghiên cứu công nghệ mới độc đáo nhất từ trước đến nay. Thay vì làm nản lòng độc giả bằng những giải thích dông dài mang nặng tính lý thuyết, tập sách sử dụng hình ảnh minh họa đi kèm hướng dẫn cụ thể hầu giúp bạn hoàn thành dự án chỉ trong nháy mắt', CAST(0x0000A02500000000 AS DateTime), N'000041.jpg', 50, 1, 2, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (42, N'Shambhala - Vùng Đất Tây Tạng Huyền Bí Hay Cuộc Hành Trình Tìm Về Bản Thể', CAST(74000 AS Decimal(18, 0)), N'Tu viện Tashilumbo thuộc thành phố Phật giáo Shigatze, nằm ở miền Tây của Tây Tạng. Nơi đây, gió thường thổi xuyên qua các hành lang rải đầy đá, để lại những luồng không khí mát rượu giữa cái nóng dịu nhẹ của buổi chiều tà. Vào thời khắc này, người ta thường cảm thấy trào dâng niềm cảm xúc động khi ngắm nhìn những tia sáng chói lòa chiếu rọi qua cao nguyên Himalaya. Cảm xúc ấy càng trở nên mãnh liệt hơn khi mặt trời dần khuất bóng.Shambhala là bản kinh cổ xưa viết bằng tay, được lưu giữ tại Tu viện Tashilumbo. Kinh Shambhala miêu tả những noi như "Hồ Độc Dược", "Hồ Ác Quỷ" và cả hiện tượng quầng cực quang ở dãy núi Himalaya, khi "Một trăm ngọn núi cùng phát sáng sau khi màn đêm buông xuống". Tất cả những nơi này đều có thực. Chúng nằm ở Ngari, một vùng xa xôi hẻo lánh ở cực tây của Tây Tạng.Ở một góc độ khác, bản kinh không chỉ đơn thuần là một cuốn sách dẫn đường theo nghĩa đen nữa, nó còn có thể là một tấm bản đồ chỉ dẫn thiền định cho mỗi cá nhân trên con đường khám phá nội tâm của chính mình. Ở góc độ này, Kinh Shambhala mang ý nghĩa phức tạp hơn. Nó dạy chúng ta cách khống chế những năng lượng tiêu cực và chuyển hóa chúng thành năng lượng tiêu cực và chuyển hóa chúng thành năng lượng tích cực....', CAST(0x0000A02500000000 AS DateTime), N'000042.jpg', 50, 3, 6, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (43, N'Sức Mạnh Của Đạo Phật - Để Sống Tốt Hơn Trong Thế Giới Ngày Nay', CAST(74000 AS Decimal(18, 0)), N'Nói đến Đạo Phật là nói đến giác ngộ, chủ trương của Đạo Phật là giác ngộ. Đạo Phật có mặt trên thế giới đến nay là 2556 năm (tính đến thời điểm hiện tại năm 2008). ', CAST(0x0000A02500000000 AS DateTime), N'000043.jpg', 50, 3, 8, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (44, N'Điều Trị Bệnh Tận Gốc - Năng Lực Của Tâm Bi Mẫn ', CAST(74000 AS Decimal(18, 0)), N'"Điều trị bệnh tận gốc" không chỉ là một cuốn sách với những lời cầu nguyện cho bệnh tật cơ thể được giảm bớt. Nội dung của cuốn sách này còn chứa đựng nhiều hơn thế nữa. Các phần lý thuyết và thực hành chứa đựng trong sách này có tác dụng dẫn dắt tâm chúng ta đến chỗ thấu hiểu sâu xa hơn về sự sống và cái chết, về vô thường và khổ đau. Sự thấu hiểu sâu sắc như thế sẽ cho phép chúng ta bắt đầu nhìn ngắm cơn đau và bệnh tật bằng một tầm nhìn bao quát hơn. Với tầm nhìn này thì khái niệm về nghiệp quả, về tái sinh và về phẩm chất của sự tái sinh, tát cả những khái niệm đó sẽ mang những ý nghĩa mới có năng lực làm dịu cơn đau và chữa lành tận gốc các căn bệnh của chúng ta', CAST(0x0000A02500000000 AS DateTime), N'000044.jpg', 50, 3, 7, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (45, N'Nhập Môn Windows Vista Tập 1', CAST(32000 AS Decimal(18, 0)), N'Nhập Môn Windows Vista - Tập 1 gồm những nôi dung sau:', CAST(0x0000A02500000000 AS DateTime), N'000045.jpg', 50, 1, 2, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (46, N'Hành Trình Tâm Linh Siêu Việt', CAST(32000 AS Decimal(18, 0)), N'Một cuốn sách của tác giả Gyalwang Drukpa, một bậc thầy về tâm linh, người đang dẫn dắt dòng truyền thừa Drukpa, một dòng truyền thừa với những hành giả thực hành tâm linh trải khắp Ấn Độ và các nước tại Châu Á, Châu Âu và Châu Mỹ. ', CAST(0x0000A02500000000 AS DateTime), N'000046.jpg', 50, 3, 11, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (47, N'Nghiệp Lực - Nhìn Lại Quá Khứ & Nhận Biết Tương Lai', CAST(32000 AS Decimal(18, 0)), N'Nỗi hoang mang bối rối của con người về nghiệp không khiến bà ngạc nhiên. Hỏi mười người ý nghĩa của từ này, bạn sẽ nhận được mười câu trả lời khác nhau. ', CAST(0x0000A02500000000 AS DateTime), N'000047.jpg', 50, 3, 10, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (48, N'Tỉnh Thức', CAST(32000 AS Decimal(18, 0)), N'"Con người còn luôn mãi khổ đau một khi chưa tỉnh thức."', CAST(0x0000A02500000000 AS DateTime), N'000048.jpg', 50, 3, 2, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (49, N'13 Nguyên Tắc Nghĩ Giàu, Làm Giàu - Think And Grow Rich', CAST(32000 AS Decimal(18, 0)), N'"Think and Grow Rich - 13 nguyên tắc nghĩ giàu, làm giàu" là cuốn sách "chỉ dẫn" duy nhất chỉ ra những nguồn lực bạn phải có để thành công. Cuốn sách sẽ giúp bạn trở nên giàu có, làm giàu thêm cho cuộc sống của bạn trên tất cả các phương diện của cuộc sống chứ không chỉ về tài chính và vật chất. Những ý tưởng trong sách "Think and Grow Rich - 13 nguyên tắc nghĩ giàu, làm giàu" bắt nguồn từ những động lực tốt đẹp: "Thành công cá nhân" và "Quan điểm suy nghĩ tích cực".', CAST(0x0000A02500000000 AS DateTime), N'000049.jpg', 50, 6, 7, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (50, N'Đạo Kỷ Nguyên Mới', CAST(32000 AS Decimal(18, 0)), N'"Think and Grow Rich - 13 nguyên tắc nghĩ giàu, làm giàu" là cuốn sách "chỉ dẫn" duy nhất chỉ ra những nguồn lực bạn phải có để thành công. Cuốn sách sẽ giúp bạn trở nên giàu có, làm giàu thêm cho cuộc sống của bạn trên tất cả các phương diện của cuộc sống chứ không chỉ về tài chính và vật chất. Những ý tưởng trong sách "Think and Grow Rich - 13 nguyên tắc nghĩ giàu, làm giàu" bắt nguồn từ những động lực tốt đẹp: "Thành công cá nhân" và "Quan điểm suy nghĩ tích cực".', CAST(0x0000A02500000000 AS DateTime), N'000050.jpg', 50, 3, 12, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (51, N'The Power Of Compassion - Sức mạnh của lòng từ', CAST(32000 AS Decimal(18, 0)), N'Từ ngày 11 đến ngày 11 tháng 6 năm 2008 này, Đức Đạt Lai Lạt Ma sẽ viếng thăm Úc Châu, đây là chuyến thăm Úc lần thứ năm của Ngài để giảng dạy Phật Pháp. Mọi người đang trông đợi sự xuất hiện của ngài.', CAST(0x0000A02500000000 AS DateTime), N'000051.jpg', 50, 3, 12, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (52, N'Con Đường Mây Trắng - DER WEG DER WEISSEN WOLKEN', CAST(32000 AS Decimal(18, 0)), N'Trong thế kỷ hai muơi này, phương Tây có hai người tìm hiểu đất nước Tây Tạng rất sâu sắc, đó là bà Alexandra David Nesel và ông Anagarika Govinda. Cả hai vị này đã từng sống nhiều năm tại tây Tạng, từng tu tập thiền định và đi khắp nơi trong xứ sở huyền bí này hơn bất cứ người nước ngoài nào khác. Có thế nói họ hiểu tây Tạng với tất cả những khía cạnh tâm linh, tâm lý, địa lý nhiều hơn cả phần đông người tây Tạng.', CAST(0x0000A02500000000 AS DateTime), N'000052.jpg', 50, 3, 13, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (53, N'Đức Đạt Lai Lạt Ma Tại Harvard', CAST(43000 AS Decimal(18, 0)), N'Đức Đạt lai Lạt ma tại Harvard là một loạt bài thuyết giảng tại Đại Học Harvard do Viện nghiên cứu Phật học Hoa Kỳ (AIRS) và Trung tâm nghiên cứu các tôn giáo bảo trợ. Các bài thuyết giảng của Đức Đạt-lai-Lạt-ma, chủ yếu do giáo sư Robert Thurman sắp xếp, đã được thực hiện tại Giảng đường Emerson trong khuôn viên của Havard.', CAST(0x0000A02500000000 AS DateTime), N'000053.jpg', 50, 3, 1, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (54, N'Những Con Đường Của Ánh Sáng - Tập 1', CAST(43000 AS Decimal(18, 0)), N'Những Con Đường Của Ánh Sáng - Tập 1: Vật Lý Siêu Hình Học Của Ánh Sáng Và Bóng Tối (Tái Bản)', CAST(0x0000A02500000000 AS DateTime), N'000054.jpg', 50, 7, 1, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (55, N'Những Con Đường Của Ánh Sáng - Tập 2', CAST(43000 AS Decimal(18, 0)), N'Những con đường của ánh sáng được coi là bản sử thi về cuộc hành trình của con người đi vào vương quốc ánh sáng và giải mã những bí mật của nó. Và trong cuốn sách này tác giả đã thảo luận về ánh sáng, và liên qua tới nó là bóng tối, trên nhiều phương diện bao gồm tầm quan trọng của nó đối với sự sống, đối với khoa học, sự diễn giải ánh sáng của bộ não, nghệ thuật của các họa sĩ thuộc trường phái ấn tượng, việc sử dụng ánh sáng trong kiến trúc và các khía cạnh tâm linh của ánh sáng....', CAST(0x0000A02500000000 AS DateTime), N'000055.jpg', 50, 7, 1, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (56, N'Cái Vô Hạn Trong Lòng Bàn Tay (Từ Big Bang Đến Giác Ngộ)', CAST(43000 AS Decimal(18, 0)), N'Cái Vô Hạn Trong Lòng Bàn Tay (Từ Big Bang Đến Giác Ngộ):', CAST(0x0000A02500000000 AS DateTime), N'000056.jpg', 50, 3, 14, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (57, N'Nghệ Thuật Thiền Định', CAST(43000 AS Decimal(18, 0)), N'Nếu như học thiền là một con đường mà các bậc cao minh nhất đã theo đuổi trong suốt cuộc đời thì thực hành thiền trong cuộc sống hằng ngày sẽ làm thay đổi cách nhìn của chúng ta về chính bản thân mình và thế giới. Đó là thông điệp mà cuốn sách Nghệ thuật thiền định muốn gửi đến chúng ta. Cuốn sách vừa như người dẵn dắt cụ thể cho chúng ta cách thực hành thiền.', CAST(0x0000A02500000000 AS DateTime), N'000057.jpg', 50, 3, 14, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (58, N'Bàn Về Hạnh Phúc', CAST(43000 AS Decimal(18, 0)), N'Tất cả chúng ta đều khát khao hạnh phúc, song làm cách nào để có được, giữ gìn nó và thậm chí để định nghĩa nó? Trước câu hỏi mang đầy tính triết lý đang bị giằng xé giữa chủ nghĩa bi quan và thái độ giễu cợt trong tư tưởng phương Tây này, Matthieu Ricard đã mang lại lời giải đáp của đạo Phật: một câu trả lời rất khắt khe, song làm chúng ta yên lòng, lạc quan và ai cũng có thể chấp nhận được.', CAST(0x0000A02500000000 AS DateTime), N'000058.jpg', 50, 3, 15, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (59, N'Lượng tử hoa và sen', CAST(43000 AS Decimal(18, 0)), N'Lưỡng Tử và Hoa Sen là sự khai phá mở rộng tri thức, tầm nhìn về những tương đương thú vị giữa tư tưởng sắc sảo về vật lý học và Phật giáo - một cuộc trò chuyện mà bất kỳ ai có suy nghĩ đều thích thú dù chỉ tình cờ nghe thấy.', CAST(0x0000A02500000000 AS DateTime), N'000059.jpg', 50, 3, 15, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (60, N'Đối Thoại Giữa Triết Học Và Phật Giáo', CAST(43000 AS Decimal(18, 0)), N'Dựa theo quan niệm cũ kỹ lâu đời, phương Tây hình dung Phật giáo như là một sự minh triết nhưng thụ động và tiêu cực, và xem Niết Bàn như là một sự quay về sống với nội tâm, không màng đến thế sự bên ngoài, kể cả sinh hoạt trong các thành phố.', CAST(0x0000A02500000000 AS DateTime), N'000060.jpg', 50, 3, 12, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (61, N'Phật giáo truyền thống Đại Thừa', CAST(43000 AS Decimal(18, 0)), N'... Cái tâm cảm thấy mình gần gũi với tất cả mọi chúng sinh như thế chính là tâm từ vô thượng. Một người có được tình yêu này đối với tất cả hữu tình không phân biệt, thì không phải là một người thường. Chắc chắn một con người như vậy đang nắm giữ những thực chứng nội tâm trong tâm thức họ. Khi một người nào có được thứ tình yêu này gặp hoặc nhìn thấy người khác, thì một cảm giác hạnh phúc hồn nhiên sinh khởi. Một người như thế không bao giờ sinh tâm giận dữ hay ganh tị, và do hậu quả của điều này, mọi người sẽ trở thành bạn của vị ấy, có niềm kính trọng lớn lao đối với vị ấy. Một người thực tập tâm từ thuần tịnh thì kết quả cũng sẽ có nội tâm rất an bình', CAST(0x0000A02500000000 AS DateTime), N'000061.jpg', 50, 3, 12, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (62, N'Tình Yêu Phổ Quát', CAST(43000 AS Decimal(18, 0)), N'...Tất cả chúng sinh đều có hạt giống Phật hay Phật tính. Phương pháp khiến cho hạt giống này nảy nở chính là thực hành những chỉ giáo về pháp luyện tâm. Những kinh nghiệm hay thực chứng trong pháp luyện tâm chính là con đường đến giác ngộ, bởi thế điểm thiết yếu là tất cả chúng sinh cần đạt được kinh nghiệm về pháp tu này. Kết thúc kinh Tiểu phẩm Bát-nhã, đức Phật đã dạy:', CAST(0x0000A02500000000 AS DateTime), N'000062.jpg', 50, 3, 12, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (63, N'Rộng Mở Tâm Hồn - Tu Tập Từ Bi Trong Đời Sống Hàng Ngày', CAST(43000 AS Decimal(18, 0)), N'Rộng Mở Tâm Hồn - Tu Tập Từ Bi Trong Đời Sống Hàng Ngày', CAST(0x0000A02500000000 AS DateTime), N'000063.jpg', 50, 3, 12, NULL)
INSERT [dbo].[Sanpham] ([Masp], [Tensp], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [Mathuonghieu], [Maxuatxu], [Moi]) VALUES (64, N'Cuộc Đời Là Vô Thường', CAST(43000 AS Decimal(18, 0)), N'Cuộc Đời Là Vô Thường', CAST(0x0000A02500000000 AS DateTime), N'000064.jpg', 50, 3, 12, NULL)

SET IDENTITY_INSERT [dbo].[Sanpham] OFF

go

INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (2, 1, 1, CAST(85000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (2, 2, 2, CAST(75000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (2, 3, 1, CAST(55000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (2, 5, 1, CAST(62000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (3, 1, 1, CAST(85000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (3, 2, 2, CAST(75000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (3, 3, 1, CAST(55000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [Masp], [SoLuong], [DonGia]) VALUES (3, 5, 1, CAST(62000 AS Decimal(18, 0)))

go


ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_Sanpham] FOREIGN KEY([Masp])
REFERENCES [dbo].[Sanpham] ([Masp])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_Sanpham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO

ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Thuonghieu] FOREIGN KEY([Mathuonghieu])
REFERENCES [dbo].[Thuonghieu] ([Mathuonghieu])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Thuonghieu]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Nhaxuatxu] FOREIGN KEY([Maxuatxu])
REFERENCES [dbo].[NhaXuatXu] ([Maxuatxu])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_SanPham_Nhaxuatxu]
GO
ALTER DATABASE [QLMYPHAM] SET  READ_WRITE 
GO


UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 9'
where [Masp]=9;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 10'
where [Masp]=10;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 11'
where [Masp]=11;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 12'
where [Masp]=12;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 13'
where [Masp]=13;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 14'
where [Masp]=14;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 15'
where [Masp]=15;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 16'
where [Masp]=16;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 17'
where [Masp]=17;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 18'
where [Masp]=18;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 19'
where [Masp]=19;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 20'
where [Masp]=20;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 21'
where [Masp]=21;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 22'
where [Masp]=22;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 23'
where [Masp]=23;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 24'
where [Masp]=24;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 25'
where [Masp]=25;

UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 26'
where [Masp]=26;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 27'
where [Masp]=27;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 28'
where [Masp]=28;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 29'
where [Masp]=29;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 30'
where [Masp]=30;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 31'
where [Masp]=31;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 32'
where [Masp]=32;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 33'
where [Masp]=33;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 34'
where [Masp]=34;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 35'
where [Masp]=35;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 36'
where [Masp]=36;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 37'
where [Masp]=37;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 38'
where [Masp]=38;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 39'
where [Masp]=39;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 40'
where [Masp]=40;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 41'
where [Masp]=41;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 42'
where [Masp]=42;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 43'
where [Masp]=43;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 44'
where [Masp]=44;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 45'
where [Masp]=45;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 46'
where [Masp]=46;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 47'
where [Masp]=47;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 48'
where [Masp]=48;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 49'
where [Masp]=49;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=50;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=51;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=52;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=53;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=54;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=55;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=56;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=57;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=58;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=59;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=60;
go
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=61;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=62;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=63;
UPDATE [dbo].[Sanpham]
set [Tensp] =N'Mỹ Phẩm 50'
where [Masp]=64;
go 
UPDATE [dbo].[Sanpham]
set [MoTa] =NULL 
where [Masp] between 9 and 64 ;
go

insert into dbo.CHITIETSANPHAM(Anhbia1,Anhbia2,Anhbia3)
values ('hinh1.png','hinh2.png','hinh3.png');
