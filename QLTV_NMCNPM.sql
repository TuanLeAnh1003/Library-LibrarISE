create database QLTV
go
use QLTV
go 
set dateformat dmy
go

drop database QLTV

create table THUTHU (
	ID_ThuThu varchar(5) constraint PK_THUTHU_ID_ThuThu primary key (ID_ThuThu) constraint ID_THUTHU default DBO.AUTO_ID_THUTHU() not null,
	HoTen nvarchar(255),
	DiaChi nvarchar(255),
	Email varchar(255),
	ChucVu nvarchar(255),
	UserName nvarchar(255) not null,
	UserPassword varchar(255) not null,
)
drop table THEDOCGIA

create table THEDOCGIA (
	ID_TheDocGia varchar(6) constraint PK_THEDOCGIA_ID_TheDocGia primary key (ID_TheDocGia) constraint ID_THEDOCGIA default DBO.AUTO_ID_THEDOCGIA() not null,
	HoTen nvarchar(255) not null,
	Email nvarchar(255) not null,
	DiaChi nvarchar(255) not null,
	NgLapThe date not null,	
	NgSinh date not null,
	LoaiDocGia varchar(1) not null,
)

create table PHIEUTHUTIENPHAT (
	ID_PhieuThuTienPhat varchar(7) constraint PK_PHIEUTHUTIENPHAT_ID_PhieuThuTienPhat primary key (ID_PhieuThuTienPhat) constraint ID_PHIEUTHUTIENPHAT default DBO.AUTO_ID_PHIEUTHUTIENPHAT() not null, 
	ID_TheDocGia varchar(6) not null,
	TongNo money not null,
	SoTienThu money not null,
	ConLai money not null,
)
alter table PHIEUTHUTIENPHAT add constraint FK_PHIEUTHUTIENPHAT_ID_TheDocGia foreign key (ID_TheDocGia) references THEDOCGIA(ID_TheDocGia) 
drop table PHIEUTHUTIENPHAT

create table PHIEUMUONSACH (
	ID_PhieuMuonSach varchar(6) constraint PK_PHIEUMUONSACH_ID_PhieuMuonSach primary key (ID_PhieuMuonSach) constraint ID_PHIEUMUONSACH default DBO.AUTO_ID_PHIEUMUONSACH() not null,
	ID_TheDocGia varchar(6) not null,
	NgMuon date not null,
)
alter table PHIEUMUONSACH add constraint FK_PHIEUMUONSACH_ID_TheDocGia  foreign key (ID_TheDocGia) references THEDOCGIA(ID_TheDocGia)
drop table PHIEUMUONSACH

create table PHIEUTRASACH (
	ID_PhieuTraSach varchar(6) constraint PK_PHIEUTRASACH_ID_PhieuTraSach primary key (ID_PhieuTraSach) constraint ID_PHIEUTRASACH default DBO.AUTO_ID_PHIEUTRASACH() not null,
	ID_TheDocGia varchar(6) not null,
	NgMuon date not null,
	TienPhatKiNay money not null,
	TienNoKiNay money not null,
	SoNgayMuon int,
	TienPhat money not null,
) 
alter table PHIEUTRASACH add constraint FK_PHIEUTRASACH_ID_TheDocGia foreign key (ID_TheDocGia) references THEDOCGIA(ID_TheDocGia)
drop table PHIEUTRASACH

create table CT_SACH_PMS (
	ID_PhieuMuonSach varchar(6)  not null,
	ID_Sach varchar(4) not null,
	SL int,
	constraint PK_ID_PhieuMuonSch_ID_Sach primary key (ID_PhieuMuonSach, ID_Sach) 
)
alter table CT_SACH_PMS add constraint FK_CT_SACH_PMS_ID_PhieuMuonSach foreign key (ID_PhieuMuonSach) references PHIEUMUONSACH(ID_PhieuMuonSach)
alter table CT_SACH_PMS add constraint FK_CT_SACH_PMS_ID_Sach foreign key (ID_Sach) references SACH(ID_Sach)
drop table CT_SACH_PMS

