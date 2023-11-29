package eat_schedule.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ImgMapper {
    List<String> findImg(int seq);

    String findMainImg(int seq);

}
