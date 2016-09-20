package kosta125.team3.park;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import kosta125.team3.park.*;

public class ParkDAO {
	
	
	
	// get connection()

	public Connection getConnection() throws Exception {

		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:ParkDB");

		return ds.getConnection();
	}

	//close utill
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// DAO 메소드

	public void list() {

	}

	public void regist() {

	}

	public void pay() {
		

	}

	public void insertCalDB(ParkVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
	 String parkNum =vo.getParkNum(), carNum = vo.getCarNum() ;
	 Timestamp inTime = vo.getInTime(), outTime = vo.getOutTime();
	 int pay=0;
		
	 //pay값을 계산하자!
	 
	 
	try {
		String sql = "insert into calDB(parkNum, carNum, inTime, outTime, pay) "
				+ "values(?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, parkNum);
		pstmt.setString(2, carNum);
		pstmt.setTimestamp(3, inTime);
		pstmt.setTimestamp(4, outTime);
		pstmt.setInt(5, pay);
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close(rs);
		close(pstmt);
		close(conn);
	}
		


	}

	public void search() {

	}

	public void calc() {

	}

}
