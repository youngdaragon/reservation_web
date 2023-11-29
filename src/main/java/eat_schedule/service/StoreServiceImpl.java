package eat_schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dao.StoreDAO;
import eat_schedule.dto.StoreDTO;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDAO dao;
	
	@Override
	public List<StoreDTO> selectDistrict() {
		return dao.selectDistrict();
	}

}
