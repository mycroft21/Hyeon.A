package kosta125.team3.subcon;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.border.EmptyBorder;

import kosta125.team3.park.CalVO;
import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class CalcProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		ParkDAO pd = new ParkDAO();

		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String carNum = request.getParameter("carNum");
		/*
		 * String month1 = request.getParameter("month"); String month2 = null;
		 */
		List<CalVO> list = pd.calc();

		int calPay = 0;

		/*
		 * if (month1 != null) {
		 * 
		 * month2 = "2016-09-30"; month1 = "2016-09-01";
		 * 
		 * System.out.println(month1); System.out.println(month2); list =
		 * pd.calc(month1, month2); }
		 */

		if (carNum != null) {
			if (date1.length() != 0) {

				System.out.println("date1 : " + date1);

				list = pd.calc(date1, date2, carNum);

			} else {
				list = pd.calc(carNum);
			}

			if (list == null) {
				list = Collections.EMPTY_LIST;
			}

		}

		if (carNum == null) {

			if (date1 != null) {

				list = pd.calc(date1, date2);
			}

			if (date1 == null) {
				list = pd.calc();
			}

			if (list == null) {
				list = Collections.EMPTY_LIST;
			}
		}

		for (int i = 0; i < list.size(); i++) {
			calPay += list.get(i).getPay();
		}

		request.setAttribute("list", list);
		request.setAttribute("num", list.size());
		request.setAttribute("calPay", calPay);

		return "/park/calcPro.jsp";
	}

}
