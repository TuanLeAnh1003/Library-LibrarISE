import React, { useState } from 'react'
import './Header.css'
import HeaderSearch from './HeaderSearch'
import HeaderAccount from './HeaderAccount'
import Navigation from './Navigation'
import HeaderBottom from './HeaderBottom'
import Inform from './Inform'

import Logo from '../Assets/Images/logo-white.png'

function Header({userName, handleInputSearch}) {
    const [isShow, setIsShow] = useState(false);

    const handleInform = () => {
        setIsShow(!isShow);
    }

    const childSearchState = (state) => {
        handleInputSearch(state);
    }

    return (
        <div className="header">
            <div className="header-top">
                <div className="header-top-logo">
                    <img className="header-top-logo-img" src={Logo} alt="logo" />
                </div>
                <HeaderSearch handleGetInput={childSearchState}/>

                <div className="header-top-notify" onClick={handleInform}>
                    <i className="header-top-notify-icon far fa-bell"></i>
                    {isShow && <Inform />}
                </div>

                <HeaderAccount name={userName}/>
            </div>

            <Navigation />

            <div className="header-bottom">
                <HeaderBottom />
            </div>
        </div>
    )
}

export default Header
