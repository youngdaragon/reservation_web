package eat_schedule.service;

import java.util.List;

import eat_schedule.dto.CouponDTO;

public interface CouponService {
	public List<CouponDTO> CouponSelect(String user_id);
	public int CouponCount(String user_id);
	public int CouponDelete(int no);
}
