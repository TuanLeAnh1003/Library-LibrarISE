import chuc_mot_ngay_tot_lanh from './Assets/Images/Chúc_một_ngày_tốt_lành.jpg';
import heo_bu_nhut_nhat from './Assets/Images/heo-bu-nhut-nhat.jpg';
import tam_li_hoc_toi_pham from './Assets/Images/tam-li-hoc-toi-pham.jpg';
import nhan_gian_huu_tinh from './Assets/Images/nhan-gian-huu-tinh.jpg';
import toi_ac_va_trung_phat from './Assets/Images/toi-ac-va-trung-phat.jpg';
import lich_su_phat_trien_nhan_loai from './Assets/Images/lich-su-phat-trien-nhan-loai.jpg';
import khong_gioi_han from './Assets/Images/khong-gioi-han.jpg';
import ngay_xua_co_mot_chuyen_tinh from './Assets/Images/Ngày_xưa_có_một_chuyện_tình.jpg';
import ngay_mai_co_mot_bat_dau from './Assets/Images/Ngay-Mai-Co-Mot-Bat-Dau.jpg';
import co_mot_ngay_bo_me_se_gia_di from './Assets/Images/Có_một_ngày_bố_mẹ_sẽ_già_đi.jpg';
import neu_con_co_ngay_mai from './Assets/Images/neu-con-co-ngay-mai.jpg';
import neu_chi_con_mot_ngay_de_song from './Assets/Images/neu-chi-con-mot-ngay-de-song.jpg';

const image = [
  {name: "Chúc một ngày tốt lành", src: chuc_mot_ngay_tot_lanh}, 
  {name: "Heo bự nhút nhát", src: heo_bu_nhut_nhat},
  {name: "Tâm lí học tội phạm", src: tam_li_hoc_toi_pham},
  {name: "Nhân gian hữu tình", src: nhan_gian_huu_tinh},
  {name: "Tội ác và trừng phạt", src: toi_ac_va_trung_phat},
  {name: "Lịch sử phát triển nhân loại", src: lich_su_phat_trien_nhan_loai},
  {name: "Không giới hạn", src: khong_gioi_han},
  {name: "Ngày xưa có một chuyện tình", src: ngay_xua_co_mot_chuyen_tinh},
  {name: "Có một ngày, bố mẹ sẽ già đi", src: co_mot_ngay_bo_me_se_gia_di},
  {name: "Nếu còn có ngày mai", src: neu_con_co_ngay_mai},
  {name: "Nếu chỉ còn một ngày để sống", src: neu_chi_con_mot_ngay_de_song},
  {name: "Ngày mai có một bắt đầu", src: ngay_mai_co_mot_bat_dau},
]; 

const findImage = (name) => {
  for(var item of image) {
    if(item.name === name) {
      return item.src;
    }
  }
  return null;
}

export {findImage};