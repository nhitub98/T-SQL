--1. Tạo csdl bằng lệnh T-sql
--syntax: create database
--tạo csdl đơn giản
use master
go
create database DEV2311LM_SQL24_03
go
--Xoá
DROP DATABASE DEV2311LM_SQL24_03
-- TẠO CSDL VỚI CÁC THUỘC TÍNH CƠ BẢN 
create database DEV2311LM_SQL24_03
ON
( NAME = DEV2311LM_SQL24_03_DATA,
    FILENAME = 'C:\Devmaster.edu.vn\DEV2311LM-SQL24\DATA\DEV2311LM_SQL24_03.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 
)
LOG ON
( NAME = DEV2311LM_SQL24_03_log,
    FILENAME = 'C:\Devmaster.edu.vn\DEV2311LM-SQL24\DATA\DEV2311LM_SQL24_03_log.ldf',
    SIZE = 5MB,
    MAXSIZE = unlimited,
    FILEGROWTH = 5MB 
	);
GO
--2. tạo bảng và các ràng buộc dữ liệu trên bảng
--các kiểu dữ liệu thường dùng
/*
 -- Kiểu số (số nguyên/ số thực): 
 ++ Số nguyên: tinyint/ smallint/ int/ bigint
 ++ Số thực: float/double/ decimal/ numeric
 -- Kiểu chuỗi kí tự (non unicode / unicode)
 ++ non unicode: char/ varchar/ text
 ++ unicode: nchar/ nvarchar/ ntext
 ++  fixed length: char/ nchar
 ++ dynamic length: varchar/nvarchar
 -- Kiểu ngày giờ: smalldatetime/ datetime/ date/ time ,...
 -- Kiểu logic: bit
 -- Kiểu nhị phân: binary
 -- tham khảo thêm: keyword (datatype in sql server https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16)
*/
/* Các ràng buộc dữ liệu trên đối tượng table (Column)
-- null/ not null
-- ràng buộc duy nhất: primary key( k nhận giá trị null) / unique (duy nhất, có nhận giá trị null)/ thuộc tính identity/ kiểu dữ liệu thuộc tính uniqueidentifier
-- ràng buộc tham chiếu (khoá ngoại) foreign key
-- ràng buộc miền giá trị  (domain): datatype (ràng buộc lớn nhất)/ check constraint
-- thuộc tính default: 
* Ràng buộc phức tạp: Sử dụng trigger
*/
--Tạo cấu trúc bảng dữ liệu:
--Syntax: create table
use DEV2311LM_SQL24_03
--2.1. Tạo bảng đơn giản:
Create table TABLE1
(
COL1 INT,
COL2 VARCHAR(100)
)
GO
--2.2. tạo bảng với ràng buộc khoá chính(Primary key)
--VATTU(MAVT, TENVT, DVTINH, PHANTRAM)
CREATE TABLE VATTU
(
MAVTU CHAR(4) PRIMARY KEY,
TENVTU NVARCHAR(200) NOT NULL,
DVT NVARCHAR(20),
PHANTRAM REAL
)
GO
-- XOÁ BẢNG: 
DROP TABLE VATTU
GO
--đẶT TÊN CONSTRAINT
CREATE TABLE VATTU
(
MAVTU CHAR(4) CONSTRAINT PK_VATTU PRIMARY KEY,
TENVTU NVARCHAR(200) NOT NULL,
DVT NVARCHAR(20),
PHANTRAM REAL
)
GO
CREATE TABLE VATTU
(
MAVTU CHAR(4),
TENVTU NVARCHAR(200) NOT NULL,
DVT NVARCHAR(20),
PHANTRAM REAL,
CONSTRAINT PK_VATTU PRIMARY KEY (MAVTU)
)
GO
--NOTE: TẠO BẢNG DỮ LIỆU VỚI KHOÁ CHÍNH TRÊN 2 HAY NHIỀU CỘT
CREATE TABLE TABLE2
(
COL1 INT PRIMARY KEY,
COL2 INT PRIMARY KEY,
COL2 NVARCHAR(100)
)
GO --ERROR
CREATE TABLE TABLE2
(
COL1 INT,
COL2 INT,
COL3 NVARCHAR(100),
CONSTRAINT PK_TABLE1 PRIMARY KEY (COL1, COL2)
)
GO
--2.3. tẠO BẢNG VỚI RÀNG BUỘC KHOÁ CHÍNH VÀ DỮ LIỆU TỰ ĐỘNG TĂNG (IDENTIFY)
-- TABLE3(col1, col2, col3)
CREATE TABLE TABLE3
(
COL1 INT IDENTITY(1,1) CONSTRAINT PK_TABLE3 PRIMARY KEY,
COL2 NVARCHAR(100),
COL3 TINYINT
)
GO
-- 2.4. TẠO BẢNG VỚI RÀNG BUỘC DUY NHẤT (UNIQUE)
-- NHACC(MANCC, TENNCC, DIACHI, DIENTHOAI)
-- PK[MANCC]
--UQ[TENNCC]
CREATE TABLE NHACC
(
MANCC CHAR(3) CONSTRAINT PK_NHACC PRIMARY KEY,
TENNCC NVARCHAR(200) CONSTRAINT UQ_NHACC_TENNCC UNIQUE,
DIACHI NVARCHAR(250),
DIENTHOAI VARCHAR(50) NOT NULL CONSTRAINT UQ_NHACC_DIENTHOAI UNIQUE
)
GO
-- 2.5. TẠO BẢNG VỚI THUỘC TÍNH DEFAULT
-- NHACC(MANCC, TENNCC, DIACHI, DIENTHOAI)
-- PK[MANCC]
--UQ[TENNCC], UQ_DIENTHOAI
--DF[DIACHI] ='25 VŨ NGỌC PHAN'
DROP TABLE NHACC
GO 
CREATE TABLE NHACC
(
MANCC CHAR(3) CONSTRAINT PK_NHACC PRIMARY KEY,
TENNCC NVARCHAR(200) CONSTRAINT UQ_NHACC_TENNCC UNIQUE,
DIACHI NVARCHAR(250) CONSTRAINT DF_NHACC_DIACHI DEFAULT '25 VŨ NGỌC PHAN',
DIENTHOAI VARCHAR(50) NOT NULL CONSTRAINT UQ_NHACC_DIENTHOAI UNIQUE
)
GO
--
DROP TABLE NHACC
GO 
CREATE TABLE NHACC
(
MANCC CHAR(3) CONSTRAINT PK_NHACC PRIMARY KEY,
TENNCC NVARCHAR(200) CONSTRAINT UQ_NHACC_TENNCC UNIQUE,
DIACHI NVARCHAR(250), 
DIENTHOAI VARCHAR(50) NOT NULL CONSTRAINT UQ_NHACC_DIENTHOAI UNIQUE,
CONSTRAINT DF_NHACC_DIACHI DEFAULT '25 VŨ NGỌC PHAN' FOR DIACHI
) -- ERROR
GO
--2.6. rÀNG BUỘC MIỀN GIÁ TRỊ CHECK CONSTRAINT 
-- CTDONDH(SODH, MAVTU, SLDAT)
--PK[SODK, MAVTU]
--CK[SLDAT]>0 -- SLDAT<150
CREATE TABLE CTDONDH
(
SODH CHAR(4),
MAVTU CHAR(4),
SLDAT TINYINT CONSTRAINT CK_CTDONDH_SLDAT CHECK(SLDAT>0 AND SLDAT<150)
CONSTRAINT PK_CTDONDH PRIMARY KEY (SODH, MAVTU)
)
GO
--ĐONH (SODH, NGAYDH, MANHACC)
--PK[SODH]
--DF[NGAYDH] = GETDATE()
PRINT GETDATE()
CREATE TABLE DONDH
(
SODH CHAR(4) CONSTRAINT PK_DONDH PRIMARY KEY,
NGAYDH DATETIME CONSTRAINT DF_DONDH_NGAYDH DEFAULT GETDATE(),
MANHACC CHAR(3)
)
GO
-- 2.7. TẠO BẢNG VỚI RÀNG BUỘC KHOÁ NGOẠI 
-- CTDONDH(SODH, MAVTU, SLDAT)
--PK[SODK, MAVTU]
--CK[SLDAT] SLDAT<100 VÀ SLDAT>0
--FK[SODH]: REFERENCES DONDH
--FK[MAVTU]: REFENCES (THAM CHIẾU) VATTU
DROP TABLE CTDONDH
GO
CREATE TABLE CTDONDH
(
SODH CHAR(4) CONSTRAINT FK_CTDONDH_DONDH_SODH FOREIGN KEY REFERENCES DONDH -- REFERENCES DONDH(SODH)
,MAVTU CHAR(4) --CONSTRAINT FK_CTDONDH_VATTU_SODH FOREIGN KEY REFERENCES VATTU -- REFERENCES VATTU(VATTU)
,SLDAT TINYINT CONSTRAINT CK_CTDONDH_SLDAT CHECK(SLDAT>0 AND SLDAT<150),
CONSTRAINT PK_CTDONDH PRIMARY KEY (SODH, MAVTU),
CONSTRAINT PK_CTDONDH_VATTU_MAVTU FOREIGN KEY (MAVTU)
REFERENCES VATTU --VATTU(MAVTU)
ON UPDATE CASCADE --NO ACTION/ SET NULL/ SET DEFAULT
ON DELETE NO ACTION -- CASCADE / SET NULL / SET DEFAULT
)
GO
--2.8. SỬA ĐỔI BẢNG DONDH
-- BỔ SUNG KHOÁ NGOẠI (MANCC) THAM CHIẾU ĐẾN BẢNG NHACC
--FK[MANHACC] ~ NHACC
--SỬA ĐỔI THÊM RÀNG BUỘC:
ALTER TABLE DONDH
ADD CONSTRAINT FK_DONDH_NHACC  FOREIGN KEY (MANHACC) REFERENCES NHACC(MANCC)
ON UPDATE CASCADE 
ON DELETE NO ACTION
GO 
-- THÊM CỘT 
ALTER TABLE DONDH
ADD TONGTRIGIA NUMERIC(18,2) 
-- XOÁ CỘT
ALTER TABLE ĐONH
DROP COLUMN TONGTRIGIA
GO
-- SỬA TÊN CỘT
EXEC sp_rename 'dbo.DONDH.TONGTRIGIA', 'TONGTRIGIA', 'COLUMN';

