package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShopDTO {
	private String user_id;
	private int balloon;
	private int seq;
	private int discount_rate;
	private int balloon_number;
	private String expired_date;
}
