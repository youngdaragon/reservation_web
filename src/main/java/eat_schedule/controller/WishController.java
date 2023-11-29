package eat_schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import eat_schedule.mapper.WishMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import eat_schedule.dto.WishDTO;
import eat_schedule.service.WishService;

@Controller
public class WishController {
	@Autowired
	WishService service;

	@Autowired
	WishMapper wishMapper;
	
	// 찜 내역 확인
	@GetMapping("user/user/wishlist")
	public ModelAndView myCoupon(HttpSession session) {
		ModelAndView mav = new ModelAndView();	
		List<WishDTO> list = service.WishSelect((String)session.getAttribute("logId"));
		mav.addObject("list", list);
		mav.setViewName("user/user/wishlist");	
		return mav;

	}

	@RequestMapping("/wishUpdate")
	public void wishUpdate(@RequestParam(value = "seq") String seq,
						   @RequestParam("wish") String wish,
						   @SessionAttribute(value = "logId") String user_id){
		if(wish.equals("true")){
			wishMapper.WishOn(Integer.parseInt(seq), user_id);
		}
		else {
			wishMapper.WishOff(Integer.parseInt(seq), user_id);
		}
	}


}
