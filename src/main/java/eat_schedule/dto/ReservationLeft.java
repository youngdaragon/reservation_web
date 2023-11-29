package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Component
@Getter
@Setter
public class ReservationLeft {
    private int reservation_left;
    private int store_seq;
    private LocalDateTime reservation_time;
    private LocalDate reservation_date;

    private int people;
}
