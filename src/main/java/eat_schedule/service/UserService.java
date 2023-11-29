package eat_schedule.service;

import eat_schedule.dto.UserDTO;

public interface UserService {
	public UserDTO loginOk(String user_id, String user_password);
	public UserDTO UserEdit(String user_id);
	public int UserEditOk(UserDTO dto);
	public UserDTO UserSelect(String user_id);
}
