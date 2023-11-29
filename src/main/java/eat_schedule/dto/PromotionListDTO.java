package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PromotionListDTO {
	private Integer seq;
	private Integer store_seq;
	private String owner_id;
	private String list_date;
	private String district;
}
