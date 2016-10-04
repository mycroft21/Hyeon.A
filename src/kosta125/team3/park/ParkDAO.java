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

	public ParkDAO() {
	}

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

	// DAO 메소드

	public List<ParkVO> list(String floor, int ro) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		
		String sql = "SELECT * FROM (SELECT * FROM PARKDB WHERE PARKNUM LIKE ?) WHERE PARKNUM LIKE ?";
		
		floor = floor.toUpperCase() + "%";
		String row = "%-" + String.valueOf(ro);
		System.out.println(floor + "  " + row);
		
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

	}// list 리턴

	public void regist(ParkVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp in = new Timestamp(System.currentTimeMillis());

		try {
			String sql = "UPDATE PARKDB SET CARNUM=?, INTIME=SYSDATE WHERE PARKNUM=?";
			
			conn = getConnection();
			System.out.println(vo.getCarNum());
			System.out.println(vo.getParkNum());
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getCarNum());
			pstmt.setString(2, vo.getParkNum());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		} // db update

	}// 등록

	public int pay(ParkVO vo, Timestamp outtime) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int pay = 0;

		Timestamp in = vo.getInTime(), out = outtime;

		// 요금계산
		if (in.getYear() == out.getYear()) {
			if (in.getMonth() == out.getMonth()) {
				if (in.getDay() == out.getDay()) {
					pay = ((out.getHours() * 60) + out.getMinutes() - (in.getHours() * 60) - in.getMinutes()) * 100;
				} else if (in.getDay() != out.getDay()) {
					pay = (((out.getDay() - in.getDay()) * 24 * 60)
							+ ((out.getHours() * 60 + out.getMinutes()) - ((in.getHours() * 60) + in.getMinutes())))
							* 100;
				} // 날짜가 다른경우
			}
			// 달 이다른경우 년이 다른경우 추가 바람
		}
		return pay;
	}

	public void clear(ParkVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "UPDATE PARKDB SET CARNUM=?, INTIME=? WHERE PARKNUM=?";

			conn = getConnection();
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
	}// 출차 완성

	public void insertCalDB(ParkVO vo, Timestamp out, String pay) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String parkNum = vo.getParkNum(), carNum = vo.getCarNum();
		Timestamp inTime = vo.getInTime();

		try {
			String sql = "INSERT INTO CALDB(PARKNUM, CARNUM, INTIME, OUTTIME, PAY) " + "VALUES(?,?,?,?,?)";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, parkNum);
			pstmt.setString(2, carNum);
			pstmt.setTimestamp(3, inTime);
			pstmt.setTimestamp(4, out);
			pstmt.setString(5, pay);

			pstmt.executeUpdate();

			clear(vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
			close(conn);
		}

	}// 정산 데이터베이스 삽입구

	public ArrayList search(String carNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ParkVO> list = new ArrayList<ParkVO>();
		String A = null;

		String sql = "SELECT * FROM PARKDB WHERE CARNUM LIKE ?";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			A = "%" + carNum + "%";

			pstmt.setString(1, A);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ParkVO vo = new ParkVO();
				vo.setParkNum(rs.getString("parknum"));
				vo.setCarNum(rs.getString("carnum"));
				vo.setInTime(rs.getTimestamp("intime"));

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

	}// 차량 검색

	public List<CalVO> calc() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;

		String sql = "SELECT * FROM CALDB WHERE OUTTIME BETWEEN TO_CHAR((SYSDATE),'YYYY-MM-DD') AND TO_CHAR((SYSDATE+1),'YYYY-MM-DD')";

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

	}// 당일 정산 읽어오기

	public List<CalVO> calc(String carNum) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;

		String sql = "SELECT * FROM CALDB WHERE OUTTIME BETWEEN TO_CHAR((SYSDATE),'YYYY-MM-DD') AND TO_CHAR((SYSDATE+1),'YYYY-MM-DD') AND CARNUM LIKE ?";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			String A = "%" + carNum + "%";
			System.out.println("a1= " + A);
			pstmt.setString(1, A);
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

	}// 당일 정산 읽어오기

	public List<CalVO> calc(String dateA, String dateB) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = null, date2 = null;
		String sql = "SELECT * FROM CALDB WHERE OUTTIME BETWEEN TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND TO_DATE(?,'YYYY-MM-DD HH24:MI:SS')";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			date1 = dateA + " 00:00:01";
			date2 = dateB + " 23:59:59";
			pstmt.setString(1, date1);
			pstmt.setString(2, date2);

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
		System.out.println(date1);

		return list;

	}// 정산 읽어오기

	public List<CalVO> calc(String date1, String date2, String carNum) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateA = null, dateB = null;
		String sql = "SELECT * FROM CALDB WHERE OUTTIME BETWEEN TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND TO_DATE(?,'YYYY-MM-DD HH24:MI:SS') AND CARNUM LIKE ?";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			String A = "%" + carNum + "%";

			System.out.println("a2= " + A);
			
			dateA = date1 + " 00:00:01";
			dateB = date2 + " 23:59:59";
			
			pstmt.setString(1, dateA);
			pstmt.setString(2, dateB);
			pstmt.setString(3, A);

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
		System.out.println(date1);

		return list;

	}// 차번호로 검색

	public int setAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int all = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PARKDB");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				all = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return all;
	}// 전체 주차 공간

	public int setCu() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cu = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PARKDB WHERE CARNUM IS NULL");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cu = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return cu;
	}// 전체 남아있는 주차 가능 대수

	public int setPartAll(String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int partAll = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PARKDB WHERE PARKNUM LIKE '%A%'");

			rs = pstmt.executeQuery();
			if (rs.next()) {
				partAll = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return partAll;
	}// 구역별 전체 주차 가능 대수(20)

	public int setCuA() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cuA = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PARKDB WHERE PARKNUM LIKE '1F%' AND CARNUM IS NULL");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cuA = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return cuA;
	}// A구역 _ 남아있는 주차 가능 대수

	public int setCuB() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cuB = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PARKDB WHERE PARKNUM LIKE '2F%' AND CARNUM IS NULL");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cuB = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return cuB;
	}// B구역 _ 남아있는 주차 가능 대수

	public int setCuC() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cuC = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PARKDB WHERE PARKNUM LIKE '3F%' AND CARNUM IS NULL");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cuC = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return cuC;
	}// C구역 _ 남아있는 주차 가능 대수

	public int setCuD() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cuD = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM PARKDB WHERE PARKNUM LIKE '4F%' AND CARNUM IS NULL");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cuD = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}
		return cuD;
	}// D구역 _ 남아있는 주차 가능 대수

}