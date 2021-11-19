const express = require('express');
const {sql, conn} = require('./db');
const bodyParser = require('body-parser');
const cors = require('cors');

const adminRouters = express.Router();

const app = express();

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use('/admin/', adminRouters);

// Đăng nhập
adminRouters.post('/signin', async (req, res) => {
  var pool = await conn;
  var sqlString = "select * from ACCOUNT where USERNAME=@userName and USERPASS=@userPassword";
  return await pool.request()
  .input("userName", sql.NVarChar, req.body.userName)
  .input("userPassword", sql.NVarChar, req.body.userPassword)
  .query(sqlString)
  .then(data => {
    if(data.recordset.length === 1) {
      res.send('1');
      console.log(data.recordset)
    } else res.send('0');
  })
  .catch(err => res.send('0'));
});

//Lấy sách khi mới vào trang sách
adminRouters.get('/sach', async(req, res) => {
  var pool = await conn;
  var sqlString = "select TenSach, TenTheLoai, TenTacGia, TriGia, TenNXB " +
                  "from SACH join THELOAI on SACH.ID_TheLoai = THELOAI.ID_TheLoai " +
                  "join TACGIA on SACH.ID_TacGia = TACGIA.ID_TacGia " +
                  "join NHAXUATBAN on SACH.ID_NXB = NHAXUATBAN.ID_NXB"
  return await pool.request()
  .query(sqlString)
  .then(data => {
    if(data.recordset.length >= 1) {
      res.send(data.recordset);
    } else res.send('0');
  })
  .catch(err => res.send('0'));
})

// Thêm sách mới
adminRouters.post('/themsach', async(req, res) => {
  var pool = await conn;
  var sqlString = "exec add_new_book @tenSach, @tacGia, @nxb, @namxb, @triGia, @theLoai, @ngay, @thang, @nam"
  return await pool.request()
  .input('tenSach', sql.NVarChar, req.body.tenSach)
  .input('tacGia', sql.NVarChar, req.body.tacGia)
  .input('nxb', sql.NVarChar, req.body.nxb)
  .input('namxb', sql.Int, req.body.namxb)
  .input('triGia', sql.Money, req.body.triGia)
  .input('ngay', sql.Int, req.body.ngay)
  .input('thang', sql.Int, req.body.thang)
  .input('nam', sql.Int, req.body.nam)
  .input('theLoai', sql.NVarChar, req.body.theLoai)
  .query(sqlString)
  .then(data => {
    res.send(data);
    }
  )
  .catch(err => res.send('0'));
})

// Xóa sách
adminRouters.post('/xoasach', async(req, res) => {
  var pool = await conn;
  var sqlString = "delete from SACH " +
                  "where TenSach=@tenSach " +
                  "and TriGia=@triGia " +
                  "and day(NgNhap)=@ngay and month(NgNhap)=@thang and year(NgNhap)=@nam";
  return await pool.request()
  .input('tenSach', sql.NVarChar, req.body.tenSach)
  .input('tacGia', sql.NVarChar, req.body.tacGia)
  .input('nxb', sql.NVarChar, req.body.nxb)
  .input('namxb', sql.Int, req.body.namxb)
  .input('triGia', sql.Money, req.body.triGia)
  .input('ngay', sql.Int, req.body.ngay)
  .input('thang', sql.Int, req.body.thang)
  .input('nam', sql.Int, req.body.nam)
  .input('theLoai', sql.NVarChar, req.body.theLoai)
  .query(sqlString)
  .then(data => {
    console.log(data);
    res.send(data);
    }
  )
  .catch(err => res.send('0'));
})


//Lấy những sách đang được mượn
adminRouters.get('/sachmuon', async(req, res) => {
  var pool = await conn;
  var sqlString = "select distinct TenSach, TenTheLoai, TenTacGia, TriGia, TenNXB " +
                  "from SACH join THELOAI on SACH.ID_TheLoai = THELOAI.ID_TheLoai " +
                  "join TACGIA on SACH.ID_TacGia = TACGIA.ID_TacGia " +
                  "join NHAXUATBAN on SACH.ID_NXB = NHAXUATBAN.ID_NXB " +
                  "join PHIEUMUONSACH on PHIEUMUONSACH.ID_PhieuMuonSach = CT_SACH_PMS.ID_PhieuMuonSach"
  return await pool.request()
  .query(sqlString)
  .then(data => {
    if(data.recordset.length >= 1) {
      res.send(data.recordset);
    } else res.send('0');
  })
  .catch(err => res.send('0'));
})

//Lập phiếu mượn sách
adminRouters.post('/taophieumuonsach', async(req, res) => {
  var pool = await conn;
  var sqlString = "exec add_Phieu_Muon_Sach @idDocGia, @idSach, @sl, @ngay, @thang, @nam";
  return await pool.request()
  .input("idDocGia", sql.NVarChar, req.body.idDocGia)
  .input("idSach", sql.NVarChar, req.body.idSach)
  .input("sl", sql.Int, req.body.soLuong)
  .input("ngay", sql.Int, req.body.ngay)
  .input("thang", sql.Int, req.body.thang)
  .input("nam", sql.Int, req.body.nam)
  .query(sqlString)
  .then(data => {
    console.log(data);
  })
  .catch(err => res.send('0'));
})

