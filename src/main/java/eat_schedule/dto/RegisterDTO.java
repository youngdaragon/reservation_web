package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterDTO {
	private String user_name;
	private String user_id;
    private String user_password;
    private Integer gender;
    private String nickname;
    private Integer is_owner;
    private String phone_number;
    private String email;
    private Integer balloon;
    private String joindate;
}
