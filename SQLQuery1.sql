select TenTheLoai, COUNT(ct.ID_PhieuMuonSach) as SoLanMuon
from THELOAI tl join SACH s on tl.ID_TheLoai = s.ID_TheLoai
join CT_SACH_PMS ct on ct.ID_Sach = s.ID_Sach
join PHIEUMUONSACH pms on pms.ID_PhieuMuonSach = ct.ID_PhieuMuonSach
where MONTH(NgMuon) = 2 and YEAR(NgMuon) = 2019
group by TenTheLoai

use demo
drop table CT_SACH_PMS
create table CT_SACH_PMS (
	ID_PhieuMuonSach varchar(255)  not null,
	ID_Sach varchar(255) not null,
	SL int,
	constraint PK_ID_PhieuMuonSch_ID_Sach primary key (ID_PhieuMuonSach, ID_Sach) 
)
select * from THELOAI
select * from SACH
select * from CT_SACH_PMS
select * from PHIEUMUONSACH

insert into CT_SACH_PMS(ID_PhieuMuonSach, ID_Sach, SL) values ('CTPMS001', 'S001', 5)
insert into CT_SACH_PMS(ID_PhieuMuonSach, ID_Sach, SL) values ('CTPMS002', 'S001', 10)
insert into CT_SACH_PMS(ID_PhieuMuonSach, ID_Sach, SL) values ('CTPMS003', 'S003', 3)
insert into CT_SACH_PMS(ID_PhieuMuonSach, ID_Sach, SL) values ('CTPMS004', 'S004', 2)
insert into CT_SACH_PMS(ID_PhieuMuonSach, ID_Sach, SL) values ('CTPMS005', 'S005', 4)
insert into CT_SACH_PMS(ID_PhieuMuonSach, ID_Sach, SL) values ('CTPMS006', 'S006', 1)

insert into PHIEUMUONSACH(ID_PhieuMuonSach, ID_TheDocGia, NgMuon) values ('CTPMS001', 'DG001', '03/03/2019')
insert into PHIEUMUONSACH(ID_PhieuMuonSach, ID_TheDocGia, NgMuon) values ('CTPMS002', 'DG002', '03/03/2019')
insert into PHIEUMUONSACH(ID_PhieuMuonSach, ID_TheDocGia, NgMuon) values ('CTPMS003', 'DG003', '03/03/2019')
insert into PHIEUMUONSACH(ID_PhieuMuonSach, ID_TheDocGia, NgMuon) values ('CTPMS004', 'DG004', '03/03/2019')
insert into PHIEUMUONSACH(ID_PhieuMuonSach, ID_TheDocGia, NgMuon) values ('CTPMS005', 'DG005', '03/03/2019')
insert into PHIEUMUONSACH(ID_PhieuMuonSach, ID_TheDocGia, NgMuon) values ('CTPMS006', 'DG006', '03/03/2019')

create table BAOCAOMUONSACH (
	ID_BaoCaoMuonSach varchar(255) constraint PK_BAOCAOMUONSACH_ID_BaoCaoMuonSach primary key (ID_BaoCaoMuonsach) not null,
	Thang int,
	STT int,
	TenTheLoai nvarchar(255),
	SoLuotMuon int,
	TiLe int,
	TongSoLuotMuon int,
)
select TenTheLoai, TongSoLuotMuon
from BAOCAOMUONSACH