--3. làm việc với các câu lệnh dml (select/insert/update/delete)
--3.1. select -> lọc/duyệt/ trích các bản ghi từ nguồn dữ liệu
SELECT*FROM VATTU
GO 
--3.2. INSERT
-- THÊM MỘT HAY NHIỀU BẢN GHI VÀO BẢNG
-- SYNTAX: (ĐƠN GIẢN)
--THÊM MỘT BẢN GHI VÀO BẢNG
INSERT VATTU(MAVTU,TENVTU,DVT,PHANTRAM) -- CÁCH NÀY KHÔNG BẮT BUỘC GIÁ TRỊ PHẢI ĐƯỢC THÊM VÀO CÁC CỘT TƯƠNG ỨNG
VALUES('VT01', N'Tủ lạnh LG204', N'Chiếc', 40)
GO
SELECT * FROM VATTU
INSERT VATTU -- CÁCH NÀY BẮT BUỘC GIÁ TRỊ PHẢI ĐC THÊM VÀO CÁC CỘT TƯƠNG ỨNG, SỐ LƯỢNG PHẢI BẰNG NHAU
VALUES('VT02', N'TỦ LẠNH LG204', N'Chiếc', 40)
GO
INSERT VATTU --Msg 213, Level 16, State 1, Line 233 Column name or number of supplied values does not match table definition.
VALUES('VT02', N'TỦ LẠNH LG204', N'Chiếc')
GO
-- GHI CHÚ: 
--++ CỘT IDENTITY-> MẶC ĐỊNH KHÔNG THỰC HIỆN THÊM GIÁ TRỊ CHO CỘT NÀY
--++ CỘT CÓ GIÁ TRỊ MẶC ĐỊNH HOẶC NULL: CÓ THỂ KHÔNG CẦN THÊM GIÁ TRỊ
--++ MẶC ĐỊNH: KHI THÊM GIÁ TRỊ TRÊN CỘT KHOÁ NGOẠI, THÌ GIÁ TRỊ ĐÓ PHẢI TỒN TẠI TRÊN CỘT THAM CHIẾU TRÊN BẢNG 1 TƯƠNG ỨNG
-- THÊM NHIỀU BẢN GHI CÙNG BẢNG CÙNG LÚC VÀO BẢNG
INSERT VATTU(MAVTU,TENVTU,DVT,PHANTRAM) VALUES
('VT03',N'Tủ lạnh toshiba', N'Chiếc',10),
('VT04',N'Tủ lạnh toshiba', N'Chiếc',15),
('VT05',N'Tủ lạnh toshiba', N'Chiếc',17),
('VT03',N'Tủ lạnh toshiba', N'Chiếc',80)
GO -- ERROR
SELECT*FROM VATTU
INSERT VATTU(MAVTU,TENVTU,DVT,PHANTRAM) VALUES
('VT03',N'Tủ lạnh toshiba', N'Chiếc',10),
('VT04',N'Tủ lạnh toshiba', N'Chiếc',15),
('VT05',N'Tủ lạnh toshiba', N'Chiếc',17),
('VT06',N'Tủ lạnh toshiba', N'Chiếc',80)
GO -- OK
--INSERT SELECT 
INSERT VATTU(MAVTU,TENVTU,DVT,PHANTRAM)
SELECT 'VT09',N'Tủ lạnh toshiba 9', N'Chiếc',10 UNION
SELECT 'VT08',N'Tủ lạnh 
toshiba 8', N'Chiếc',10
------------------------------------------------
--GHI CHÚ: 
/*
- DỮ LIỆU CHUỖI NON UNICODE: ĐẶT TRONG CẶP NHÁY ĐƠN ''
- DỮ LIỆU CHUỖI UNICODE: ĐẶT TRONG CẶP NHÁY ĐƠN N''
- DỮ LIỆU KIỂU NGÀY: (MẶC ĐỊNH)-> ĐẶT TRONG CẶP DẤU NHÁY ĐƠN '', THEO ĐỊNH DẠNG: MM/DD/YYYY HOẶC YYYY/MM/DD
==> SET DATEFORMAT DMY?
*/
--INSERT LÀ CÂU LỆNH THÊM MỘT HOẶC NHIỀU BẢN GHI VÀO BẢNG. ĐÂY LÀ THAO TÁC TRÊN DÒNG TRONG BẢNG. 
--3.3. UPDATE -> SỬA ĐỔI DỮ LIỆU TRÊN CỘT TRONG BẢNG
--XOÁ CŨ, THÊM MỚI: 
-- SYNTAX: 
/* 
UPDATE <TABLE_NAME> [SOURCE]
SET <COLUMN_NAME> = <GIÁ TRỊ> /[<COLUMN_SOURCE>] [,...]
[WHERE <CONDITION>]
*/
-- CẬP NHẬT CỘT PHANTRAM TRONG BẢNG VẬT TƯ, TĂNG LÊN 10:
SELECT*FROM VATTU
--
UPDATE VATTU SET PHANTRAM = PHANTRAM+10
GO
--CẬP NHẬT CỘT PHẦN TRĂM TRONG BẢNG VẬT TƯ, TỈ LỆ PHẦN TRĂM GIẢM ĐI 10 CHO NHỮNG VẬT TƯ CÓ PHẦN TRĂM >=50
UPDATE VATTU SET PHANTRAM = PHANTRAM -10 WHERE PHANTRAM >=50
GO
-- 3.4. XOÁ (DELETE)
--SYNTAX: DELETE [FROM] <TABLE_NAME> [WHERE <CONDITION>]
DELETE VATTU WHERE MAVTU ='VT01'
GO
DELETE VATTU WHERE PHANTRAM<50
GO
SELECT*FROM CTDONDH
-- GHI CHÚ: KHI XOÁ DỮ LIỆU TRÊN BẢNG MÀ CÓ LIÊN KẾT ĐẾN BẢNG BÊN NHIỀU THÌ CHÚ Ý ĐẾN ĐIỀU KIỆN THAM CHIẾU (ON DELETE NO ACTION)
--3.5. XOÁ SẠCH (LÀM SẠCH VÙNG NHỚ)
--SYNTAX: TRUNCATE TABLE <TABLE_NAME>
TRUNCATE TABLE VATTU -- Cannot truncate table 'VATTU' because it is being referenced by a FOREIGN KEY constraint.
GO
TRUNCATE TABLE [DBO].[TABLE3]
GO
-- Lesson04 - Truy vấn dữ liệu (SELECT - TSQL)
use master
go
CREATE DATABASE DEV2311LM_SQL24_04
GO
USE DEV2311LM_SQL24_04;
GO
-- Truy vấn dữ liệu từ 1 hay nhiều bảng với các điều kiện, lọc, ...
-- syntax:
/*
-- Syntax for SQL Server and Azure SQL Database  
 
<SELECT statement> ::=    
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
*/
-- 1. Truy vấn với select đơn giản (không có from)
SELECT 'Devmaster Academy'
GO
-- 2. Đặt tên cột cho dữ liệu trong tập kết quả
SELECT 'Devmaster Academy' as [Company]
GO
SELECT 'Devmaster Academy' as 'Company'
GO
SELECT 'Devmaster Academy' [Company Name]
GO
SELECT 'Company'= 'Devmaster Academy'
GO
--3. Truy vấn dữ liệu từ một bảng sử dụng dấu *
-- Liệt kê tất cả các dữ liệu trong bảng khoa
-- (*)
SELECT *
FROM KHOA
GO
-- 4. Lựa chọn các cột trong tập kết quả
SELECT MaKH, TenKH
FROM KHOA
GO
-- liệt kê các thông tin masv, hosv, tensv, ngaysinh
SELECT MASV, HOSV, TENSV, NGAYSINH
FROM SINHVIEN
GO
-- 5. Sử dụng biểu thức trong select
-- liệt kê các thông tin masv, hoten, ngaysinh, trong đó cột hoten được gộp từ hosv, tensv
SELECT MASV, HOSV + ' ' + TENSV as [Họ tên], NGAYSINH
FROM SINHVIEN
GO
-- Liệt kê các thông tin diểm thi của sinh viên, thêm cột điểm tăng 10%

