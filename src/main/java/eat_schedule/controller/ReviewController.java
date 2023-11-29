package eat_schedule.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import eat_schedule.dto.AvgScoreDTO;
import eat_schedule.dto.ReviewDTO;
import eat_schedule.dto.ReviewFileDTO;
import eat_schedule.dto.WishDTO;
import eat_schedule.service.ReviewService;

@Controller
@RequestMapping("/user")
public class ReviewController {
	@Autowired
	ReviewService service;
	
	// 리뷰 목록 불러오기
	@GetMapping("user/myReview")
	public ModelAndView myReview(HttpSession session) { 
		ModelAndView mav = new ModelAndView();
		List<ReviewDTO> list = service.ReviewSelect((String)session.getAttribute("logId"));
		mav.addObject("list", list);
		mav.setViewName("user/user/myReview");	
		return mav;
		}

	// 리뷰 쓰기 저장 (DB)
	@PostMapping("user/ReviewWriteOk")
	public ModelAndView ReviewWriteOk(HttpServletRequest request, ReviewDTO dto, MultipartHttpServletRequest mul) {
		
		dto.setUser_id((String)request.getSession().getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)request;
		
		MultipartFile fi = mul.getFile("filename");
		String file = fi.getOriginalFilename();
		
		if(file.equals("") || file.length() <= 0) {
			file = null;
		}
		
		List<MultipartFile> files = mul.getFiles("filename");
		
		String path = request.getSession().getServletContext().getRealPath("/uploadfile");
		List<ReviewFileDTO> fileList = new ArrayList<ReviewFileDTO>();
		if(files!=null) {
			for(int i=0; i<files.size(); i++) {
				MultipartFile mf = files.get(i);
				
				String orgFilename = mf.getOriginalFilename();
				if(orgFilename!=null && !orgFilename.equals("")) {
					File f = new File(path, orgFilename);
					
					if(f.exists()) {
						for(int renameNum=1; ; renameNum++) {
							
							int point = orgFilename.lastIndexOf("."); // 마지막 .의 위치
							String orgFile = orgFilename.substring(0, point); // 확장자를 뺀 파일명
							String orgExt = orgFilename.substring(point+1); // 확장자
						
							String newFilename = orgFile+" ("+renameNum+")."+orgExt;
							f = new File(path, newFilename);
							if(!f.exists()) {
								orgFilename = newFilename;
								break;
							}
						}
						
					}
					try {
						mf.transferTo(new File(path, orgFilename));
					}catch(Exception e) {
						e.printStackTrace();
					}
					ReviewFileDTO rfDTO=new ReviewFileDTO();
					rfDTO.setFilename(orgFilename);
					fileList.add(rfDTO);
				}			
			}
		}
		String fileName;
		String location;
		if(fileList.size()!=0) {
			fileName=fileList.get(0).getFilename();
			dto.setFile_location("/uploadfile/"+fileName);
			System.out.println(dto.getFile_location());	
			location="/uploadfile/"+fileName;
		}	
		else {
			fileName="";
			location="";
			
		}
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("id", dto.getUser_id());
			map.put("store_seq", dto.getStore_seq());
			map.put("score", dto.getScore());
			map.put("review", dto.getReview());
			map.put("filename", file);
			map.put("location", location);
			int result = service.ReviewInsert(map);	
			
			// 평점 평균, 리뷰 총 개수 update
			double avg_score = service.AvgScore(dto.getStore_seq());
			int count = service.ReviewCount(dto.getStore_seq());
			
			AvgScoreDTO avgDTO = new AvgScoreDTO();
			avgDTO.setStore_seq(dto.getStore_seq());
			avgDTO.setAvg_score(avg_score);
			avgDTO.setCount(count);
			
			int cnt = service.WishUpdate(avgDTO);
			
			System.out.println(dto.getStore_seq());
			System.out.println(avg_score);
			System.out.println(count);
			System.out.println(cnt);
			
			mav.setViewName("redirect:/user/user/myReview");

		return mav;	

	}
	
