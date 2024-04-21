use DBRestaurant
create table NhanVien
(
	NV_ID int primary key identity(1,1) not null,
	NV_Ten nvarchar(30) not null,
	NV_ChucVu nvarchar(20) not null,
	NV_SDT varchar(11) not null unique,
	NV_DiaChi nvarchar(100)
)

create table ID
(
	username varchar(30) primary key,
	password varchar(30) not null,
	status int not null,
	NV_ID int null,
	foreign key (NV_ID) references NhanVien(NV_ID)
)

create table BanAn
(
	Ban_ID int primary key identity(1,1) not null,
	Ban_Ten nvarchar(20) not null unique,
	Ban_Loai nvarchar(10) not null,
	Ban_SoNguoi int not null,
	Ban_TrangThai nvarchar(20) not null
)

create table NhaCungCap
(
	NCC_ID int primary key identity(1,1) not null,
	NCC_Ten nvarchar(30) not null unique,
	NCC_DiaChi nvarchar(100) not null,
	NCC_SDT varchar(11) not null
)

create table NguyenLieu
(
	NL_ID int primary key identity(1,1) not null,
	NL_Ten nvarchar(50) not null unique,
	NL_DonViTinh nvarchar(10) not null,
	NL_SoLuong int not null
)

create table NuocUong
(
	Nuoc_ID int primary key identity(1,1) not null,
	Nuoc_Ten nvarchar(50) not null unique,
	Nuoc_DonViTinh nvarchar(10) not null,
	Nuoc_HinhAnh varchar(100) not null,
	Nuoc_Gia money not null,
	Nuoc_TrangThai nvarchar(30) not null
)
	
create table MonAn
(
	MonAn_ID int primary key identity(1,1) not null,
	MonAn_Ten nvarchar(50) not null unique,
	MonAn_DonViTinh nvarchar(10) not null,
	MonAn_Gia money,
	MonAn_HinhAnh varchar(100) not null,
	MonAn_Loai nvarchar(30) not null,
	MonAn_TrangThai nvarchar(30) not null
)	
	
create table ChiTietMonAn
(
	CTMonAn_ID int primary key identity(1,1) not null,
	MonAn_ID int not null,
	NL_ID int not null,
	ChiTietMonAn_SoLuong int not null,
	ChiTietMonAn_DonViTinh nvarchar(10) not null,
	GhiChu nvarchar(50),
	foreign key (MonAn_ID) references MonAn(MonAn_ID),
	foreign key (NL_ID) references NguyenLieu(NL_ID)
)

create table DonNhapNguyenLieu
(
	DonNhap_ID 	int primary key identity(1,1) not null,
	DonNhap_NgayNhap date not null,
	DonNhap_TongTien numeric(12) not null,
	NCC_ID int not null,
	NV_ID int not null,
	foreign key (NCC_ID) references NhaCungCap(NCC_ID),
	foreign key (NV_ID) references NhanVien(NV_ID)
)

create table ChiTietDonNhap
(
    CTDonNhap_ID int primary key identity(1,1) not null,
	DonNhap_ID int not null,
	NL_ID int not null,
	ChiTietDon_SoLuong int not null,
	ChiTietDon_DonViTinh nvarchar(20) not null,
	ChiTietDon_DonGia numeric(10) not null,
	ChiTietDon_ThanhTien numeric(12) not null,
	foreign key (DonNhap_ID) references DonNhapNguyenLieu(DonNhap_ID),
	foreign key (NL_ID) references NguyenLieu(NL_ID)
)

create table HoaDon
(
	HoaDon_ID int primary key identity(1,1) not null,
	NV_ID int not null,
	Ban_ID int not null,
	HoaDon_ThoiGianVao datetime not null,
	HoaDon_ThoiGianRa datetime not null,
	HoaDon_TongTien numeric(14) not null,
	HoaDon_TrangThai nvarchar(20) not null,
	foreign key (NV_ID) references NhanVien(NV_ID),
	foreign key (Ban_ID) references BanAn(Ban_ID)
)

create table ChiTietHoaDon
(
    CTHoaDon_ID int primary key identity(1,1) not null,
	HoaDon_ID int not null,
	MonAn_ID int not null,
	ChiTietHD_SoLuong int not null,
	ChiTietHD_DonGia int not null,
	ChiTietHD_GhiChu nvarchar(100) null,
	ChiTietHD_TrangThai nvarchar(20) not null,
	foreign key (MonAn_ID) references MonAn(MonAn_ID),
	foreign key (HoaDon_ID) references HoaDon(HoaDon_ID),
)

