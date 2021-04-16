package com.green.pboard.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.pboard.dao.PBoardDao;
import com.green.pboard.vo.Criteria;
import com.green.pboard.vo.PBoardVo;

@Repository("pboardDao")
public class PBoardDaoImpl implements PBoardDao {

	@Autowired
	private  SqlSession sqlSession;
	
	@Override
	public List<PBoardVo> getPBoardList(Criteria vo) {
		return sqlSession.selectList("PBoard.PBoardListWithPaging", vo ); 
	}

	@Override
	public List<PBoardVo> getPBoardList() {
		List<PBoardVo> pboardList = sqlSession.selectList("PBoard.PBoardList");
		return   pboardList;
	}
	
	
	@Override
	public int listCount() {
		return sqlSession.selectOne("PBoard.ListCount");
	}
		
	@Override
	public void insertPBoard(HashMap<String, Object> map) {
		sqlSession.insert("PBoard.PBoardInsert", map);		
	}

	@Override
	public PBoardVo pboardView(int idx) {
		PBoardVo vo =  sqlSession.selectOne("PBoard.PBoardView", idx );
		return   vo;
	}

	@Override
	public void updatePBoard(PBoardVo vo) {
		
		sqlSession.update("PBoard.PBoardUpdate", vo );
	}

	@Override
	public void deletePBoard(int idx) {
		
		sqlSession.delete("PBoard.PBoardDelete", idx );
		
	}

	@Override
	public PBoardVo read(int idx) {
		return sqlSession.selectOne("PBoard.Read", idx);
	}



}









