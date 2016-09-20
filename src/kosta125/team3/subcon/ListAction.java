package kosta125.team3.subcon;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;

public class ListAction implements SubCon{

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fnum = request.getParameter("fnum");
		ParkDAO dao = ParkDAO.getInstance();
		List list1 = dao.list(fnum, 1);
		List list2 = dao.list(fnum, 2);
		List list3 = dao.list(fnum, 3);
		List list4 = dao.list(fnum, 4);
		System.out.println(list1);
		System.out.println(list2);
		System.out.println(list3);
		System.out.println(list4);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		return "/park/list.jsp";
	}
	
}
