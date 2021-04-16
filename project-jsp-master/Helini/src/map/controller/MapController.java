package map.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import map.dao.MapDao;
import map.vo.MapVo;

@WebServlet("/map")
public class MapController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlFunc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlFunc(request, response);
	}

	private void controlFunc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd"); // ?cmd=LIST

		// cmd = LIST
		if (cmd.equals("LIST")) {
			// db 목록 조회
			MapDao dao = new MapDao();
			List<MapVo> list = dao.getMapList("");

			System.out.println("cont count:" + list.size());

			// 데이터 조회된 속성에 담기
			request.setAttribute("mapList", list);

			// 보여줄 페이지로 이동
			String link = "/view/menu/searchFitCen.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(link);
			rd.forward(request, response);
		

		}
		
		
		

		if (cmd.equals("VIEW")) {
			String idx = request.getParameter("idx");
			String searchWord = request.getParameter("sc");
			
			
			System.out.println(idx + "");
			// DB 조회 - 내용보기
			MapDao dao = new MapDao();
			MapVo vo = dao.getMap(idx);
			
			List<MapVo> list = dao.getMapList(searchWord);
			 
			 request.setAttribute("map", vo);
			 request.setAttribute("maplist", list); 
			 
			 // 페이지 이동 
			 String link = "/view/menu/searchFitCen.jsp"; 
			 RequestDispatcher rd = request.getRequestDispatcher(link);
			 rd.forward(request, response);
			 
		}
	}
}