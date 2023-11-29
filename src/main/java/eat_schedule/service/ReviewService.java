package eat_schedule.service;

import java.util.HashMap;
import java.util.List;

import eat_schedule.dto.AvgScoreDTO;
import eat_schedule.dto.ReviewDTO;

public interface ReviewService {
	public List<ReviewDTO> ReviewSelect(String user_id);
	public int ReviewInsert(HashMap<String, Object> map);
	public ReviewDTO ReviewEdit(int no);
	public int ReviewEditUpdate(ReviewDTO dto);
	public int ReviewDelete(int no);

	public Double AvgScore(int no);
	public int ReviewCount(int no);
	public int WishUpdate(AvgScoreDTO dto);

}
