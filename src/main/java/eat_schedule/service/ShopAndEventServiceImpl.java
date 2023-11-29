package eat_schedule.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dao.ShopAndEventDAO;
import eat_schedule.dto.RegisterDTO;
import eat_schedule.dto.ShopDTO;


@Service
public class ShopAndEventServiceImpl implements ShopAndEventService {
	@Autowired
	ShopAndEventDAO dao;

	@Override
	public List<ShopDTO> selectCoupon() {
		return dao.selectCoupon();
	}

	@Override
	public List<RegisterDTO> selectUser(String user_id) {
		return dao.selectUser(user_id);
	}

	@Override
	public int couponInsertOk(ShopDTO dto) {
		return dao.couponInsertOk(dto);
	}

	@Override
	public int userUpdateOk(HashMap<String , Object> map) {
		return dao.userUpdateOk(map);
	}
	
	@Override
	public int balloonUseInsert(HashMap<String, Object> map) {
		return dao.balloonUseInsert(map);
	}
	



	
}
