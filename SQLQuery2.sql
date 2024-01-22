use master
go
create database QLSINHVIEN
go
use DEV2311LM_SQL24_04
go

USE [DEV2311LM_SQL24_04]
GO
/****** Object:  Table [dbo].[Ketqua]    Script Date: 01/10/2019 16:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ketqua](
	[MaSV] [nvarchar](3) NOT NULL,
	[MaMH] [nvarchar](2) NOT NULL,
	[Diem] [real] NULL,
 CONSTRAINT [Prk_MaSV_MAMH] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 01/10/2019 16:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKH] [nvarchar](2) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
 CONSTRAINT [Prk_KHOA_khoa] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 01/10/2019 16:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [nvarchar](2) NOT NULL,
	[TenMH] [nvarchar](50) NOT NULL,
	[Sotiet] [tinyint] NULL,
 CONSTRAINT [Prk_MONHOC_MaMH] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 01/10/2019 16:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [nvarchar](3) NOT NULL,
	[HoSV] [nvarchar](15) NOT NULL,
	[TenSV] [nvarchar](7) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [smalldatetime] NOT NULL,
	[NoiSinh] [nvarchar](100) NOT NULL,
	[MaKH] [nvarchar](2) NOT NULL,
	[HocBong] [float] NULL,
 CONSTRAINT [Prk_SINHVIEN_MaSV] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'01', 3)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'02', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'03', 5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A01', N'04', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'01', 4.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'05', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A02', N'08', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'01', 2)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'03', 2.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A03', N'04', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'02', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'03', 10)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'04', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'A04', N'08', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'01', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'03', 2.5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B01', N'04', 4)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'02', 6)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'04', 10)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B02', N'08', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'01', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B04', N'04', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B05', N'03', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B05', N'05', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B05', N'06', 8)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'B05', N'08', 9)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'01', 3)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'03', 2)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'04', 7)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'05', 5)
INSERT [dbo].[Ketqua] ([MaSV], [MaMH], [Diem]) VALUES (N'C01', N'06', 6)
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'AV', N'Anh Văn')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'DT', N'Điện tử')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'KT', N'Kế toán')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'TH', N'Tin học')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'TR', N'Triết')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'01', N'Cơ sở dữ liệu', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'02', N'Trí tuệ nhân tạo', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'03', N'Toán rời rạc ứng dụng', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'04', N'Đồ họa ứng dụng', 60)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'05', N'Tiếng Anh cơ bản', 60)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'06', N'Tin học văn phòng', 60)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'07', N'Pháp luật đại cương', 30)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'08', N'Anh chuyên Ngành', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [Sotiet]) VALUES (N'09', N'PTTK Hệ thống', 60)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A01', N'Nguyễn Thị', N'Hải', 1, CAST(N'1986-02-23T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 130000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A02', N'Trần Văn', N'Chính', 0, CAST(N'1994-12-20T00:00:00' AS SmallDateTime), N'Bình Định', N'TH', 150000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A03', N'Lê Thu Bạch', N'Yến', 1, CAST(N'1993-02-21T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TH', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A04', N'Trần Anh', N'Tuấn', 0, CAST(N'1987-12-20T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 80000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'A10', N'Trần Thị', N'Mai', 1, CAST(N'1994-10-04T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B01', N'Hoàng Thanh', N'Mai', 1, CAST(N'1992-08-12T00:00:00' AS SmallDateTime), N'Hải Phòng', N'TR', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B02', N'Trần Thị Thu', N'Thủy', 1, CAST(N'1990-01-02T00:00:00' AS SmallDateTime), N'Tp. HCM', N'AV', 80000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B03', N'Đố Văn', N'Lâm', 0, CAST(N'1994-02-26T00:00:00' AS SmallDateTime), N'Bình Định', N'TR', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B04', N'Bùi Kim', N'Dung', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hµ Néi', N'TH', 170000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'B05', N'Nguyễn Thị', N'Hạnh', 1, CAST(N'1988-09-16T00:00:00' AS SmallDateTime), N'Hải Phòng', N'AV', 130000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'C01', N'Hà Quang', N'Anh', 0, CAST(N'1985-03-11T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TR', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'C03', N'Lê Quang', N'Lưu', 0, CAST(N'1985-02-23T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'T03', N'Hoàng Thị Hải', N'Yến', 1, CAST(N'1989-09-10T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 170000)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong]) VALUES (N'T06', N'Nguyễn Văn', N'Thắng', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 1500000)
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [Def_SINHVIEN_HocBong]  DEFAULT (0) FOR [HocBong]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [Frk_KetQua_Makh] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [Frk_KetQua_Makh]
GO
ALTER TABLE [dbo].[Ketqua]  WITH CHECK ADD  CONSTRAINT [Frk_KetQua_Mamh] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[Ketqua] CHECK CONSTRAINT [Frk_KetQua_Mamh]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [Frk_SINHVIEN_Makh] FOREIGN KEY([MaKH])
REFERENCES [dbo].[Khoa] ([MaKH])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [Frk_SINHVIEN_Makh]
GO
-- Syntax for SQL Server and Azure SQL Database  
  
--<SELECT statement> ::=    
    [ WITH { [ XMLNAMESPACES ,] [ <common_table_expression> [,...n] ] } ]  
    <query_expression>   
    [ ORDER BY <order_by_expression> ] 
    [ <FOR Clause>]   
    [ OPTION ( <query_hint> [ ,...n ] ) ]   
<query_expression> ::=   
    { <query_specification> | ( <query_expression> ) }   
    [  { UNION [ ALL ] | EXCEPT | INTERSECT }  
        <query_specification> | ( <query_expression> ) [...n ] ]   
<query_specification> ::=   
SELECT [ ALL | DISTINCT ]   
    [TOP ( expression ) [PERCENT] [ WITH TIES ] ]   
    < select_list >   
    [ INTO new_table ]   
    [ FROM { <table_source> } [ ,...n ] ]   
    [ WHERE <search_condition> ]   
    [ <GROUP BY> ]   
    [ HAVING < search_condition > ]   


--1. TRUY VẤN VỚI SELECT ĐƠN GIẢN (KHÔNG CÓ FROM)
select 'Devmaster Academy'
go
--2. ĐẶT TÊN CỘT CHO DỮ LIỆU TRONG TẬP KẾT QUẢ
select 'Devmaster Academy' as [Company]
go
select 'devmaster academy' 'company'
go
select 'devmaster academy' [company name]
go
select 'company'='Devmaster'
go
--3. TRUY VẤN DỮ LIỆU TỪ MỘT BẢNG SỬ DỤNG DẤU *
--Liệt kê tất cả các dữ liệu trong bảng khoa
-- (*)
select * from khoa
go
--4. LỰA CHỌN CÁC CỘT TRONG TẬP KẾT QUẢ
select MaKH, TenKH
from khoa
go
--Liệt kê các thông tin masv, hosv, tensv, ngaysinh
select masv, hosv, tensv, ngaysinh
FROM sinhvien
go
--5. Sử dụng biểu thức trong select
--Liệt kê các thông tin masv, hosv, ngaysinh, trong đó cột hoten được gộp từ hosv, tensv
select masv, hosv+ '' + tensv as [họ tên], ngaysinh
FROM sinhvien
go
--Liệt kê các thông tin điểm thi của sinh viên, thêm cột điểm tăng 10%
select * , [DIEM TANG] =DIEM*110/100
from ketqua
go
--6. Sử dụng mệnh đề where để giới hạn dữ liệu trong tập kết quả (lọc, tìm kiếm)
-- where <biểu thức điều kiện>
/* 
- Điều kiện sử dụng các phép toán so sánh 
(>, >=, <, <=;=, <>, !=) => Thường dùng với cột dữ liệu kiểu số
- Điều kiện sử dụng phép toán tương đối (áp dụng với dữ liệu kiểu chuỗi)
+ LIKE/ NOT LIKE:
+++ Các kí tự đại diện:
	++ Dấu % đại diện cho chuỗi kí tự bất kì có thể rỗng
	++ Dấu _ đại diện cho 1 kí tự bất kì
	++ [a-m]: khoảng kí tự từ a-m

- Sử dụng toán tử quan hệ (And, or, not) trong biểu thức điều kiện 
- Điều kiện so sánh tập hợp: IN/ NOT IN

*/
/*
Select
from
where
*/
-- Liệt kê sinh viên có học bổng lớn hơn hoặc bằng 100000

