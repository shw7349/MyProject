package com.green.pboard.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.green.pboard.service.CommentService;
import com.green.pboard.vo.CommentVo;

@RestController
@RequestMapping("/comment/*")
public class CommentController {
/*
	@Inject
	CommentService commentService;
	
	@RequestMapping("insert.do")
	public void insert(@ModelAttribute CommentVo vo, HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");
		vo.setCommentUser(mem_id);
		commentService.insert(vo);
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam int idx, 
			@RequestParam(defaultValue = "1") int curPage, 
			ModelAndView mav, HttpSession session) {
		int count = commentService.count(idx);
		CommentPager commentPager = new CommentPager(count, curPage);
		int start 	= 	commentPager.getPageBegin();
		int end		=	commentPager.getPageEnd();
		List<CommentVo> list = commentService.list(idx, start, end, session);
		mav.setViewName("PBoard/commentList");
		mav.addObject("list",list);
		mav.addObject("commnetPager", commentPager);
		
		return mav;	
	}
	
	*/
	
}
