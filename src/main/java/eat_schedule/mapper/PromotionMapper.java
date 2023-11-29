package eat_schedule.mapper;

import eat_schedule.dto.Store;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;

@Mapper
@Component
public interface PromotionMapper {
    ArrayList<Store> findAll(String district, LocalDate today);
}
