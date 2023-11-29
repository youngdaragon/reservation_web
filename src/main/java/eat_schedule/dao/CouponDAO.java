package eat_schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import eat_schedule.dto.CouponDTO;

@Component
@Mapper
public interface CouponDAO {
	// 쿠폰 내역 확인
	public List<CouponDTO> CouponSelect(String user_id);
	// 쿠폰 개수 확인
	public int CouponCount(String user_id);
	// 쿠폰 삭제
	public int CouponDelete(int no);
}
