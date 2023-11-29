package eat_schedule.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import eat_schedule.dto.UserDTO;
@Component
@Mapper
public interface UserDAO {
	// 로그인
	public UserDTO loginOk(String user_id, String user_password);
	// 회원정보 수정폼
	public UserDTO UserEdit(String user_id);
	// 회원정보 수정 DB 업데이트
	public int UserEditOk(UserDTO dto);
	// 유저 정보 가져오기
	public UserDTO UserSelect(String user_id);
}