create table CT_SACH_PTS (
	ID_PhieuTraSach varchar(6) not null,
	ID_Sach varchar(4) not null,
	SL int,
	constraint PK_ID_PhieuTraSach_ID_Sach primary key (ID_PhieuTraSach, ID_Sach)
)
alter table CT_SACH_PTS add constraint FK_CT_SACH_PTS_ID_PhieuTraSach foreign key (ID_PhieuTraSach) references PHIEUTRASACH(ID_PhieuTraSach) 
alter table CT_SACH_PTS add constraint FK_CT_SACH_PTS_ID_Sach foreign key (ID_Sach) references SACH(ID_Sach) 
drop table CT_SACH_PTS

create table BAOCAOMUONSACH (
	ID_BaoCaoMuonSach varchar(7) constraint PK_BAOCAOMUONSACH_ID_BaoCaoMuonSach primary key (ID_BaoCaoMuonsach) constraint ID_BAOCAOMUONSACH default DBO.AUTO_ID_BAOCAOMUONSACH() not null,
	Thang int ,
	STT int,
	TenTheLoai nvarchar(255),
	SoLuotMuon int,
	TiLe int,
	TongSoLuotMuon int,
)
drop table BAOCAOMUONSACH

create table BAOCAOSACHTRATRE (
	ID_BaoCaoSachTraTre varchar(8) constraint PK_BAOCAOTRATRE_ID_BaoCaoSachTratre primary key (ID_BaoCaoSachTraTre) constraint ID_BAOCAOSACHTRATRE default DBO.AUTO_ID_BAOCAOSACHTRATRE() not null,
	Ngay date,
	STT int,
	TenSach nvarchar(255),
	NgMuon date,
	SoNgayTraTre int,
)
drop table BAOCAOSACHTRATRE

create table SACH (
	ID_Sach varchar(4) constraint PK_SACH_ID_Sach primary key (ID_Sach) constraint ID_SACH default DBO.AUTO_ID_SACH() not null,
	ID_DanhSach varchar(6) not null,
	ID_TheLoai varchar(5) not null,
	ID_TacGia varchar(5) not null,
	ID_NXB varchar(6) not null,
	TenSach nvarchar(255) not null,
	TomTat nvarchar(255),
	NgNhap date not null,
	NamXB int not null,
	TriGia money not null,
	TinhTrang bit,
	SL int,
)
alter table SACH add constraint FK_SACH_ID_DanhSach foreign key (ID_DanhSach) references DANHSACHSACH(ID_DanhSach) 
alter table SACH add constraint FK_SACH_ID_TheLoai foreign key (ID_TheLoai) references THELOAI(ID_TheLoai) 
alter table SACH add constraint FK_SACH_ID_TacGia foreign key (ID_TacGia) references TACGIA(ID_TacGia) 
alter table SACH add constraint FK_SACH_ID_NXB foreign key (ID_NXB) references NHAXUATBAN(ID_NXB) 
drop table SACH

create table THELOAI (
	ID_TheLoai varchar(5) constraint PK_THELOAI_ID_TheLoai primary key (ID_TheLoai) constraint ID_THELOAI default DBO.AUTO_ID_THELOAI() not null,
	TenTheLoai nvarchar(255) not null,
)
drop table THELOAI

create table TACGIA (
	ID_TacGia varchar(5) constraint PK_TACGIA_ID_TacGia primary key (ID_TacGia) constraint ID_TACGIA default DBO.AUTO_ID_TACGIA() not null,
	TenTacGia nvarchar(255) not null,
	NgSinh date,
	TieuSu nvarchar(255),
)
drop table TACGIA

create table NHAXUATBAN (
	ID_NXB varchar(6) constraint PK_NHAXUATBAN_ID_NXB primary key (ID_NXB) constraint ID_NXB default DBO.AUTO_ID_NXB() not null,
	TenNXB nvarchar(255) not null,
	TheLoai nvarchar(255),
)
drop table NHAXUATBAN

