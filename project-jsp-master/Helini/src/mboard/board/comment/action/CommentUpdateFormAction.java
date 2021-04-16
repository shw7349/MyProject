package mboard.board.comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.action.Action;
import mboard.board.action.ActionForward;
import mboard.board.model.CommentDAO;
import mboard.board.model.CommentVO;

public class CommentUpdateFormAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			System.out.println("지금 CommentUpdateFormAction 왓음");
	        ActionForward forward = new ActionForward();
	        
	        // 수정할 댓글의 글번호를 가져온다.
	        int comment_num = Integer.parseInt(request.getParameter("num"));
	 
	        CommentDAO dao = CommentDAO.getInstance();
	        CommentVO comment = dao.getComment(comment_num);
	        
	        // 댓글 정보를 request에 세팅한다.
	        request.setAttribute("comment", comment);
	        
	        forward.setRedirect(false);
	        forward.setNextPath("/view/mboard/commentUpdateForm.jsp");
	        
	        return forward;
	    }

}
