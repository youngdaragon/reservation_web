package eat_schedule.controller;

import eat_schedule.mapper.CommonMapper;
import eat_schedule.dto.Store;
import eat_schedule.mapper.ImgMapper;
import eat_schedule.mapper.RegionMapper;
import eat_schedule.service.FindPromotion;
import eat_schedule.service.FindStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.ArrayList;


@Controller
@RequestMapping()
@RequiredArgsConstructor
public class Search {
    private final FindPromotion findPromotion;

    private final FindStore findStore;

    private final CommonMapper CommonMapper;

    private final RegionMapper regionMapper;

    private final ImgMapper imgMapper;

    @GetMapping("/search")
    public String searchDistrict(@RequestParam(value = "district") String district,
                                 @RequestParam(value = "category", required = false) String category,
                                 @RequestParam(value = "sort", required = false) String sort,
                                 @RequestParam(value = "store_name", required = false) String search_name,
                                 @SessionAttribute(value = "logStatus", required = false) String logStatus,
                                 @SessionAttribute(value = "isOwner", required = false) String isOwner,
                                 Model model){

        model.addAttribute("district", district);

        model.addAttribute("logStatus", logStatus);

        model.addAttribute("isOwner", isOwner);

        model.addAttribute("promotionList", findPromotion(district));

        model.addAttribute("category", category);

        model.addAttribute("region", CommonMapper.findArea());

        model.addAttribute("AllCategory", CommonMapper.findCategory());

        model.addAttribute("area", regionMapper.findRegion());

        model.addAttribute("stores", findAllStore(district, category, sort, search_name));

        return "thymeleaf/find-location";
    }
    ArrayList<Store> findPromotion(String district){
        return findPromotion.findPromotionList(district);
    }

    ArrayList<Store> findAllStore(String district, String category, String sort, String name){
        if(sort==null||sort.equals("score")){
            return findStore.findAllScore(district, category, name);
        }
        else if (sort.equals("wish")){
            return findStore.findAllWish(district, category, name);
        }
        else {
            return findStore.findAllReview(district, category, name);
        }
    }
}