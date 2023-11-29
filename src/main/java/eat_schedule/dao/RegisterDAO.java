package eat_schedule.dao;

import org.apache.ibatis.annotations.Mapper;

import eat_schedule.dto.RegisterDTO;

@Mapper
public interface RegisterDAO {
	public RegisterDTO loginOk(String user_id, String user_password);
	public int idCheckCount(String user_id);
	public int nicknameCheckCount(String nickname);
	public int registerInsert(RegisterDTO dto);
	public String idSearch(String username, String email);
	public String passwordSearch(String username, String email, String user_id);
	public int balloonGetInsert(String user_id);
}