select *
from sinhvien
where hocbong>100000
go
-- Liệt kê sinh viên có học bổng trong khoảng 10000 đến 100000
select *
from sinhvien
where hocbong>=10000 and hocbong <=100000
go
--
select *
from sinhvien
where hocbong between 10000 and 100000
go
--- so sánh tương đối (LIKE/ NOT LIKE)
--Liệt kê sinh viên có tên bắt đầu bằng 'T'
select *
from sinhvien
where tensv like N'T%'
go
--Liệt kê sinh viên có tên chưa kí tự 'u'
select *
from sinhvien
where tensv like N'%u%'
go
-- Liệt kê sinh viên có tên và kí tự thứ 2 là 'u'
select *
from sinhvien
where tensv like N'_u%'
go
-- Liệt kê sinh viên có tên chứa 3 kí tự 
select *
from sinhvien
where tensv like N'___'
go
-------------------
select *
from sinhvien
where len(tensv)=3
go
--------------------
-- Liệt kê sinh viên có tên có chứa kí tự đầu tiên trong khoảng từ a-m
select *
from sinhvien
where tensv like N'[a-m]%'
go
-- Liệt kê sinh viên k có tên chứa kí tự đầu tiên trong khoảng từ a-m
select *
from sinhvien
where tensv not like N'[a-m]%'
go
--
select *
from sinhvien
where tensv like N'[^a-m]%'
go
-- Sử dụng tập hợp
-- Liệt kê sinh viên có tháng sinh là tháng 2 và tháng 8
select masv,hosv,tensv,phai,ngaysinh,noisinh,makh,hocbong,diemtrungbinh
from sinhvien
where month(ngaysinh)=2 or month(ngaysinh) =8
go
select masv,hosv,tensv,phai,ngaysinh,noisinh,makh,hocbong,diemtrungbinh
from sinhvien
where month(ngaysinh) in (2,8)
go
========================================================================
--7. Sắp xếp dữ liệu trong tập kết quả
--Sắp tăng: Order by <column_name> | <index>| <alise_name> asc (mặc định)
--Sắp giảm: Order by desc
--Liệt kê sinh viên, dữ liệu sắp theo tên sinh viên tăng dần
select masv,hosv as [Họ sinh viên],tensv as [Tên sinh viên]
from sinhvien
order by tensv asc
go
select masv,hosv as [Họ sinh viên],tensv as [Tên sinh viên]
from sinhvien
order by 3 asc
go
select masv,hosv as [Họ sinh viên],tensv as [Tên sinh viên]
from sinhvien
order by [Tên sinh viên] asc
go
--DESC
select masv,hosv as [Họ sinh viên],tensv as [Tên sinh viên]
from sinhvien
order by tensv desc
go
--- LIỆT KÊ SINH VIÊN, DỮ LIỆU SẮP THEO TÊN TĂNG DẦN, NẾU TRÙNG THÌ SẮP THEO HỌ SINH VIÊN GIẢM DẦN
select masv,hosv as [Họ sinh viên],tensv as [Tên sinh viên]
from sinhvien
order by tensv asc, hosv desc
go

