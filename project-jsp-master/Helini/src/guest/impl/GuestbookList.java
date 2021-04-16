package guest.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.dao.GuestbookDao;
import guest.vo.GuestbookVo;
import guest.base.Action;

public class GuestbookList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/view/guestbook/GuestbookForm.jsp";
		
		GuestbookDao guestbookDao      = new GuestbookDao();
		List<GuestbookVo> gbList = guestbookDao.getGuestbookList();
		
		//System.out.println(gbList);
		
		request.setAttribute("gbList", gbList);

		// 페이지 이동
		request.getRequestDispatcher(path).forward(request, response);

	}

}
