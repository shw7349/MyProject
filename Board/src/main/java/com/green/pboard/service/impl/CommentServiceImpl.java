package com.green.pboard.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.pboard.dao.CommentDao;
import com.green.pboard.service.CommentService;
import com.green.pboard.vo.CommentVo;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
/*
	@Autowired
	private   CommentDao  commentDao;

	@Override
	public List<CommentVo> list(Integer idx, int start, int end, HttpSession session) {
		List<CommentVo> items = commentDao.list(idx,start, end);
		String mem_id = (String) session.getAttribute("mem_id");
		for(CommentVo vo : items) {
			if(vo.getSecretComment().equals("y")) {
				if(mem_id==null) {
					vo.setComment_content("비밀 댓글입니다.");
				} else {
					String writer = vo.getWriter();
					String commentUser = vo.getCommentUser();
					if(!mem_id.equals(writer)&& !mem_id.equals(commentUser)) {
						vo.setComment_content("비밀 댓글입니다.");
					}
				}
			}
		}
		return items;
	}

	@Override
	public void insert(CommentVo vo) {
		commentDao.insert(vo);
		
	}

	@Override
	public void delete(Integer comment_num) {
		commentDao.delete(comment_num);
		
	}

	@Override
	public int count(int idx) {
		return commentDao.count(idx);
	}
*/
	
}