------LAB 04-------
select * from monhoc
--1.
select * from monhoc
--2. 
select masv, hosv, tensv, hocbong
from sinhvien
order by masv asc
--3. 
select masv,tensv,phai, ngaysinh
from sinhvien
order by tensv asc
--4.
select tensv, ngaysinh, hocbong
from sinhvien
order by ngaysinh asc, hocbong desc
--5.
select mamh,tenmh,sotiet
from monhoc
where tenmh like N'T%'
--6.
select hosv, tensv, ngaysinh, phai
from sinhvien
where tensv like N'%i'
--7.
select makh,tenkh
from khoa
where tenkh like N'_N%'
--8. 
select *
from sinhvien
where hosv like N'%Thị%'
--9. 
select masv, hosv,tensv, phai, hocbong
from sinhvien
where tensv like N'[a-m]%'
go
--10. 
select hosv,tensv, ngaysinh,noisinh,hocbong
from sinhvien
where tensv like N'%[a-m]%'
order by hosv asc, tensv asc
go
--11.
select masv, hosv, tensv, ngaysinh, khoa.makh
from sinhvien, khoa
WHERE sinhvien.makh=khoa.makh
---Câu 15: cho biết các sinh viên sinh sau ngày 20/12/1977. gồm các thông tin họ tên sv, ngày sinh, nơi học, học bổng. ds sẽ đc sắp theo thứ tự ngày sinh giảm dần
select hosv,tensv,convert(varchar(10),ngaysinh, 103) as 'ngày sinh',noisinh,hocbong
from sinhvien
where ngaysinh> '1988/12/20'
order by ngaysinh desc
--
Set dateformat ymd
go -- sau khi đặt lại phải sửa
======================================
-- 7. Sử dụng từ khoá TOP trong select
-- TOP: trích ra số bản ghi đầu tiên trong tập kết quả
select  top 1 * from sinhvien
go
select  top 5 * from sinhvien
go
---TOP 50%
select  top 50 percent * 
from sinhvien
go
-- Lấy ra sinh viên có học bổng cao nhất 
select top 1 * 
from sinhvien
order by hocbong desc
go
-- Lấy ra những sinh viên có học bổng cao nhất
select top 1 with ties * 
from sinhvien
order by hocbong desc
go
------------
--8. Sử dụng từ khoá distinct trong select
--distrinct: loại bỏ dòng trùng lặp (dữ lại 1)
select * 
from sinhvien
go -- Các bản ghi là duy nhất (PK)
select makh
from sinhvien
go -- lặp ->15 bản ghi
select distinct makh
from sinhvien
go -- 
--9. Sử dụng case...when trong select
--: Liệt kê sinh viên, trong phai hiển thị là: 1~ nam, 0~ nữ; null ~khác
select masv, hosv, tensv, phai=case phai
when 1 then N'nam'
when 0 then N'nữ'
else N'Khác'
end
,ngaysinh,noisinh,makh,hocbong,diemtrungbinh
from sinhvien
go
select masv, hosv, tensv, phai=case 
when phai=1 then N'Nam'
when phai=0 then N'Nữ'
else N'Khác'
end
,ngaysinh,noisinh,makh,hocbong,diemtrungbinh
from sinhvien
go
===================================================
--10. Sử dụng hàm iif => IIF( boolean_expression, true_value, false_value )
select masv, hosv,tensv, phai =IIF(phai=1, N'Nam', IIF(phai=0, N'Nữ',N'Khác')),
ngaysinh,noisinh, makh, hocbong
from sinhvien
go
========================================================================================================================
-- Truy vấn kết hợp 2 hay nhiều bảng (JOIN)
/*
INNER JOIN
LEFT JOIN
LEFT OUTER JOIN
RIGHT JOIN/RIGHT OUTER JOIN
FULL JOIN/ FULL OUTER JOIN: số bản ghi nhân với nhau 
*/
--INNER JOIN: 
select *
from khoa as k
join sinhvien s on k.makh=s.makh
go
select *
from khoa as k, sinhvien as s
where k.makh=s.makh
go -- SO SÁNH
---- LEFT JOIN/ LEFT OUTER JOIN
select *
from khoa as k
left join sinhvien s on k.makh=s.makh
go
select *
from khoa as k
right join sinhvien s on k.makh=s.makh
go
select *
from khoa as k
full join sinhvien s on k.makh=s.makh
go
--LIỆT KÊ CÁC THÔNG TIN MAKH, TENKH, HOTEN, NGAYSINH, PHAI, HOCBONG
select makh,tenkh,hoten=hosv+''+tensv,ngaysinh,phai,hocbong
from khoa as k
join sinhvien s on k.makh=s.makh
go -- Ambiguous column name 'makh'.

