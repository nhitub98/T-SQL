--Tạo csdl có tên Lab02
create database LAB02
go
--Gọi csdl ra sử dụng
use LAB02
go
-- Khai báo 1 biến Name, gán giá trị và in ra
DECLARE @Name NVARCHAR(50) = N'Lương Thu Hiền'
PRINT @Name
GO
--Khai báo 1 biến Age, gán giá trị và in ra
DECLARE @Age INT
SET @Age = 30
SELECT @Age AS 'Age'
GO
-- Tạo 1 bảng tên employee với thông tin:
CREATE TABLE Employee
(
ID int PRIMARY KEY,
FullName nvarchar(35),
Gender bit,
BirthDay datetime,
Address nvarchar(max),
Email varchar(50), 
Salary float
)
GO
-- Thêm cột phone: varchar(20) cho bảng Employee
ALTER TABLE Employee
ADD phone varchar(20)
-- Nhập vào tối thiểu 5 bản ghi
select*from Employee
INSERT Employee 
VALUES
('1', N'Tô Hoàng Nam'   ,'1', '2002-09-25', N'Hà Nội','tohoangnam2k2@gmail.com','10000000','0123456789'),
('2', N'Lương Thu Hiền' ,'0', '1998-12-25', N'Quảng Ninh','nhitub98@gmail.com' ,'20000000','0396312298'),
('3', N'Lê Minh Đức'    ,'1', '2002-01-01', N'Hải Phòng' ,'duc2k2@gmail.com'   ,'50000000','0396312343'),
('4', N'Cát Trung Hiếu' ,'1', '2005-07-22', N'Thái Bình' ,'hieu2k5@gmail.com'  ,'70000000','01684648475'),
('5', N'Lê Trung Bách'  ,'1', '2002-09-25', N'Hà Nội'    ,'bachby2k2@gmail.com','60000000','0229343533')
GO
-- Đưa ra tất cả các nhân viên trong công ty
SELECT * FROM Employee
GO
-- Đưa ra các nhân viên có lương >2000000
SELECT * FROM Employee
WHERE Salary>2000000
GO
-- Đưa ra các nhân viên có sinh nhật trong tháng này
SELECT *FROM Employee
WHERE MONTH(BirthDay) = MONTH(GETDATE());
GO
-- Đưa ra danh sách nhân viên hiển thị kèm thêm cột tuổi và cột birthday hiển thị dưới dạng dd/mm/yyyy
SELECT ID, FullName, Gender, FORMAT(BirthDay, 'dd/mm/yyyy') AS BirthDay, DATEDIFF(YEAR, BirthDay, GETDATE()) AS Tuổi, Address,
    Email, Salary
FROM Employee;
GO
-- Đưa ra những nhân viên có địa chỉ ở Hà Nội
SELECT * FROM Employee
WHERE Address= N'Hà Nội';
Go
-- Sửa tên nhân viên có mã là "NV01" thành tên "John"
UPDATE Employee
SET FullName = 'John'
WHERE ID = 'NV01'
go
-- Xoá những nhân viên có tuổi > 50
DELETE FROM Employee
WHERE DATEDIFF(YEAR, BirthDay, GETDATE()) > 50
Go
-- Copy những nhân viên có tuổi > 50 sang một bảng mới
CREATE TABLE COPY
(
    ID int PRIMARY KEY,
    FullName nvarchar(35),
    Gender bit,
    BirthDay datetime,
    Address nvarchar(max),
    Email varchar(20),
    Salary float
)
GO
INSERT INTO COPY(ID, FullName, Gender, BirthDay, Address, Email, Salary)
SELECT ID, FullName, Gender, BirthDay, Address, Email, Salary
FROM Employee
WHERE DATEDIFF(YEAR, BirthDay, GETDATE()) > 50
GO
-- Đếm số sinh viên
SELECT COUNT(*) AS [Số sinh viên]
FROM Employee;
Go