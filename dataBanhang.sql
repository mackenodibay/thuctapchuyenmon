USE [master]
GO
/****** Object:  Database [Webbanhang]    Script Date: 6/9/2021 2:11:05 AM ******/
CREATE DATABASE [Webbanhang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Webbanhang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Webbanhang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Webbanhang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Webbanhang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Webbanhang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Webbanhang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Webbanhang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Webbanhang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Webbanhang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Webbanhang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Webbanhang] SET ARITHABORT OFF 
GO
ALTER DATABASE [Webbanhang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Webbanhang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Webbanhang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Webbanhang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Webbanhang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Webbanhang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Webbanhang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Webbanhang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Webbanhang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Webbanhang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Webbanhang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Webbanhang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Webbanhang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Webbanhang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Webbanhang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Webbanhang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Webbanhang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Webbanhang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Webbanhang] SET  MULTI_USER 
GO
ALTER DATABASE [Webbanhang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Webbanhang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Webbanhang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Webbanhang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Webbanhang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Webbanhang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Webbanhang] SET QUERY_STORE = OFF
GO
USE [Webbanhang]
GO
/****** Object:  Table [dbo].[db_ChiTietDonDatHang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_ChiTietDonDatHang](
	[MaSP] [int] NOT NULL,
	[MaDonDatHang] [int] NOT NULL,
	[SoLuongDat] [int] NULL,
	[DonGiaDat] [float] NULL,
 CONSTRAINT [PK_db_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_ChiTietDonHang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_ChiTietDonHang](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
 CONSTRAINT [PK_db_ChiTietDonHang_1] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_DangKy]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_DangKy](
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[EmailDK] [varchar](50) NULL,
	[DiaChiDK] [nvarchar](100) NULL,
	[TenDayDu] [nvarchar](50) NULL,
	[CauHoiBaoMat] [nvarchar](100) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinhDK] [nchar](10) NULL,
	[MaQuyen] [int] NULL,
 CONSTRAINT [PK_db_DangKy] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_DanhMuc]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](50) NULL,
	[AnhDaiDien] [nvarchar](100) NULL,
	[ThuTu] [int] NULL,
	[MaDMCha] [int] NULL,
 CONSTRAINT [PK_db_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_DonDatHang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_DonDatHang](
	[MaDonDatHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[ThanhTienDH] [float] NULL,
	[TinhTrangDonHang] [nvarchar](300) NULL,
	[MaKH] [int] NULL,
	[TenKH] [nvarchar](50) NULL,
	[sdtKH] [varchar](15) NULL,
	[EmailKH] [varchar](50) NULL,
 CONSTRAINT [PK_db_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_HoaDon]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [datetime] NULL,
	[ThanhTien] [float] NULL,
	[MaNV] [int] NULL,
	[TenNV] [nvarchar](70) NULL,
	[MaKH] [int] NULL,
	[TenKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_db_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_KhachHang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKh] [nvarchar](50) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[sdtKH] [varchar](15) NULL,
	[EmailKH] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_db_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_NhanVien]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](70) NULL,
	[GioiTinhNV] [nvarchar](10) NULL,
	[DiaChiNV] [nvarchar](100) NULL,
	[sdtNV] [varchar](15) NULL,
	[NgayVaoLam] [datetime] NULL,
 CONSTRAINT [PK_db_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_NhomSanPham]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_NhomSanPham](
	[NhomID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](100) NULL,
	[AnhDaiDien] [nvarchar](100) NULL,
	[ThuTu] [int] NULL,
	[SoSPHienThi] [int] NULL,
 CONSTRAINT [PK_db_NhomSanPham] PRIMARY KEY CLUSTERED 
(
	[NhomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_QuyenDangNhap]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_QuyenDangNhap](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [varchar](10) NULL,
 CONSTRAINT [PK_db_QuyenDangNhap] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_SanPham]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[AnhSP] [nvarchar](100) NULL,
	[SoLuongSP] [int] NULL,
	[GiaSP] [float] NULL,
	[MotaSP] [nvarchar](max) NULL,
	[MaDM] [int] NULL,
	[NhomID] [int] NULL,
 CONSTRAINT [PK_db_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[db_ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonDatHang_db_DonDatHang] FOREIGN KEY([MaDonDatHang])
REFERENCES [dbo].[db_DonDatHang] ([MaDonDatHang])
GO
ALTER TABLE [dbo].[db_ChiTietDonDatHang] CHECK CONSTRAINT [FK_db_ChiTietDonDatHang_db_DonDatHang]
GO
ALTER TABLE [dbo].[db_ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonDatHang_db_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[db_SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[db_ChiTietDonDatHang] CHECK CONSTRAINT [FK_db_ChiTietDonDatHang_db_SanPham]
GO
ALTER TABLE [dbo].[db_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonHang_db_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[db_HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[db_ChiTietDonHang] CHECK CONSTRAINT [FK_db_ChiTietDonHang_db_HoaDon]
GO
ALTER TABLE [dbo].[db_ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_db_ChiTietDonHang_db_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[db_SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[db_ChiTietDonHang] CHECK CONSTRAINT [FK_db_ChiTietDonHang_db_SanPham]
GO
ALTER TABLE [dbo].[db_DangKy]  WITH CHECK ADD  CONSTRAINT [FK_db_DangKy_db_QuyenDangNhap] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[db_QuyenDangNhap] ([MaQuyen])
GO
ALTER TABLE [dbo].[db_DangKy] CHECK CONSTRAINT [FK_db_DangKy_db_QuyenDangNhap]
GO
ALTER TABLE [dbo].[db_DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_db_DonDatHang_db_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[db_KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[db_DonDatHang] CHECK CONSTRAINT [FK_db_DonDatHang_db_KhachHang]
GO
ALTER TABLE [dbo].[db_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_db_HoaDon_db_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[db_KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[db_HoaDon] CHECK CONSTRAINT [FK_db_HoaDon_db_KhachHang]
GO
ALTER TABLE [dbo].[db_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_db_HoaDon_db_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[db_NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[db_HoaDon] CHECK CONSTRAINT [FK_db_HoaDon_db_NhanVien]
GO
ALTER TABLE [dbo].[db_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_db_SanPham_db_DanhMuc] FOREIGN KEY([MaDM])
REFERENCES [dbo].[db_DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[db_SanPham] CHECK CONSTRAINT [FK_db_SanPham_db_DanhMuc]
GO
ALTER TABLE [dbo].[db_SanPham]  WITH CHECK ADD  CONSTRAINT [FK_db_SanPham_db_NhomSanPham] FOREIGN KEY([NhomID])
REFERENCES [dbo].[db_NhomSanPham] ([NhomID])
GO
ALTER TABLE [dbo].[db_SanPham] CHECK CONSTRAINT [FK_db_SanPham_db_NhomSanPham]
GO
/****** Object:  StoredProcedure [dbo].[chitietdondathang_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[chitietdondathang_delete]
	@masp int,
	@madondathang int
	AS
	BEGIN
		delete db_ChiTietDonDatHang where MaSP=@masp and MaDonDatHang=@madondathang
	END

GO
/****** Object:  StoredProcedure [dbo].[chitietdondathang_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[chitietdondathang_insert]
	@masp int,
	@madondathang int,
	@soluongdat int,
	@dongiadat float,
	@ret int out
	AS
	BEGIN
		set @ret=1
		if(not exists(select * from db_ChiTietDonDatHang where @masp=MaSP and @madondathang=MaDonDatHang))
		begin
		insert into db_ChiTietDonDatHang(MaSP,MaDonDatHang,SoLuongDat,DonGiaDat) values(@masp,@madondathang,@soluongdat,@dongiadat)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[chitietdondathang_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[chitietdondathang_update]
	@masp int,
	@madondathang int,
	@soluongdat int,
	@dongiadat float
	AS
	BEGIN
		update db_ChiTietDonDatHang set SoLuongDat=@soluongdat,DonGiaDat=@dongiadat where MaSP=@masp and MaDonDatHang=@madondathang
	END

GO
/****** Object:  StoredProcedure [dbo].[chitietdonhang_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[chitietdonhang_delete]
	@masp int,
	@mahoadon int
	AS
	BEGIN
		delete db_ChiTietDonHang where MaSP=@masp and MaHD=@mahoadon
	END

GO
/****** Object:  StoredProcedure [dbo].[chitietdonhang_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[chitietdonhang_insert]
	@masp int,
	@mahoadon int,
	@soluong int,
	@dongia float,
	@ret int out
	AS
	BEGIN
		set @ret=1
		if(not exists(select * from db_ChiTietDonHang where @masp=MaSP and @mahoadon=MaHD))
		begin
		insert into db_ChiTietDonHang(MaHD,MaSP,SoLuong,DonGia) values(@mahoadon,@masp,@soluong,@dongia)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[chitietdonhang_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[chitietdonhang_update]
	@masp int,
	@mahoadon int,
	@soluong int,
	@dongia float
	AS
	BEGIN
		update db_ChiTietDonHang set SoLuong=@soluong,DonGia=@dongia where MaSP=@masp and MaHD=@mahoadon
	END

GO
/****** Object:  StoredProcedure [dbo].[dangky_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[dangky_delete]
	@tendangnhap varchar(50)
	AS
	BEGIN
		delete from db_DangKy where TenDangNhap=@tendangnhap
	END

GO
/****** Object:  StoredProcedure [dbo].[dangky_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[dangky_insert]
	@tendangnhap varchar(50),
	@matkhau varchar(50) ,
	@emaildk varchar(50),
	@diachidk nvarchar(50),
	@tendaydu nvarchar(50),
	@cauhoibaomat nvarchar(100),
	@ngaysinh date,
	@gioitinhdk nvarchar(10),
	@maquyen int,
	@ret int out
	AS
	BEGIN
		set @ret=1
		if(not exists(select * from db_DangKy where @tendangnhap=TenDangNhap))
		begin
		insert into db_DangKy(TenDangNhap,MatKhau,EmailDK,DiaChiDK,TenDayDu,CauHoiBaoMat,NgaySinh,GioiTinhDK,MaQuyen) values(@tendangnhap,@matkhau,@emaildk,@diachidk,@tendaydu,@cauhoibaomat,@ngaysinh,@gioitinhdk,@maquyen)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[dangky_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[dangky_update]
	@tendangnhap varchar(50),
	@matkhau varchar(50) ,
	@emaildk varchar(50),
	@diachidk nvarchar(50),
	@tendaydu nvarchar(50),
	@cauhoibaomat nvarchar(100),
	@ngaysinh date,
	@gioitinhdk nvarchar(10),
	@maquyen int
	AS
	BEGIN
		update db_DangKy set MatKhau=@matkhau,EmailDK=@emaildk,DiaChiDK=@diachidk,TenDayDu=@tendaydu,CauHoiBaoMat=@cauhoibaomat,NgaySinh=@ngaysinh,GioiTinhDK=@gioitinhdk,MaQuyen=@maquyen where TenDangNhap=@tendangnhap
	END

GO
/****** Object:  StoredProcedure [dbo].[danhmuc_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[danhmuc_delete]
	@madm int
	AS
	BEGIN
		delete from db_DanhMuc where MaDM=@madm
		delete from db_SanPham where MaDM=@madm
	END

GO
/****** Object:  StoredProcedure [dbo].[danhmuc_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[danhmuc_insert]
	@tendm nvarchar(50),
	@anhdaidien nvarchar(100),
	@thutu int,
	@maDMcha int,
	@ret int out
	AS
	BEGIN
		set @ret=1
		if(not exists(select * from db_DanhMuc where @tendm=TenDM))
		begin
		insert into db_DanhMuc(TenDM,AnhDaiDien,ThuTu,MaDMCha) values(@tendm,@anhdaidien,@thutu,@maDMcha)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[danhmuc_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[danhmuc_update]
	@madm int,
	@tendm nvarchar(50),
	@anhdaidien nvarchar(100),
	@thutu int,
	@maDMcha int
	AS
	BEGIN
		update db_DanhMuc set TenDM=@tendm,AnhDaiDien=@anhdaidien,ThuTu=@thutu,MaDMCha=@maDMcha where MaDM=@madm
	END

GO
/****** Object:  StoredProcedure [dbo].[dondathang_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[dondathang_delete]
	@madondathang int
	AS
	BEGIN
		delete from db_ChiTietDonDatHang where MaDonDatHang=@madondathang
		delete from db_DonDatHang where MaDonDatHang=@madondathang
	END

GO
/****** Object:  StoredProcedure [dbo].[dondathang_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[dondathang_insert]
	@ngaytao datetime,
	@thanhtienhd float,
	@tinhtrangdonhang nvarchar(300),
	@makh int,
	@tenkh nvarchar(50),
	@sdtkh varchar(15),
	@emailkh varchar(50),
	@ret int out
	AS
	BEGIN
		set @ret=1
		begin
		insert into db_DonDatHang(NgayTao,ThanhTienDH,TinhTrangDonHang,MaKH,TenKH,sdtKH,EmailKH) values(@ngaytao,@thanhtienhd,@tinhtrangdonhang,@makh,@tenkh,@sdtkh,@emailkh)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[dondathang_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[dondathang_update]
	@madondathang int,
	@ngaytao datetime,
	@thanhtienhd float,
	@tinhtrangdonhang nvarchar(300),
	@makh int,
	@tenkh nvarchar(50),
	@sdtkh varchar(15),
	@emailkh varchar(50)
	AS
	BEGIN
		update db_DonDatHang set NgayTao=@ngaytao,ThanhTienDH=@thanhtienhd,TinhTrangDonHang=@tinhtrangdonhang,MaKH=@makh,TenKH=@tenkh,sdtKH=@sdtkh,EmailKH=@emailkh where MaDonDatHang=@madondathang
	END

GO
/****** Object:  StoredProcedure [dbo].[hoadon_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[hoadon_delete]
	@mahoadon int
	AS
	BEGIN
		delete from db_HoaDon where MaHD=@mahoadon
		delete from db_ChiTietDonHang where MaHD=@mahoadon
	END

GO
/****** Object:  StoredProcedure [dbo].[hoadon_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[hoadon_insert]
	@ngaylap datetime,
	@thanhtien float,
	@manv int,
	@tennv nvarchar(70),
	@makh int,
	@tenkh nvarchar(70),
	@ret int out
	AS
	BEGIN
		set @ret=1
		begin
		insert into db_HoaDon(NgayLap,ThanhTien,MaNV,TenNV,MaKH,TenKH) values(@ngaylap,@thanhtien,@manv,@tennv,@makh,@makh)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[hoadon_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[hoadon_update]
	@mahoadon int,
	@ngaylap datetime,
	@thanhtien float,
	@manv int,
	@tennv nvarchar(70),
	@makh int,
	@tenkh nvarchar(70)
	AS
	BEGIN
		update db_HoaDon set NgayLap=@ngaylap,ThanhTien=@thanhtien,MaNV=@manv,TenNV=@tennv,MaKH=@makh,TenKH=@tenkh where MaHD=@mahoadon
	END

GO
/****** Object:  StoredProcedure [dbo].[khachang_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[khachang_delete]
	@makh int
	AS
	BEGIN
		delete from db_KhachHang where MaKH=@makh
	END

GO
/****** Object:  StoredProcedure [dbo].[khachang_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[khachang_insert]
	@tenkh nvarchar(50),
	@diachikh nvarchar(100),
	@sdtkh varchar(15),
	@emailkh varchar(50),
	@matkhau nvarchar(50),
	@ret int out
	AS
	BEGIN
		set @ret=1
		begin
		insert into db_KhachHang(TenKh,DiaChiKH,sdtKH,EmailKH,MatKhau) values(@tenkh,@diachikh,@sdtkh,@emailkh,@matkhau)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[khachang_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[khachang_update]
	@makh int,
	@tenkh nvarchar(50),
	@diachikh nvarchar(100),
	@sdtkh varchar(15),
	@emailkh varchar(50),
	@matkhau nvarchar(50)
	AS
	BEGIN
		update db_KhachHang set TenKh=@tenkh,DiaChiKH=@diachikh,sdtKH=@sdtkh,EmailKH=@emailkh, MatKhau=@matkhau where MaKH=@makh
	END

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[nhanvien_delete]
	@manv int
	AS
	BEGIN
		delete from db_NhanVien where MaNV=@manv
	END

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[nhanvien_insert]
	@tennv nvarchar(70),
	@gioitinhnv nvarchar(10),
	@diachinv nvarchar(100),
	@sdtnv varchar(15),
	@ngayvaolam datetime,
	@ret int out
	AS
	BEGIN
		set @ret=1
		begin
		insert into db_NhanVien(TenNV,GioiTinhNV,DiaChiNV,sdtNV,NgayVaoLam) values(@tennv,@gioitinhnv,@diachinv,@sdtnv,@ngayvaolam)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[nhanvien_update]
	@manv int,
	@tennv nvarchar(70),
	@gioitinhnv nvarchar(10),
	@diachinv nvarchar(100),
	@sdtnv varchar(15),
	@ngayvaolam datetime
	AS
	BEGIN
		update db_NhanVien set TenNV=@tennv,GioiTinhNV=@gioitinhnv,DiaChiNV=@diachinv,sdtNV=@sdtnv,NgayVaoLam=@ngayvaolam where MaNV=@manv
	END

GO
/****** Object:  StoredProcedure [dbo].[nhomsanpham_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[nhomsanpham_delete]
	@nhomid int
	AS
	BEGIN
		delete from db_NhomSanPham where NhomID=@nhomid
	END

GO
/****** Object:  StoredProcedure [dbo].[nhomsanpham_inser]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[nhomsanpham_inser]
	@tennhom nvarchar(100),
	@anhdaidien nvarchar(100),
	@thutu int,
	@soSPhienthi int,
	@ret int out
	AS
	BEGIN
		set @ret=1
		if(not exists(select * from db_NhomSanPham where @tennhom=TenNhom))
		begin
		insert into db_NhomSanPham(TenNhom,AnhDaiDien,ThuTu,SoSPHienThi) values(@tennhom,@anhdaidien,@thutu,@soSPhienthi)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[nhomsanpham_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[nhomsanpham_update]
	@nhomid int,
	@tennhom nvarchar(100),
	@anhdadien nvarchar(100),
	@thutu int,
	@solanhienthi int
	AS
	BEGIN
		update db_NhomSanPham set TenNhom=@tennhom,AnhDaiDien=@anhdadien,ThuTu=@thutu,SoSPHienThi=@solanhienthi where NhomID=@nhomid
	END

GO
/****** Object:  StoredProcedure [dbo].[quyendangnhap_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[quyendangnhap_delete]
	@quyenid int
	AS
	BEGIN
		delete from db_QuyenDangNhap where MaQuyen=@quyenid
	END

GO
/****** Object:  StoredProcedure [dbo].[quyendangnhap_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[quyendangnhap_insert]
	@tenquyen varchar(10),
	@ret int out
	AS
	BEGIN
		set @ret=1
		if(not exists(select * from db_QuyenDangNhap where @tenquyen=TenQuyen))
		begin
		insert into db_QuyenDangNhap(TenQuyen) values(@tenquyen)
		set @ret=2
		end
	END

GO
/****** Object:  StoredProcedure [dbo].[quyendangnhap_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[quyendangnhap_update]
	@maquyen int,
	@tenquyen varchar(100)
	AS
	BEGIN
		update db_QuyenDangNhap set TenQuyen=@tenquyen where MaQuyen=@maquyen
	END

GO
/****** Object:  StoredProcedure [dbo].[sanpham_delete]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sanpham_delete]
	@masp int
	AS
	BEGIN
		delete from db_SanPham where MaSP=@masp
	END

GO
/****** Object:  StoredProcedure [dbo].[sanpham_insert]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sanpham_insert]
	@tensp nvarchar(100),
	@anhsanpham nvarchar(100),
	@soluongsp int,
	@giasp float,
	@motasp nvarchar(MAX),
	@maDM int,
	@nhomID int,
	@ret int out
	AS
	BEGIN
		set @ret=1
		if(not exists(select * from db_SanPham where @tensp=TenSP))
		begin
		insert into db_SanPham(TenSP,AnhSP,SoLuongSP,GiaSP,MotaSP,MaDM,NhomID) values(@tensp,@anhsanpham,@soluongsp,@giasp,@motasp,@maDM,@nhomID)
		set @ret=2
		end
	END
GO
/****** Object:  StoredProcedure [dbo].[sanpham_update]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[sanpham_update]
	@masp int,
	@tensp nvarchar(100),
	@anhsp nvarchar(100),
	@soluongsp int,
	@giasp float,
	@motasp nvarchar(MAX),
	@madm int,
	@nhomid int
	AS
	BEGIN
		update db_SanPham set TenSP=@tensp,AnhSP=@anhsp,SoLuongSP=@soluongsp,GiaSP=@giasp,MotaSP=@motasp,MaDM=@madm,NhomID=@nhomid where MaSP=@masp
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdondathang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_chitietdondathang]
	AS
	BEGIN
		select * from db_ChiTietDonDatHang
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdondathang_by_madondathang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_chitietdondathang_by_madondathang]
	(
	@madondathang int
	)
	AS
	BEGIN
		select * from db_ChiTietDonDatHang where MaDonDatHang=@madondathang
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_chitietdonhang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_chitietdonhang]
	AS
	BEGIN
		select * from db_ChiTietDonHang
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dangky]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_dangky]
	AS
	BEGIN
		select * from db_DangKy
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dangky_by_id]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_dangky_by_id]
	@TenDangNhap varchar(50)
	AS
	BEGIN
		select * from db_DangKy where TenDangNhap=@TenDangNhap
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dangky_by_id_matkhau]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_dangky_by_id_matkhau]
	@TenDangNhap varchar(50),
	@MatKhau varchar(50)
	AS
	BEGIN
		select * from db_DangKy where TenDangNhap=@TenDangNhap and MatKhau=@MatKhau
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_danhmuc]
	AS
	BEGIN
		select * from db_DanhMuc order by ThuTu
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc_by_id]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure  [dbo].[thongtin_danhmuc_by_id]
	(
	@MaDM INT
	)
	AS
	BEGIN
		select * from db_DanhMuc where MaDM=@MaDM
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_danhmuc_by_MaDMCha]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure  [dbo].[thongtin_danhmuc_by_MaDMCha]
	(
	@MaDMCha INT
	)
	AS
	BEGIN
		select * from db_DanhMuc where MaDMCha=@MaDMCha
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_dondathang]
	AS
	BEGIN
		select * from db_DonDatHang
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_by_id]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_dondathang_by_id]
	@MaDonDatHang int
	AS
	BEGIN
		select * from db_DonDatHang where MaDonDatHang=@MaDonDatHang
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_by_mathanhtoan]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_dondathang_by_mathanhtoan]
	@mathanhtoan nvarchar(300)
	AS
	BEGIN
		select * from db_DonDatHang where TinhTrangDonHang=@mathanhtoan
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_dondathang_desc]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	create PROCEDURE [dbo].[thongtin_dondathang_desc]
	AS
	BEGIN
		select * from db_DonDatHang order by MaDonDatHang desc
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_hoadon]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_hoadon]
	AS
	BEGIN
		select * from db_HoaDon
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_khachhang]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_khachhang]
	AS
	BEGIN
		select * from db_KhachHang
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_khachhang_by_emailkh]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_khachhang_by_emailkh]
	@emailkh nvarchar(50)
	AS
	BEGIN
		select * from db_KhachHang where EmailKH=@emailkh
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_khachhang_by_emailkh_matkhau]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_khachhang_by_emailkh_matkhau]
	@emailkh nvarchar(50),
	@matkhau nvarchar(50)
	AS
	BEGIN
		select * from db_KhachHang where EmailKH=@emailkh and MatKhau=@matkhau
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_khachhang_by_makh]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_khachhang_by_makh]
	@makh nvarchar(50)
	AS
	BEGIN
		select * from db_KhachHang where MaKH=@makh
	END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhanvien]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_nhanvien]
	AS
	BEGIN
		select * from db_NhanVien
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomsp]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_nhomsp]
	AS
	BEGIN
		select * from db_NhomSanPham
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_nhomsp_by_id]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_nhomsp_by_id]
	@NhomID INT
	AS
	BEGIN
		select * from db_NhomSanPham where NhomID=@NhomID
	END
GO
/****** Object:  StoredProcedure [dbo].[thongtin_quyendangnhap]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[thongtin_quyendangnhap]
	AS
	BEGIN
		select * from db_QuyenDangNhap
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_quyendangnhap_by_id]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_quyendangnhap_by_id]
	@MaQuyen int
	AS
	BEGIN
		select * from db_QuyenDangNhap where MaQuyen=@MaQuyen
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_sanpham]
	AS
	BEGIN
		select * from db_SanPham
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_id]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_sanpham_by_id]
	@MaSP INT
	AS
	BEGIN
		select * from db_SanPham where MaSP=@MaSP
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_madm]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_sanpham_by_madm]
	@MaMD INT
	AS
	BEGIN
		select top 3 * from db_SanPham where MaDM=@MaMD
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_madm_tatca]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_sanpham_by_madm_tatca]
	@MaMD INT
	AS
	BEGIN
		select * from db_SanPham where MaDM=@MaMD
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_nhomid]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[thongtin_sanpham_by_nhomid]
	@NhomID INT,
	@SoSPHienThi INT
	AS
	BEGIN
		declare @sql nvarchar(300)
		set @sql='select top '+CAST(@SoSPHienThi as varchar(10))+' * from db_SanPham where NhomID='+CAST(@NhomID as varchar(10))
		exec sp_executesql @sql
		
	END

GO
/****** Object:  StoredProcedure [dbo].[thongtin_sanpham_by_tukhoa]    Script Date: 6/9/2021 2:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create PROCEDURE [dbo].[thongtin_sanpham_by_tukhoa]
	@TuKhoa nvarchar(100)
	AS
	BEGIN
		select * from db_SanPham where TenSP like N'%'+@TuKhoa+'%'
	END

GO
USE [master]
GO
ALTER DATABASE [Webbanhang] SET  READ_WRITE 
GO
