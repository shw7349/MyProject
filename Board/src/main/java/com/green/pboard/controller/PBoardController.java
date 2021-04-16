package com.green.pboard.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.pboard.service.PBoardService;
import com.green.pboard.vo.Criteria;
import com.green.pboard.vo.PBoardVo;
import com.green.pboard.vo.Paging;

@Controller
public class PBoardController {
	
	
	@Autowired
	private  PBoardService  pboardService;
	
	
	@RequestMapping("/")
	public  String  home() {
		return "home";     // 이동할 jsp 이름
	}
	
	/*
	 * @RequestMapping(value="/PBoard/List", method=RequestMethod.GET) public String
	 * pboardList ( Model model ) { List<PBoardVo> pboardList =
	 * pboardService.getPBoardList(); model.addAttribute("pboardList", pboardList );
	 * return "list"; }
	 */
	@RequestMapping(value="/PBoard/List", method=RequestMethod.GET)
	public String pboardList(Criteria cri, Model model) {
		List<PBoardVo> pboardList = pboardService.getPBoardList();
		model.addAttribute("pboardList", pboardService.getPBoardList(cri));

		Paging pageMaker = new Paging();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pboardService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "list";
		  }
	
	 @RequestMapping("/PBoard/WriteForm") 
	 public String writeForm( ) {
		 return "writeform"; 
	 }
	 
	 @RequestMapping("/PBoard/Write") 
	 public @ResponseBody String write ( PBoardVo vo ) {
		 
	HashMap<String, Object> map = new HashMap<String, Object>();
	 map.put("mem_id", vo.getMem_id()); 
	 map.put("title", vo.getTitle());
	 map.put("cont", vo.getCont()); 
	 map.put("img_url", vo.getImg_url());
	 map.put("regdate", vo.getRegdate());
	 
	 pboardService.insertPBoard( map );
	 return "ok"; 
	 }
	 
	@RequestMapping("/PBoard/View")
	public  String  view ( int idx, Model model ) {
		
		PBoardVo vo = pboardService.pboardView( idx );
		model.addAttribute("pboard", vo);
		return "view";
		
	}  
	
	@RequestMapping(value="/PBoard/UpdateForm" , method=RequestMethod.GET)
	public  String  updateForm( PBoardVo vo, Model model ) {
		
		model.addAttribute("update", pboardService.read(vo.getIdx()));
		return "update";
	}
	
	@RequestMapping(value="/PBoard/Update", method=RequestMethod.GET)
	public  String  update( PBoardVo vo) {
		
		pboardService.updatePBoard( vo );		
		return "redirect:/PBoard/List";
		
	} 
	
	@RequestMapping("/PBoard/Delete")
	public  String  delete( int idx ) {
		pboardService.deletePBoard( idx );
		return "ok";
		
	}
	
	
}











