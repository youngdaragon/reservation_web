package eat_schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import eat_schedule.dto.WishDTO;

@Component
@Mapper
public interface WishDAO {
	// 찜 목록
	public List<WishDTO> WishSelect(String user_id);

	public List<WishDTO> WishSelectSpecific(String user_id, int store_seq);
}
