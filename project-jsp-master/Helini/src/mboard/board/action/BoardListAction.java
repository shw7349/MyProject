package mboard.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.model.BoardDAO;
import mboard.board.model.BoardVO;

public class BoardListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		//list?f=title&q=a //검색
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		//페이지
		String page_ = request.getParameter("p");
		
		String field = "title";
		if (field_ != null && !field_.equals("")) {
			field = field_;
		}
		String query = "";
		if (query_ != null && !query_.equals("")) {
			query = query_;
		}
		int page = 1;
		if (page_ != null && !page_.equals("")) {
			page = Integer.parseInt(page_);
		}
		
		BoardDAO dao = new BoardDAO();
		List<BoardVO>  BoardList  = dao.getBoardList(field, query, page); 
	
		int count = dao.getBoardCount(field, query);
		
		request.setAttribute("BoardList", BoardList);
		
		request.setAttribute("count",count);
		
		//단순 조회이므로 forward() 사용 (db의 상태변화 없으므로)
		forward.setRedirect(false);
		forward.setNextPath("boardList.do");
		
		return forward;
	}
}
