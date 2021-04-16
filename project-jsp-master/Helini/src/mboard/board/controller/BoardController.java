package mboard.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mboard.board.action.Action;
import mboard.board.action.ActionForward;
import mboard.board.action.BoardDeleteAction;
import mboard.board.action.BoardDeleteCheckAction;
import mboard.board.action.BoardDeleteCheckFormAction;
import mboard.board.action.BoardDetailAction;
import mboard.board.action.BoardListAction;
import mboard.board.action.BoardModifyAction;
import mboard.board.action.BoardModifyFormAction;
import mboard.board.action.BoardWriteAction;
import mboard.board.model.BoardDAO;

@WebServlet("*.do")

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	BoardDAO boardDAO = null;
	
	public void init() throws ServletException {
		boardDAO = new BoardDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어온 커맨드를 추출하는 과정
        String requestURI = request.getRequestURI();
        int cmdIdx = requestURI.lastIndexOf("/")+1;
        
        String command = requestURI.substring(cmdIdx);
        
        // URI, command 확인
        System.out.println("requestURI : "+requestURI);
        System.out.println("command : "+command);
        System.out.println("boardController");
        ActionForward forward = null;
        Action action = null;
        
        // 보여줄 화면 URL
        String form = "/view/mboard/";
        // 커맨드에 해당하는 액션을 실행한다.
        try {
            // 화면전환
            if(command.equals("boardList.do")) // 게시판리스트 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"boardList.jsp");
            }
            else if(command.equals("mainForm.do"))    // 첫화면이동 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("index.jsp");
            }
            else if(command.equals("boardDetail.do"))    // 게시판상세보기 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"boardDetail.jsp");
            }
            else if(command.equals("boardWrite.do")) // 게시판작성 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"boardWrite.jsp");
            }
            else if(command.equals("boardModify.do")) // 게시판수정 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"boardModify.jsp");
            }
            else if(command.equals("boardDeleteCheck.do")) // 게시판체크삭제 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath(form+"boardDeleteCheck.jsp");
            }
           
            // 각종 처리 액션
            else if(command.equals("BoardListAction.do")) // 게시판리스트 처리
            {
                action = new BoardListAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("BoardDeleteAction.do")) // 게시판삭제 처리
            {
                action = new BoardDeleteAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("BoardDetailAction.do")) // 게시판상세보기 처리
            {
                action = new BoardDetailAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("BoardWriteAction.do")) // 게시판작성 처리
            {
                action = new BoardWriteAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("BoardModifyFormAction.do")) // 회원수정 처리
            {
                action = new BoardModifyFormAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("BoardModifyAction.do")) // 회원삭제 처리
            {
                action = new BoardModifyAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("DeleteCheckAction.do")) // 회원삭제 처리
            {
                action = new BoardDeleteCheckAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("DeleteCheckFormAction.do")) // 회원삭제 처리
            {
                action = new BoardDeleteCheckFormAction();
                forward = action.execute(request, response);
            }
 
            // 화면이동 - isRedirext() 값에 따라 sendRedirect 또는 forward를 사용
            // sendRedirect : 새로운 페이지에서는 request와 response객체가 새롭게 생성된다.
            // forward : 현재 실행중인 페이지와 forwad에 의해 호출될 페이지는 request와 response 객체를 공유
            if(forward != null){
                if (forward.isRedirect()) {
                    response.sendRedirect(forward.getNextPath());
                } else {
                    RequestDispatcher dispatcher = request
                            .getRequestDispatcher(forward.getNextPath());
                    dispatcher.forward(request, response);
                }
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    } // end doProcess

}



