package kosta125.team3.subcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class SearchProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String carnum = request.getParameter("search");
		ParkDAO dao = new ParkDAO();
		
		String parkNum = null;
		parkNum = dao.search(carnum);
		
		System.out.println(parkNum);
		
		request.setAttribute("parknum", parkNum);
		request.setAttribute("carnum", carnum);
		
		return "/park/searchPro.jsp";
	}

}
