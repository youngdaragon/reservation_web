package eat_schedule.service;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dao.RegisterDAO;
import eat_schedule.dto.RegisterDTO;



@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	RegisterDAO dao;
	
	@Override
	public RegisterDTO loginOk(String user_id, String user_password) {
		return dao.loginOk(user_id, user_password);
	}

	@Override
	public int idCheckCount(String user_id) {
		return dao.idCheckCount(user_id);
	}

	@Override
	public int nicknameCheckCount(String nickname) {
		return dao.nicknameCheckCount(nickname);
	}

	@Override
	public int registerInsert(RegisterDTO dto) {
		return dao.registerInsert(dto);
	}


	@Override
	public String idSearch(String username, String email) {
		return dao.idSearch(username, email);
	}

	@Override
	public String passwordSearch(String username, String email, String user_id) {
		return dao.passwordSearch(username, email, user_id);
	}

	@Override
	public int balloonGetInsert(String user_id) {
		return dao.balloonGetInsert(user_id);
	}
	


}
