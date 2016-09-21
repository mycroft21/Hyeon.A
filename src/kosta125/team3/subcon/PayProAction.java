package kosta125.team3.subcon;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class PayProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ParkDAO dao = ParkDAO.getInstance();
		String parkNum = request.getParameter("parkNum");
		String carNum = request.getParameter("carNum");
		String inTime = request.getParameter("inTime");
		System.out.println(parkNum);
		System.out.println(carNum);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date parsedDate = sdf.parse(inTime);
		Timestamp writeDate = new Timestamp(parsedDate.getTime());
		
		ParkVO vo = new ParkVO();
		
		vo.setParkNum(request.getParameter("parkNum"));
		vo.setCarNum(request.getParameter("carNum"));
		vo.setInTime(writeDate);
		
		int pay = dao.pay(vo);
		
		request.setAttribute("carNum", carNum);
	  	request.setAttribute("pay", pay);		
		
	  	return "/park/payPro.jsp";
	}

}
