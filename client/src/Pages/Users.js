import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './Users.css'

function Users() {
    const [listReaderCards, setListReaderCards] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:5000/admin/docgia')
        .then(data => {
          if(data.data.length >= 1) {
            setListReaderCards([...data.data]);
          } else {
            alert("Không có thẻ độc giả nào!");
          }
        })
        .catch(err => alert('Có lỗi xảy ra. Hãy thử tải lại trang!'));
    }, []);

    const handleCreateUser = () => {
        const createUser = document.querySelector('.users-create-wrapper')

        createUser.style.display = 'block'
    }
    const handleRemoveUser = () => {
        const removeUser = document.querySelector('.users-remove-wrapper')

        removeUser.style.display = 'block'
    }

    return (
        <div className="container">
            <div className="container__table">
                <table className="table__user">
                    <thead>
                        <tr className="table__user-header">
                            <th></th>
                            <th className="table__stt">STT</th>
                            <th className="table__col-2">Họ và tên</th>
                            <th className="table__col-3">Ngày sinh</th>
                            <th className="table__col-4">Ngày lập thẻ</th>
                            <th className="table__col-5">Email</th>
                            <th className="table__col-6">Địa chỉ</th>
                            <th className="table__col-7">Loại độc giả</th>
                        </tr>
                    </thead>

                    <tbody>
                        {listReaderCards.map((item, index) => (
                            <tr key={index}>
                                <td className="table__check"><input type="checkbox"/></td>
                                <td className="table__stt">{index+1}</td>
                                <td >{item.HoTen}</td>
                                <td >{item.NgSinh}</td>
                                <td >{item.NgLapThe}</td>
                                <td >{item.Email}đ</td>
                                <td >{item.DiaChi}</td>
                                <td >{item.LoaiDocGia}</td>
                            </tr>
                        ))}
                    </tbody> 
                </table>
            </div>

            <div className="container__button">
                <button className="button" onClick={handleCreateUser}>Tạo thẻ</button>
                <button className="button" onClick={handleRemoveUser}>Xóa thẻ</button>
                <button className="button">Chỉnh sửa</button>
            </div>


        </div>
    )
}

export default Users
