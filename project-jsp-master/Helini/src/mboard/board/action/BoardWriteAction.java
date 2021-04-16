package mboard.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.model.BoardDAO;

public class BoardWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();
		
		String title = request.getParameter("title");
		String writer_id = request.getParameter("writer_id");
		String content = request.getParameter("content");
		
		//DB 목록 조회
		BoardDAO dao = new BoardDAO();
		dao.writeBoard(title, writer_id, content);
		
		forward.setRedirect(false);
		forward.setNextPath("BoardListAction.do");
		
		return forward;
	}

}
