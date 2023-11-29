package eat_schedule.service;


import java.util.HashMap;
import java.util.List;

import eat_schedule.dto.BoardDTO;


public interface BoardService {
	public int inquiryInsert(HashMap<String, Object> map);
	
	//
	public List<BoardDTO> inquiryAllSelect(String user_id);
	public BoardDTO inquirySelect(int seq);
	public BoardDTO inquiryEditSelect(int seq, String user_id);
	public String filenameSelect(int seq);
	public int inquiryDelete(int seq, String user_id);
	public int inquiryEditUpdate(HashMap<String, Object> map);
}
