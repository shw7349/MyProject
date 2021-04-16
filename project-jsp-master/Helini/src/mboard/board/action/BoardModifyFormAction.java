package mboard.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.model.BoardDAO;
import mboard.board.model.BoardVO;

public class BoardModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		int id = Integer.parseInt(request.getParameter("id"));	
		//DB 목록 조회
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoard(id);
		request.setAttribute("vo", vo);
		
		//단순 조회이므로 forward() 사용 (db의 상태변화 없으므로)
		forward.setRedirect(false);
		forward.setNextPath("boardModify.do");
		
		return forward;
	}

}
