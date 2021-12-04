import axios from 'axios';
import React, { useState, useEffect} from 'react';
import './SearchResult.css';
import {findImage} from '../Images';
import not_found from '../Assets/Images/not_found.jpg';

function SearchResult({search}) {
  const [listBooks, setListBook] = useState([]);

  useEffect(() => {
    axios.get(`http://localhost:5000/:${search}`)
    .then(res => setListBook([...res.data]))
    .catch(err => console.log(err))
  }, [search])

  return (
    <div className="search-result">
      <div className="search-result__wrapper">
        {listBooks.length >= 1 ? listBooks.map((item, index) => (
          <div key={index} className="search-result__book">
            <img src={findImage(item.TenSach)} alt="book-image"/>
            <div className="search-result__book-info">
              <h1>{item.TenSach}</h1>
              <h2>Giá: {item.TriGia}đ</h2>
              <p>Tác giả: {item.TenTacGia}</p>
              <p>NXB: {item.TenNXB}</p>
            </div>
          </div>
          )) : 
          <div className="search-result__not-found">
            <img src={not_found} alt="Not_found" />
            <h2>Không có sách bạn muốn tìm. Hãy thử nhập tên khác!</h2>
          </div>
        }
      </div>
    </div>
  )
}

export default SearchResult
