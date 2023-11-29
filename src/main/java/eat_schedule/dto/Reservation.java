package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class Reservation {
    private int seq;
    private int store_seq;
    private String user_id;
    private int number_of_people;
    private int coupon;
    private String reservation_time;
    private String reservation_status;
    private String reservation_comment;

}