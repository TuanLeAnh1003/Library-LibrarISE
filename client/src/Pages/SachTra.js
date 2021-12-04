import React, { useEffect, useState } from 'react';
import axios from 'axios';
import PhieuTraSach from '../Components/PhieuTraSach';
import './SachTra.css';

function SachTra() {
  const [listReturnedBooks, setListReturnedBooks] = useState([]);
  const [isPay, setIsPay] = useState(false);

  useEffect(() => {
    axios.get('http://localhost:5000/admin/sachtra')
    .then(data => {console.log(data)
      if(data.data.length >= 1) {
        setListReturnedBooks([...data.data]);
      } else {
        alert("Không có sách được trả!");
      }
    })
    .catch(err => {console.log(err);alert('Có lỗi xảy ra. Hãy thử tải lại trang!')});

  }, []);

  const handleAdd = () => {
      setIsPay(true);
  }

  const childState = (state) => {
      setIsPay(state)
  }

  const handleUpdate = () => {
    const update = document.querySelector('.LPTS__wrapper-update')
    update.style.display = 'flex'
  }

  return (
    <div className="container-PTS">
      <div className="container-PTS__table">
          <table className="table__book">
              <thead>
                  <tr className="table__book-header">
                      <th></th>
                      <th className="table__stt">STT</th>
                      <th className="table__col-3">ID độc giả</th>
                      <th className="table__col-4">Họ tên</th>
                      <th className="table__col-6">Ngày lập</th>
                      <th className="table__col-7">Tên sách</th>
                      <th className="table__col-8">Tiền phạt kỳ này</th>
                      <th className="table__col-9">Tổng nợ kỳ này</th>
                      <th>Tổng nợ</th>
                  </tr>
              </thead>

              <tbody>
                {listReturnedBooks.map((item, index) => (
                    <tr key={index}>
                        <td className="table__check"><input type="checkbox"/></td>
                        <td className="table__stt">{index+1}</td>
                        <td >{item.ID_TheDocGia}</td>
                        <td >{item.HoTen}</td>
                        <td >{item.NgMuon}</td>
                        <td >{item.TenSach}</td>
                        <td >{item.TienPhatKiNay}</td>
                        <td >{item.TienNoKiNay}</td>
                        <td >{item.TongNo}</td>
                    </tr>
                ))}
              </tbody> 
          </table>
      </div>

      <div className="container__button">
          <button className="button" onClick={handleAdd}>Thêm</button>
          <button className="button">Xóa</button>
          <button className="button" onClick={handleUpdate}>Sửa</button>
      </div>

      {isPay ? <PhieuTraSach handleClick={childState}/> : ""}
  </div>
  )
}

export default SachTra
