package com.green.pboard.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.pboard.dao.PBoardDao;
import com.green.pboard.service.PBoardService;
import com.green.pboard.vo.Criteria;
import com.green.pboard.vo.PBoardVo;

@Service("pboardService")
public class PBoardServiceImpl implements PBoardService {

	@Autowired
	private   PBoardDao  pboardDao;
	
	@Override
	public List<PBoardVo> getPBoardList() {
		List<PBoardVo> pboardList  = pboardDao.getPBoardList();	
		return   pboardList;
	}
	@Override
	public List<PBoardVo> getPBoardList(Criteria vo) {
		List<PBoardVo> lists = (List<PBoardVo>) pboardDao.getPBoardList(vo);
		return lists;
	}

	@Override
	public void insertPBoard(HashMap<String, Object> map) {
		pboardDao.insertPBoard( map );
		
	}

	@Override
	public PBoardVo pboardView(int idx) {
		
		PBoardVo   vo   =  pboardDao.pboardView(  idx  );
		
		return  vo;
	}

	@Override
	 public void updatePBoard(PBoardVo vo) {
		pboardDao.updatePBoard(vo);
		
	}

	@Override
	public void deletePBoard(int idx) {
		
		pboardDao.deletePBoard( idx );
		
	}

	@Override
	public int listCount() {
		int count = pboardDao.listCount();
		return count;
	}
	@Override
	public PBoardVo read(int idx) {
		return pboardDao.read(idx);
	}



}