insert into NhanVien (NV_Ten, NV_ChucVu, NV_SDT, NV_DiaChi) values ( N'Nguyễn Đào Diễm Phương', N'Thu ngân', '0939693852', N'256 Nguyễn Văn Lượng, phường 17, quận Gò Vấp, tp Hồ Chí Minh')
insert into NhanVien (NV_Ten, NV_ChucVu, NV_SDT, NV_DiaChi) values (N'Trương Cẩm Linh', N'Bếp', '0936532123', N'450 Bàu Cát, phường 2, quận Tân Bình, tp Hồ Chí Minh')
insert into NhanVien (NV_Ten, NV_ChucVu, NV_SDT, NV_DiaChi) values (N'Lê Thị Kim Ngân', N'Quản lý', '0985642317', N'123 Lê Văn Sỹ, phường 3, quận Tân Bình, tp Hồ Chí Minh')
insert into NhanVien (NV_Ten, NV_ChucVu, NV_SDT, NV_DiaChi) values (N'Hoàng Minh Nam', N'Phục vụ', '0937452331', N'320 Nguyễn Văn Trỗi, phường 5, quận 3, tp Hồ Chí Minh')
insert into NhanVien (NV_Ten, NV_ChucVu, NV_SDT, NV_DiaChi) values (N'Bùi Thế Nam', N'Thu ngân', '0937465222', N'23 Lê Lợi, phường 2, quận Gò Vấp, tp Hồ Chí Minh')
insert into NhanVien (NV_Ten, NV_ChucVu, NV_SDT, NV_DiaChi) values (N'Nguyễn Huỳnh Hồng Phúc', N'Bếp', '0937465232', N'45 Trần Hưng Đạo, phường 2, quận 1, tp Hồ Chí Minh')

insert into ID (username, password, status, NV_ID) values ('diemphuong', 123, 1, 1)
insert into ID (username, password, status, NV_ID) values ('camlinh', 123, 1, 2)
insert into ID (username, password, status, NV_ID) values ('kimngan', 123, 1, 3)
insert into ID (username, password, status, NV_ID) values ('hoangnam', 123, 1, 4)
insert into ID (username, password, status, NV_ID) values ('thenam', 123, 1, 5)
insert into ID (username, password, status, NV_ID) values ('hongphuc', 123, 1, 6)
insert into ID (username, password, status) values ('admin', 123, 1)

insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 1', N'Thường', 4, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 2', N'Thường', 4, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 3', N'Thường', 2, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 4', N'Thường', 8, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 5', N'Thường', 4, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 6', N'Thường', 8, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 7', N'Thường', 4, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 8', N'Thường', 4, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 9', N'VIP', 4, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 10', N'VIP', 8, N'Đang trống')
insert into BanAn (Ban_Ten, Ban_Loai, Ban_SoNguoi, Ban_TrangThai) values (N'Bàn 11', N'VIP', 4, N'Đang trống')

insert into NhaCungCap (NCC_Ten, NCC_DiaChi, NCC_SDT) values (N'Nhà cung cấp 1', N'123 Lê Văn Sỹ, quận 3, tp Hồ Chí Minh', '0218536423')
insert into NhaCungCap (NCC_Ten, NCC_DiaChi, NCC_SDT) values (N'Nhà cung cấp 2', N'23 Lê Văn Tám, quận 1, tp Hồ Chí Minh', '0936585771')
insert into NhaCungCap (NCC_Ten, NCC_DiaChi, NCC_SDT) values (N'Nhà cung cấp 3', N'115 Hai Bà Trưng, quận 1, tp Hồ Chí Minh', '0901236598')
insert into NhaCungCap (NCC_Ten, NCC_DiaChi, NCC_SDT) values (N'Nhà cung cấp 4', N'47 Nguyễn Chí Thanh, quận 10, tp Hồ Chí Minh', '0901236589')
insert into NhaCungCap (NCC_Ten, NCC_DiaChi, NCC_SDT) values (N'Nhà cung cấp 5', N'20 Nguyễn Tri Phương, quận 5, tp Hồ Chí Minh', '0938596456')

insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Đùi gà', 'kg',200)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cánh gà', 'kg',100)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Chân gà', 'kg',150)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Ức gà', 'kg',300)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Mực một nắng', 'kg',100)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cá lóc', 'kg',35)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bún sợi nhỏ', 'kg',50)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Rau muống', 'kg',20)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cà chua', 'kg',30)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Dưa leo', 'kg',20)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Hành', 'kg',3)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Tỏi', 'kg',5)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Ớt', 'kg',5)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Mực', 'kg',90)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bạc tuộc', 'kg',100)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Nấm kim châm', 'kg',36)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Nấm bào ngu', 'kg',25)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Trứng gà', 'cái',532)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Nước suối Lavie', 'chai',630)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bia 333', 'chai',1000)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bia Tiger', 'chai',985)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cá hồi', 'kg',65)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Phô mai', 'kg',20)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Mì ý', 'kg',63)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Thịt bò', 'kg',136)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Thịt heo', 'kg',153)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bột chiên giòn', 'kg',80)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bột chiên xù', 'kg',76)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Nước mắm', 'lít',20)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Nước tương', 'lít',30)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Muối', 'kg',43)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Đường', 'kg',32)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bột ngọt', 'kg',12)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Tương ớt', 'kg',95)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Dầu', 'lít',200)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cam', 'trái', 50)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Dâu', 'trái', 100)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Tôm', 'kg', 53)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bánh mì sandwich', 'lát', 129)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Tàu hủ', 'kg', 10)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cà rốt', 'kg', 30)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Tương cà', 'chai', 13)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Hành tây', 'kg', 47)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Sữa', 'chai', 80)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cà phê', 'kg', 27)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Cá basa', 'kg', 103)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Gừng', 'kg', 2)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Củ cải', 'kg', 21)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bánh mì', N'ổ', 20)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Coca cola', 'chai', 217)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Pepsi', 'lon', 191)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Chanh', 'kg', 33)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bơ', 'kg', 213)
insert into NguyenLieu (NL_Ten, NL_DonViTinh, NL_SoLuong) values (N'Bia Heineken', 'lon', 562)

insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cánh gà chiên nước mắm', N'Đĩa',100000, 'canh-ga-nuoc-mam.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Đùi gà chiên nước mắm', N'Đĩa', 200000, 'dui-ga-nuoc-mam.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cánh gà chiên bột', N'Đĩa', 300000, 'canh-ga-chien-bot.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Đùi gà chiên bột', N'Đĩa', 120000, 'dui-ga-chien-bot.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Mỳ ý bò', N'Đĩa', 10000, 'm-y.jpg',N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Tôm lăn bột ', N'Đĩa', 90000, 'tom-lan-bot.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Takoyaki ', N'Đĩa',40000, 'takoyaki.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Sashimi cá hồi', N'Đĩa', 12000,'sashimi-ca-hoi.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Tàu hủ chiên sả ớt', N'Đĩa', 200000,'tau-hu-chien-sa-o.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Sandwich kẹp gà', N'Đĩa',40000, 'sandwich-kep-ga.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Lẩu xào cay', N'Nồi', 20000,'lau-xao-cay.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Salad hoa quả', N'Đĩa', 23200,'salad-hoa-qua.jpg', N'Thức ăn',N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Bò xào', N'Đĩa', 80000,'bo-xao.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Burger bò', N'Cái', 50000,'burger-bo.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cá basa kho', N'Đĩa', 30000,'ca-basa-kho.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cơm chiên dương châu',N'Đĩa', 20000, 'com-chien-duong-chau,jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cơm chiên trứng', N'Đĩa', 300000,'com-chien-trung.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cơm chiên hải sản', N'Đĩa', 20000,'com-chien-hai-san.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cơm chiên kim chi', N'Đĩa', 20000,'com-chien-kim-chi.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Cơm cuộn trứng', N'Đĩa', 30000,'com-cuon-trung.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Gà phô mai', N'Đĩa', 40000,'ga-pho-mai.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Khoai tây chiên', N'Đĩa',60000, 'khoai-tay-chien.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Kimbap cuộn', N'Đĩa',40000 ,'kimbap.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Kimbap chiên', N'Đĩa', 302000,'kimbap-chien.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Mỳ cay Thượng Hải', N'Đĩa',40000, 'my-cay-thuong-hai.jpg', N'Thức ăn', N'Đang kinh doanh')
insert into MonAn (MonAn_Ten, MonAn_DonViTinh,MonAn_Gia, MonAn_HinhAnh, MonAn_Loai, MonAn_TrangThai) values ( N'Mỳ ý hải sản', N'Đĩa',40000, 'my-y-hai-san.jpg', N'Thức ăn', N'Đang kinh doanh')

insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Nước suối Lavie', N'chai', 'lavie.png', '7000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Cam ép ', N'Ly', 'cam-ep.jpg', N'15000', 'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Sinh tố dâu', N'Ly', 'sinh-to-dau.jpg', '20000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Sinh tố bơ', N'Ly', 'sinh-to-bo.jpg', '20000',N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Nước suối Aquafina', N'chai', 'aquafina.jpeg', N'7000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Bia Heineken', N'lon', 'heineken.jpeg', '23000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Bia 333', N'lon', '333.jpg', '23000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Bia Tiger', N'lon', 'tiger.jpg', '23000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Coca Cola', N'chai', 'coca cola.jpg', '10000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Pepsi', N'chai', 'pepsi.jpg', '10000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'7 up', N'chai', '7up.jpeg', '10000', N'Đang kinh doanh')
insert into NuocUong (Nuoc_Ten, Nuoc_DonViTinh, Nuoc_HinhAnh, Nuoc_Gia, Nuoc_TrangThai) values ( N'Trà đào', N'ly', 'peachtea.jpg', '12000', N'Đang kinh doanh')

insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (1,2,300, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (1,29,3, N'ml', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (1,35,300, N'ml', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (5,24,150, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (5,23,5, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (5,25,50, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (5,9,100, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (6,38,500, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (6,35,300, N'ml', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (6,28,100, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (7,15,300, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (7,48,100, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (8,22,500, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (9,40,700, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (9,35,200, N'ml', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (9,13,100, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (10,39,2, N'lát', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (10,4,100, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (10,9,80, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (11,7,300, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (11,14,200, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (11,16,500, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (11,25,200, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (11,40,100, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (12,37,300, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (12,53,300, N'gram', null)
insert into ChiTietMonAn (MonAn_ID, NL_ID, ChiTietMonAn_SoLuong, ChiTietMonAn_DonViTinh, GhiChu) values (12,36,300, N'gram', null)

insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('9/12/2018', 13000000, 1,1)
insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('9/12/2018', 9000000, 1,2)
insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('9/12/2018', 5000000, 1,3)
insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('1/12/2019', 13000000, 1,1)
insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('2/1/2019', 10000000, 1,2)
insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('3/3/2019', 15000000, 1,3)
insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('3/4/2019', 4000000, 1,1)
insert into DonNhapNguyenLieu (DonNhap_NgayNhap, DonNhap_TongTien, NCC_ID, NV_ID) values ('3/5/2019', 9000000, 1,1)

insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (1,1,50,N'kg',200000,10000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (1,2,15,N'kg',200000,3000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (2,3,45,N'kg',200000,9000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (4,1,50,N'kg',200000,10000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (4,2,15,N'kg',200000,3000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (5,3,50,N'kg',200000,10000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (6,22,50,N'kg',300000,15000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (7,25,16,N'kg',250000,4000000)
insert into ChiTietDonNhap (DonNhap_ID, NL_ID, ChiTietDon_SoLuong, ChiTietDon_DonViTinh, ChiTietDon_DonGia, ChiTietDon_ThanhTien) values (8,26,90,N'kg',100000,10000000)

insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values ( 4, 1, '3/5/2019 19:32:00', '3/5/2019 21:39:00', N'Đã hoàn thành', 580000)
insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values (4, 2, '3/5/2019 18:39:00', '3/5/2019 21:39:00', N'Đã hoàn thành', 290000)
insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values (4, 3, '3/5/2019 20:02:00', '3/5/2019 22:03:00', N'Đã hoàn thành', 320000)
insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values (4, 4, '3/5/2019 20:12:00', '3/5/2019 21:45:00', N'Đã hoàn thành', 160000)
insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values (4, 1, '3/7/2019 17:23:00', '3/7/2019 19:33:00', N'Đã hoàn thành', 280000)
insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values (4, 2, '3/7/2019 18:01:00', '3/7/2019 19:26:00', N'Đã hoàn thành', 225000)
insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values (4, 4, '3/7/2019 19:03:00', '3/7/2019 20:56:00', N'Đã hoàn thành', 225000)
insert into HoaDon (NV_ID, Ban_ID, HoaDon_ThoiGianVao, HoaDon_ThoiGianRa, HoaDon_TrangThai, HoaDon_TongTien) values (4, 5, '3/7/2019 19:52:00', '3/7/2019 20:48:00', N'Đã hoàn thành', 240000)

insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (1, 1, 2, 65000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (1, 5, 5, 80000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (1, 6, 5, 10000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (2, 3, 3, 75000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (2, 4, 1, 65000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (3, 1, 4, 80000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (4, 5, 2, 80000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (5, 5, 4, 70000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (6, 3, 3, 75000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (7, 1, 3, 75000, N'Đã hoàn thành')
insert into ChiTietHoaDon (HoaDon_ID, MonAn_ID, ChiTietHD_SoLuong, ChiTietHD_DonGia, ChiTietHD_TrangThai) values (8, 5, 3, 80000, N'Đã hoàn thành')
