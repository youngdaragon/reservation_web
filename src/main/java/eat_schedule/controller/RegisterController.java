package eat_schedule.controller;



import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import eat_schedule.dto.RegisterDTO;
import eat_schedule.service.RegisterService;


@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	RegisterService service;
	
	
	@Autowired
	JavaMailSender mailSender;

	
	// 로그인
	@GetMapping("loginForm")
	public String login() {
		return "register/loginForm";
	}
	
	@PostMapping("loginOk")
	public ModelAndView loginOk(@RequestParam("user_id")String user_id, @RequestParam("user_password")String user_password,
								HttpServletRequest request, HttpSession session ,HttpServletResponse res) {
		
		//System.out.println(user_id);
		//System.out.println(user_password);
		
		RegisterDTO dto = service.loginOk(user_id, user_password);
		
		ModelAndView mav = new ModelAndView();
		
		if(dto!=null) {
			session.setAttribute("logId", dto.getUser_id());
			session.setAttribute("logName", dto.getUser_name());
			session.setAttribute("balloon", dto.getBalloon());
			session.setAttribute("logStatus", "Y");
			session.setAttribute("isOwner", dto.getIs_owner());
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:loginForm");
		}
		return mav;
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout() {
		return "register/logout";
	}
	/*
	// 로그아웃
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	*/
	
	// 회원가입 폼
	@GetMapping("/joinForm")
	public String join() {
		return "register/joinForm";
	}
	
	// 아이디 중복검사
	@GetMapping("idCheck")
	public String idCheck(String user_id, Model model) {

		int result = service.idCheckCount(user_id);

		model.addAttribute("user_id", user_id);
		model.addAttribute("result", result);
		
		return "register/idCheck";
	}
	// 닉네임 중복검사
	@GetMapping("nicknameCheck")
	public String nicknameCheck(String nickname, Model model) {

		int result = service.nicknameCheckCount(nickname);

		model.addAttribute("nickname", nickname);
		model.addAttribute("result", result);
		
		return "register/nicknameCheck";
	}
	
	
	// 회원가입
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk(RegisterDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		int result = service.registerInsert(dto);
		
		if(result>0) {// 성공
			mav.setViewName("redirect:loginForm");
			String user_id = dto.getUser_id();
			int result2 = service.balloonGetInsert(user_id);
		}else {
			mav.addObject("msg", "회원등록을 실패하였습니다.\n다시 시도해주세요.");
			mav.setViewName("register/joinOkResult");
		}	
		return mav;
	}

	
	// 아이디 찾기
	@GetMapping("idSearchForm")
	public String idSearchForm() {
		return "register/idSearchForm";
	}

	//아이디 찾기
	@PostMapping("idSearchEmailSend")
	@ResponseBody
	public String idSearchEmailSend(RegisterDTO dto) {
		
		
		
		System.out.println("dto : " + dto.getUser_name());
		System.out.println("dtoo : " + dto.getEmail());
		
		String user_id = service.idSearch(dto.getUser_name(), dto.getEmail());
		
		System.out.println("user_id : " + user_id);
		
		if(user_id==null || user_id.equals("")){
			return "N";
		}else{
			String emailSubject = "아이디 찾기 결과";
			String emailContent = "<div style=margin:50px; padding:50px; border:2px solid gray; font-size:2em; text-align:center;>";
			emailContent += "<b>MUKSCHEDULE</b><br/>아이디찾기 검색결과입니다.<br/>";
			emailContent += "아이디: "+user_id;
			emailContent += "</div>"; 
			
			try {
				// mimeMessage -> mimeMessageHelper
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				// 보내는 메일주소
				messageHelper.setFrom("guswldbs98@naver.com");
				// 받는 쪽
				messageHelper.setTo(dto.getEmail());
				messageHelper.setSubject(emailSubject);
				messageHelper.setText("text/html; charset=UTF-8", emailContent);
				
				mailSender.send(message); // 보내기
				
				return "Y";
			}catch(Exception e) {
				e.printStackTrace();
				return "N";
			}
		}
	}
	
	// 비밀번호 찾기
	@GetMapping("passwordSearchForm")
	public String passwordSearchForm() {
		return "register/passwordSearchForm";
	}
	
	//비밀번호 찾기
		@PostMapping("passwordSearchEmailSend")
		@ResponseBody
		public String passwordSearchEmailSend(RegisterDTO dto) {
			
			String user_password = service.passwordSearch(dto.getUser_name(), dto.getEmail(), dto.getUser_id());
				
			if(user_password==null || user_password.equals("")){
				return "N";
			}else{
				String emailSubject = "비밀번호 찾기 결과";
				String emailContent = "<div style=margin:50px; padding:50px; border:2px solid gray; font-size:2em; text-align:center;>";
				emailContent += "<b>MUKSCHEDULE</b><br/>비밀번호찾기 검색결과입니다.<br/>";
				emailContent += "비밀번호: "+user_password;
				emailContent += "</div>"; 
				
				try {
					// mimeMessage -> mimeMessageHelper
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
					
					// 보내는 메일주소
					messageHelper.setFrom("guswldbs98@naver.com");
					// 받는 쪽
					messageHelper.setTo(dto.getEmail());
					messageHelper.setSubject(emailSubject);
					messageHelper.setText("text/html; charset=UTF-8", emailContent);
					
					mailSender.send(message); // 보내기
					
					return "Y";
				}catch(Exception e) {
					e.printStackTrace();
					return "N";
				}
			}
		}
		
	// 전화번호 인증번호 요청 
	@RequestMapping(value = "/smssend", method = RequestMethod.POST)
	public @ResponseBody String getData(@RequestParam("phone_number") String toPerson,
										@RequestParam("randomNum") String randomNum) {

		final String client_service_id = "ncp:sms:kr:304995613909:sms_test";
		final String request_uri        = "https://sens.apigw.ntruss.com/sms/v2/services/";
		final String client_access_key = "5AKpLpuxf6FTVT2aXNEJ";
		final String client_secret_key = "qdhBX0LB185vxFicRumQK8xxurFF4LWV906wkbmG";

		String msg = "";
		
		try {
			StringBuffer str = new StringBuffer();
			
			str.append(request_uri);
			str.append(client_service_id);
			str.append("/messages");
			
			String aa = "/sms/v2/services/" + client_service_id + "/messages";
			
			URL url = new URL(str.toString());
			HttpURLConnection httpURLConnection = (HttpURLConnection)url.openConnection();
			
			Long time = System.currentTimeMillis();
			
			String key = makeSignature(aa, time.toString(), "POST", client_access_key, client_secret_key);
		    	
			// JSON 을 활용한 body data 생성
			JSONObject bodyJson = new JSONObject();
			JSONObject toJson = new JSONObject();
		    JSONArray  toArr = new JSONArray();

		    //toJson.put("subject","");							// Optional, messages.subject	개별 메시지 제목, LMS, MMS에서만 사용 가능
		    //toJson.put("content","sms test in spring 111");	// Optional, messages.content	개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		    toJson.put("to",toPerson);							// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
		    toArr.put(toJson);
		    
		    bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
		    bodyJson.put("from","01038231933");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능
		    bodyJson.put("content", "[MUKSCHEDULE] 인증번호는 " + randomNum + "입니다.");	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		    bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
		    
		    String body = bodyJson.toString();
					    
			
			httpURLConnection.setRequestMethod("POST");
			httpURLConnection.setDoInput(true);
			httpURLConnection.setDoOutput(true);
			httpURLConnection.setReadTimeout(10000);
			httpURLConnection.setConnectTimeout(10000);
			httpURLConnection.setRequestProperty("content-type", "application/json");
			httpURLConnection.setRequestProperty("x-ncp-apigw-timestamp", time.toString());
			httpURLConnection.setRequestProperty("x-ncp-iam-access-key", client_access_key);
			httpURLConnection.setRequestProperty("x-ncp-apigw-signature-v2", key);
			
			DataOutputStream wr = new DataOutputStream(httpURLConnection.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();
			
	        // 요청에 대한 응답 받기
	        int responseCode = httpURLConnection.getResponseCode();
	        
	        BufferedReader in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));

	        if(responseCode == 200 || responseCode == 202) {
	        	
		        String inputLine;
		        
		        StringBuffer response = new StringBuffer();
		        while ((inputLine = in.readLine()) != null) {
		            response.append(inputLine);
		        }
		        in.close();
	        
	        }
	
	        switch(responseCode){
	        	
		        case 200 :
		        case 202 :
		        	msg = "인증번호를 발송했습니다 ! ";
		        	break;
		        case 400 :
		        	msg = "Bad Request";
		        	break;
		        case 401 :
		        	msg = "Unauthorized";
		        	break;
		        case 403 :
		        	msg = "Forbidden";
		        	break;
		        case 404 :
		        	msg = "Not Found";
		        	break;
		        case 429 :
		        	msg = "Too Many Requests";
		        	break;
		        case 500 :
		        	msg = "Internal Server Error";
		        	break;
		        default :
		        	msg = "System Error";
		        	break;
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	
	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) {
	    String space = " ";                    // one space
	    String newLine = "\n";                 // new line
	    

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (Exception e) {
			encodeBase64String = e.toString();
		}
	  return encodeBase64String;
	}
		
		
		
		

}
