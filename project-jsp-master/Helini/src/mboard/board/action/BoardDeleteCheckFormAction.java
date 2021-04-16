package mboard.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.model.BoardDAO;
import mboard.board.model.BoardVO;

public class BoardDeleteCheckFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward forward = new ActionForward();
	
		//DB 목록 조회
		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.getBoardList();
	
		//데이터 조회된 속성에 담기
		request.setAttribute("boardList", list);

		
		//단순 조회이므로 forward() 사용 (db의 상태변화 없으므로)
		forward.setRedirect(false);
		forward.setNextPath("boardDeleteCheck.do");
		
		return forward;
	}

}
