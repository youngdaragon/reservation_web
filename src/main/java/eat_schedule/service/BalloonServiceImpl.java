package eat_schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dao.BalloonDAO;
import eat_schedule.dto.BalloonDTO;

@Service
public class BalloonServiceImpl implements BalloonService {
	
	@Autowired
	BalloonDAO dao;
	
	@Override
	public List<BalloonDTO> BalloonSelect(String user_id){
		return dao.BalloonSelect(user_id);
	}
	@Override
	public int BalloonUpdate(String user_id) {
		return dao.BalloonUpdate(user_id);
	}
}
