package eat_schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import eat_schedule.dto.ReservationDTO;
import eat_schedule.service.ReservationService;

@Controller
@RequestMapping("/user")
public class ReservationController {
	@Autowired
	ReservationService service;
	
	// 예약내역 확인
	@GetMapping("user/myReservation")
	public ModelAndView myReservation(HttpSession session) { 
		ModelAndView mav = new ModelAndView();
		
		List<ReservationDTO> list = service.ReservationSelect((String)session.getAttribute("logId"));
		for (ReservationDTO dto : list) {
			System.out.println();
			System.out.println(dto.getReservation_time());
			System.out.println();
		}

		mav.addObject("list", list);
		mav.setViewName("user/user/myReservation");	
		return mav;
	}
	
	// 리뷰 쓰기 폼
	@GetMapping("user/reviewWrite")
	public ModelAndView reviewWrite(int no, HttpSession session){
		ModelAndView mav = new ModelAndView();
		ReservationDTO dto = service.ReviewWrite(no);
		mav.addObject("dto", dto); 
		mav.setViewName("user/user/reviewWriteForm");
		return mav;
	}
	
	// 예약 삭제 (예약 취소)
	@GetMapping("user/reservationDel")
	public ModelAndView reservationDel(int no) {
		ModelAndView mav = new ModelAndView();
		
		int result = service.ReservationDelete(no);
		
		if(result>0) {
			mav.setViewName("redirect:/user/user/myReservation"); // 성공
		}else {
			mav.addObject("msg", "예약 삭제 실패");
			mav.setViewName("user/user/joinOkResult");	// 실패
		}
		return mav;
	}
}
