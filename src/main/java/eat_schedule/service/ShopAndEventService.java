package eat_schedule.service;

import java.util.HashMap;
import java.util.List;

import eat_schedule.dto.RegisterDTO;
import eat_schedule.dto.ShopDTO;


public interface ShopAndEventService {
	public List<ShopDTO> selectCoupon();
	public List<RegisterDTO> selectUser(String user_id);
	public int couponInsertOk(ShopDTO dto);
	public int userUpdateOk(HashMap<String , Object> map);
	public int balloonUseInsert(HashMap<String , Object> map);
}
