package eat_schedule.service;

import java.util.List;

import eat_schedule.dto.WishDTO;

public interface WishService {
	public List<WishDTO> WishSelect(String user_id);
}
