package eat_schedule.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;


@Mapper
@Component
public interface CommonMapper {

    List<String> findArea();

    List<String> findCategory();

}
