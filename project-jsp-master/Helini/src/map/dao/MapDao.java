package map.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import map.db.DBCon;
import map.vo.MapVo;


public class MapDao {

	public List<MapVo> getMapList(String searchWord) {
		Connection          conn  = null;
		PreparedStatement   pstmt = null;
		ResultSet           rs    = null;		
		
		List<MapVo> list = new ArrayList<MapVo>();
		DBCon   db     = null;
		
		String searchSql="";
		
		if(!searchWord.equals("")) {
			searchSql=" WHERE ADDR LIKE '%"+searchWord+"%'";
		}
		
		
		
		try {
			db          =  new DBCon();
			conn        =  db.getConnection();
			String  sql = "SELECT IDX, TITLE,";
			sql        += " ADDR, TEL, GYEONGDO, WIDO ";
			sql        += " FROM      Map";
			sql        += searchSql;
			sql        += " ORDER BY  IDX  ASC";
			pstmt       =  conn.prepareStatement(sql);
			rs    =  pstmt.executeQuery();
			while( rs.next() ) {
				int     idx     = rs.getInt("idx");
				String  title   = rs.getString("title");				
				String  addr    = rs.getString("addr");				
				String  tel    = rs.getString("tel");				
				String  gyeongdo    = rs.getString("gyeongdo");				
				String  wido    = rs.getString("wido");				
				MapVo vo = new MapVo(idx, title, addr, tel, gyeongdo, wido);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs    != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
	}

	public MapVo getMap(String reqidx) {
		
		Connection          conn  = null;
		PreparedStatement   pstmt = null;
		ResultSet           rs    = null;		
		
	    MapVo      vo = null;
	    DBCon      db = null;
		
		try {
			db          =  new DBCon();
			conn        =  db.getConnection();
			
			String  sql = "SELECT IDX, TITLE,";
			sql        += " ADDR, GU, TEL, GYEONGDO, WIDO ";
			sql        += " FROM      Map";
			sql        += " WHERE IDX = ?";
			pstmt       =  conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(reqidx) );   // 13
			//pstmt.setString(1, idx);   // '13'
			System.out.println( sql );
			rs    =  pstmt.executeQuery();
			if( rs.next() ) {
				int     idx     = rs.getInt("idx");
				String  title   = rs.getString("title");				
				String  addr    = rs.getString("addr");				
				String  tel    = rs.getString("tel");				
				String  gyeongdo    = rs.getString("gyeongdo");				
				String  wido    = rs.getString("wido");				
				vo              = new MapVo(idx, title, addr, tel, gyeongdo, wido);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs    != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("getMap 결과:" + vo);
		
		return vo;
	}
	
	/*public MapVo searchMap(String reqidx) {
		
		Connection          conn  = null;
		PreparedStatement   pstmt = null;
		ResultSet           rs    = null;		
		
		MapVo      vo = null;
		DBCon      db = null;
		
		try {
			db          =  new DBCon();
			conn        =  db.getConnection();
			
			String  sql = "SELECT IDX, TITLE,";
			sql        += " ADDR, GU, TEL, GYEONGDO, WIDO ";
			sql        += " FROM      Map";
			sql        += " WHERE ADDR LIKE %?% ";
			pstmt       =  conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(reqidx) );   // 13
			//pstmt.setString(1, idx);   // '13'
			System.out.println( sql );
			rs    =  pstmt.executeQuery();
			if( rs.next() ) {
				int     idx     = rs.getInt("idx");
				String  title   = rs.getString("title");				
				String  addr    = rs.getString("addr");				
				String  tel    = rs.getString("tel");				
				String  gyeongdo    = rs.getString("gyeongdo");				
				String  wido    = rs.getString("wido");				
				vo              = new MapVo(idx, title, addr, tel, gyeongdo, wido);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs    != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("getMap 결과:" + vo);
		
		return vo;
	}*/
}