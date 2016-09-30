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
		request.setCharacterEncoding("UTF-8");
		
		ParkDAO dao = ParkDAO.getInstance();
		String parkNum = request.getParameter("parkNum");
		String carNum = request.getParameter("carNum");
		String inTime = request.getParameter("inTime");
		String pay = request.getParameter("pay");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date parsedDate = sdf.parse(inTime);
		Timestamp writeDate = new Timestamp(parsedDate.getTime());
		Timestamp outtime = new Timestamp(System.currentTimeMillis());
		
		ParkVO vo = new ParkVO();
		
		vo.setParkNum(request.getParameter("parkNum"));
		vo.setCarNum(request.getParameter("carNum"));
		vo.setInTime(writeDate);
		
		dao.insertCalDB(vo, outtime, pay);
		dao.clear(vo);
		
		request.setAttribute("carNum", carNum);
		
	  	return "/park/payPro.jsp";

	}

}