create table DANHSACHSACH (
	ID_DanhSach varchar(6) constraint PK_DANHSACHSACH_ID_DanhSach primary key (ID_DanhSach) constraint ID_DANHSACH default DBO.AUTO_ID_DANHSACHSACH() not null,
	ID_NhaCC varchar(6) not null,
	ID_ThuThu varchar(5) not null,
	ID_Kho varchar(4) not null,
	NgNhap date,
	SL int,
	TinhTrang bit,
)
alter table DANHSACHSACH add constraint FK_DANHSACHSACH_ID_NhaCC foreign key (ID_NhaCC) references NHACUNGCAP(ID_NhaCC)
alter table DANHSACHSACH add constraint FK_DANHSACHSACH_ID_ThuThu foreign key (ID_ThuThu) references THUTHU(ID_ThuThu) 
alter table DANHSACHSACH add constraint FK_DANHSACHSACH_ID_Kho foreign key (ID_Kho) references KHO(ID_Kho)
drop table DANHSACHSACH

create table NHACUNGCAP (
	ID_NhaCC varchar(6) constraint PK_NHACUNGCAP_ID_NhaCC primary key (ID_NhaCC) constraint ID_NHACC default DBO.AUTO_ID_NHACUNGCAP() not null,
	TenNhaCC nvarchar(255) not null,
	DiaChi nvarchar(255),
	SDT varchar(255),
	NguoiDaiDien nvarchar(255),
)
drop table NHACUNGCAP

create table KHO (
	ID_Kho varchar(4) constraint PK_KHO_ID_Kho primary key (ID_Kho) constraint ID_KHO default DBO.AUTO_ID_KHO() not null,
	TenKho nvarchar(255) not null,
	TinhTrang varchar(255),
)
drop table KHO

create table THAMSO (
	SoDocGia int,
	DoTuoiDocGia int,
	ThoiHanThe int,
	SoTheLoai int,
	SoTacGia int, 
	ThoiHanXuatBan int,
	ThoiHanTheMuon int, 
	SoSachMuon int, 
	SoNgayMuon int,
	TienPhatMoiNgay money,
	SoTienThu money,
	SoTienNo money,
)
drop table THAMSO

----------------------------------------------------------------
-- TẠO ID TỰ ĐỘNG CHO CÁC BẢNG
----------------------------------------------------------------

-- BẢNG THỦ THƯ
CREATE FUNCTION AUTO_ID_THUTHU()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(ID_ThuThu) FROM THUTHU) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_ThuThu, 3)) FROM THUTHU
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TT00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TT0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG THẺ ĐỘC GIẢ
CREATE FUNCTION AUTO_ID_THEDOCGIA()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(ID_TheDocGia) FROM THEDOCGIA) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_TheDocGia, 3)) FROM THEDOCGIA
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TDG00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TDG0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG PHIẾU THU TIỀN PHẠT
CREATE FUNCTION AUTO_ID_PHIEUTHUTIENPHAT()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_PhieuThuTienPhat) FROM PHIEUTHUTIENPHAT) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_PhieuThuTienPhat, 3)) FROM PHIEUTHUTIENPHAT
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PTTP00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PTTP0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG PHIẾU MƯỢN SÁCH
CREATE FUNCTION AUTO_ID_PHIEUMUONSACH()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(ID_PhieuMuonSach) FROM PHIEUMUONSACH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_PhieuMuonSach, 3)) FROM PHIEUMUONSACH
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PMS00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PMS0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG PHIẾU TRẢ SÁCH
CREATE FUNCTION AUTO_ID_PHIEUTRASACH()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(ID_PhieuTraSach) FROM PHIEUTRASACH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_PhieuTraSach, 3)) FROM PHIEUTRASACH
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'PTS00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'PTS0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG BÁO CÁO MƯỢN SÁCH
CREATE FUNCTION AUTO_ID_BAOCAOMUONSACH()
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @ID VARCHAR(7)
	IF (SELECT COUNT(ID_BaoCaoMuonSach) FROM BAOCAOMUONSACH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_BaoCaoMuonSach, 3)) FROM BAOCAOMUONSACH
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'BCMS00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'BCMS0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG BÁO CÁO SÁCH TRẢ TRỄ
CREATE FUNCTION AUTO_ID_BAOCAOSACHTRATRE()
RETURNS VARCHAR(8)
AS
BEGIN
	DECLARE @ID VARCHAR(8)
	IF (SELECT COUNT(ID_BaoCaoSachTraTre) FROM BAOCAOSACHTRATRE) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_BaoCaoSachTraTre, 3)) FROM BAOCAOSACHTRATRE
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'BCSTT00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'BCSTT0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
drop function AUTO_ID_BAOCAOSACHTRATRE

