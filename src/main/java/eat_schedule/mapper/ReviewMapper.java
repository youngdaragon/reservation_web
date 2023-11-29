package eat_schedule.mapper;

import eat_schedule.dto.Review;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ReviewMapper {
    List<Review> findAllReviewByStore(int seq);

    Double findAvgScore(int seq);
}