select khoa.makh,tenkh,hoten=hosv+''+tensv,ngaysinh,phai,hocbong
from khoa as k
join sinhvien s on k.makh=s.makh
go -- The multi-part identifier "khoa.makh" could not be bound.


select k.makh,tenkh,hoten=hosv+''+tensv,ngaysinh,phai,hocbong
from khoa as k
join sinhvien s on k.makh=s.makh
go 
select s.makh,tenkh,hoten=hosv+''+tensv,ngaysinh,phai,hocbong
from khoa as k
join sinhvien s on k.makh=s.makh
go -- lỗi
------ Liệt kê các thông tin: makh, tenkh, hosv, tensv, phai, diem
-- Khoa, sinhvien, ketqua
select k.makh, s.masv, tenkh, hosv, tensv, phai,diem
from khoa as k
join sinhvien as s on k.makh=s.makh
join ketqua as q on s.masv=q.masv
go

----DESIGNER => chuột phải =>design query in editor
--Luyện tập với lab04
--Nghiên cứu truy vấn gộp nhóm/ điều kiện
--Truy vấn con: truy vấn lồng nhau 
--Truy vấn tham chiếu
---------------LESSION 05
--12.Truy vấn gộp nhóm
--GROUP BY <DS cột không nằm trong biểu thức thống kê>
select*from sinhvien order by makh
go
--Thực hiện tính toán, gộp các nhóm theo tiêu chí nào đó, thông thường sử dụng các hàm thống kê
--SUM, COUNT, MAX, MIN, AVG
--Liệt kê các thông tin: mã khoa, tổng học bổng của từng khoa
-- sinhvien
select makh, isnull(sum(hocbong),0) as [Tổng học bổng]
from sinhvien
group by makh 
go
--tính tổng học bổng theo từng khoa, thông tin gồm có: makh, tenkh, tổng học bổng
select k.makh, tenkh, isnull(sum(hocbong),0) as [Tổng học bổng]
from sinhvien as s
right join khoa as k on s.makh=k.makh
group by k.makh, tenkh 
go
--Tính điểm trung bình của từng sinh viên, Thông tin gồm: Masv, hosv, tensv, phai, diemtb
select s.masv, hosv, tensv, phai,round(isnull(avg(diem),0),2) as [Điểm TB]
from sinhvien as s
left join ketqua as k on s.masv=k.masv
group by s.masv, hosv,tensv, phai
go
--Thống kê điểm thi cao nhất theo từng môn học, thông tin gồm mamh, tenmh, sotiet, điểm cao nhất
--MAX, MIN
select m.MaMH, tenmh, sotiet, max(diem) as maxdiem, min(diem) as mindiem
from monhoc as m
full join ketqua as k on m.mamh=k.mamh
group by m.mamh, tenmh, sotiet
go
select m.MaMH, tenmh, sotiet, diem
from monhoc as m
full join ketqua as k on m.mamh=k.mamh
go-- check kq
--13. Truy vấn gộp nhóm có điều kiện
--Having: là biểu điều kiện có chứa hàm thống kê
--Thống kê những sinh viên có điểm trung bình >=5 (avg(diem)>=5)
select s.masv, hosv, tensv, phai, round(isnull(avg(diem),0),2) as [Điểm TB]
from sinhvien as s
join ketqua as k on s.masv=k.masv
group by s.masv, hosv,tensv, phai
having avg(diem)>=5
go
--Thống kê những sinh viên có điểm trung bình >=5 (avg(diem)>=5) và không có môn nào dưới 5
select s.masv, hosv, tensv, phai, round(isnull(avg(diem),0),2) as [Điểm TB]
from sinhvien as s
join ketqua as k on s.masv=k.masv
group by s.masv, hosv,tensv, phai
having avg(diem)>=5 and min(diem)>=5
go
--Thống kê những sv có điểm trung bình <5
select s.masv, hosv, tensv, phai, round(isnull(avg(diem),0),2) as [Điểm TB]
from sinhvien as s
left join ketqua as k on s.masv=k.masv --ưu tiên bảng sv vì có khả năng sv chưa thi
group by s.masv, hosv,tensv, phai
--having isnull(avg(diem),0)<5 -- (1)
having avg(diem)<5 or avg(diem) is null --(2)
go
--14. Truy vấn con
--Là loại truy vấn có chứa một câu lệnh truy vấn khác ( Đặt trong select, from, where)
--Liệt kê các khoa chưa có sinh viên học
select *
from khoa
where makh not in (select distinct makh from sinhvien where makh is not null)
go
--Liệt kê các sinh viên chưa thi môn trí tuệ nhân tạo 
select * 
from sinhvien as s
where s.masv not in (select masv from ketqua where mamh='02')
go
select * 
from sinhvien as s
where s.masv not in (select masv from ketqua as k, monhoc as m where k.mamh=m.mamh and TenMH=N'Trí tuệ nhân tạo')
go
select * 
from sinhvien as s
where s.masv not in (select masv from ketqua as k, monhoc as m where k.mamh=m.mamh and TenMH LIKE N'%Trí tuệ nhân tạo%')
go
==================================================================
--15. Truy vấn tham chiếu
--Câu lệnh truy vấn con, có điều kiện tham chiếu đến truy vấn cha
-- Liệt kê thông tin: makh, tenkh, tongsv, tongnam,tongnu
select makh, tenkh, tongsv = (select count(masv) from sinhvien where makh=k.makh),
                    tongnam = (select count(masv) from sinhvien where makh=k.makh and phai=1),
					tongnu = (select count(masv) from sinhvien where makh=k.makh and phai=0)
