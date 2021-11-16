import React, { useEffect, useRef, useState } from 'react';
import './HeaderBottom.css';
import slideImg from '../Assets/Images/Image-slide.png';
import buttonImg from '../Assets/Images/Image-button.png';

function HeaderBottom() {
  const [page, setPage] = useState(0);
  const [move, setMove] = useState(0);

  const slide = useRef();

  const handleButton = (i) => {
    setPage(i);
  }

  const handleToLeft = () => {
    if(page > 0) {
      setPage(page => page - 1);
    }
  }

  const handleToRight = () => {
    if(page < 3) {
      setPage(page => page + 1);
    }
  }


  useEffect(() => {
    setMove(slide.current.clientWidth*page)
  }, [page]);

  return (
    <div className="headerBottom">
      <div className="headerBottom__wrap">
        <div className="iconWrapLeft">
          <i className="fas fa-angle-left" onClick={handleToLeft}></i>
        </div>
        <div className="headerBottom__slideWrap">
          <div className="headerBottom__slide" style={{left: -move+"px"}}>
            {Array(4).fill().map((_, index) => (
              <img key={index} src={slideImg} alt="Header slide" ref={slide}/>
            ))}
          </div>
        </div>
        <div className="iconWrapRight">
          <i className="fas fa-angle-right" onClick={handleToRight}></i>
        </div>

      </div>

      <div className="headerBottom__buttonWrap">
        <div className="headerBottom__button">
          {Array(4).fill().map((_, index) => (
            <img 
              key={index}
              src={buttonImg} 
              alt="Header slide" 
              onClick={() => handleButton(index)}
              style={{opacity: index===page ? "0.6" : ""}}
            />
          ))}
        </div>
      </div>

    </div>
  )
}

export default HeaderBottom
