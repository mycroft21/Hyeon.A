package kosta125.team3.subcon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class SearchProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String carnum = request.getParameter("search");

		ParkDAO da = new ParkDAO();

		String parkNum = da.search(carnum);
		System.out.println(parkNum);

		request.setAttribute("parknum", parkNum);
		request.setAttribute("carnum", carnum);

		String fnum = "1F";

		ParkDAO dao = ParkDAO.getInstance();

		List list1 = dao.list(fnum, 1);
		List list2 = dao.list(fnum, 2);
		List list3 = dao.list(fnum, 3);
		List list4 = dao.list(fnum, 4);
		List list5 = dao.list(fnum, 5);

		System.out.println(parkNum);
		System.out.println(carnum);

		for (int i = 1; i <= list1.size(); i++) {
			ParkVO temp = (ParkVO) list1.get(i - 1);
			String ts = "avo" + String.valueOf(i);
			request.setAttribute(ts, temp);

		}

		for (int i = 1; i <= list2.size(); i++) {
			ParkVO temp = (ParkVO) list2.get(i - 1);
			String ts = "bvo" + String.valueOf(i);
			request.setAttribute(ts, temp);
		}

		for (int i = 1; i <= list3.size(); i++) {
			ParkVO temp = (ParkVO) list3.get(i - 1);
			String ts = "cvo" + String.valueOf(i);
			request.setAttribute(ts, temp);
		}

		for (int i = 1; i <= list4.size(); i++) {
			ParkVO temp = (ParkVO) list4.get(i - 1);
			String ts = "dvo" + String.valueOf(i);
			request.setAttribute(ts, temp);
		}

		for (int i = 1; i <= list5.size(); i++) {
			ParkVO temp = (ParkVO) list5.get(i - 1);
			String ts = "evo" + String.valueOf(i);
			request.setAttribute(ts, temp);
		}

		return "/park/searchPro.jsp";
	}

}
