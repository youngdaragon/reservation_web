package eat_schedule.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dto.StoreDTO;
import eat_schedule.dto.BalloonDTO;
import eat_schedule.dto.CouponDTO;
import eat_schedule.dto.FilenameDTO;
import eat_schedule.dto.MenuDTO;
import eat_schedule.dto.PromotionListDTO;
import eat_schedule.dto.RegisterDTO;
import eat_schedule.dto.ReservationDTO;
import eat_schedule.dto.ReviewDTO;
import eat_schedule.mapper.OwnerDAO;

@Service
public class OwnerSeriviceImpl implements OwnerService {
	@Autowired
	OwnerDAO dao;
	@Override
	public int storeRegisterOk(StoreDTO store) {
		return dao.storeRegisterOk(store);
	}
	@Override
	public StoreDTO storeInfoEdit(Integer store_seq) {
		return dao.storeInfoEdit(store_seq);
	}
	@Override
	public int storeInfoEditOk(StoreDTO store) {
		return dao.storeInfoEditOk(store);
	}
	@Override
	public RegisterDTO userInfoEdit(String ownerId) {
		return dao.userInfoEdit(ownerId);
	}
	@Override
	public int userInfoEditOk(RegisterDTO user) {
		return dao.userInfoEditOk(user);
	}
	@Override
	public List<StoreDTO> storeSelect(String ownerId) {
		return dao.storeSelect(ownerId);
	}
	@Override
	public List<ReservationDTO> reservationSelect(Integer store_seq) {
		return dao.reservationSelect(store_seq);
	}
	@Override
	public List<ReviewDTO> reviewSelect(Integer store_seq) {
		return dao.reviewSelect(store_seq);
	}
	@Override
	public int couponGift(CouponDTO coupon) {
		return dao.couponGift(coupon);
	}
	@Override
	public int ownerCommentAdd(ReviewDTO review) {
		return dao.ownerCommentAdd(review);
	}
	@Override
	public int reservationCheck(ReservationDTO reservation) {
		return dao.reservationCheck(reservation);
	}
	@Override
	public ReviewDTO reviewSelectDetail(Integer review_seq) {
		return dao.reviewSelectDetail(review_seq);
	}
	@Override
	public ReservationDTO reservationSelectDetail(Integer reservation_seq) {
		return dao.reservationSelectDetail(reservation_seq);
	}
	@Override
	public int reservationNoCheck(int store_seq) {
		return dao.reservationNoCheck(store_seq);
	}
	@Override
	public int showCheck(ReservationDTO reservation) {
		return dao.showCheck(reservation);
	}
	@Override
	public int balloonGive(String user_id, int balloon) {
		return dao.balloonGive(user_id, balloon);
	}
	@Override
	public int balloonNowNumber(String user_id) {
		return dao.balloonNowNumber(user_id);
	}
	@Override
	public int couponStatus(Integer review_seq) {
		return dao.couponStatus(review_seq);
	}
	@Override
	public int noShowCheckNum(int store_seq) {
		return dao.noShowCheckNum(store_seq);
	}
	@Override
	public int menuInsert(MenuDTO menu) {
		return dao.menuInsert(menu);
	}
	@Override
	public int pictureDirInsert(StoreDTO store) {
		return dao.pictureDirInsert(store);
	}
	@Override
	public int balloonListUpdate(BalloonDTO balloon) {
		return dao.balloonListUpdate(balloon);
	}
	@Override
	public int promotionInsert(PromotionListDTO promotion) {
		return dao.promotionInsert(promotion);
	}
	@Override
	public List<MenuDTO> menuLoad(Integer store_seq) {
		return dao.menuLoad(store_seq);
	}
	@Override
	public MenuDTO menuInfo(Integer menu_seq) {
		return dao.menuInfo(menu_seq);
	}
	@Override
	public int menuEditOk(MenuDTO menu) {
		return dao.menuEditOk(menu);
	}
	@Override
	public int pictureInsert(FilenameDTO filename) {
		return dao.pictureInsert(filename);
	}
	@Override
	public int storeDelete(Integer seq) {
		return dao.storeDelete(seq);
	}
	@Override
	public int menuDelete(Integer seq) {
		return dao.menuDelete(seq);
	}
	@Override
	public List<ReservationDTO> reservationDateSelect(Integer store_seq, String date) {
		return dao.reservationDateSelect(store_seq, date);
	}
	@Override
	public List<ReviewDTO> reviewOwnerCommentSelect(Integer store_seq, Integer status) {
		return dao.reviewOwnerCommentSelect(store_seq, status);
	}
	@Override
	public List<ReviewDTO> reviewCouponSelect(Integer store_seq, Integer status) {
		return dao.reviewCouponSelect(store_seq, status);
	}
	@Override
	public Double storeScore(Integer store_seq) {
		return dao.storeScore(store_seq);
	}
	@Override
	public List<PromotionListDTO> advList(Integer store_seq) {
		return dao.advList(store_seq);
	}
	@Override
	public int menuInsertMap(HashMap<String, Object> map) {
		return dao.menuInsertMap(map);
	}
}
