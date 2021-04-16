package member.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import member.vo.MemberVO;

public class MemberDAO {
	
	private DataSource        dataFactory = null;
	private Connection        conn        = null;
	private PreparedStatement pstmt       = null;
	private ResultSet         rs          = null;
	private String            query       = null;

// 데이터베이스 연결
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
			System.out.println("[연결] 데이터베이스와 연결됨");
		} 
		catch (NamingException e) {e.printStackTrace();}
	}
	
// 회원 조회	
	public List<MemberVO> listMembers() {
		List<MemberVO> membersList = new ArrayList<MemberVO>();
		
		try {
			conn = dataFactory.getConnection();
			
			query = "SELECT *"
				  + "  FROM member"
				  + " ORDER BY joindate DESC";
			System.out.println("listMembers() => " + query);
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String id       = rs.getString("id"      );
				String pwd      = rs.getString("pwd"     );
				String nickname = rs.getString("nickname");
				String email    = rs.getString("email"   );
				Date   joindate = rs.getDate  ("joindate");
				MemberVO memberVO = new MemberVO(id, pwd, nickname, email, joindate);

				membersList.add(memberVO);
			}
			
			rs   .close();
			pstmt.close();
			conn .close();
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		return membersList;
	}

// 회원 추가
	public void addMember(MemberVO memberVO) {
		try {
			conn = dataFactory.getConnection();
			
			String id       = memberVO.getId      ();
			String pwd      = memberVO.getPwd     ();
			String nickname = memberVO.getNickname();
			String email    = memberVO.getEmail   ();
			
			query = "INSERT INTO member"
				  + "  (id, pwd, nickname, email)"
				  + "  VALUES"
				  + "  (?, ?, ?, ?)";
			System.out.println("addMember() => " + query);
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, id      );
			pstmt.setString(2, pwd     );
			pstmt.setString(3, nickname);
			pstmt.setString(4, email   );
			pstmt.executeUpdate();
			
			pstmt.close();
			conn .close();
		} 
		catch (SQLException e) {e.printStackTrace();}
	}
	
// 회원 검색
	public MemberVO findMember(String id_) {
		MemberVO memInfo = null;
		
		try {
			conn = dataFactory.getConnection();
			
			query = "SELECT *"
				  + "  FROM member"
				  + " WHERE id = ?";
			System.out.println("findMember() => " + query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id_);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String id       = rs.getString("id"      );
			String pwd      = rs.getString("pwd"     );
			String nickname = rs.getString("nickname");
			String email    = rs.getString("email"   );
			Date   joindate = rs.getDate  ("joindate");
			memInfo = new MemberVO(id, pwd, nickname, email, joindate);
			
			pstmt.close();
			conn .close();
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		return memInfo;
	}
	
// 회원 수정	
	public void modMember(MemberVO memberVO) {
		String id       = memberVO.getId      ();
		String pwd      = memberVO.getPwd     ();
		String nickname = memberVO.getNickname();
		String email    = memberVO.getEmail   ();
		
		try {
			conn = dataFactory.getConnection();
			
			query = "UPDATE member"
			      + "   SET pwd      = ?"
				  + "     , nickname = ?"
				  + "     , email    = ?"
				  + " WHERE id = ?";
			System.out.println("modMember() => " + query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, nickname);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn .close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	
// 회원 삭제
	public void delMember(String id) {
		try {
			conn = dataFactory.getConnection();
			
			query = "DELETE"
				  + "  FROM member"
				  + " WHERE id = ?";
			System.out.println("delMember() => " + query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn .close();
		} catch (SQLException e) {e.printStackTrace();}
	}

// 회원 로그인
	public boolean isExisted(MemberVO memberVO) {
		boolean result = false;
		
		String id  = memberVO.getId ();
		String pwd = memberVO.getPwd();
		
		try {
			conn = dataFactory.getConnection();
		
			query = "SELECT DECODE(COUNT(*), 1, 'true', 'false') AS result"
			      + "  FROM member"
			      + " WHERE id  = ?"
			      + "   AND pwd = ?";
			System.out.println("isExisted() => " + query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));

			if (result)
				System.out.println("[체크] 가입된 회원 정보와 일치");
			else 
				System.out.println("[체크] 가입된 회원 정보와 불일치");
		
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		return result;
	}
	
}