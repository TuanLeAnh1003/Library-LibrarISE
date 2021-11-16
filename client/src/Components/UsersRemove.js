import React from 'react'
import './UsersRemove.css'
import {useState} from 'react'

function UsersDelete() {
    const [name, setName] = useState('')
    const [email, setEmail] = useState('')
    const [birthday, setBirthday] = useState()
    const [birthmonth, setBirthmonth] = useState()
    const [birthyear, setBirthyear] = useState()
    const [address, setAddress] = useState('')
    const [cardDay, setCardDay] = useState()
    const [cardMonth, setCardMonth] = useState()
    const [cardYear, setCardYear] = useState()

    const handleExit = () => {
        const removeUser = document.querySelector('.users-remove-wrapper')

        removeUser.style.display = 'none'
    }

    const handleRemoveUser = () => {
        if (name !== '' || 
        email !== '' || 
        birthday != null ||
        birthmonth != null ||
        birthyear != null ||
        address !== '' || 
        cardDay != null ||
        cardMonth != null ||
        cardYear != null) {
            // await axios.post()
            // .then
        } else {
            alert('Nhập ít nhất 1 trường của người dùng muốn xóa')
        }
    }

    return (
        <div className="users-remove-wrapper" onClick={handleExit}>
            <div className="container-remove" onClick={e => e.stopPropagation()}>
                <div className="container__remove-reader">
                <h2 className="remove-reader__header">XÓA THẺ ĐỘC GIẢ</h2>
                <div className="remove-reader__form">
                    <div className="form__element">
                        <i className="fas fa-id-badge"></i>
                        <label>Họ và tên</label>
                        <input type="text" placeholder="Nguyen Duy An" onChange={e => setName(e.target.value)}/>
                    </div>
                    <div className="form__element">
                        <i className="far fa-envelope"></i>
                        <label>Email</label>
                        <input type="text" placeholder="19521179@gm.uit.edu.vn" onChange={e => setEmail(e.target.value)}/>
                    </div>
                    <div className="form__element">
                        <i className="fas fa-birthday-cake"></i>
                        <label>Ngày sinh</label>
                        <span className="element__number-wrapper"><input type="number" min="1" max="31" onChange={e => setBirthday(e.target.value)}/></span>
                        <span className="element__number-wrapper"><input type="number" min="1" max="12"  onChange={e => setBirthmonth(e.target.value)}/></span>
                        <span className="element__number-wrapper"><input type="number" min="1899" max="2021" onChange={e => setBirthyear(e.target.value)}/></span>
                    </div>
                    <div className="form__element">
                        <i className="fas fa-map-marker-alt"></i>
                        <label>Địa chỉ</label>
                        <input type="text" placeholder="Go Vap District, HCM city" onChange={e => setAddress(e.target.value)}/>
                    </div>
                    <div className="form__element">
                        <i className="fas fa-calculator"></i>
                        <label>Ngày lập thẻ</label>
                        <span className="element__number-wrapper"><input type="number" min="1" max="31" onChange={e => setCardDay(e.target.value)}/></span>
                        <span className="element__number-wrapper"><input type="number" min="1" max="12" onChange={e => setCardMonth(e.target.value)}/></span>
                        <span className="element__number-wrapper"><input type="number" min="1899" max="2021" onChange={e => setCardYear(e.target.value)}/></span>
                    </div>
                    <div className="form__element">
                        <i className="fas fa-user"></i>
                        <label>Loại độc giả</label>
                        <span className="element__radio-wrapper">
                            <input type="radio" name="reader-type" value="X"/>
                            <label>X</label>
                        </span>
                        <span className="element__radio-wrapper">
                            <input type="radio" name="reader-type" value="Y"/>
                            <label>Y</label>
                        </span>
                    </div>
                </div>
                <span className="remove-reader__button-wrapper">
                    {/* <button className="button--submit" onClick={handleRemoveUser}>Tạo thẻ</button> */}
                </span>
                <span className="remove-reader__button-wrapper">
                    <button className="button--ignore" onClick={handleExit}>Hủy bỏ</button>
                    <button className="button--submit" onClick={handleRemoveUser}>Xóa thẻ</button>
                </span>
                </div>
            </div>
        </div>
    )
}

export default UsersDelete
