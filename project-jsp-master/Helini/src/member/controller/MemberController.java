package member.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import member.dao.MemberDAO;
import member.vo.MemberVO;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	
	MemberDAO memberDAO = null;

	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = null;
		String action  = request.getPathInfo();

		if (!action.substring(1, 4).equals("ass")) {
			System.out.println("[액션] " + action);
		}

		/* 미사용
		// listMembers.do
		if (action == null || action.equals("/listMembers.do")) {
			List<MemberVO> membersList = memberDAO.listMembers();
			
			request.setAttribute("membersList", membersList);
			
			forward = "/view/member/listMembers.jsp";
		}
		*/
		
// addMember.do
		if (action.equals("/addMember.do")) {
			String id       = request.getParameter("id"      );
			String pwd      = request.getParameter("pwd"     );
			String nickname = request.getParameter("nickname");
			String email    = request.getParameter("email"   );
			MemberVO memberVO = new MemberVO(id, pwd, nickname, email);
			
			memberDAO.addMember(memberVO);
			
			forward = "/member/loginMember.do";
		}
		
// addMemberForm.do		
		else if (action.equals("/addMemberForm.do")) {
			forward = "/view/member/addMemberForm.jsp";
		}
		
// modMember.do		
		else if (action.equals("/modMember.do")) {
		     String id       = request.getParameter("id"      );
		     String pwd      = request.getParameter("pwd"     );
		     String nickname = request.getParameter("nickname");
	         String email    = request.getParameter("email"   );
		     MemberVO memberVO = new MemberVO(id, pwd, nickname, email);
		     
		     memberDAO.modMember(memberVO);
		     
		     forward ="/member/adminInfo.do";
		}
		
// modMemberForm.do
		else if (action.equals("/modMemberForm.do")) {
			String id = request.getParameter("id");
			
			MemberVO memInfo = memberDAO.findMember(id);
			
			request.setAttribute("memInfo", memInfo);
			
			forward = "/view/member/modMemberForm.jsp";
		}
		
// delMember.do		
		else if (action.equals("/delMember.do")) {
		     String id = request.getParameter("id");
		     
		     memberDAO.delMember(id);
		     
		     forward = "/member/adminInfo.do";
		}
		
// loginMember.do
		else if (action.equals("/loginMember.do")) {
			String id  = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			MemberVO memberVO = new MemberVO();
			memberVO.setId (id);
			memberVO.setPwd(pwd);
			
			memberDAO = new MemberDAO();
			
			boolean result = memberDAO.isExisted(memberVO);
			
			if (result) {
				String nickname = memberDAO.findMember(id).getNickname();
				
				HttpSession session = request.getSession();
				session.setAttribute("isLogon", true);
				session.setAttribute("login_id", id);
				session.setAttribute("login_pwd", pwd);
				session.setAttribute("login_nickname", nickname);
				
				forward = "/";
			}
			else {
				forward = "/view/member/loginMemberForm.jsp";
			}
		}
		
// loginMemberForm.do
		else if (action.equals("/loginMemberForm.do")) {
			forward = "/view/member/loginMemberForm.jsp";
		}

// logoutMember.do
		else if (action.equals("/logoutMember.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			forward = "/";
		}
		
// adminInfo.do
		else if (action.equals("/adminInfo.do")) {
			List<MemberVO> membersList = memberDAO.listMembers();
			
			request.setAttribute("membersList", membersList);
			
			forward = "/view/member/adminInfo.jsp";
		}
		
// modMyInfo.do		
		else if (action.equals("/modMyInfo.do")) {
		     String id       = request.getParameter("id"      );
		     String pwd      = request.getParameter("pwd"     );
		     String nickname = request.getParameter("nickname");
	         String email    = request.getParameter("email"   );
		     MemberVO memberVO = new MemberVO(id, pwd, nickname, email);
		     
		     memberDAO.modMember(memberVO);
		     
		     forward ="/";
		}
		
// myInfo.do
		else if (action.equals("/myInfo.do")) {
			HttpSession session = request.getSession();
			String myInfo = (String) session.getAttribute("login_id");
			
			MemberVO memInfo = memberDAO.findMember(myInfo);
			
			request.setAttribute("memInfo", memInfo);
			
			forward = "/view/member/myInfo.jsp";
		}

// 나머지 요청	
		else {
			
			forward = "/";
		}
		
		if (forward.equals("/"))
			response.sendRedirect("/");
		else
			request.getRequestDispatcher(forward).forward(request, response);
	}

}