from khoa as k
--Cách khác
select k.makh, tenkh, tongsv= count(masv), sum(iif(phai=1,1,0)) as tongnam, sum(iif(phai=1,0,1)) as tongnu
from khoa as k
left join sinhvien as s on k.makh=s.makh
group by k.makh, tenkh
go
--16. Truy vấn tạo bảng (Make table query)
--into: sử dụng trong truy vấn -- tạo bảng tạm 
select* 
into sinhvien_temp
from sinhvien
go
-- bảng tạm (thật sự)
--#table --bảng tạm cục bộ
select k.makh, tenkh, tongsv= count(masv), sum(iif(phai=1,1,0)) as tongnam, sum(iif(phai=1,0,1)) as tongnu
into #thongkekhoa
from khoa as k
left join sinhvien as s on k.makh=s.makh
group by k.makh, tenkh
go
select * from #thongkekhoa
--##table -- bảng tạm toàn cục - use trên máy chủ server
select k.makh, tenkh, tongsv= count(masv), sum(iif(phai=1,1,0)) as tongnam, sum(iif(phai=1,0,1)) as tongnu
into ##thongkekhoa
from khoa as k
left join sinhvien as s on k.makh=s.makh
group by k.makh, tenkh
go
select * from ##thongkekhoa
---THAM SỐ
declare @name nvarchar(100)
set @name= 'AV'
select *from khoa where makh= @name
go
--1. View
--1.1). Tạo view 
/* syntax:
create view vw_ViewName
[option]
as
select...
[option]
go */
--Tạo view thể hiện thông tin tổng hợp từ bảng khoa, sinh viên
create view vw_KHOASINHVIEN
as
select k.*, [MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh],[HocBong]
from khoa as k
full join sinhvien as s on k.makh=s.makh
go
select*from vw_KHOASINHVIEN
go
--Xem câu lệnh select trong view
sp_helptext vw_KHOASINHVIEN
Go
--1.2. Sửa đổi
--Thêm tuỳ chọn encryption- che dấu nội dung trong view
alter view vw_KHOASINHVIEN
with encryption
as
select k.*, [MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh],[HocBong]
from khoa as k
full join sinhvien as s on k.makh=s.makh
go
sp_helptext vw_KHOASINHVIEN
Go
-- Thêm tuỳ chọn schemabinding
alter view vw_KHOASINHVIEN
with encryption, schemabinding
as
select k.*, [MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh],[HocBong]
from khoa as k
full join sinhvien as s on k.makh=s.makh
go-- Syntax '*' is not allowed in schema-bound objects.