-- BẢNG SÁCH
CREATE FUNCTION AUTO_ID_SACH()
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @ID VARCHAR(4)
	IF (SELECT COUNT(ID_Sach) FROM SACH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_Sach, 3)) FROM SACH
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'S00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'S0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG TÁC GIẢ
CREATE FUNCTION AUTO_ID_TACGIA()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(ID_TacGia) FROM TACGIA) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_TacGia, 3)) FROM TACGIA
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TG00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TG0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG THỂ LOẠI
CREATE FUNCTION AUTO_ID_THELOAI()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(ID_TheLoai) FROM THELOAI) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_TheLoai, 3)) FROM THELOAI
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TL00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TL0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG NHÀ XUẤT BẢN
CREATE FUNCTION AUTO_ID_NXB()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(ID_NXB) FROM NHAXUATBAN) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_NXB, 3)) FROM NHAXUATBAN
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NXB00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NXB0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

-- BẢNG DANH SÁCH SÁCH
CREATE FUNCTION AUTO_ID_DANHSACHSACH()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(ID_DanhSach) FROM DANHSACHSACH) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_DanhSach, 3)) FROM DANHSACHSACH
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'DSS00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'DSS0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

drop function AUTO_ID_DANHSACHSACH

-- BẢNG NHÀ CUNG CẤP
CREATE FUNCTION AUTO_ID_NHACUNGCAP()
RETURNS VARCHAR(6)
AS
BEGIN
	DECLARE @ID VARCHAR(6)
	IF (SELECT COUNT(ID_NhaCC) FROM NHACUNGCAP) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_NhaCC, 3)) FROM NHACUNGCAP
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'NCC00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'NCC0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

drop function AUTO_ID_NHACUNGCAP

-- BẢNG KHO
CREATE FUNCTION AUTO_ID_KHO()
RETURNS VARCHAR(4)
AS
BEGIN
	DECLARE @ID VARCHAR(4)
	IF (SELECT COUNT(ID_Kho) FROM KHO) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(ID_Kho, 3)) FROM KHO
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'K00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'K0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

------------------------------------------------------------------
-- INSERT DỮ LIỆU
------------------------------------------------------------------
-- BẢNG THU THU
insert into THUTHU(UserName, UserPassword) values (N'Phó Khánh Hưng', N'hungpho')
insert into THUTHU(UserName, UserPassword) values (N'Lê Anh Tuấn', N'tuan1003')
select * from THUTHU

-- BẢNG THỂ LOẠI - lại
insert into THELOAI(TenTheLoai) values (N'A')
insert into THELOAI(TenTheLoai) values (N'B')
insert into THELOAI(TenTheLoai) values (N'C')

-- BẢNG NHÀ XUẤT BẢN
insert into NHAXUATBAN(TenNXB) values (N'Kim Đồng')
insert into NHAXUATBAN(TenNXB) values (N'Ngọc Tháp')
insert into NHAXUATBAN(TenNXB) values (N'Hà Nội')
insert into NHAXUATBAN(TenNXB) values (N'Trẻ')
insert into NHAXUATBAN(TenNXB) values (N'Đông Ấn')
insert into NHAXUATBAN(TenNXB) values (N'Hoa Sen')

