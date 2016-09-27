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
			pstmt = conn.prepareStatement("select * from memoDB where memoNum=?");
			pstmt.setInt(1, memoNum);
			rs = pstmt.executeQuery();
			if(rs.next()){
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
	
	public MemoVO selectedVOAll(int memoNum){
		MemoVO vo = new MemoVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from memoDB where memoNum=?");
			pstmt.setInt(1, memoNum);
			rs = pstmt.executeQuery();
			if(rs.next()){
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
	
	public void deleteMemo(int memoNum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from memoDB where memoNum=?");
			pstmt.setInt(1, memoNum);
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
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM memoDB");
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

	}// 총 수 세기
	
	public List<MemoVO> getSelectAll(int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = null;

		try {
			conn = getConnection();

			sql = "select * from memoDB where memonum between ? and ?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList(endRow);

				do {
					MemoVO vo = new MemoVO();

					vo.setMemoNum(rs.getInt(1));
					vo.setContent(rs.getString(3));
					vo.setMemoTime(rs.getTimestamp(4));
					vo.setPass(rs.getString(5));
					vo.setSubject(rs.getString(2));

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
	
	public ArrayList search(String keyField, String keyWord) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<MemoVO> list = new ArrayList<MemoVO>();
		
		try {
			String sql = "select * from memoDB ";
			
			if(keyWord != null && !keyWord.equals("")) { //키워드가 공백이 아니라면
			sql += "where " + keyField.trim() + "like '%"+keyWord.trim()+"%' order by memoTime";
			
			} else { //모든 레코드 검색
				sql += "order by memoTime";
			}
			
			System.out.println("sql = " + sql);
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemoVO vo = new MemoVO();
				vo.setMemoNum(rs.getInt("memoNum"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setMemoTime(rs.getTimestamp("memoTime"));
				vo.setPass(rs.getString("pass"));
				
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
	
}