SELECT * , [DIEM TANG] = DIEM*110/100
FROM KETQUA
GO
-- 6. Sử dụng mệnh đề where để giới hạn dữ liệu trong tập kết quả (lọc, tìm kiếm)
-- WHERE <Biểu thức điều kiện>
/*
    - Điều kiện sử dụng các phép toán so sánh
        (>; >=; <; <=; =; <>; !=) => thường dùng với cột dữ liệu kiểu số
    - Điều kiện sử dụng phép toán tương đối (áp dụng với dữ liệu kiểu chuỗi)
        + Like / Not Like:
            +++ các ký đại diện:
                ++: dấu %  đại diện cho chuỗi ký tự bất kỳ có thể rỗng
                ++: dấu _ đại diện cho 1 ký tự bất kỳ
                ++: [a-m]: khoảng ký tự từ a đến m

    - Sử dụng toán tử quan hệ (and,or, not ) trong biểu thức điều kiện
    - Điều kiện so sánh tập hợp: IN / NOT IN
*/
/*
    SELECT
    FROM
    WHERE
*/
-- Liệt kê sinh viên có học bổng lớn hơn hoặc bằng 100000
SELECT  *
FROM SINHVIEN
WHERE HOCBONG >=100000
GO
-- Liệt kê sinh viên có học bổng trong khoảng 10.000 đến 100.000
SELECT  *
FROM SINHVIEN
WHERE HOCBONG >=10000 and hocbong<=100000
GO
--
SELECT  *
FROM SINHVIEN
WHERE HOCBONG between 10000 and 100000
GO
--- so sánh tương đối (LIKE / NOT LIKE)
-- Liệt kê sinh viên có tên bắt đầu bằng 'T'
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'T%'
GO
-- Liệt kê sinh viên có tên chứa ký tự 'u'
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'%u%'
GO
-- Liệt ke sinh viên có tên mà ký tự thứ 2 là 'u'
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'_u%'
GO
-- Liệt kê sinh viên có tên chứa 3 ký tự
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'___'
GO
--
SELECT  *
FROM SINHVIEN
WHERE len(TENSV)=3
GO
-- Liệt kê sinh viên có tên có chứa ký tự đầu tiên trong khoảng a-m
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'[a-m]%'
GO
-- ko
SELECT  *
FROM SINHVIEN
WHERE TENSV not LIKE N'[a-m]%'
GO
--
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'[^a-m]%'
GO

