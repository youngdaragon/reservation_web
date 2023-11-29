package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuDTO {
	private Integer seq;
	private Integer store_seq;
	private String menu_name;
	private Integer price;
	private String category;
	private String information;
	private String picture_location;
}
