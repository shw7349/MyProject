package guest.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.base.Action;

public class GuestbookDeleteForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/view/guestbook/GuestbookDeleteForm.jsp";

		// 글번호를 가져온다.
		int gb_no = Integer.parseInt(request.getParameter("gb_no"));
				
		request.setAttribute("gb_no", gb_no);
		
		
		request.getRequestDispatcher(path).forward(request, response);

	}

}
