import React, { useState } from 'react'
import { Link } from 'react-router-dom';
import './HeaderSearch.css'

function HeaderSearch({handleGetInput}) {
    const [searchInput, setSearchInput] = useState('');

    const handleClickSearch = () => {
        handleGetInput(searchInput);
    }

    return (
        <div className="header-search">
            <input type="text" className="header-search-input" placeholder="Nhấn để tìm kiếm" onChange={e => setSearchInput(e.target.value)}/>
            <Link to="/thuvien/timkiem">
                <button className="header-search-btn" onClick={handleClickSearch}>
                    <i className="header-search-btn-icon fas fa-search"></i>
                    <span className="header-search-btn-title">Tìm kiếm</span>
                </button>
            </Link>
            
        </div>
    )
}

export default HeaderSearch
