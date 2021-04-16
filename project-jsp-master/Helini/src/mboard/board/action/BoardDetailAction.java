package mboard.board.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.model.BoardDAO;
import mboard.board.model.BoardVO;
import mboard.board.model.CommentDAO;
import mboard.board.model.CommentVO;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		BoardDAO dao = new BoardDAO();
		
		//조회수 +1
		int id_ = Integer.parseInt(request.getParameter("id"));
		dao.countBoard(id_);
		
		//리스트
		int id = Integer.parseInt(request.getParameter("id"));	
		
		BoardVO vo = dao.getBoard(id);
		request.setAttribute("vo", vo);
		
		System.out.println("!!!!!!!!!!!!!!!!!!");
		//COMMENT
		// 게시글 번호를 이용하여 해당 글에 있는 댓글 목록을 가져온다.
		int idx = Integer.parseInt(request.getParameter("id"));
		System.out.println(idx);
        CommentDAO commentDAO = CommentDAO.getInstance();
        ArrayList<CommentVO> commentList = commentDAO.getCommentList(idx);
		System.out.println("~~~~~~~~~~~~~~~~~~"+commentList);

        // 댓글이 1개라도 있다면 request에 commentList를 세팅한다.
        if(commentList.size() > 0) {
        	request.setAttribute("commentList", commentList);       
        }
        
		System.out.println("~~~~~~~~~~~~~~~~~~");
		
		
		//단순 조회이므로 forward() 사용 (db의 상태변화 없으므로)
		forward.setRedirect(false);
		forward.setNextPath("boardDetail.do");
		
		return forward;
	}

}