-- sử dụng tập hợp
-- Liệt kê sinh viên có tháng sinh là tháng 2 và tháng 8
SELECT  MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
WHERE MONTH(NGAYSINH) = 2 OR MONTH(NGAYSINH) =8
GO
SELECT  MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
WHERE MONTH(NGAYSINH) IN (2,8)
GO
-- not in
SELECT  MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
WHERE MONTH(NGAYSINH) NOT IN (2,8)
GO
--==================================================
--7. Sắp xếp dữ liệu trong tập kết quả
-- sắp tăng: ORDER BY <Column_Name> | <index> | <alise name>  ASC (Mặc định)
-- Sắp giảm: ORDER BY DESC
-- Liệt kế sinh viên, dữ liệu sắp theo tên sinh viên tăng dần
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY TenSV ASC
--
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY 3 ASC
--
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY [Tên sinh viên] ASC
-- DESC
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY TenSV DESC
---
--- LIỆT KÊ SINH VIÊN, DỮ LIỆU SẮP THEO TÊN TĂNG DẦN, NẾU TRÙNG THÌ SẮP THEO HOSV GIẢM DẦN
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY TenSV ASC, HOSV DESC
GO
-- LUYỆN TẬP:
/*
15. Cho biết các sinh viên sinh sau ngày 20/12/1977, gồm các thông tin: Họ tên sinh
viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự
ngày sinh giảm dần.
*/
 SELECT   HoSV, TenSV,  CONVERT(VARCHAR(10),NgaySinh,103) as 'Ngày sinh', NoiSinh, HocBong
 FROM SINHVIEN
 WHERE NgaySinh > '1988/12/20'
 ORDER BY NgaySinh DESC
 --
 set dateformat dmy
 go
 SELECT   HoSV, TenSV,  CONVERT(VARCHAR(10),NgaySinh,103) as 'Ngày sinh', NoiSinh, HocBong
 FROM SINHVIEN
 WHERE NgaySinh > '20/12/1988'
 ORDER BY NgaySinh DESC

