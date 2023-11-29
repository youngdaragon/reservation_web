package eat_schedule.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import eat_schedule.dto.StoreDTO;
import eat_schedule.dto.BalloonDTO;
import eat_schedule.dto.CouponDTO;
import eat_schedule.dto.FilenameDTO;
import eat_schedule.dto.MenuDTO;
import eat_schedule.dto.PromotionListDTO;
import eat_schedule.dto.RegisterDTO;
import eat_schedule.dto.ReservationDTO;
import eat_schedule.dto.ReviewDTO;

@Mapper
public interface OwnerDAO {
	//가게선택
	public List<StoreDTO> storeSelect(String ownerId);
	//예약 미확인 개수 구하기
	public int reservationNoCheck(int store_seq);
	//방문 미확인 개수 구하기
	public int noShowCheckNum(int store_seq);
	//가게등록
	public int storeRegisterOk(StoreDTO store);
	//가게정보수정시 원래 데이터 불러오기
	public StoreDTO storeInfoEdit(Integer store_seq);
	//가게정보수정
	public int storeInfoEditOk(StoreDTO store);
	//회원정보수정시 원래 데이터 불러오기
	public RegisterDTO userInfoEdit(String ownerId);
	//회원정보수정
	public int userInfoEditOk(RegisterDTO user);
	//예약내역확인
	public List<ReservationDTO> reservationSelect(Integer store_seq);
	//예약내역날짜별확인
	public List<ReservationDTO> reservationDateSelect(Integer store_seq, String date);
	//리뷰내역확인
	public List<ReviewDTO> reviewSelect(Integer store_seq);
	//리뷰내역확인
	public List<ReviewDTO> reviewOwnerCommentSelect(Integer store_seq, Integer status);
	//리뷰내역확인
	public List<ReviewDTO> reviewCouponSelect(Integer store_seq, Integer status);
	//가게 리뷰 평균 별점
	public Double storeScore(Integer store_seq);
	//쿠폰증정
	public int couponGift(CouponDTO coupon);
	//댓글남기기
	public int ownerCommentAdd(ReviewDTO review);
	//예약확인
	public int reservationCheck(ReservationDTO reservation);
	//리뷰 상세정보
	public ReviewDTO reviewSelectDetail(Integer review_seq);
	//예약 상세정보
	public ReservationDTO reservationSelectDetail(Integer reservation_seq);
	//쇼 확인
	public int showCheck(ReservationDTO reservation);
	//먹풍지급
	public int balloonGive(String user_id, int balloon);
	//먹풍지급내역 업데이트
	public int balloonListUpdate(BalloonDTO balloon);
	//풍선내역불러오기
	public int balloonNowNumber(String user_id);
	//쿠폰지급여부
	public int couponStatus(Integer review_seq);
	//메뉴 등록
	public int menuInsert(MenuDTO menu);
	//사진 주소 저장
	public int pictureDirInsert(StoreDTO store);
	//광고리스트 저장
	public int promotionInsert(PromotionListDTO promotion);
	//메뉴 리스트 불러오기
	public List<MenuDTO> menuLoad(Integer store_seq); 
	//메뉴 상세정보 불러오기
	public MenuDTO menuInfo(Integer menu_seq);
	//메뉴 업데이트
	public int menuEditOk(MenuDTO menu);
	//파일명 넣기(경로넣기)
	public int pictureInsert(FilenameDTO filename);
	//가게삭제
	public int storeDelete(Integer seq);
	//메뉴삭제
	public int menuDelete(Integer seq);
	//광고리스트 사장님 확인
	public List<PromotionListDTO> advList(Integer store_seq);
	//업로드파일 리스트 불러오기
	public List<FilenameDTO> fileList(Integer store_seq);
	//db에서 파일삭제
	public int deletePicture(Integer fileSeq);
	//파일 시퀀스로 파일찾기
	public FilenameDTO selectPicture(Integer seq);
	//가게 사진 한장만 가져오기
	public FilenameDTO storePicture(Integer store_seq);

	int menuInsertMap(HashMap<String, Object> map);
}
