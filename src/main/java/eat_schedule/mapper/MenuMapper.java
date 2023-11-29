package eat_schedule.mapper;

import eat_schedule.dto.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface MenuMapper {
    List<Menu> findMenu(int seq);

    List<String> findMenuType(int seq);
}