--==================================================
--7. sử dụng từ khóa TOP trong select
-- TOP: trích ra số bản ghi đầu tiên trong tập kết quả
SELECT *
FROM SINHVIEN
GO
SELECT TOP 1 *
FROM SINHVIEN
GO
SELECT TOP 5 *
FROM SINHVIEN
GO
-- TOP 50%
SELECT TOP 50 PERCENT *
FROM SINHVIEN
GO
-- LẤY RA SINH VIÊN CÓ HỌC BỔNG CAO NHẤT
SELECT TOP 1 *
FROM SINHVIEN
ORDER BY HOCBONG DESC
GO
-- LẤY RA NHỮNG SINH VIÊN CÓ HỌC BỔNG CAO NHẤT
SELECT TOP 1 WITH TIES *
FROM SINHVIEN
ORDER BY HOCBONG DESC
GO
--==================================================
--8. sử dụng từ khóa DISTINCT trong select
-- distinct: loại bỏ dòng trùng lặp (giữ lại 1)

SELECT *
FROM SINHVIEN
GO -- các bản ghi là duy nhất (PK)

SELECT makh
FROM SINHVIEN
GO -- lặp -> 15 bản ghi

SELECT distinct makh
FROM SINHVIEN
GO
--==================================================
--9. case ... when ... then trong select
--: Liệt kê sinh viên, trong phai hiển thị là: 1 ~ Nam ; 0 ~ Nữ; null ~ Khác
SELECT   MaSV, HoSV, TenSV, Phai = CASE Phai
                                        WHEN 1 THEN N'Nam'
                                        WHEN 0 THEN N'Nữ'
                                        ELSE N'Khác'
                                    END
     ,NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
GO
SELECT   MaSV, HoSV, TenSV, Phai = CASE
                                        WHEN Phai=1 THEN N'Nam'
                                        WHEN Phai=0 THEN N'Nữ'
                                        ELSE N'Khác'
                                    END
     ,NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
GO
---
--==================================================
--10. sử dụng hàm IIF => IIF( boolean_expression, true_value, false_value )
SELECT   MaSV, HoSV, TenSV, [Phái] = IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác'))
     ,NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
GO
--==================================================
--11. Truy vấn kết hợp 2 hay nhiều bảng (JOIN)
/*
    INNER JOIN
    LEFT JOIN / LEFT OUTER JOIN
    RIGHT JOIN / RIGHT OUTER JOIN
    FULL JOIN / FULL OUTER JOIN
*/
-- INNER JOIN:
SELECT  *
FROM KHOA AS K
    JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO
SELECT  *
FROM KHOA AS K, SINHVIEN AS S
WHERE K.MAKH = S.MAKH
GO -- SO SÁNH
-- LEFT JOIN / LEFT OUTER JOIN

SELECT  *
FROM KHOA AS K
    LEFT JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO
-- RIGHT JOIN
SELECT  *
FROM KHOA AS K
    RIGHT JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO
-- FULL NOIN
SELECT  *
FROM KHOA AS K
    FULL JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO

-- LIỆT KÊ CÁC THÔNG : MAKH, TENKH, HOTEN, NGAYSINH, PHAI, HOCBONG
SELECT MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO--Ambiguous column name 'MAKH'.
SELECT KHOA.MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO--The multi-part identifier "KHOA.MAKH" could not be bound.
SELECT K.MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO
SELECT S.MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO

