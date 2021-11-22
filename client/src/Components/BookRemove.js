import React from 'react'
import './BookCreate.css'
import {useState} from 'react'

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
        if (bookName !== '' ||
            author !== '' ||
            publisher !== '' ||
            publishedYear != null ||
            money != null ||
            day != null ||
            month != null ||
            year != null ||
            style !== '') {
            // await axios.post()
            // .then
        } else {
            alert("Vui lòng nhập ít nhất 1 thông tin")
        }
    }

    const handleExit = () => {
        const RemoveBook = document.querySelector('.container-book-wrapper-remove')
        
        RemoveBook.style.display = 'none'
    }
 
    return (
        <div className="container-book-wrapper-remove" onClick={handleExit}>
            <div className="container-book-remove" onClick={e => e.stopPropagation()}>
                <h2 className="container__header">XÓA SÁCH</h2>
                <p className="container-book-content">BẠN CÓ CHẮC CHẮN MUỐN XÓA SÁCH ĐÃ CHỌN KHỎI HỆ THỐNG ?</p>
                <div className="container-book-btn">
                    <button className="container-book-btn-cancel">Hủy bỏ</button>
                    <button className="container-book-btn-remove">Xóa sách</button>
                </div>
            </div>
        </div>
    )
}

export default BookRemove
