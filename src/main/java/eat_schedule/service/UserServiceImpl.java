package eat_schedule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dao.UserDAO;
import eat_schedule.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDAO dao;
	
	@Override
	public UserDTO loginOk(String user_id, String user_password) {
		return dao.loginOk(user_id, user_password);
	}	
	@Override
	public UserDTO UserEdit(String user_id) {	
		return dao.UserEdit(user_id);
	}

	@Override
	public int UserEditOk(UserDTO dto) {
		return dao.UserEditOk(dto);
	}	
	@Override
	public UserDTO UserSelect(String user_id) {
		return dao.UserSelect(user_id);
	}

}