-- Liệt kê các thông tin: MAKH, TENKH, MASV, HOSV, TENSV, PHAI, DIEM
-- KHOA, SINHVIEN, KETQUA
SELECT K.MAKH, S.MASV, TENKH, HOSV, TENSV, PHAI, DIEM
FROM KHOA AS K
    JOIN SINHVIEN AS S ON K.MAKH=S.MAKH
    JOIN KETQUA AS Q ON S.MASV = Q.MASV
GO
---DESIGNER
SELECT   Khoa.MaKH, Khoa.TenKH, SinhVien.MaSV, SinhVien.HoSV, SinhVien.TenSV, SinhVien.Phai, Ketqua.Diem
FROM         Khoa INNER JOIN
                         SinhVien ON Khoa.MaKH = SinhVien.MaKH INNER JOIN
                         Ketqua ON SinhVien.MaSV = Ketqua.MaSV

GO
SELECT   Khoa.MaKH AS [Mã khoa], Khoa.TenKH AS [Tên khoa], SinhVien.MaSV, SinhVien.HoSV, SinhVien.TenSV, SinhVien.Phai
FROM         Khoa LEFT OUTER JOIN
                         SinhVien ON Khoa.MaKH = SinhVien.MaKH
go
SELECT   Khoa.MaKH, Khoa.TenKH, SinhVien.MaSV, SinhVien.HoSV, SinhVien.TenSV, SinhVien.Phai, SinhVien.NgaySinh, SinhVien.NoiSinh, SinhVien.HocBong, SinhVien.DiemTrungBinh,
                         Ketqua.Diem, MonHoc.MaMH, MonHoc.TenMH, MonHoc.Sotiet
FROM         Ketqua INNER JOIN
                         MonHoc ON Ketqua.MaMH = MonHoc.MaMH INNER JOIN
                         SinhVien ON Ketqua.MaSV = SinhVien.MaSV INNER JOIN
                         Khoa ON SinhVien.MaKH = Khoa.MaKH
-- Lesson05 - Truy vấn dữ liệu (SELECT - TSQL) - nâng cao
use master
go
CREATE DATABASE DEV2311LM_SQL24_04
GO
USE DEV2311LM_SQL24_04;
GO

--- Luyện tập với lab04.
-- Nghiên cứu truy vấn gộp nhóm / điều kiện gộp nhóm
-- truy vấn con
-- truy vấn tham chiếu
---------------------- LESSON05
--12. Truy vấn gộp nhóm
-- GROUP BY <Ds cột không nằm trong biểu thức thống kê>
SELECT * FROM SINHVIEN  order by makh
GO
-- thực hiện tính toán, gộp các nhóm theo tiêu chí nào đó, thông thường có sử dụng các hàm thống kê
-- SUM, COUNT, MAX, MIN, AVG
-- Liệt kê các thông tin: makh, tong hoc bong cua tung khoa
-- sinhvien
SELECT MAKH, ISNULl(SUM(hocbong),0) as [Tổng học bổng]
FROM SINHVIEN
GROUP BY MaKH
GO
-- tính tổng học bổng theo từng khoa, thông tin gồm có: makh, tenkh, tổng học bổng
SELECT K.MAKH, TenKH, ISNULl(SUM(hocbong),0) as [Tổng học bổng]
FROM SINHVIEN as S
    RIGHT JOIN KHOA as K On s.MaKH = k.MaKH
GROUP BY K.MaKH, TenKH
GO
-- Tính điểm trung bình của từng sinh viên, thông tin gồm: MaSV, hosv, tensv, phai, diemtb
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    LEFT JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
GO
-- Thống kê điểm thi cao nhất theo từng môn học, thông tin gồm: MaMH, TenMH, Sotiet, Diem cao nhất
-- MAX,
-- Min - thấp nhất
SELECT M.MaMH, TENMH, SOTIET, MAX(DIEM) as MAXDIEM , MIN(DIEM) as MINDIEM
FROM MONHOC AS M
    FULL JOIN KETQUA AS K ON M.MaMH = K.MaMH
GROUP BY M.MaMH, TENMH, SOTIET
GO
-- 13. Truy vấn gộp nhóm có điều kiện
-- having: là biểu điều kiện có chứa hàm thống kê
-- Thống kê những sinh viên có điểm trung bình >=5 (avg(diem)>=5)
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
HAVING AVG(DIEM)>=5
GO
-- Thống kê những sinh viên có điểm trung bình >=5 (avg(diem)>=5) và không có môn nào dưới 5
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
HAVING AVG(DIEM)>=5 AND MIN(DIEM) >=5
GO
-- Thống kê những sinh viên có điểm trung bình <5
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    LEFT JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
--HAVING ISNULL(AVG(DIEM),0)<5
HAVING AVG(DIEM)<5 Or AVG(DIEM) is Null
GO
-- 14. Truy vấn con
-- là loại truy vấn có chứa một câu lệnh truy vấn khác (đặt trong: select, from, where , having, )
-- Liệt kê các khoa chưa có sinh viên học
SELECT *
FROM KHOA
WHERE MAKH NOT IN (SELECT DISTINCT MAKH FROM SINHVIEN WHERE MAKH IS NOT NULL)
GO
-- Liệt kê các sinh viên chưa thi môn Trí tuệ nhân tạo
SELECT *
FROM SINHVIEN AS S
WHERE S.MaSV NOT IN (SELECT MASV FROM KETQUA WHERE MAMH = '02')
go
SELECT *
FROM SINHVIEN AS S
WHERE S.MaSV NOT IN (SELECT MASV FROM KETQUA AS K, MONHOC AS M WHERE k.mamh=m.mamh and TenMH = N'Trí tuệ nhân tạo')
GO
--
SELECT *
FROM SINHVIEN AS S
WHERE S.MaSV NOT IN (SELECT MASV FROM KETQUA AS K, MONHOC AS M WHERE k.mamh=m.mamh and TenMH LIKE N'%Trí tuệ nhân tạo%')
GO
-- =================================
--15. Truy vấn tham chiếu
-- Câu lệnh truy vấn con, có điều kiện tham chiếu đến truy vấn cha
-- Liệt kê thông tin: makh, tenkh, tongsv, tongnam, tongnu
SELECT MakH, TenKH, TongNam = (Select Count(MaSV) from SinhVien where MaKH = K.MaKH)
    ,TongNam = (Select Count(MaSV) from SinhVien where MaKH = K.MaKH and Phai = 1)
    ,TongNu = (Select Count(MaSV) from SinhVien where MaKH = K.MaKH and Phai = 0)
