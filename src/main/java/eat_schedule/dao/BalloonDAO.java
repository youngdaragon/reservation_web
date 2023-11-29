package eat_schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import eat_schedule.dto.BalloonDTO;

@Component
@Mapper
public interface BalloonDAO {
	// 풍선 목록 가져오기
	public List<BalloonDTO> BalloonSelect(String user_id);
	// 유저 테이블에 풍선 update
	public int BalloonUpdate(String user_id);
}
