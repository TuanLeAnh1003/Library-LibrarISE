import React, {useEffect, useState} from 'react';
import './TienPhat.css';
import PhieuThuTienPhat from '../Components/PhieuThuTienPhat';
import axios from 'axios';

function TienPhat() {
  const [isAdd, setIsAdd] = useState(false);
  const [listFinedMoney, setListFinedMoney] = useState([]);

  const handleAdd = () => {
    setIsAdd(true);
  }

  const childState = (state) => {
    setIsAdd(state)
  }

  useEffect(() => {
    axios.get("http://localhost:5000/admin/tienphat")
    .then(res => {
        if(res.data.length >= 1) {
        setListFinedMoney([...res.data]);
      } else {
        alert("Không có phiếu phạt!");
      }
    })
    .catch(err => console.log(err))
  }, [])

  return (
    <div className="container-PTTP">
        <div className="container__table">
            <table className="table__book">
                <thead>
                    <tr className="table__book-header">
                        <th></th>
                        <th className="table__stt">STT</th>
                        <th className="table__col">ID độc giả</th>
                        <th className="table__col">Họ tên</th>
                        <th className="table__col">Tổng nợ</th>
                        <th className="table__col">Số tiền thu</th>
                        <th className="table__col">Còn lại</th>
                    </tr>
                </thead>

                <tbody>
                  {listFinedMoney.map((item, index) => (
                    <tr key={index}>
                        <td className="table__check"><input type="checkbox" /></td>
                        <td className="table__stt">{index+1}</td>
                        <td>{item.ID_TheDocGia}</td>
                        <td>{item.HoTen}</td>
                        <td>{item.TongNo}đ</td>
                        <td>{item.SoTienThu}đ</td>
                        <td>{item.ConLai}đ</td>
                    </tr>
                  ))}
                    
                </tbody> 
            </table>
        </div>

        <div className="container__button">
            <button className="button" onClick={handleAdd}>Thêm</button>
            <button className="button">Xóa</button>
            <button className="button">Sửa</button>
        </div>

      {isAdd ? <PhieuThuTienPhat handleClick={childState}/> : ""}
    </div>

  )
}

export default TienPhat
