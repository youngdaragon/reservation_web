package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class Menu {
    private Integer seq;
    private Integer store_seq;
    private String menu_name;
    private Integer price;
    private String category;
    private String information;
    private String picture_location;
}
