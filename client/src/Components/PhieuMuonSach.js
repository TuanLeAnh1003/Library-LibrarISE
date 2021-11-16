import axios from 'axios';
import React, { useState } from 'react';
import './PhieuMuonSach.css';

function PhieuMuonSach({handleClick}) {

  const [idReader, setIdReader] = useState('');
  const [day, setDay] = useState('');
  const [month, setMonth] = useState('');
  const [year, setYear] = useState('');
  const [idBook, setIdBook] = useState('');
  const [number, setNumber] = useState('');

  const handleClickOK = () => {
    if(idReader !== "" && day !== "" && month !== "" && year !== "" && idBook !== "" && number !== "") {
      // await axios.post()
      // .then
      handleClick(false)
    } else {
      alert('Có trường chưa được nhập!')
    }
  }

  return (
    <div className="container-PMS__wrap" onClick={() => handleClick(false)}>
      <div className="container__PMS" onClick={e => e.stopPropagation()}>
        <h2 className="container__header">LẬP PHIẾU MƯỢN SÁCH</h2>
        <div className="container__form-section">
          <div className="form-section__element">
            <i class="fas fa-user-alt"></i>
            <label>Độc giả</label>
            <span className="element__button-wrapper">
              <input 
                type="text" 
                value={idReader}
                placeholder="Nhập ID độc giả" 
                onChange={e => setIdReader(e.target.value)}
              />
              <button className="button--submit">OK</button>
            </span>
          </div>

          <div className="form-section__element">
            <i class="fas fa-calendar-alt"></i>
            <label>Ngày lập thẻ</label>
            <span className="element__number-wrapper">
              <input 
                type="number" 
                value={day}
                min="1" 
                max="31" 
                onChange={e => setDay(e.target.value)}
              />
            </span>
            <span className="element__number-wrapper">
              <input 
                type="number" 
                value={month}
                min="1" 
                max="12" 
                onChange={e => setMonth(e.target.value)}
              />
            </span>
            <span className="element__number-wrapper">
              <input
                type="number"
                value={year}
                min="1899"
                max="2021"
                onChange={e => setYear(e.target.value)}
              />
            </span>
          </div>
        </div>

        <div className="form-section__element">
          <i class="fas fa-book-open"></i>
          <label>Sách mượn</label>

          <span className="element__button-wrapper">
            <input 
              type="text" 
              value={idBook}
              placeholder="Nhập ID sách" 
              onChange={e => setIdBook(e.target.value)}
            />
            <button className="button--submit">OK</button>
          </span>
        </div>
        <div className="form-section__element">
          <label>Số lượng</label>
          <span className="element__number-wrapper">
            <input 
              type="number" 
              value={number}
              min="1" 
              max="100" 
              onChange={e => setNumber(e.target.value)}
            />
          </span>
        </div>
        <div className="container__table-PMS">
          <table className="table__book-PMS">
            <tbody>
              <tr>
                <td className="table__book-id">#123456</td>
                <td className="table__book-name">CNPM</td>
                <td>A</td>
                <td>Hồ Thanh Phong</td>
                <td className="table__button-wrapper">
                  <button className="button--ignore">Xóa</button>
                </td>
              </tr>
              <tr>
                <td className="table__book-id">#123456</td>
                <td className="table__book-name">CNPM</td>
                <td>A</td>
                <td>Hồ Thanh Phong</td>
                <td className="table__button-wrapper">
                  <button className="button--ignore">Xóa</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <span className="container__button-wrapper">
          <button className="button--submit" onClick={handleClickOK}>OK</button>
        </span>
      </div>
    </div>
    
  )
}

export default PhieuMuonSach
