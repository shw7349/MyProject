package guest.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.base.Action;
import guest.dao.GuestbookDao;
import guest.vo.GuestbookVo;

public class GuestbookUpdateForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gb_no = request.getParameter("gb_no");
		
		// 수정할 데이터를 조회
		GuestbookDao guestbookDao =  new GuestbookDao();
		GuestbookVo  guestbookVo  =  guestbookDao.getBook(gb_no);
		
		// 수정할 데이터 저장(attribute)
		request.setAttribute("guestbookVo", guestbookVo);
		
		// 수정할 데이터를 입력받는 화면으로 이동
		String path = "/view/guestbook/GuestbookUpdateForm.jsp";
		request.getRequestDispatcher(path).forward(request, response);

	}

}
