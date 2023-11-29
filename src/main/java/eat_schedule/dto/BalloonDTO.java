package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BalloonDTO {
	private String user_id;
	private Integer store_seq;
	private String use_get_time;
	private Integer balloon;
	private Integer total_balloon;
	private String content;
}
