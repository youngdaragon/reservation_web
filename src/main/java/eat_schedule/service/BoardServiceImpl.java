package eat_schedule.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eat_schedule.dao.BoardDAO;
import eat_schedule.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO dao;
	
	@Override
	public int inquiryInsert(HashMap<String, Object> map) {
		return dao.inquiryInsert(map);
	}

	//
	@Override
	public List<BoardDTO> inquiryAllSelect(String user_id) {
		return dao.inquiryAllSelect(user_id);
	}
	@Override
	public BoardDTO inquirySelect(int seq) {
		return dao.inquirySelect(seq);
	}

	@Override
	public BoardDTO inquiryEditSelect(int seq, String user_id) {
		return dao.inquiryEditSelect(seq, user_id);
	}

	@Override
	public String filenameSelect(int seq) {
		return dao.filenameSelect(seq);
	}

	@Override
	public int inquiryDelete(int seq, String user_id) {
		return dao.inquiryDelete(seq, user_id);
	}

	@Override
	public int inquiryEditUpdate(HashMap<String, Object> map) {
		return dao.inquiryEditUpdate(map);
	}

	


}
