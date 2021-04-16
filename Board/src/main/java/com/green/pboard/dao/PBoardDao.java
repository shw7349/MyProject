package com.green.pboard.dao;

import java.util.HashMap;
import java.util.List;

import com.green.pboard.vo.Criteria;
import com.green.pboard.vo.PBoardVo;

public interface PBoardDao {
	
	List<PBoardVo> getPBoardList(Criteria vo);
	
	List<PBoardVo> getPBoardList();

	int listCount();

	void insertPBoard(HashMap<String, Object> map);

	PBoardVo pboardView(int idx);

	void updatePBoard(PBoardVo vo);

	void deletePBoard(int idx);

	PBoardVo read(int idx);
	

}
