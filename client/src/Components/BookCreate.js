import React from 'react'
import './BookCreate.css'
import {useState} from 'react'

function BookCreate() {
    const [bookName, setBookName] = useState('')
    const [author, setAuthor] = useState('')
    const [publisher, setPublisher] = useState('')
    const [publishedYear, setPublishedYear] = useState()
    const [money, setMoney] = useState()
    const [day, setDay] = useState()
    const [month, setMonth] = useState()
    const [year, setYear] = useState()
    const [style, setStyle] = useState('')

    const handleAddBook = () => {
        if (bookName !== '' &&
            author !== '' &&
            publisher !== '' &&
            publishedYear != null &&
            money != null &&
            day != null &&
            month != null &&
            year != null &&
            style !== '') {
            // await axios.post()
            // .then
        } else {
            alert("Vui lòng nhập đầy đủ thông tin")
        }
    }

    const handleExit = () => {
        const AddBook = document.querySelector('.container-book-wrapper')
        
        AddBook.style.display = 'none'
    }
 
    return (
        <div className="container-book-wrapper" onClick={handleExit}>
            <div className="container-book" onClick={e => e.stopPropagation()}>
        <h2 className="container__header">THÊM SÁCH</h2>
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
                ><input type="number" min="1" max="31" value="10" onChange={e => setDay(e.target.value)}
            /></span>
            <span className="element__number-wrapper"
                ><input type="number" min="1" max="12" value="10" onChange={e => setMonth(e.target.value)}
            /></span>
            <span className="element__number-wrapper"
                ><input
                type="number"
                min="1899"
                max="2021"
                value="2001"
                onChange={e => setYear(e.target.value)}
            /></span>
            </div>
            <div className="form-section__element">
            <i className="fas fa-book-open"></i>

            <label>Thể loại</label>
            <input type="text" placeholder="A" onChange={e => setStyle(e.target.value)}/>
            </div>
        </div>
        
        <span className="container__button-wrapper">
          <button className="button--submit" onClick={handleAddBook}>Thêm</button>
        </span>
    </div>
    </div>
    )
}

export default BookCreate
