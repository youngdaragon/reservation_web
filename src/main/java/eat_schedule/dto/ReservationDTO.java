package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationDTO {
	private Integer seq;
	private Integer store_seq;
	private String user_id;
	private Integer number_of_people;
	private Integer coupon;
	private String reservation_time;
	private String reservation_status;
	private String reservation_comment;
	private String user_name;
	private String phone_number;
	private String email;
	private String store_name;
}