alter view vw_KHOASINHVIEN
with encryption, schemabinding
as
select k.makh, [MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh],[HocBong]
from khoa as k
full join sinhvien as s on k.makh=s.makh
go -- Cannot schema bind view 'vw_KHOASINHVIEN' because name 'khoa' is invalid for schema binding. Names must be in two-part format and an object cannot reference itself.

alter view vw_KHOASINHVIEN
with encryption, schemabinding
as
select k.makh, [MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh],[HocBong]
from dbo.khoa as k
full join dbo.sinhvien as s on k.makh=s.makh
go 
-- 
sp_depends vw_KHOASINHVIEN
go
sp_rename 'dbo.Sinhvien.DiemTrungBinh', 'DTB', 'COLUMN';
---------------------
alter view vw_KHOASINHVIEN
with encryption, schemabinding
as
select k.makh, [MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh],[HocBong], DiemTrungBinh*10 as DTB
from dbo.khoa as k
full join dbo.sinhvien as s on k.makh=s.makh
go 
--1.3. Xoá
drop view vw_KHOASINHVIEN
go
----2.Procedure (Create/alter/drop)
--2.1. Tạo thủ tục người dùng
-- Thủ tục đơn giản
create proc spud_KHOA
As
	select *from khoa
Go
-- THỰC THI
spud_KHOA
go
exec spud_KHOA
go
execute spud_KHOA
-- 2.2. Thủ tục với các tuỳ chọn: encryption/recompile
sp_helptext spud_KHOA
go
alter proc spud_KHOA
with encryption,recompile
as
select*from khoa
go
exec spud_KHOA with recompile
go
--2.3. Thủ tục với tham số đầu vào 
--Viết thủ tục hiển thị tất cả sinh viên theo tham sô mã khoa
create proc spud_SinhVienByMaKH
@MaKh char(2)
--with encryption, recompile
as 
select*from sinhvien
where maKh=@MaKh

