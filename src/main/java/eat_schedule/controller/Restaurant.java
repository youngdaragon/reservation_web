package eat_schedule.controller;

import eat_schedule.dao.UserDAO;
import eat_schedule.dao.WishDAO;
import eat_schedule.dto.*;
import eat_schedule.mapper.*;
import eat_schedule.service.EmailService;
import eat_schedule.service.FindStore;
import eat_schedule.service.UpdateReservation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import java.util.List;

@RequestMapping("/restaurant")
@Controller
@Slf4j
@RequiredArgsConstructor
public class Restaurant {

    private final FindStore findStore;
    private final MenuMapper menuMapper;
    private final ReviewMapper reviewMapper;
    private final UpdateReservation updateReservation;
    private final CouponMapper couponMapper;
    private final EmailService emailService;
    private final WishDAO wishMapper;
    private final Reservation reservation;
    private final ImgMapper imgMapper;
    private final JavaMailSender mailSender;

    private final ReservationMapper reservationMapper;



    @GetMapping("/{seq}")
    public String showRestaurant(@PathVariable int seq,
                                 @SessionAttribute(value = "logId", required = false) String user_id,
                                 Model model){

        Store store = findStore.findStoreBySeq(seq);

        StringBuilder facility = facility(store);

        model.addAttribute("img", imgMapper.findImg(seq));

        model.addAttribute("facility", facility);
        List<Review> review = reviewMapper.findAllReviewByStore(seq);
        for (Review review1 : review) {
            System.out.println();
            System.out.println(review1.getFile_location());
            System.out.println();
        }
        model.addAttribute("reviews", review);

        model.addAttribute("avgScore", reviewMapper.findAvgScore(seq));

        model.addAttribute("menus", menuMapper.findMenu(seq));

        model.addAttribute("type", menuMapper.findMenuType(seq));

        model.addAttribute("store", store);

        List<WishDTO> wish = wishMapper.WishSelectSpecific(user_id, seq);
        int wishChk;
        if(wish.size()==0){
            wishChk=0;
        }
        else {
            wishChk=1;
        }

        model.addAttribute("wish", wishChk);

        model.addAttribute("coupon", couponMapper.findCoupon(user_id, seq));

        return "thymeleaf/store";
    }

    //예약임.
    @PostMapping("/{seq}")
    public String showRestaurant(@PathVariable int seq,
                                 @SessionAttribute(value = "logStatus", required = false) String login,
                                 @SessionAttribute("logId") String user_id,
                                 @RequestParam("date") String date,
                                 @RequestParam("time") String time,
                                 @RequestParam("coupon") String coupon,
                                 @RequestParam("people") String people,
                                 @RequestParam(value = "comment", required = false) String comment,
                                 Model model){
        if(!login.equals("Y")){
            return "redirect:/register/loginForm";//로그인페이지 url
        }
        reservation.setUser_id(user_id);
        reservation.setStore_seq(seq);
        Integer coupon1 = Integer.parseInt(coupon);
        reservation.setCoupon(coupon1);
        Integer people1 = Integer.parseInt(people);
        reservation.setNumber_of_people(people1);
        reservation.setReservation_status("예약");
        if(comment==null){
            comment="예약";
        }
        String time1;
        reservation.setReservation_comment(comment);
        if(time.length()==7){
            time1 = String.valueOf(Integer.parseInt(time.substring(0,1))+12)+":00:00";
        }
        else {
            time1 = time.substring(0,2)+":00:00";
        }
        String dateTime = date+" "+time1;
        reservation.setReservation_time(dateTime);
        model.addAttribute("reservation", reservation);

        updateReservation.updateReservation(reservation);

        reservationMapper.balloonUpdate(user_id);

        reservationMapper.balloonHistoryUpdate(user_id);

//        mailSendToUser(reservation);
//
//        mailSendToOwner(reservation);

        return "redirect:/user/user/myReservation";
    }

//    private void mailSendToUser(Reservation reservation) {
//        UserDTO user = userMapper.UserSelect(reservation.getUser_id());
//
//        Store store = findStore.findStoreBySeq(reservation.getStore_seq());
//
//        mail.setTitle(user.getUser_name()+"님 "+store.getStore_name()+"의 예약이 완료되었습니다.");
//        mail.setAddress(user.getEmail());
//        mail.setMessage(user.getUser_name()+"님\n"+ reservation.getReservation_time()+" "+store.getStore_name()+"의 예약이 완료되었습니다.\n"+"확인하러 가기 "+"localhost:8080/user/mypage/reservation");
//        emailService.sendEmail(mail);
//    }
//    private void mailSendToOwner(Reservation reservation) {
//        String ownerId = findStore.findStoreBySeq(reservation.getStore_seq()).getOwner_id();
//        UserDTO owner = userMapper.UserSelect(ownerId);
//        Store store = findStore.findStoreBySeq(reservation.getStore_seq());
//
//        mail.setTitle(owner.getUser_name()+"님 "+store.getStore_name()+"에 새로운 예약이 들어왔습니다.");
//        mail.setAddress(owner.getEmail());
//        mail.setMessage(owner.getUser_name()+"님\n"+ reservation.getReservation_time()+" "+store.getStore_name()+"의 예약이 들어왔습니다.\n"+"확인하러 가기 "+"localhost:8080/user/mypage/reservation");
//        emailService.sendEmail(mail);
//    }


    private static StringBuilder facility(Store store) {
        StringBuilder sb = new StringBuilder();
        if(store.isParking()) sb.append("주차가능");
        if(store.isAnimal()) sb.append("애완동물 동반, ");
        if(store.isGroup_customer()) sb.append("단체석, ");
        if(store.isPlayroom()) sb.append("놀이방, ");
        if(store.isDisabled()) sb.append("장애인편의시설, ");
        if(store.isWifi()) sb.append("무선 인터넷");
        return sb;
    }

//    String emailSubject = "아이디 찾기 결과";
//    String emailContent = "<div style=margin:50px; padding:50px; border:2px solid gray; font-size:2em; text-align:center;>";
//    emailContent += "<b>MUKSCHEDULE</b><br/>아이디찾기 검색결과입니다.<br/>";
//    emailContent += "아이디: "+user_id;
//    emailContent += "</div>";
//
//			try {
//        // mimeMessage -> mimeMessageHelper
//        MimeMessage message = mailSender.createMimeMessage();
//        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//
//        // 보내는 메일주소
//        messageHelper.setFrom("guswldbs98@naver.com");
//        // 받는 쪽
//        messageHelper.setTo(dto.getEmail());
//        messageHelper.setSubject(emailSubject);
//        messageHelper.setText("text/html; charset=UTF-8", emailContent);
//
//        mailSender.send(message); // 보내기
//
//        return "Y";
//    }catch(Exception e) {
//        e.printStackTrace();
//        return "N";
//    }

}
