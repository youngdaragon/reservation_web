package eat_schedule.controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import eat_schedule.dto.BoardDTO;
import eat_schedule.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService service;
	
	@GetMapping("FAQ")
	public String faq() {
		return "board/FAQ";
	}
	
	@GetMapping("inquiry")
	public String inquiry(HttpSession session) {
		
		Object id = session.getAttribute("logId");
		String user_id = (String)id;
		
		if(user_id=="" || user_id==null) {
			return "redirect:/register/loginForm";
		}else {
			return "board/inquiry";
		}	
	}
	
	
	@PostMapping("inquiryWriteOk")
	public ModelAndView inquiryWriteOk(HttpServletRequest req, BoardDTO dto , MultipartHttpServletRequest mureq) {
		
		dto.setUser_id((String)req.getSession().getAttribute("logId"));
		ModelAndView mav = new ModelAndView();
		
		MultipartFile ss = mureq.getFile("filename");
		String ff = ss.getOriginalFilename();
		
		if(ff.equals("") || ff.length() <= 0) {
			ff = null;
		}
		
		List<MultipartFile> files = mureq.getFiles("filename");
		
		
		String path = req.getSession().getServletContext().getRealPath("/uploadfile");
		//System.out.println("path: " + path); 
		
		if(files!=null){// 업로드 파일이 있을때
			for(int i=0; i<files.size(); i++) {
				MultipartFile mf = files.get(i);
				
				String orgFilename = mf.getOriginalFilename(); // 원래의 파일명
				if(orgFilename!=null && !orgFilename.equals("")) {// rename
					
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
				}
			}
		}
		try {
			HashMap<String , Object> map = new HashMap<String , Object>();
			
			map.put("id", dto.getUser_id());
			map.put("title", dto.getQuestion_title());
			map.put("content", dto.getQuestion());
			map.put("filename", ff);
			map.put("location", path);
			
			int result = service.inquiryInsert(map);
			
			mav.setViewName("redirect:/board/inquiryList"); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;	
	}
	
		// 업로드 파일 삭제
		public void fileDelete(String path, String filename) {
			File f = new File(path, filename);
			f.delete();
		}
	
	
		// 마이페이지 1:1문의 리스트보기
		@RequestMapping("inquiryList")
		public ModelAndView inquiryList(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			List<BoardDTO> list = service.inquiryAllSelect((String)session.getAttribute("logId"));
			
			mav.addObject("list", list);
			mav.setViewName("/board/inquiryList");
			
			return mav;
		}
		
		// 1:1문의 보기
		@GetMapping("inquiryView/{seq}")
		public ModelAndView inquiryView(@PathVariable("seq") int seq) {
			ModelAndView mav = new ModelAndView();
			
			BoardDTO dto = service.inquirySelect(seq);
			
			String fn = service.filenameSelect(seq);
			mav.addObject("filename" , fn);
			
			mav.addObject("dto", dto);
			
			mav.setViewName("/board/inquiryView");
			
			return mav;
		}
		
		// 1:1문의 수정 폼
		@GetMapping("inquiryEdit/{seq}")
		public ModelAndView inquiryEdit(@PathVariable("seq") int seq, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			BoardDTO dto = service.inquiryEditSelect(seq, (String)session.getAttribute("logId"));
			
			if(dto==null) {
				mav.setViewName("redirect:inquiryView/"+seq);
			}else {
				// 첨부파일
				String fn = service.filenameSelect(seq);
				
				mav.addObject("dto", dto);
				mav.addObject("filename" , fn);
				//mav.addObject("fileList", fileList);
				//mav.addObject("fileCount", fileList.size());
			
				// 수정폼으로 이동
				mav.setViewName("/board/inquiryEdit");
			}
			return mav;
		}
		
		// 1:1문의 수정(DB)
		@PostMapping("inquiryEditOk")
		public ModelAndView inquiryEditOk(HttpServletRequest req, BoardDTO dto , MultipartHttpServletRequest mureq,
										  HttpSession session) {

			String before_filename = req.getParameter("before_filename");
			
			dto.setUser_id((String)req.getSession().getAttribute("logId"));
			ModelAndView mav = new ModelAndView();
			
			MultipartFile ss = mureq.getFile("filename");
			String ff = ss.getOriginalFilename();
			
			if(ff.equals("") || ff.length() <= 0) {
				ff = null;
			}
			
			List<MultipartFile> files = mureq.getFiles("filename");
			 
			
			
			String path = req.getSession().getServletContext().getRealPath("/uploadfile");
			System.out.println("path: " + path); 
			
			if(files!=null){// 업로드 파일이 있을때
				for(int i=0; i<files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgFilename = mf.getOriginalFilename(); // 원래의 파일명
					if(orgFilename!=null && !orgFilename.equals("")) {// rename
						
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
					}
				}
			}
			try {
				HashMap<String , Object> map = new HashMap<String , Object>();
				
				map.put("seq", dto.getSeq());
				map.put("id", dto.getUser_id());
				map.put("title", dto.getQuestion_title());
				map.put("content", dto.getQuestion());
				map.put("filename", ff);
				map.put("location", path);
				
				int result = service.inquiryEditUpdate(map);
				
				
				List<BoardDTO> list = service.inquiryAllSelect((String)session.getAttribute("logId"));
				
				mav.addObject("list", list);
				
				mav.setViewName("redirect:/board/inquiryList"); 
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			 
			if(before_filename!= null && ff != null && !before_filename.equals(ff)) {
				fileDelete(path, before_filename);
			}
			
			return mav;
			
		}
		
		// 1:1문의 삭제
		@GetMapping("inquiryDelete")
		public ModelAndView inquiryDel(@RequestParam int seq, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			
			String path = session.getServletContext().getRealPath("/uploadfile");
			
			String filename = service.filenameSelect(seq);
			
			int result = service.inquiryDelete(seq, (String)session.getAttribute("logId"));
	
			if(result>0) {
				fileDelete(path, filename);
				mav.setViewName("redirect:inquiryList");
			}else {
				mav.setViewName("redirect:inquiryView/"+seq);
			}
			return mav;
			
		}
		
		
}

