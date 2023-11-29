package eat_schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import eat_schedule.dto.RegisterDTO;
import eat_schedule.dto.ShopDTO;


@Mapper
public interface ShopAndEventDAO {
	public List<ShopDTO> selectCoupon();
	public List<RegisterDTO> selectUser(String user_id);
	public int couponInsertOk(ShopDTO dto);
	public int userUpdateOk(HashMap<String , Object> map);
	public int balloonUseInsert(HashMap<String , Object> map);
}
