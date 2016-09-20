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

public class ParkDAO {

	private static ParkDAO instance = new ParkDAO();
	public static ParkDAO getInstance() {
		return instance;
	}
	public ParkDAO() {	}  
	
	
	// get connection()

	public Connection getConnection() throws Exception {

		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc:ParkDB");

		return ds.getConnection();
	}

	// close util

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

	// DAO �޼ҵ�

	public List<ParkVO> list(String floor, int ro) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "select * from (select * from parkdb where parknum like ?) where parknum like ?";
		floor = floor.toUpperCase()+"%";
		String row = "%-"+String.valueOf(ro);
		System.out.println(floor+"  "+row);
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, row);
			pstmt.setString(2, floor);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList();

				do {
					ParkVO vo = new ParkVO();
					vo.setParkNum(rs.getString(1));
					vo.setCarNum(rs.getString(2));
					vo.setInTime(rs.getTimestamp(3));

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

	}// list ����

	public void regist(ParkVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp in = new Timestamp(System.currentTimeMillis());

		try {
			String sql = "update parkdb carNum = ?, inTime =? where parkNum = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getCarNum());
			pstmt.setTimestamp(2, in);
			pstmt.setString(3, vo.getParkNum());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		} // db update

	}// ���

	public int pay(ParkVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int pay = 0;

		Timestamp in = vo.getInTime(), out = new Timestamp(System.currentTimeMillis());

		// ��ݰ��
		if (in.getYear() == out.getYear()) {
			if (in.getMonth() == out.getMonth()) {
				if (in.getDay() == out.getDay()) {
					pay = ((out.getHours() * 60) + out.getMinutes() - (in.getHours() * 60) - in.getMinutes()) * 100;
				} else if (in.getDay() != out.getMonth()) {
					pay = ((out.getDay() - in.getDay()) * 24 * 60) - (out.getHours() * 60) + out.getMinutes()
							- (in.getHours() * 60) - in.getMinutes();
				} // ��¥�� �ٸ����
			}
			// �� �̴ٸ���� ���� �ٸ���� �߰� �ٶ�
		}

		insertCalDB(vo, out, pay);// db �Է�

		try {
			String sql = "update parkdb carNum = ?, inTime =? where parkNum = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, null);
			pstmt.setString(2, null);
			pstmt.setString(3, vo.getParkNum());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		} // db update

		return pay;
		// pay ���� ����!
	}// ���� �ϼ�

	public void insertCalDB(ParkVO vo, Timestamp out, int pay) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String parkNum = vo.getParkNum(), carNum = vo.getCarNum();
		Timestamp inTime = vo.getInTime();

		try {
			String sql = "insert into calDB(parkNum, carNum, inTime, outTime, pay) " + "values(?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, parkNum);
			pstmt.setString(2, carNum);
			pstmt.setTimestamp(3, inTime);
			pstmt.setTimestamp(4, out);
			pstmt.setInt(5, pay);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
			close(conn);
		}

	}// ���� �����ͺ��̽� ���Ա�

	public String search(String carNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "SELECT parknum FROM PARKDB where carnum = ? ";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, carNum);

			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}

		return rs.toString();

	}// ���� �˻�

	public List<CalVO> calc() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
	      SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");

				
		String sql = "SELECT * FROM CAlDB where outtime between ? and ?";
		
		Timestamp today = new Timestamp(System.currentTimeMillis());

		
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sdf.format(today));
			pstmt.setString(2, sdf.format(today));

			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList();

				do {
					CalVO vo = new CalVO();

					vo.setParkNum(rs.getString("parknum"));
					vo.setCarNum(rs.getString("carnum"));
					vo.setInTime(rs.getTimestamp("intime"));
					vo.setOutTime(rs.getTimestamp("outtime"));
					vo.setPay(rs.getInt("pay"));

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

	}//���� ���� �о����
	
	public List<CalVO> calc(int date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "select * from caldb where outtime between ? and ? ";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList();

				do {
					CalVO vo = new CalVO();

					vo.setParkNum(rs.getString("parknum"));
					vo.setCarNum(rs.getString("carnum"));
					vo.setInTime(rs.getTimestamp("intime"));
					vo.setOutTime(rs.getTimestamp("outtime"));
					vo.setPay(rs.getInt("pay"));

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

	}//���� �о����

}
