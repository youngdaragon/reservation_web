package eat_schedule.mapper;

import eat_schedule.dto.Reservation;
import eat_schedule.dto.ReservationLeft;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ReservationMapper {
    int insertReservation(Reservation reservation);

    int updateReservation(Reservation reservation);

    void balloonUpdate(String user_id);

    void balloonHistoryUpdate(String user_id);

    List<ReservationLeft> findReservationLeft(int seq);
}
