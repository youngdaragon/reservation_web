package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {

	private String user_id;
	private String user_password;
	private String user_name;
	private String nickname;
	private int is_owner;
	private String phone_number;
	private String address;
	private int gender;
	private String email;
	private int balloon;
	private String join_date;
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}