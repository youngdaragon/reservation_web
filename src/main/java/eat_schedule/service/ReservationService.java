package eat_schedule.service;

import java.util.List;

import eat_schedule.dto.ReservationDTO;

public interface ReservationService {
	public List<ReservationDTO> ReservationSelect(String user_id);
	public ReservationDTO ReviewWrite(int no);
	public int ReservationDelete(int no);
}
