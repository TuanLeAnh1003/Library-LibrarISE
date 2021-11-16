import React from 'react'
import './HeaderSearch.css'

function HeaderSearch() {
    return (
        <div className="header-search">
            <input type="text" className="header-search-input" placeholder="Nhấn để tìm kiếm" />
            <button className="header-search-btn">
                <i className="header-search-btn-icon fas fa-search"></i>
                <p className="header-search-btn-title">Tìm kiếm</p>
            </button>
        </div>
    )
}

export default HeaderSearch
