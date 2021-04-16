package mboard.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mboard.board.db.DBCon;


//service
//C R U D 기본하구 
//조회수, 회원,,비회원 나타내기  , 댓글 

//한거 
//리스트(읽기), detail, 삭제(그냥 삭제(detail에서), 조회수+1(새로고침할떄)
//글쓰기(list에서), 수정, 체크 삭제(list에서,,관리자admin왓을떄만 할수잇게 )) 
//게시물검색기능(제목,작성자), 페이징처리, 

//해야할거
//댓글 , 회원/비회원 구분해서 나타내기, 회원나타내기, 파일(동영상x)
//그냥 해보는거 - 기상청 api 날씨 정보 가져와서 띄우기 -> 날씨에 따라 오늘 운동에 대한 글
//회원/비회원 구분해서 - 다른게시판에  같이쓸수 있느거

public class BoardDAO {
	DBCon db 				= null;
	Connection conn 		= null;
	ResultSet rs 			= null;
	PreparedStatement pstmt = null;
	
	//list
	public List<BoardVO> getBoardList() {
		
		return getBoardList("title", "", 1);
	}
	public List<BoardVO> getBoardList(int page) {
		
		return getBoardList("title", "", page);
	}
	
	public List<BoardVO> getBoardList(String field/*TITLE, WRITER_ID*/, String query/*A*/, int page) {
		
		List<BoardVO> BoardList = new ArrayList<BoardVO>();
		
		try {
			db 		 = new DBCon();
			conn	 = db.getConnection();
			
//			String sql 	= "SELECT * FROM BOARD ORDER BY ID DESC";	
			String sql = "SELECT * FROM (" + 
					"    SELECT ROWNUM NUM, N.* " + 
					"    FROM (SELECT * FROM BOARD WHERE "+field+" LIKE ? ORDER BY REGDATE DESC) N" + 
					") " + 
					"WHERE NUM BETWEEN ? AND ?";
			
			pstmt	 = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			pstmt.setInt(2, 1+(page-1)*10 );
			pstmt.setInt(3, page*10);
			
			rs 		 = pstmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writer_id = rs.getString("WRITER_ID");
				String content = rs.getString("CONTENT");
				Date regdate = rs.getDate("REGDATE");
				int hit = rs.getInt("HIT"); 
				String files = rs.getString("FILES");
				String regid = rs.getString("REGID");
				
				BoardVO vo = new BoardVO(
						id, title, writer_id, content, regdate, hit, files, regid);
				
				BoardList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {rs.close();}
				if (pstmt != null) {pstmt.close();}
				if (conn != null) {conn.close();}
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("list-------------------");
		
		return BoardList;
	}

	
	//detail
	public BoardVO getBoard(int id) {
		BoardVO vo = null;
		String sql = "SELECT * FROM BOARD WHERE ID=?";
		try {
			db 		 = new DBCon();
			conn	 = db.getConnection();
			PreparedStatement st = conn.prepareStatement(sql);
			
			st.setInt(1, id);
			
			rs = st.executeQuery();	
			
				if(rs.next()){
					int nid = rs.getInt("ID");
					String title = rs.getString("TITLE");
					String writer_id = rs.getString("WRITER_ID");
					String content = rs.getString("CONTENT");
					Date regdate = rs.getDate("REGDATE"); 
					int hit = rs.getInt("HIT"); 
					String files = rs.getString("FILES");
					String regid = rs.getString("REGID");
					
					vo = new BoardVO(
							nid, title, writer_id, content, regdate, hit, files, regid);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {rs.close();}
				if (pstmt != null) {pstmt.close();}
				if (conn != null) {conn.close();}
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("detail-------------------");
		
		return vo;
	}

	
	//delete
	public void deleteBoard(int id) {
		String sql 	= "DELETE FROM BOARD WHERE ID = ?";
		try {
			
			db = new DBCon();
			conn	 	= db.getConnection();
			pstmt	 	= conn.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			
			pstmt.executeUpdate();
			
			System.out.println(sql + " id 값 = "+ id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {pstmt.close();}
				if (conn != null) {conn.close();}
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("delete------------------------------");
		
	}
	
	//write
	public void writeBoard(String title, String writer_id, String content) {
		
		try {
			db = new DBCon();
			conn	 = db.getConnection();
			
			String sql  = "INSERT INTO BOARD (ID, TITLE, WRITER_ID, CONTENT) ";
			sql			+=" VALUES ((SELECT NVL(MAX(ID),0)+1 FROM BOARD),?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, writer_id);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
			System.out.println(sql + " title, write_id, content 값 = "+ 
												title +" , "+ writer_id +" , "+ content);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {pstmt.close();}
				if (conn != null) {conn.close();}
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("write----------------------------");
		
	}

	//modify
	public void modifyBoard(int id, String title, String writer_id, String content) {
		try {
			
			db = new DBCon();
			conn	 = db.getConnection();
			String sql = "UPDATE BOARD SET  TITLE = ?, WRITER_ID = ?, CONTENT = ? WHERE ID = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, writer_id);
			pstmt.setString(3, content);
			pstmt.setInt(4, id);
			
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {pstmt.close();}
				if (conn != null) {conn.close();}
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("modify--------------");
	}

	//count +1
	public void countBoard(int id_) {
		try {
			db = new DBCon();
			conn	 = db.getConnection();
			//db 에 들어갈 sql
			String sql = "UPDATE BOARD SET HIT = HIT + 1 WHERE ID = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, id_);
			System.out.println(sql + id_);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {pstmt.close();}
				if (conn != null) {conn.close();}
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("count +1 ---------------------------------");
	}

	//deletecheck
	public void deleteCheckBoard(String[] checkbox) {
		try {
			db = new DBCon();
			conn	 = db.getConnection();
			
		    int id = 0;
			    for(int i=0;i<checkbox.length;i++){
			    
			    	String sql 	= "DELETE FROM BOARD WHERE ID = ?";
			    	pstmt = conn.prepareStatement(sql);
			    	id	= Integer.parseInt(checkbox[i]);
			    	
			    	pstmt.setInt(1, id);
					pstmt.executeUpdate();
					System.out.println("------------for문");
			    }
		    System.out.println("----for문 끝");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null) {pstmt.close();}
					if (conn != null) {conn.close();}
					db.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		System.out.println("deletecheck-----------------------");
	}
	
	
	//목록이 있으면 목록에 대한 갯수
	public int getBoardCount() {
		
		return getBoardCount("title", "");
	}
	public int getBoardCount(String field, String query) {
		
		int count = 0;
		
		String sql = "SELECT COUNT(ID) COUNT FROM (" + 
				"    SELECT ROWNUM NUM, N.* " + 
				"    FROM (SELECT * FROM BOARD WHERE "+field+" LIKE ? ORDER BY REGDATE DESC) N" +
				") ";
		try {
			db = new DBCon();
			conn	 = db.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+query+"%");
			
			ResultSet rs = pstmt.executeQuery();
			
				if (rs.next()) {
					count = rs.getInt("count");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {rs.close();}
				if (pstmt != null) {pstmt.close();}
				if (conn != null) {conn.close();}
				db.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	

	
	
	

}
