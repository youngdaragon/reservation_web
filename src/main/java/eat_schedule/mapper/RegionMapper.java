package eat_schedule.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface RegionMapper {
    List<String> findRegion();
}
