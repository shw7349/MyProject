package com.green.pboard.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.pboard.dao.CommentDao;
import com.green.pboard.vo.CommentVo;

@Repository
public class CommentDaoImpl implements CommentDao {
/*
	@Inject
	@Autowired
	private  SqlSession sqlSession;

	@Override
	public List<CommentVo> list(Integer idx, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx",idx);
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList("Comment.CommentList", map);
	}

	@Override
	public void insert(CommentVo vo) {
		sqlSession.insert("Comment.CommentInsert",vo);
	}

	@Override
	public void delete(Integer comment_num) {
		sqlSession.delete("Comment.CommentDelete", comment_num);
	}

	@Override
	public int count(int idx) {
		return sqlSession.selectOne("Comment.CommentCounter",idx);
	}
	*/
}