-- BẢNG TÁC GỈA
insert into TACGIA(TenTacGia) values (N'Hữu Trí')
insert into TACGIA(TenTacGia) values (N'Nguyễn Nhật Ánh')
insert into TACGIA(TenTacGia) values (N'Dâu Tây')
insert into TACGIA(TenTacGia) values (N'Hạ Vũ')
insert into TACGIA(TenTacGia) values (N'Kiều Minh Sơn')
insert into TACGIA(TenTacGia) values (N'Ason Kim')

-- BẢNG SÁCH - lại
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB001', 'TG002', 'TL003', 'DSS001', N'Chúc một ngày tốt lành', '20/04/2019', 2016, 55000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB001', 'TG003', 'TL003', 'DSS001', N'Heo bự nhút nhát', '15/10/2020', 2015, 99000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB002', 'TG001', 'TL002', 'DSS001', N'Tâm lí học tội phạm', '01/06/2020', 2017, 53500)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB004', 'TG004', 'TL002', 'DSS002', N'Nhân gian hữu tình', '13/05/2018', 2016, 167000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB005', 'TG004', 'TL001', 'DSS001', N'Tội ác và trừng phạt', '20/04/2016', 2016, 40000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB003', 'TG005', 'TL001', 'DSS002', N'Lịch sử phát triển nhân loại', '20/04/2018', 2015, 25000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB001', 'TG006', 'TL002', 'DSS002', N'Không giới hạn', '20/04/2019', 2018, 120000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB003', 'TG002', 'TL002', 'DSS002', N'Ngày xưa có một chuyện tình', '20/04/2019', 2018, 120000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB003', 'TG002', 'TL002', 'DSS001', N'Chúc một ngày tốt lành', '20/04/2019', 2018, 120000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB001', 'TG005', 'TL003', 'DSS002', N'Ngày mai có một bắt đầu', '20/04/2019', 2018, 50000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB001', 'TG006', 'TL002', 'DSS002', N'Có một ngày, bố mẹ sẽ già đi', '20/04/2019', 2018, 624800)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB002', 'TG003', 'TL002', 'DSS002', N'Nếu còn có ngày mai', '20/04/2019', 2018, 78000)
insert into SACH(ID_NXB, ID_TacGia, ID_TheLoai, ID_DanhSach, TenSach, NgNhap, NamXB, TriGia) values ('NXB001', 'TG006', 'TL002', 'DSS001', N'Nếu chỉ còn một ngày để sống', '20/04/2019', 2018, 100000)

-- BẢNG DANH SÁCH SÁCH
insert into DANHSACHSACH (ID_NhaCC, ID_Kho, ID_ThuThu) values ('NCC001', 'K001', 'TT001')
insert into DANHSACHSACH (ID_NhaCC, ID_Kho, ID_ThuThu) values ('NCC002', 'K002', 'TT002')

-- BẢNG NHÀ CUNG CẤP
insert into NHACUNGCAP(TenNhaCC) values (N'Phương Nam')
insert into NHACUNGCAP(TenNhaCC) values (N'Biển Đông')
select * from NHACUNGCAP
delete from NHACUNGCAP
-- BẢNG KHO
insert into KHO(TenKho) values (N'Phía Nam')
insert into KHO(TenKho) values (N'Phía Đông')
insert into KHO(TenKho) values (N'Phía Bắc')

