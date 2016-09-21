package kosta125.team3.subcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;

public class SearchProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String carnum = request.getParameter("search");
		ParkDAO pd = new ParkDAO();
		String spot = pd.search(carnum);
		
		request.setAttribute("parknum", spot);
		
		return "/park/serchPro.jsp";
	}

}
