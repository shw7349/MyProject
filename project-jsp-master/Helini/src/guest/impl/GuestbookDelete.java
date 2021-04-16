package guest.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.base.Action;
import guest.dao.GuestbookDao;
import guest.vo.GuestbookVo;

public class GuestbookDelete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//넘어온 정보로 저장
		response.setCharacterEncoding("utf-8");
		String reqgb_no = request.getParameter("gb_no");
		int    gb_no	= Integer.parseInt(reqgb_no);
		String gb_pass  = request.getParameter("gb_pass");

		GuestbookDao guestbookDao = new GuestbookDao();
		GuestbookVo  guestbookVo = new GuestbookVo();

		guestbookVo.setGb_no(gb_no);
		guestbookVo.setGb_pass(gb_pass);

		guestbookDao.guestbookDelete(guestbookVo);

		String path = "/view/guestbook/DeleteMessage.jsp";
		request.getRequestDispatcher(path).forward(request, response);


	}

}