FROM KHOA as K
-- Cách khác
SELECT k.MAKH, TENKH, TONGSV = COUNT(MASV), SUM(IIF(PHAI=1,1,0)) as TONGNAM,SUM(IIF(PHAI=1,0,1)) as TONGNu
FROM KHOA as K
    LEFT JOIN SINHVIEN as S On K.MAKH = S.MAKH
GROUP BY k.MAKH, TENKH
GO
--16. Truy vấn tạo bảng (Make table query)
-- into: sử dụng trong truy vấn
SELECT *
INTO SINHVIEN_temp
FROM SINHVIEN
GO
-- bảng tạm
-- #table
SELECT k.MAKH, TENKH, TONGSV = COUNT(MASV), SUM(IIF(PHAI=1,1,0)) as TONGNAM,SUM(IIF(PHAI=1,0,1)) as TONGNu
INTO #THONGKEKHOA
FROM KHOA as K
    LEFT JOIN SINHVIEN as S On K.MAKH = S.MAKH
GROUP BY k.MAKH, TENKH
GO
SELECT * FROM #THONGKEKHOA
-- ##table
SELECT k.MAKH, TENKH, TONGSV = COUNT(MASV), SUM(IIF(PHAI=1,1,0)) as TONGNAM,SUM(IIF(PHAI=1,0,1)) as TONGNu
INTO ##THONGKEKHOA
FROM KHOA as K
    LEFT JOIN SINHVIEN as S On K.MAKH = S.MAKH
GROUP BY k.MAKH, TENKH
GO
SELECT * FROM ##THONGKEKHOA
GO

--- THAM SỐ
DECLARE @name nvarchar(100)
SET @name = 'AV'
SELECT * From KHOA where MaKH = @name
GO
	
#Lesson06

USE [DEV2311LM_SQL24_04]
GO
--1. View
--1.1: Tạo view
/* syntax:
CREATE VIEW vw_ViewName
    [option]
AS
    SELECT ....
    [OPTION]
GO
*/

-- tạo view thể thông tin tổng hợp từ bảng khoa , sinh vien
CREATE VIEW vw_KHOASINHVIEN
AS
    SELECT K.*, MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh,  HocBong, DiemTrungBinh
    FROM KHOA AS K
        FULL JOIN SINHVIEN AS S ON K.MaKH = S.MaKH
GO
SELECT * from vw_KHOASINHVIEN
GO
--  xem câu lệnh select trong view
sp_helptext vw_KHOASINHVIEN
GO
-- 1.2: Sửa đổi
-- thêm tùy chọn encryption - che dấu nội dung trong view
ALTER VIEW vw_KHOASINHVIEN
    WITH ENCRYPTION
AS
    SELECT K.*, MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh,  HocBong, DiemTrungBinh
    FROM KHOA AS K
        FULL JOIN SINHVIEN AS S ON K.MaKH = S.MaKH
GO
sp_helptext vw_KHOASINHVIEN
GO
-- THÊM TÙY CHỌN SCHEMABINDING
ALTER VIEW vw_KHOASINHVIEN
    WITH ENCRYPTION, SCHEMABINDING
AS
    SELECT K.*, MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh,  HocBong, DiemTrungBinh
    FROM KHOA AS K
        FULL JOIN SINHVIEN AS S ON K.MaKH = S.MaKH
GO
--Syntax '*' is not allowed in schema-bound objects.
ALTER VIEW vw_KHOASINHVIEN
    WITH ENCRYPTION, SCHEMABINDING
AS
    SELECT K.MaKH, TenKH, MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh,  HocBong, DiemTrungBinh
    FROM KHOA AS K
        FULL JOIN SINHVIEN AS S ON K.MaKH = S.MaKH
GO
--Cannot schema bind view 'vw_KHOASINHVIEN' because name 'KHOA' is invalid for schema binding. Names must be in two-part format and an object cannot reference itself.
ALTER VIEW vw_KHOASINHVIEN
    WITH ENCRYPTION, SCHEMABINDING
AS
    SELECT K.MaKH, TenKH, MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh,  HocBong, DiemTrungBinh
    FROM dbo.KHOA AS K
        FULL JOIN dbo.SINHVIEN AS S ON K.MaKH = S.MaKH
