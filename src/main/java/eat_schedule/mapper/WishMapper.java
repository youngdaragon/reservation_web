package eat_schedule.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Component
@Mapper
public interface WishMapper {
    void WishOn(Integer seq, String user_id);

    void WishOff(Integer seq, String user_id);
}
