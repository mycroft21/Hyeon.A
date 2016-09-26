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

	// DAO �޼ҵ�

	public List<ParkVO> list(String floor, int ro) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "select * from (select * from parkdb where parknum like ?) where parknum like ?";
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

	}// list ����

	public void regist(ParkVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp in = new Timestamp(System.currentTimeMillis());

		try {
			String sql = "update parkdb set carNum=?, inTime=sysdate where parkNum=?";
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

	}// ���

	public int pay(ParkVO vo, Timestamp outtime) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int pay = 0;

		Timestamp in = vo.getInTime(), out = outtime;

		// ��ݰ��
		if (in.getYear() == out.getYear()) {
			if (in.getMonth() == out.getMonth()) {
				if (in.getDay() == out.getDay()) {
					pay = ((out.getHours() * 60) + out.getMinutes() - (in.getHours() * 60) - in.getMinutes()) * 100;
				} else if (in.getDay() != out.getDay()) {
					pay = (((out.getDay() - in.getDay()) * 24 * 60)
							+ ((out.getHours() * 60 + out.getMinutes()) - ((in.getHours() * 60) + in.getMinutes())))
							* 100;
				} // ��¥�� �ٸ����
			}
			// �� �̴ٸ���� ���� �ٸ���� �߰� �ٶ�
		}
		return pay;
	}

	public void clear(ParkVO vo) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "update parkdb set carNum=?, inTime=? where parkNum=?";

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
	}// ���� �ϼ�

	public void insertCalDB(ParkVO vo, Timestamp out, String pay) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String parkNum = vo.getParkNum(), carNum = vo.getCarNum();
		Timestamp inTime = vo.getInTime();

		try {
			String sql = "insert into calDB(parkNum, carNum, inTime, outTime, pay) " + "values(?,?,?,?,?)";
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

	}// ���� �����ͺ��̽� ���Ա�

	public List search(String carNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<String> list = new ArrayList<String>();
		String A = null;
		ParkVO vo = new ParkVO();

		String sql = "SELECT * FROM PARKDB WHERE CARNUM LIKE ?";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			A = "%" + carNum + "%";

			pstmt.setString(1, A);

			rs = pstmt.executeQuery();

			
			
			while (rs.next()) {
				vo.setParkNum(rs.getString("parknum"));
				vo.setCarNum(rs.getString("carnum"));
				vo.setInTime(rs.getTimestamp("intime"));
				
				list.add(rs.getString("carnum"));

			}
			System.out.println(vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
			close(conn);
		}

		return list;

	}// ���� �˻�

	public List<CalVO> calc() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;

		String sql = "select * from calDB where outtime between to_char((sysdate),'yyyy-mm-dd') and to_char((sysdate+1),'yyyy-mm-dd')";

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

	}// ���� ���� �о����

	public List<CalVO> calc(String dateA, String dateB) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = null, date2 = null;
		String sql = "select * from caldb where outtime between to_date(?,'YYYY-MM-DD HH24:MI:SS') and to_date(?,'YYYY-MM-DD HH24:MI:SS')";

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

	}// ���� �о����

	public int setAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int all = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from parkdb");
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
	}// ��ü ���� ����

	public int setCu() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cu = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from parkdb where carnum is null");
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
	}// ��ü �����ִ� ���� ���� ���
	
	public int setPartAll(String name) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int partAll = 0;

	      try {
	         conn = getConnection();

	         pstmt = conn.prepareStatement("select count(*) from parkDB where parkNum like '1F-"+name+"%'");

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
	   }// 1���� ������ ��ü ���� ���� ���
	   
	   public int setCuA() {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int cuA = 0;

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select count(*) from parkDB where parkNum like '1F-A%' and carNum is null");
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
	   }// A���� _ �����ִ� ���� ���� ���
	   
	   public int setCuB() {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int cuB = 0;

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select count(*) from parkDB where parkNum like '1F-B%' and carNum is null");
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
	   }// B���� _ �����ִ� ���� ���� ���
	   
	   public int setCuC() {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int cuC = 0;

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select count(*) from parkDB where parkNum like '1F-C%' and carNum is null");
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
	   }// C���� _ �����ִ� ���� ���� ���
	   
	   public int setCuD() {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int cuD = 0;

	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement("select count(*) from parkDB where parkNum like '1F-D%' and carNum is null");
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
	   }// D���� _ �����ִ� ���� ���� ���
	
}