GO
--
sp_depends vw_KHOASINHVIEN
go
sp_rename 'dbo.SinhVien.DiemTrungBinh', 'DTB', 'COLUMN';
GO
ALTER VIEW vw_KHOASINHVIEN
    WITH ENCRYPTION, SCHEMABINDING
AS
    SELECT K.MaKH, TenKH, MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh,  HocBong, DiemTrungBinh*10 as DTB
    FROM dbo.KHOA AS K
        FULL JOIN dbo.SINHVIEN AS S ON K.MaKH = S.MaKH
GO
--1.3: xóa
DROP VIEW vw_KHOASINHVIEN
GO
-----2. PROCEDURE: (CREATE / ALTER / DROP)
--2.1: Tạo thủ tục người dùng
-- thủ tục đơn giản
CREATE PROC spud_KHOA
AS
    SELECT * FROM KHOA
GO
-- THỰC THI
spud_KHOA
GO
EXEC spud_KHOA
GO
EXECUTE spud_KHOA
GO
--2.2 Thủ tục với các tùy chọn: encryption / recompile
sp_helptext spud_KHOA
GO
ALTER PROC spud_KHOA
    WITH ENCRYPTION
AS
    SELECT * FROM KHOA
GO
ALTER PROC spud_KHOA
    WITH ENCRYPTION, RECOMPILE
AS
    SELECT * FROM KHOA
GO
exec spud_KHOA with recompile
GO
--2.3: thủ tục với tham số đầu vào
-- Viết thủ tục hiện tất cả sinh viên theo tham số mã khoa
CREATE PROC spud_SinhVienByMaKH
    @MaKH char(2)
    --WITH ENCRYPTION, RECOMPILE
AS
    SELECT *
    FROM SINHVIEN
    WHERE MaKH = @MaKH
GO
-- Thực thi
Exec spud_SinhVienByMaKH 'AV'
--
Exec spud_SinhVienByMaKH @MaKH = 'TH'
GO
-- 2.4: Thủ tục với tham số đầu vào tùy chọn (mặc định)
-- Viết thủ tục hiện tất cả sinh viên theo tham số mã khoa, nếu người dùng không truyền giá trị thì hiển thị tất cả
ALTER PROC spud_SinhVienByMaKH
    @MaKH char(2) = NULL
    --WITH ENCRYPTION, RECOMPILE
AS
    /*
    IF @MaKH is null
        BEGIN
            SELECT *
            FROM SINHVIEN
        END
    ELSE
        SELECT *
        FROM SINHVIEN
        WHERE MaKH = @MaKH
    */
    SELECT *
    FROM SINHVIEN
    WHERE MaKH = ISNULL(@MaKH,MAKH)
GO
Exec spud_SinhVienByMaKH
Exec spud_SinhVienByMaKH 'AV'
GO
--2.5: sử dụng lệnh return trong thủ tục
CREATE PROC spud_Calculator
    @a int, @b int
As
    declare @c int
    SET @c = @a+@b
    --RETURN @a+@b
    RETURN @c
GO
-- thự thi
spud_Calculator 10,20
--
--print spud_Calculator 10,20 -- error
declare @kq int
exec @kq = spud_Calculator 10,20
print @kq
--
declare @kq int
exec @kq = spud_Calculator 10,20
print N'Kết quả: ' + cast(@kq as varchar)
--
declare @kq int
exec @kq = spud_Calculator @b=12,@a=20
print N'Kết quả: ' + cast(@kq as varchar)
GO
--2.5: Viết thủ tục thực hiện việc thêm mới dữ liệu vào bảng khoa
-- tham số vào: makh, tenkh
-- kiểm tra: nếu mã khoa trùng thì trả về mã lỗi là -1
---10'
CREATE PROC spud_KHOA_Insert
    @MaKH char(2)
    ,@TenKH nvarchar(50)
AS
    -- kiểm tra khóa chính trùng
    IF EXISTS(SELECT MAKH FROM KHOA WHERE MAKH=@MaKH)
    BEGIN
        RAISERROR('Trùng khóa chính',16,1)
        RETURN -1
    END
    -- THÊM
    INSERT KHOA(MaKH, TenKH) VALUES(@MaKH, @TenKH)
    RETURN 1
GO
--
declare @res int
Exec @res=spud_KHOA_Insert @MaKH='AV', @TenKH =N'Ngoại ngữ Anh Văn'
print @res
GO
declare @res int
Exec @res=spud_KHOA_Insert @MaKH='VA', @TenKH =N'Ngoại ngữ Anh Văn'
print @res
GO
--2.6: THủ tục với tham số đầu ra
-- OUTPUT
-- VIẾT THỦ TỤC VỚI YÊU CẦU:
-- thủ tục thực hiện tính toán và trả tổng số sinh viên theo tham số đầu vào là makh
-- nếu không có mã khoa thì tính tổng toàn bộ sinh viên
-- input: @makh
-- output: @tongsv
ALTER PROC spud_TongSV
    @makh char(2) = NULL
    ,@tongsv int OUTPUT
AS
    SELECT @TongSV = count(MaSV) From SINHVIEN Where MaKH = ISNULL(@MaKH,MaKH) Or MaKH is NULL
GO
DECLARE @Tong int
Exec spud_TongSV @makh='AV', @tongsv=@tong  OUTPUT
Print @Tong
GO
DECLARE @Tong int
Exec spud_TongSV   @tongsv=@tong  OUTPUT
Print @Tong
GO
SELECT * from SINHVIEN