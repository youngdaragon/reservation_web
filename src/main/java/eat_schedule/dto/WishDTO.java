package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WishDTO {
	private int seq;
	private String user_id;
	private int store_seq;
	private String store_name;
	private String district;
	private String category;
	private double avg_score;
	private String owner_comment;
	private int count;
}
