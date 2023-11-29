package eat_schedule.service;

import java.util.List;

import eat_schedule.dto.BalloonDTO;


public interface BalloonService {
	public List<BalloonDTO> BalloonSelect(String user_id);
	public int BalloonUpdate(String user_id);
}
