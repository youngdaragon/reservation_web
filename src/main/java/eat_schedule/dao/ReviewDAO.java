package eat_schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import eat_schedule.dto.AvgScoreDTO;
import eat_schedule.dto.ReviewDTO;
import eat_schedule.dto.WishDTO;

@Component
@Mapper
public interface ReviewDAO {
	// 리뷰 확인
	public List<ReviewDTO> ReviewSelect(String user_id);
	// 리뷰 작성(DB)
	public int ReviewInsert(HashMap<String, Object> map);
	// 리뷰 수정 폼
	public ReviewDTO ReviewEdit(int no);
	// 리뷰 수정 (DB update)
	public int ReviewEditUpdate(ReviewDTO dto);
	// 리뷰 삭제
	public int ReviewDelete(int no);
	// 리뷰 별점 평균 계산
	public Double AvgScore(int no);
	// 리뷰 총 개수 계산
	public int ReviewCount(int no);
	// 리뷰 별점 평균, 총 개수 계산 DB Update
	public int WishUpdate(AvgScoreDTO dto);
}