--Thực thi
exec spud_SinhVienByMaKH 'AV'
go
--
exec spud_SinhVienByMaKH @MaKh='TH'
Go
--2.4. Thủ tục với tham số đầu vào tuỳ chọn(mặc định)
--Viết thủ tục hiển thị tất cả sinh viên theo tham sô mã khoa, nếu người dùng không truyền giá trị thì hiển thị tất cả
alter proc spud_SinhVienByMaKH
@MaKh char(2)=NULL
--with encryption, recompile
as 
/*
if @makh is null
select*
from sinhvien
else
select*
from sinhvien
where maKh=@MaKh
go
exec spud_SinhVienByMaKH
exec spud_SinhVienByMaKH 'AV'
go
*/
select*
from sinhvien
where maKh=ISNULL(@makh,makh)
go
exec spud_SinhVienByMaKH
exec spud_SinhVienByMaKH 'AV'
go
--2.5. Sử dụng lệnh return trong thủ tục
create proc spud_caculator 
@a int, @b int
as
declare @c int 
set @c=@a+@b
--return @a+@b
return @c
go
--thực thi
spud_calculator 10,20 
--
--print spud_caculator 10,20 --error
declare @kq int
exec @kq=spud_caculator 10,20
print @kq
--
declare @kq int
exec @kq=spud_caculator 10,20
print N'Kết quả' + cast(@kq as varchar)
--
declare @kq int
exec @kq=spud_caculator @a=10,@b=20
print N'Kết quả' + cast(@kq as varchar)

exec @kq=spud_caculator 10,20
--2.5. Viết thủ tục thực hiện việc thêm mới dữ liệu vào bảng khoa
--Tham số vào: makh, tenkh
--Kiểm tra: mã khoa trùng thì trả về mã lỗi là -1
alter proc spud_AddKhoa
@MaKh nvarchar(2), @TenKh nvarchar(50), @msg nvarchar(max)=null output
as 
begin 
update dbo.khoa
set tenkh=@tenkh
where makh=@makh
set @msg='Loi'
end try
begin catch
set @msg=ERROR_MESSAGE
END catch
go

exec spud_AddKhoa CSDL, N'Cơ sở dữ liệu'
------------
create proc spud_Khoa_Insert
@makh char(2),
@tenkh nvarchar(50)
as
--kiểm tra khoá chính trùng
if exists (select makh from khoa where makh=@makh)
begin
raiserror('Trùng khoá chính',16,1)
return -1
end

-- thêm 
insert khoa(makh,tenkh) values (@makh,@tenkh)
return 1
go
declare @res int
exec @res=spud_Khoa_Insert @makh='VA', @tenKh=N'Ngoại ngữ Anh văn'
Go
--2.6. thủ tục với tham số đầu ra
--output
--viết thủ tục với yêu cầu
--thủ tục thực hiện tính toán và trả tổng số sinh viên theo tham số đầu vào là makh
--nếu không có mã khoa thì tính tổng toàn bộ sinh viên
--input; @makh
--output; @tongsv
create proc spud_TongSV
@makh char(2) =NULL,
@tongsv int OUTPUT
as
select @TongSV=count (MaSv) from sinhvien where makh=ISNULL(@makh,makh) or makh is null
go
declare @tong int
exec spud_TongSV @makh='AV', @tongsv=@tong output
print @tong
go
declare @tong int
exec spud_TongSV  @tongsv=@tong output
print @tong
go



