import React from 'react'
import './StatisticsByCategory.css'
import {useState} from 'react'

function StatisticsByCategory() {
    const [month, setMonth] = useState()
    const [year, setYear] = useState()

    const handleCreateStatistic = () => {
        // await axios.post()
        // .then
    }

    return (
        <div>
            <div className="thongketheloai">
                <div className="container-statistics-category">
                    <div className="container_time-statistics-category">
                        <i class="fas fa-calculator"></i>
                        <label for="">Thời gian thống kê</label>
                        <div className="input">
                                {/* <!-- <input type="number" name="" value=""><br>
                                <input type="number" name="" value=""><br> --> */}

                                <select name="month" className="month_option" onChange={e => setMonth(e.target.value)}>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>

                                <select name="year" className="year_option"  onChange={e => setYear(e.target.value)}>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2022">2020</option>
                                    <option value="2021">2021</option>
                                </select>
                        </div>
                        <button className="button-statistic" onClick={handleCreateStatistic}>Tạo báo cáo</button>
                    </div>

                    <div className="container_table-statistics-category">
                        <div className="title_table">
                            <h2>BÁO CÁO THỐNG KÊ THEO THỂ LOẠI</h2>
                            <p>Tháng {month} năm {year}</p>
                        </div>

                        <table>
                            <thead>
                                <tr className="table_header">
                                    <th>STT</th>
                                    <th>Tên thể loại</th>
                                    <th>Số lượt mượn</th>
                                    <th>Tỉ lệ</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>A</td>
                                    <td>x</td>
                                    <td>30%</td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td>B</td>
                                    <td>y</td>
                                    <td>40%</td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td>C</td>
                                    <td>z</td>
                                    <td>50%</td>
                                </tr>

                                <tr>
                                    <td rowspan="2" colspan="3">Tổng lượt mượn:</td>
                                    <td>x+y+z</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default StatisticsByCategory
