package guest.dao;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import guest.db.DBCon;
import guest.vo.GuestbookVo;
import oracle.jdbc.internal.OracleCallableStatement;


public class GuestbookDao {

	public void guestbookInsert(GuestbookVo guestbookVo) {
		// 방명록 추가
		Connection        conn  = null;
		CallableStatement cstmt = null;

		DBCon db = null;
		try {
			db = new DBCon();
			conn = db.getConnection();
			// gb_id, gb_pass, gb_con, bnum, lvl, step, nref
			String sql = "{CALL PKG_GUESTBOOK.PROC_GB_INSERT(?, ?, ?, ?, ?, ?, ?) }";
			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, guestbookVo.getGb_id());
			cstmt.setString(2, guestbookVo.getGb_pass());
			cstmt.setString(3, guestbookVo.getGb_con());
			cstmt.setInt(4, guestbookVo.getBnum());
			cstmt.setInt(5, guestbookVo.getLvl());
			cstmt.setInt(6, guestbookVo.getStep());
			cstmt.setInt(7, guestbookVo.getNref());
			
			cstmt.executeUpdate();

		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}

	}

	// list조회
	public List<GuestbookVo> getGuestbookList() {
		List<GuestbookVo> gbList = new ArrayList<GuestbookVo>();

		Connection        conn  = null;
		CallableStatement cstmt = null;
		ResultSet         rs    = null;

		DBCon db = null;
		try {
			db   = new DBCon();
			conn = db.getConnection();
			String sql = "{CALL PKG_GUESTBOOK.PROC_GB_LIST(?)}";
			cstmt = conn.prepareCall(sql);

			cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();

			OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			
			while(rs.next()) {
				GuestbookVo vo = new GuestbookVo();
				vo.setGb_no(rs.getInt("gb_no"));
				vo.setGb_id(rs.getString("gb_id"));
				vo.setGb_pass(rs.getString("gb_pass"));
				vo.setGb_con(rs.getString("gb_con"));
				vo.setGb_date(rs.getString("gb_date"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setBnum(rs.getInt("bnum"));
				vo.setLvl(rs.getInt("lvl"));
				vo.setStep(rs.getInt("step"));
				vo.setNref(rs.getInt("nref"));

				gbList.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(cstmt != null) cstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}

		return gbList;
	}

	//방명록삭제
	public void guestbookDelete(GuestbookVo guestbookVo) {
		Connection        conn  = null;
		CallableStatement cstmt = null;

		int    gb_no   = guestbookVo.getGb_no();
		String gb_pass = guestbookVo.getGb_pass();


		DBCon db = null;
		try {
			db = new DBCon();
			conn = db.getConnection();
			String sql = "{CALL PKG_GUESTBOOK.PROC_GB_DELETE(?, ?) }";
			cstmt = conn.prepareCall(sql);
			System.out.println(gb_no);
			System.out.println(gb_pass);


			cstmt.setInt(1, gb_no);
			cstmt.setString(2, gb_pass);		
			cstmt.executeUpdate();


		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
	}

	//글 수정
	public void guestbookUpdate(GuestbookVo guestbookVo) {
		Connection        conn  = null;
		CallableStatement cstmt = null;

		int    gb_no   = guestbookVo.getGb_no();
		String gb_pass = guestbookVo.getGb_pass();
		String gb_con = guestbookVo.getGb_con();

		DBCon db = null;
		try {
			db = new DBCon();
			conn = db.getConnection();
			String sql = "{CALL PKG_GUESTBOOK.PROC_GB_UPDATE(?, ?, ?) }";
			cstmt = conn.prepareCall(sql);
			System.out.println(gb_no);
			System.out.println(gb_con);

			cstmt.setString(1, gb_con);
			cstmt.setInt(2, gb_no);
			cstmt.setString(3, gb_pass);		
			cstmt.executeUpdate();

		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}

		}
	}

	public GuestbookVo getBook(String gb_no) {
		GuestbookVo vo = null;
		
		Connection         conn  = null;
		CallableStatement  cstmt = null;
		ResultSet          rs    = null;
		
		DBCon   db   = null;
		
		try {
			db         = new DBCon();
			conn       = db.getConnection();
			String sql = "{CALL PKG_GUESTBOOK.PROC_GB_VIEW(?, ?)}";				
			cstmt      = conn.prepareCall(sql);		
			
			cstmt.setInt(1, Integer.parseInt(gb_no));
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			
			cstmt.executeQuery();
			
			OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
			rs = ocstmt.getCursor(2);
			
			rs.next();
			
			// gb_no, gb_id, gb_pass, gb_con, gb_date, readcount, bnum, lvl, step, nref 
			vo = new GuestbookVo();
			vo.setGb_no(rs.getInt("gb_no"));
			vo.setGb_id(rs.getString("gb_id"));
			vo.setGb_pass(rs.getString("gb_pass"));
			vo.setGb_con(rs.getString("gb_con"));
			vo.setGb_date(rs.getString("gb_date"));
			vo.setReadcount(rs.getInt("readcount"));
			vo.setBnum(rs.getInt("bnum"));
			vo.setLvl(rs.getInt("lvl"));
			vo.setStep(rs.getInt("step"));
			vo.setNref(rs.getInt("nref"));
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs    != null ) rs.close();
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return vo;
	}


}