	// 리뷰 수정
	@GetMapping("user/reviewEdit")
	public ModelAndView ReviewEditForm(Integer no) {
		ModelAndView mav = new ModelAndView();
		
		ReviewDTO dto = service.ReviewEdit(no);
		mav.addObject("dto", dto);
		mav.setViewName("user/user/reviewEditForm");
		
		return mav;
	}
	// 업로드 파일 삭제
	public void fileDelete(String path, String filename) {
		File f = new File(path, filename);
		f.delete();
	}   
		
	// 리뷰 수정 저장(DB)
	@PostMapping(value="user/reviewEditOk")
	public ModelAndView ReviewEditOk(HttpServletRequest request, ReviewDTO dto) {
		
		String before_filename=request.getParameter("before_filename");
		
		dto.setUser_id((String)request.getSession().getAttribute("logId"));
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)request;
		
		ModelAndView mav = new ModelAndView();
		
		if(mr.getFiles("filename")!=null) {
			List<MultipartFile> files = mr.getFiles("filename");
			
			String path = request.getSession().getServletContext().getRealPath("/uploadfile");
			
			try {
				fileDelete(path, before_filename);
				}
				catch(Exception e) {
					System.out.println("삭제안됨");
				}
			
			List<ReviewFileDTO> fileList = new ArrayList<ReviewFileDTO>();
			if(files!=null) {
				for(int i=0; i<files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgFilename = mf.getOriginalFilename();
					if(orgFilename!=null && !orgFilename.equals("")) {
						File f = new File(path, orgFilename);
						
						if(f.exists()) {
							for(int renameNum=1; ; renameNum++) {
								
								int point = orgFilename.lastIndexOf("."); // 마지막 .의 위치
								String orgFile = orgFilename.substring(0, point); // 확장자를 뺀 파일명
								String orgExt = orgFilename.substring(point+1); // 확장자
							
								String newFilename = orgFile+" ("+renameNum+")."+orgExt;
								f = new File(path, newFilename);
								if(!f.exists()) {
									orgFilename = newFilename;
									break;
								}
							}
						}
						try {
							mf.transferTo(new File(path, orgFilename));
						}catch(Exception e) {
							e.printStackTrace();
						}
						ReviewFileDTO rfDTO=new ReviewFileDTO();
						rfDTO.setFilename(orgFilename);
						fileList.add(rfDTO);
					}			
				}		
			}
			if(fileList.size()!=0) {
				String fileName=fileList.get(0).getFilename();
				dto.setFile_location("/uploadfile/"+fileName);
				System.out.println(dto.getFile_location());
			}	
		}
		// 평점 평균, 리뷰 총 개수 update
		double avg_score = service.AvgScore(dto.getStore_seq());
		int count = service.ReviewCount(dto.getStore_seq());
		
		AvgScoreDTO avgDTO = new AvgScoreDTO();
		avgDTO.setStore_seq(dto.getStore_seq());
		avgDTO.setAvg_score(avg_score);
		avgDTO.setCount(count);
		
		int cnt = service.WishUpdate(avgDTO);
		
		System.out.println(dto.getStore_seq());
		System.out.println(avg_score);
		System.out.println(count);
		System.out.println(cnt);
					
		int result=service.ReviewEditUpdate(dto);
		
		if(result>0) {
			mav.setViewName("redirect:/user/user/myReview");
			
		}else {
			mav.addObject("msg", "리뷰수정실패");
			mav.setViewName("user/user/joinOkResult");
		}
		
		return mav;
		
	}
	
	// 리뷰 삭제
	@GetMapping("user/reviewDel")
	public ModelAndView reviewDel(int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		int result = service.ReviewDelete(no);
		
		if(result>0) {
			mav.setViewName("redirect:/user/user/myReview"); //리뷰등록 성공
		}else {
			mav.addObject("msg", "리뷰 삭제 실패");
			mav.setViewName("user/user/joinOkResult");	// 리뷰 등록 실패
		}
		return mav;
	}
}
