import React, {useState} from 'react';
import axios from 'axios';
import './BookCreate.css';

function BookRemove() {
    const [bookName, setBookName] = useState('')
    const [author, setAuthor] = useState('')
    const [publisher, setPublisher] = useState('')
    const [publishedYear, setPublishedYear] = useState()
    const [money, setMoney] = useState()
    const [day, setDay] = useState()
    const [month, setMonth] = useState()
    const [year, setYear] = useState()
    const [style, setStyle] = useState('')

    const handleRemoveBook = () => {
        if (bookName !== '' &&
            author !== '' &&
            publisher !== '' &&
            publishedYear != null &&
            money != null &&
            day != null &&
            month != null &&
            year != null &&
            style !== '') {
            axios.post('http://localhost:5000/admin/xoasach', {
                tenSach: bookName,
                tacGia: author,
                nxb: publisher,
                namxb: publishedYear,
                triGia: money,
                ngay: day,
                thang: month,
                nam: year,
                theLoai: style,
            })
            .then(res => {
                console.log(res)
                if(res.data[0] === 1) {
                    alert('Sách đã được xóa khỏi hệ thống!');
                }
                if(res.data[0] === 0) {
                    alert('Sách không tồn tại trong hệ thống!')
                }
            })
        } else {
            alert("Vẫn còn thông tin chưa được nhập!")
        }
    }

    const handleExit = () => {
        const RemoveBook = document.querySelector('.container-book-wrapper-remove')
        
        RemoveBook.style.display = 'none'
    }
 
    return (
        <div className="container-book-wrapper-remove" onClick={handleExit}>
            <div className="container-book" onClick={e => e.stopPropagation()}>
        <h2 className="container__header">XÓA SÁCH</h2>
        <div className="container__form-section">
            <div className="form-section__element">
            <i className="fas fa-id-badge"></i>
            <label>Tên sách</label><br />
            <input type="text" placeholder="CNPM" onChange={e => setBookName(e.target.value)}/>
            </div>
            <div className="form-section__element">
            <i className="fas fa-user"></i>
            <label>Tác giả</label><br />
            <input type="text" placeholder="19521179@gm.uit.edu.vn" onChange={e => setAuthor(e.target.value)}/>
            </div>
            <div className="form-section__element">
            <i className="fas fa-house-user"></i>
            <label>Nhà xuất bản</label>
            <input type="text" placeholder="Go Vap District, HCM city" onChange={e => setPublisher(e.target.value)} />
            </div>
            <div className="form-section__element-1">
            <div className="form-section__element form-section__element-3">
                <div className="form-section__element-wrapper">
                <i className="fas fa-calculator"></i>
                <label>Năm xuất bản</label>
                </div>
                <span className="element__number-wrapper"
                ><input
                    type="number"
                    min="1899"
                    max="2021"
                    onChange={e => setPublishedYear(e.target.value)}
                /></span>
            </div>
            <div className="form-section__element form-section__element-3">
                <div className="form-section__element-wrapper">
                <i className="fas fa-coins"></i>
                <label className="fo">Trị giá</label>
                </div>
                <input
                className="form-section__element-input-gia"
                type="number"
                placeholder="30.000"
                onChange={e => setMoney(e.target.value)}
                />
            </div>
            </div>

            <div className="form-section__element">
            <i className="fas fa-business-time"></i>
            <label>Ngày lập thẻ</label>
            <span className="element__number-wrapper"
                ><input type="number" min="1" max="31" onChange={e => setDay(e.target.value)}
            /></span>
            <span className="element__number-wrapper"
                ><input type="number" min="1" max="12" onChange={e => setMonth(e.target.value)}
            /></span>
            <span className="element__number-wrapper"
                ><input
                type="number"
                min="1899"
                max="2021"
                onChange={e => setYear(e.target.value)}
            /></span>
            </div>
            <div className="form-section__element">
            <i className="fas fa-book-open"></i>

            <label>Thể loại</label>
            <input type="text" placeholder="A" onChange={e => setStyle(e.target.value)}/>
            </div>
        </div>
        
        <span className="container__note-wrapper">
        <p>
          <br /><br /><b> BẠN CÓ CHẮC CHẮN MUỐN XÓA SÁCH NÀY KHỎI HỆ THỐNG?</b>
        </p>
      </span>
      <span className="container__button-wrapper">
        <button className="button--ignore" onClick={handleExit}>Hủy bỏ</button>
        <button className="button--submit" onClick={handleRemoveBook}>Xóa sách</button>
      </span>
    </div>
    </div>
    )
}

export default BookRemove
