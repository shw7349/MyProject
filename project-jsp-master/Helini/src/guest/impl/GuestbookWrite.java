package guest.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.base.Action;
import guest.dao.GuestbookDao;
import guest.vo.GuestbookVo;

public class GuestbookWrite implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 정보로 저장
		// guestbook_id, guestbook_password, guestbook_content
		// hidden : bnum, lvl, step, nref
		response.setCharacterEncoding("utf-8");

		String gb_id     = request.getParameter("gb_id");		
		String gb_pass = request.getParameter("gb_pass");
		String gb_con  = request.getParameter("gb_con");

		int      bnum    = Integer.parseInt( request.getParameter("bnum"));
		int      lvl     = Integer.parseInt( request.getParameter("lvl"));
		int      step    = Integer.parseInt( request.getParameter("step"));
		int      nref    = Integer.parseInt( request.getParameter("nref"));

		GuestbookVo  guestbookVo  = new GuestbookVo(gb_id, gb_pass, gb_con, bnum, lvl, step, nref);

		GuestbookDao guestbookdao = new GuestbookDao();
		guestbookdao.guestbookInsert(guestbookVo);

		// 메뉴리스트로 이동(조회)한다
		Action action = new GuestbookList();
		action.execute(request, response);

	}
}
