package kosta125.team3.park;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



import kosta125.team3.park.*;

public class MemoDAO {

	private static MemoDAO instance = new MemoDAO();

	public static MemoDAO getInstance() {
		return instance;
	}

	public MemoDAO() {
	}

	public Connection getConnection() throws Exception {

		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:ParkDB");

		return ds.getConnection();
	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public MemoVO selectedVO(int memoNum){
		MemoVO vo = new MemoVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMODB WHERE MEMONUM=?");
			pstmt.setInt(1, memoNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setMemoNum(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setMemoTime(rs.getTimestamp(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close(rs);
			close(pstmt);
			close(conn);
		}
		return vo;
	}
	
	public MemoVO selectedVOAll(int memoNum) {
		MemoVO vo = new MemoVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMODB WHERE MEMONUM=?");
			pstmt.setInt(1, memoNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setMemoNum(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setMemoTime(rs.getTimestamp(4));
				vo.setPass(rs.getString(5));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close(rs);
			close(pstmt);
			close(conn);
		}
		return vo;
	}
	
	public void deleteMemo(int memoNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM MEMODB WHERE MEMONUM=?");
			pstmt.setInt(1, memoNum);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(conn);
		}
	}
	
	public int getListAllcount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM MEMODB");
			rs = pstmt.executeQuery();

			if (rs.next())
				count = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}

		return count;

	}// 총 메모 수 세기
	
	public List<MemoVO> getSelectAll(int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = null;

		try {
			conn = getConnection();

			sql = "SELECT * FROM (SELECT ROWNUM R, MEMONUM, SUBJECT, CONTENT, MEMOTIME, PASS FROM (SELECT * FROM MEMODB ORDER BY MEMONUM DESC)) WHERE R>=? AND R<=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList(endRow);

				do {
					MemoVO vo = new MemoVO();

					vo.setMemoNum(rs.getInt(2));
					vo.setContent(rs.getString(4));
					vo.setMemoTime(rs.getTimestamp(5));
					vo.setPass(rs.getString(6));
					vo.setSubject(rs.getString(3));

					list.add(vo);

				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}

		return list;
	}//총 페이지 로딩
		
	public void list(){
		
	}
	
	public int searchCount(String keyField, String keyWord) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql="";
	    int count = 0;
	    
	    if(keyField.length()<1) {
	    	sql = "SELECT COUNT(*) FROM (SELECT ROWNUM R, MEMONUM, SUBJECT, CONTENT, MEMOTIME, PASS FROM MEMODB ORDER BY R DESC)";
	    } else {
	    	sql = "SELECT COUNT(*) FROM (SELECT ROWNUM R, MEMONUM, SUBJECT, CONTENT, MEMOTIME, PASS FROM MEMODB ORDER BY R DESC) WHERE " + keyField.trim() + " LIKE '%"+keyWord.trim()+"%'";
	    }

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return count;
	}// 검색 시 총 메모 수 세기
	
	public ArrayList search(String keyField, String keyWord, int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		ArrayList<MemoVO> list = new ArrayList<MemoVO>();
		
		try {      
			if(keyWord != null && !keyWord.equals("")) { //키워드가 공백이 아니라면
				sql = "SELECT * FROM (SELECT ROWNUM R, MEMONUM, SUBJECT, CONTENT, MEMOTIME, PASS FROM (SELECT * FROM MEMODB WHERE "+keyField.trim()+" LIKE '%"+keyWord.trim()+"%' ORDER BY MEMONUM DESC)) WHERE R>=? AND R<=?";
		   
			} else { //모든 레코드 검색
				sql = "SELECT * FROM (SELECT ROWNUM R, MEMONUM, SUBJECT, CONTENT, MEMOTIME, PASS FROM (SELECT * FROM MEMODB ORDER BY MEMONUM DESC)) WHERE R>=? AND R<=?";
		    }
		   
			System.out.println("sql = " + sql);
		   
		    conn = getConnection();
		    pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setInt(1, startRow);
		    pstmt.setInt(2, endRow);
		    
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()) {
		        MemoVO vo = new MemoVO();
		        
		        vo.setMemoNum(rs.getInt("MEMONUM"));
		        vo.setSubject(rs.getString("SUBJECT"));
		        vo.setContent(rs.getString("CONTENT"));
		        vo.setMemoTime(rs.getTimestamp("MEMOTIME"));
		        vo.setPass(rs.getString("PASS"));
		        
		        list.add(vo);
		    }
		   
		} catch (Exception e) {
		   e.printStackTrace();
		   
		} finally {
		   close(pstmt);
		   close(rs);
		   close(conn);
		}
		return list;
	}//글 검색
	
	public int modify(MemoVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		int result = -1;

		try {
			conn = getConnection();

			sql = "UPDATE MEMODB SET SUBJECT = ?, CONTENT = ?, MEMOTIME = SYSDATE WHERE MEMONUM = ? AND PASS = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getMemoNum());
			pstmt.setString(4, vo.getPass());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return result;
	}// 글 수정 end
	
	public void insert(MemoVO vo)  {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=getConnection();
			
			String sql = "INSERT INTO MEMODB (MEMONUM, SUBJECT, CONTENT, MEMOTIME, PASS) VALUES(MNUMBERS.NEXTVAL,?,?,SYSDATE,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getPass());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		
	} // 글등록 end

	
}