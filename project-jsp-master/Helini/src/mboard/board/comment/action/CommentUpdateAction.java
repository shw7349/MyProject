package mboard.board.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.action.Action;
import mboard.board.action.ActionForward;
import mboard.board.model.CommentDAO;
import mboard.board.model.CommentVO;

public class CommentUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			 // 파라미터를 가져온다.
	        int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	        String comment_content = request.getParameter("comment_content");
	        
	        CommentDAO dao = CommentDAO.getInstance();
	        
	        CommentVO comment = new CommentVO();
	        comment.setComment_num(comment_num);
	        comment.setComment_content(comment_content);
	        
	        boolean result = dao.updateComment(comment);
	        
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
	        // 정상적으로 댓글을 수정했을경우 1을 전달한다.
	        if(result) out.println("1");
	        
	        out.close();
	        
	        return null;
	    }

}
