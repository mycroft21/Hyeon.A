package kosta125.team3.subcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class PayPro2Action implements SubCon {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ParkDAO dao = ParkDAO.getInstance();
				
		ParkVO vo = new ParkVO();
		String out = request.getParameter("out");
		int pay = Integer.parseInt(request.getParameter("pay"));
		
		dao.insertCalDB(vo, out, pay);
		
		return "/park/payPro.jsp";
	}

}
