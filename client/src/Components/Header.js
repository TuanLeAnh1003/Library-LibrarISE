import React from 'react'
import './Header.css'
import HeaderSearch from './HeaderSearch'
import HeaderAccount from './HeaderAccount'
import Navigation from './Navigation'
import HeaderBottom from './HeaderBottom'

import Logo from '../Assets/Images/logo-white.png'

function Header() {
    return (
        <div className="header">
            <div className="header-top">
                <div className="header-top-logo">
                    <img className="header-top-logo-img" src={Logo} alt="logo" />
                </div>
                <HeaderSearch />

                <div className="header-top-notify">
                    <i className="header-top-notify-icon far fa-bell"></i>
                </div>

                <HeaderAccount />
            </div>

            <Navigation />

            <div className="header-bottom">
                <HeaderBottom />
            </div>
        </div>
    )
}

export default Header
