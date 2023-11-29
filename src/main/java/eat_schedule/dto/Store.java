package eat_schedule.dto;

import eat_schedule.mapper.CommonMapper;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class Store {
    private Integer seq;

    private String category;

    private Double score;

    private Integer review;

    private Integer wishs;

    private String store_name;

    private String tel_number;

    private String location;

    private String comment;

    private String open_time;

    private String close_time;

    private String how_to_come;

    private String picture_location;

    private boolean parking;

    private boolean wifi;

    private boolean animal;
    private boolean wish;

    private boolean group_customer;

    private boolean playroom;

    private boolean disabled;

    private String owner_id;


    public void setLocation(String location) {
        this.location = "\'"+location+"\'";
    }

}