//Thông tin các phiếu trả sách đã có
adminRouters.get('/sachtra', async(req, res) => {
  var pool = await conn;
  var sqlString = "select PHIEUTRASACH.ID_TheDocGia, HoTen, NgMuon, TenSach, TienPhatKiNay, TienNoKiNay, TongNo " +
                  "from PHIEUTRASACH join CT_SACH_PTS on PHIEUMUONSACH.ID_PhieuTraSach = CT_SACH_PTS.ID_PhieuTraSach" +
                  "join SACH on SACH.ID_Sach = CT_SACH_PTS.ID_SACH " +
                  "join THEDOCGIA on PHIEUTRASACH.ID_TheDocGia = THEDOCGIA.ID_TheDocGia";
  return await pool.request()
  .query(sqlString)
  .then(data => {
    if(data.recordset.length >= 1) {
      res.send(data.recordset);
    } else res.send('0');
  })
  .catch(err => res.send('0'));
})

//CHỈNH LAI SAU
//Thông tin các phiếu thu tiền phạt đã có
//CHỈNH LẠI SAU
adminRouters.get('/sachtra', async(req, res) => {
  var pool = await conn;
  var sqlString = "select PHIEUTHUTIENPHAT.ID_TheDocGia, HoTen, NgMuon, TenSach, TienPhatKiNay, TienNoKiNay, TongNo " +
                  "from PHIEUTRASACH join CT_SACH_PTS on PHIEUMUONSACH.ID_PhieuTraSach = CT_SACH_PTS.ID_PhieuTraSach" +
                  "join SACH on SACH.ID_Sach = CT_SACH_PTS.ID_SACH " +
                  "join THEDOCGIA on PHIEUTRASACH.ID_TheDocGia = THEDOCGIA.ID_TheDocGia";
  return await pool.request()
  .query(sqlString)
  .then(data => {
    if(data.recordset.length >= 1) {
      res.send(data.recordset);
    } else res.send('0');
  })
  .catch(err => res.send('0'));
})

//Thông tin các thẻ độc giả đã được lập
adminRouters.get('/docgia', async(req, res) => {
  var pool = await conn;
  var sqlString = "select HoTen, NgSinh, NgLapThe, Email, DiaChi, LoaiDocGia " +
                  "from NGUOIDUNG2"
  return await pool.request()
  .query(sqlString)
  .then(data => {
    if(data.recordset.length >= 1) {
      res.send(data.recordset);
    } else res.send('0');
  })
  .catch(err => res.send('0'));
})

let PORT = 5000;
app.listen(PORT, () => {
  console.log(`server started on port ${PORT}`);
});

// Tạo người dùng
adminRouters.post('/docgia/tao', async (req, res) => {
  var pool = await conn;
  var sqlString = "insert into NGUOIDUNG2(HoTen, NgSinh, NgLapThe, Email, DiaChi, LoaiDocGia) values (@hoTen, @ngSinh, @ngLapThe, @email, @diaChi, @loaiDocGia)"
  return await pool.request()
  .input("hoTen", sql.NVarChar, req.body.hoTen)
  .input("ngSinh", sql.Date, req.body.ngSinh)
  .input("ngLapThe", sql.Date, req.body.ngLapThe)
  .input("email", sql.NVarChar, req.body.email)
  .input("diaChi", sql.NVarChar, req.body.diaChi)
  .input("loaiDocGia", sql.NVarChar, req.body.loaiDocGia)
  .query(sqlString)
  .then (data => {
    if(data.recordset.length === 1) {
      res.send('1');
      console.log(data.recordset)
    } else res.send('0');
  })
  .catch(err => res.send('0'))
});

// Xóa người dùng
adminRouters.post('/docgia/xoa', async (req, res) => {
  var pool = await conn;
  var sqlString = "delete from NGUOIDUNG2 where HoTen=@hoTen and NgSinh=@ngSinh and NgLapThe=@ngLapThe and Email=@email and DiaChi=@diaChi and LoaiDocGia=@loaiDocGia"
  return await pool.request()
  .input("hoTen", sql.NVarChar, req.body.hoTen)
  .input("ngSinh", sql.Date, req.body.ngSinh)
  .input("ngLapThe", sql.Date, req.body.ngLapThe)
  .input("email", sql.NVarChar, req.body.email)
  .input("diaChi", sql.NVarChar, req.body.diaChi)
  .input("loaiDocGia", sql.NVarChar, req.body.loaiDocGia)
  .query(sqlString)
  .then (data => {
    if(data.recordset.length === 1) {
      res.send('1');
      console.log(data.recordset)
    } else res.send('0');
  })
  .catch(err => res.send('0'))
});
