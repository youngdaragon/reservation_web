package eat_schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import eat_schedule.dto.RegisterDTO;
import eat_schedule.dto.ShopDTO;
import eat_schedule.service.ShopAndEventService;

@Controller
@RequestMapping("/shopAndEvent")
public class ShopAndEventController {
	@Autowired
	ShopAndEventService service;

	
	@RequestMapping("shop")
	public String getData(Model model, HttpSession session) {
	
		Object id = session.getAttribute("logId");
		String user_id = (String)id;
		//System.out.println("user_id: " + user_id);
		
		List<ShopDTO> list = service.selectCoupon();
		model.addAttribute("list", list);
		
		List<RegisterDTO> user = service.selectUser(user_id);
		
		
		String balloon = "";
		
		if(user != null && user.size() > 0) {
			
			for(int i = 0 ; i < user.size(); i ++ ) {
				balloon = Integer.toString(user.get(i).getBalloon());
			}
			
			model.addAttribute("balloon" , balloon);
	
		
		}else {
			return "redirect:/register/loginForm";
		}

		return "/shopAndEvent/shop";
		
	}
	@PostMapping("buyCouponOk")
	public ModelAndView buyCouponOk(ShopDTO sDTO, RegisterDTO rDTO, HttpSession session, HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();

		rDTO.setUser_id((String)session.getAttribute("logId"));
		sDTO.setUser_id((String)session.getAttribute("logId"));
		
		//System.out.println(req.getParameter("discount_rate"));
		
		try {
			//System.out.println("S_ID : " + sDTO.getUser_id());
			
			int sResult = service.couponInsertOk(sDTO);
					
			HashMap<String , Object> map = new HashMap<String , Object>();
			
			map.put("id", rDTO.getUser_id());
			map.put("seq", sDTO.getSeq());
			
			int rResult = service.userUpdateOk(map);
			
			
			if(sResult>0 && rResult>0) {
				
				int result = service.balloonUseInsert(map);
				
				List<RegisterDTO> arr = new ArrayList<RegisterDTO>();
				
				arr = service.selectUser(rDTO.getUser_id());
				int a = 0;
				
				if ( arr != null && arr.size() > 0) {
					for ( int idx =0 ; idx < arr.size() ; idx ++ ) {
						a = arr.get(idx).getBalloon();
					}
					session.setAttribute("balloon", a);
				}
				mav.setViewName("redirect:/shopAndEvent/shop");
			}else {
				mav.addObject("msg", "쿠폰구매에 실패하였습니다.\n문의사항은 1:1문의를 이용해주세요.");
				mav.setViewName("shopAndEvent/shopOkResult");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
}







