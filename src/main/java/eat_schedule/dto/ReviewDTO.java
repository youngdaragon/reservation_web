package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class ReviewDTO {
	private Integer seq;
	private Integer store_seq;
	private String user_id;
	private String owner_id;
	private Integer score;
	private String review;
	private String review_time;
	private String owner_comment;
	private String comment_time;
	private Integer coupon_status;
	private String file_location;
	private String store_name;
}
