package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class Review {
    private String user_id;
    private Integer store_seq;
    private String owner_id;

    private Integer score;

    private String review;

    private String review_time;

    private String owner_comment;

    private String comment_time;

    private String file_location;


}
