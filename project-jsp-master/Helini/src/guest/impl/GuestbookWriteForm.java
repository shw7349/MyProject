package guest.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import guest.base.Action;
import guest.dao.GuestbookDao;
import guest.vo.GuestbookVo;

public class GuestbookWriteForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		///gb_no=${guestbook.gb_no}&bnum=${boardVo.bnum}&lvl=${boardVo.lvl}&step=${boardVo.step}&nref=${boardVo.nref}
		String path = "/view/guestbook/GuestbookReply.jsp";

		int gb_no = Integer.parseInt(request.getParameter("gb_no"));
		int bnum  = Integer.parseInt(request.getParameter("bnum"));
		int lvl   = Integer.parseInt(request.getParameter("lvl"));
		int step  = Integer.parseInt(request.getParameter("step"));
		int nref  = Integer.parseInt(request.getParameter("nref"));

		// 메뉴 목록조회
		GuestbookDao guestbookDao  = new GuestbookDao();
		List<GuestbookVo> menuList = guestbookDao.getGuestbookList();
		request.setAttribute("menuList", menuList);

		GuestbookVo guestbookVo = new GuestbookVo();
		guestbookVo.setGb_no(gb_no);
		guestbookVo.setBnum(bnum);
		guestbookVo.setLvl(lvl);
		guestbookVo.setStep(step);
		guestbookVo.setNref(nref);

		request.setAttribute("guestbookVo", guestbookVo);
		request.getRequestDispatcher(path).forward(request, response);

	}

}
