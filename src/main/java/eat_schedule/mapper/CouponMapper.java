package eat_schedule.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import eat_schedule.dto.Coupon;

import java.util.List;


@Component
@Mapper
public interface CouponMapper {
    public List<Coupon> findCoupon(String user_id, int seq);
}