-------------------------------
--TUAN 
-- BANG THEDOCGIA - lại
insert into THEDOCGIA (HoTen, Email, DiaChi, NgLapThe, NgSinh, LoaiDocGia) values ('Alex', 'alex@gmail.com', 'alexAddress', '10/03/2019', '10/03/2001', 'X')
insert into THEDOCGIA (HoTen, Email, DiaChi, NgLapThe, NgSinh, LoaiDocGia) values ('Laura', 'laura@gmail.com', 'lauraAddress', '10/03/2020', '11/03/2001', 'Y')
insert into THEDOCGIA (HoTen, Email, DiaChi, NgLapThe, NgSinh, LoaiDocGia) values ('Peter', 'peter@gmail.com', 'peterAddress', '10/03/2018', '12/03/2001', 'X')
insert into THEDOCGIA (HoTen, Email, DiaChi, NgLapThe, NgSinh, LoaiDocGia) values (N'Phó Khánh Hưng', 'hung@gmail.com', 'peterAddress', '20/06/2017', '24/09/2001', 'Y')
insert into THEDOCGIA (HoTen, Email, DiaChi, NgLapThe, NgSinh, LoaiDocGia) values (N'Lê Anh Tuấn',  'hung@gmail.com', 'peterAddress', '10/03/2018', '12/03/2001', 'X')
insert into THEDOCGIA (HoTen, Email, DiaChi, NgLapThe, NgSinh, LoaiDocGia) values ('Thành Long', 'long@gmail.com', 'peterAddress', '10/03/2018', '12/03/2001', 'Y')
select * from THEDOCGIA
-- BANG PHIEUMUONSACH - lại
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG001', '10/03/2021')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG002', '10/03/2019')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG003', '12/03/2019')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG004', '12/10/2018')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG005', '17/12/2018')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG006', '24/01/2019')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG001', '15/02/2019')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG002', '01/03/2017')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG003', '10/04/2017')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG004', '12/05/2020')
insert into PHIEUMUONSACH (ID_TheDocGia, NgMuon) values ('TDG005', '12/06/2019')

-- BANG CT_SACH_PMS - lại
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS001', 'S001', 5)
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS002', 'S002', 10)
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS003', 'S003', 1)
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS004', 'S006', 2)
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS005', 'S007', 1)
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS006', 'S004', 1)
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS007', 'S009', 3)
insert into CT_SACH_PMS (ID_PhieuMuonSach, ID_Sach, SL) values ('PMS008', 'S010', 1)


-- BANG PHIEUTRASACH - lại
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG001', '24/09/2019', 0, 0, 3, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG002', '24/09/2018', 50000, 0, 3, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG003', '24/09/2020', 0, 0, 1, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG004', '24/09/2018', 0, 0, 2, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG005', '24/09/2020', 25000, 0, 3, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG006', '24/09/2019', 0, 0, 4, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG001', '24/09/2018', 0, 0, 3, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG002', '24/09/2019', 30000, 5000, 3, 30000)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG004', '24/09/2020', 0, 0, 5, 0)
insert into PHIEUTRASACH (ID_TheDocGia, NgMuon, TienPhatKiNay, TienNoKiNay, SoNgayMuon, TienPhat) values ('TDG006', '24/09/2019', 0, 0, 3, 0)

-- BANG CT_SACH_PTS - lại
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS001', 'S003', 1)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS002', 'S004', 2)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS003', 'S006', 1)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS004', 'S005', 1)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS005', 'S008', 1)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS006', 'S010', 1)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS007', 'S010', 3)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS008', 'S001', 2)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS009', 'S002', 2)
insert into CT_SACH_PTS (ID_PhieuTraSach, ID_Sach, SL) values ('PTS010', 'S004', 1)

-- BANG PHIEUTHUTIENPHAT - lại
insert into PHIEUTHUTIENPHAT (ID_TheDocGia, TongNo, SoTienThu, ConLai) values ('TDG002', 20000, 20000, 0)
insert into PHIEUTHUTIENPHAT (ID_TheDocGia, TongNo, SoTienThu, ConLai) values ('TDG002', 30000, 25000, 5000)
insert into PHIEUTHUTIENPHAT (ID_TheDocGia, TongNo, SoTienThu, ConLai) values ('TDG005', 25000, 25000, 0)
--------------------------------------
--------------------------------------

