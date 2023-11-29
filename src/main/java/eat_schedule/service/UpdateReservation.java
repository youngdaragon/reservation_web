package eat_schedule.service;

import eat_schedule.mapper.ReservationMapper;
import eat_schedule.dto.Reservation;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UpdateReservation {

    private final ReservationMapper reservationMapper;

    public void updateReservation(Reservation reservation){
        reservationMapper.insertReservation(reservation);
        reservationMapper.updateReservation(reservation);
        //트랜잭션 커밋
    }

}
