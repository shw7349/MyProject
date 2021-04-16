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

public class CommentWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CommentDAO dao = CommentDAO.getInstance();
        CommentVO comment = new CommentVO();
        
        // 파리미터 값을 가져온다.
        int comment_board  = Integer.parseInt(request.getParameter("comment_board"));
        String comment_id  = request.getParameter("comment_id");
        String comment_content = request.getParameter("comment_content");
        
        comment.setComment_num(dao.getSeq());    // 댓글 번호는 시퀀스값으로
        comment.setComment_board(comment_board);
        comment.setComment_id(comment_id);
        comment.setComment_content(comment_content);
        System.out.println("commentWriteAction"); // 오는지 확인
        
        
        
        
        
        
        
        
        
        
        
        boolean result = dao.insertComment(comment);
 
        if(result){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("1");
            out.close();
        }
            
        return null;
    }

}
