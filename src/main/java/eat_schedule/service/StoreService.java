package eat_schedule.service;

import java.util.List;

import eat_schedule.dto.StoreDTO;

public interface StoreService {
	public List<StoreDTO> selectDistrict();
}