---------------------------------------------------------------------------------
-- THỰC HIỆN CÁC THỦ TỤC, TRUY VẤN
---------------------------------------------------------------------------------
-- THÊM SÁCH MỚI
create procedure add_new_book (@tensach nvarchar(255), @tacgia nvarchar(255), @theloai nvarchar(255), @nxb nvarchar(255), @ngay int, @thang int, @nam int, @namxb int, @trigia int)
as
begin
	declare @idtacgia varchar(5), @idnxb varchar(6), @idtheloai varchar(5), @ngaythemsach date
	if exists (select * from TACGIA where TenTacGia=@tacgia)
		begin 
			select @idtacgia = ID_TacGia from TACGIA where TenTacGia=@tacgia
		end
	else
		begin
			insert into TACGIA(TenTacGia) values (@tacgia)
			select @idtacgia = ID_TacGia from TACGIA where TenTacGia=@tacgia
		end
		-------------
	if exists (select * from THELOAI where TenTheLoai = @theloai)
		begin 
			select @idtheloai = ID_TheLoai from THELOAI where TenTheLoai = @theloai
		end
	else
		begin
			insert into THELOAI(TenTheLoai) values (@theloai)
			select @idtheloai = ID_TheLoai from THELOAI where TenTheLoai = @theloai
		end
		--------------
	if exists (select * from NHAXUATBAN where TenNXB = @nxb)
		begin 
			select @idnxb = ID_NXB from NHAXUATBAN where TenNXB=@nxb
		end
	else
		begin
			insert into NHAXUATBAN(TenNXB) values (@nxb)
			select @idnxb = ID_NXB from NHAXUATBAN where TenNXB=@nxb
		end

	set @ngaythemsach = cast((cast(@ngay as varchar(2)) + '/' + cast(@thang as varchar(2)) + '/' + cast(@nam as varchar(4))) as date)

	if not exists (select *  from SACH where TenSach = @tensach and ID_TacGia = @idtacgia)
		begin
			insert into SACH(TenSach, ID_TheLoai, ID_NXB, ID_TacGia, ID_DanhSach, NgNhap, NamXB, TriGia) values (@tensach, @idtheloai, @idnxb, @idtacgia, 'DSS002', @ngaythemsach, @namxb, @trigia)
		end
end
drop procedure add_new_book

select * from SACH

exec add_new_book N'Học không chơi, đời không nể', N'Tao', N'Tình cảm', N'Một mình tao', 22, 11, 2019, 2012, 95200
exec add_new_book N'Họuyvuyv', N'Ngauyn46 buiebger', N'Hài hước', N'Kim Đồng', 20, 10, 2021, 2020,87600
exec add_new_book N'Học không nể', N'bteje56j', N'Lãng mạn', N'Heloo', 21, 11, 2021, 2008, 55200
exec add_new_book N'Học đời không nể', N'Tao', N'Tình cảm', N'Ngọc Tháp', 21, 11, 2021, 2018, 23550

-- XÓA SÁCH
create procedure remove_book (@tensach nvarchar(255), @tentacgia nvarchar(255))
as 
begin
	if exists (select * from SACH join TACGIA on SACH.ID_TacGia=TACGIA.ID_TacGia where TenSach=@tensach and TenTacGia=@tentacgia)
		begin
			delete from SACH where TenSach=@tensach
		end
end
drop procedure remove_book

exec remove_book N'Học không chơi, đời không nể', N'Tao'
-- XOA DOCGIA
create procedure remove_user (@hoten nvarchar(255), @diachi nvarchar(255))
as 
begin
	if exists (select * from THEDOCGIA)
		begin
			delete from THEDOCGIA where HoTen=@hoten and DiaChi = @diachi
		end
end

select * from THEDOCGIA
exec remove_user N'Thành Long', N'peterAddress'

select * from THEDOCGIA
