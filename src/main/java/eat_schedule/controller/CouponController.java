package eat_schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import eat_schedule.dto.CouponDTO;
import eat_schedule.dto.UserDTO;
import eat_schedule.service.CouponService;
import eat_schedule.service.UserService;

@Controller
public class CouponController {
	@Autowired
	CouponService service;
	
	@Autowired
	UserService userservice;
	
	// 쿠폰 내역 확인
	@GetMapping("user/user/myCoupon")
	public ModelAndView myCoupon(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		List<CouponDTO> list= service.CouponSelect((String)session.getAttribute("logId"));
		mav.addObject("list", list);
		mav.setViewName("user/user/myCoupon");	
		return mav;

	}
	
	// 쿠폰 개수 확인
	@GetMapping("user/myPage")
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDTO dto = userservice.UserSelect((String)session.getAttribute("logId"));
		int cnt = service.CouponCount((String)session.getAttribute("logId"));
		mav.addObject("dto", dto);
		mav.addObject("cnt", cnt);
		mav.setViewName("user/myPage");
		return mav;
	}
	
	// 쿠폰 삭제
	@GetMapping("user/user/couponDel")
	public ModelAndView couponDel(int no) {
		ModelAndView mav = new ModelAndView();
		
		int result = service.CouponDelete(no);
		
		if(result>0) {
			mav.setViewName("redirect:/user/user/myCoupon");
		}else {
			mav.addObject("msg", "쿠폰 삭제 실패");
			mav.setViewName("user/user/joinOkResult");	// 실패
		}
		return mav;
	}
}
