package com.green.pboard.service;

import java.util.HashMap;
import java.util.List;

import com.green.pboard.vo.Criteria;
import com.green.pboard.vo.PBoardVo;

public interface PBoardService {
	
	List<PBoardVo> getPBoardList(Criteria vo);
	
	List<PBoardVo> getPBoardList();

	int listCount();
	
	void insertPBoard(HashMap<String, Object> map);

	PBoardVo pboardView(int idx); 

	void deletePBoard(int idx);

	void updatePBoard(PBoardVo vo);

	PBoardVo read(int idx);
	
}
