import React from 'react'
import './HeaderAccount.css'

import Avatar from '../Assets/Images/avatar.png'
import { Link } from 'react-router-dom'

function HeaderAccount() {
    return (
        <div className="header-account">
            <Link to="/thuvien/account/"><img className="header-account-avatar" src={Avatar} alt="Avatar"/></Link>
            <p className="header-account-name">Nguyen Duy An</p>
            <i className="header-account-down fas fa-caret-down"></i>
        </div>
    )
}

export default HeaderAccount
