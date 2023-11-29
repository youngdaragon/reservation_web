package eat_schedule.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {
	private int seq;
	private String user_id;
	private String picture_location;
	private String question_title;
	private String question;
	private String question_time;
	private String answer;
	//private String filename;
}
