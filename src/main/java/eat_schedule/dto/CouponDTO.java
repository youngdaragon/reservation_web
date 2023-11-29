package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CouponDTO {
	private String user_id;
	private String expired_period;
	private Integer discount_rate;
	private Integer seq;
	private Integer store_seq;
	private Integer review_seq;
	private String store_name;
}
