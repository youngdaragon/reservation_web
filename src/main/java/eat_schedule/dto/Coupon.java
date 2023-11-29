package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Getter
@Setter
public class Coupon {
    private String user_id;
    private LocalDateTime expired_period;
    private int discount_rate;
    private int store_seq;
}
