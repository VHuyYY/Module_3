create database Ss2;
use Ss2;

create table PHIEUXUAT(
SoPX int primary key,
NgayXuat dateTime
);

create table VATTU(
MaVTU int primary key,
TenVTU varchar(50),
DGNhap double,
SLNhap int
 );
 
 
 create table PHIEUNHAP(
 SoPN int primary key,
 NgayNhap datetime
 );
 create table NHACC(
 MaNCC varchar(50) primary key,
 TenNCC varchar(50),
 DiaChi varchar(50),
 SĐT varchar(50)
 );
 
 create table DONDH(
 SoDH int primary key,
 NgayDH datetime,
 MaNCC_Id varchar,
 foreign key (MaNCC_Id) references NHACC(MaNCC)
 );
 
 
 
 create table CHITIETPHIEUXUAT(
 SoPX_Id int,
 MaVTU_Id int,
 DGXuat double,
 SLXuat int,
 Foreign key (SoPX_Id) references PHIEUXUAT(SoPX),
 foreign key (MaVTU_Id) references VATTU(MAVTU)
 );
 
 create table CHITIETPHIEUNHAP(
 MaVTU_id int,
 SoPN_id int,
 DGNhap double,
 SLNhap int,
 Foreign key (SoPN_id) references PHIEUNHAP(SoPN),
 foreign key (MaVTU_id) references VATTU(MAVTU)
 );
 
 create table CHITIETDONHANG(
 MAVtu_id int,
 SoDH_id int,
Foreign key (SoDH_id) references DONDH(SoDH),
foreign key (MAVtu_id) references VATTU(MAVTU)
 );