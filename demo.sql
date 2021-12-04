

create table SACH (
ID_Sach varchar(255) constraint PK_SACH_ID_Sach primary key (ID_Sach) not null,
ID_TheLoai varchar(255) not null,
ID_TacGia varchar(255) not null,
ID_NXB varchar(255) not null,
TenSach nvarchar(255),
TomTat nvarchar(255),
NgNhap smalldatetime,
TriGia money,
TinhTrang bit,
SL int,
)
alter table SACH add constraint FK_SACH_ID_TheLoai foreign key (ID_TheLoai) references THELOAI(ID_TheLoai)
alter table SACH add constraint FK_SACH_ID_TacGia foreign key (ID_TacGia) references TACGIA(ID_TacGia)
alter table SACH add constraint FK_SACH_ID_NXB foreign key (ID_NXB) references NHAXUATBAN(ID_NXB)
drop table SACH

create table THELOAI (
ID_TheLoai varchar(255) constraint PK_THELOAI_ID_TheLoai primary key (ID_TheLoai) not null,
TenTheLoai nvarchar(255),
)
drop table THELOAI

create table TACGIA (
ID_TacGia varchar(255) constraint PK_TACGIA_ID_TacGia primary key (ID_TacGia) not null,
TenTacGia nvarchar(255),
NgSinh smalldatetime,
TieuSu nvarchar(255),
)
drop table TACGIA

create table NHAXUATBAN (
ID_NXB varchar(255) constraint PK_NHAXUATBAN_ID_NXB primary key (ID_NXB) not null,
TenNXB nvarchar(255),
TheLoai nvarchar(255),
NgayXB smalldatetime,
)
drop table NHAXUATBAN

insert into THELOAI(ID_TheLoai, TenTheLoai) values ('TL001', N'Tình cảm')
insert into THELOAI(ID_TheLoai, TenTheLoai) values ('TL002', N'Hài hước')
insert into THELOAI(ID_TheLoai, TenTheLoai) values ('TL003', N'Lãng mạn')
insert into THELOAI(ID_TheLoai, TenTheLoai) values ('TL004', N'Gia đình')
insert into THELOAI(ID_TheLoai, TenTheLoai) values ('TL005', N'Kinh dị')
insert into THELOAI(ID_TheLoai, TenTheLoai) values ('TL006', N'Phiêu lưu')

insert into TACGIA(ID_TacGia, TenTacGia) values ('TG001', N'Alexx Bitchyy')
insert into TACGIA(ID_TacGia, TenTacGia) values ('TG002', N'Bitchyy')
insert into TACGIA(ID_TacGia, TenTacGia) values ('TG003', N'Ahyy')
insert into TACGIA(ID_TacGia, TenTacGia) values ('TG004', N'Ax Bichyy')
insert into TACGIA(ID_TacGia, TenTacGia) values ('TG005', N'Alitchyy')
insert into TACGIA(ID_TacGia, TenTacGia) values ('TG006', N'Alexyy')

insert into NHAXUATBAN(ID_NXB, TenNXB) values ('NXB001', N'Hugo Big')
insert into NHAXUATBAN(ID_NXB, TenNXB) values ('NXB002', N'Hugig')
insert into NHAXUATBAN(ID_NXB, TenNXB) values ('NXB003', N'Zacc')

insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S001', 'TL001', 'TG001', 'NXB002', N'The Bitches', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S002', 'TL003', 'TG004', 'NXB001', N'Teches', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S003', 'TL006', 'TG004', 'NXB001', N'Te Biths', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S004', 'TL005', 'TG003', 'NXB003', N'The Bihes', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S005', 'TL005', 'TG006', 'NXB003', N'Thes', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S006', 'TL005', 'TG005', 'NXB003', N'Thtches', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S007', 'TL003', 'TG005', 'NXB002', N'Theches', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S008', 'TL001', 'TG003', 'NXB002', N'Thitches', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S009', 'TL002', 'TG002', 'NXB001', N'Biches', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S010', 'TL004', 'TG002', 'NXB003', N'Tithes', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S011', 'TL004', 'TG004', 'NXB001', N'Th Bies', 200000)
insert into SACH(ID_Sach, ID_TheLoai, ID_TacGia, ID_NXB, TenSach, TriGia) values ('S012', 'TL004', 'TG003', 'NXB002', N'The hes', 200000)

select * from THELOAI