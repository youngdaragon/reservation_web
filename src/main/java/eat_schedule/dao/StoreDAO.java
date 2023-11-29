package eat_schedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import eat_schedule.dto.StoreDTO;

@Mapper
public interface StoreDAO {
	public List<StoreDTO> selectDistrict();
}
