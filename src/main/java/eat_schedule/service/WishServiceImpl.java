package eat_schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dao.WishDAO;
import eat_schedule.dto.WishDTO;

@Service
public class WishServiceImpl implements WishService {
	@Autowired
	WishDAO dao;
	
	@Override
	public List<WishDTO> WishSelect(String user_id){
		return dao.WishSelect(user_id);
	}
}
