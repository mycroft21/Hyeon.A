package kosta125.team3.subcon;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class PayPro2Action implements SubCon {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ParkDAO dao = ParkDAO.getInstance();
				
		ParkVO vo = new ParkVO();
		String 	carnum,	parknum,intime,outtime;
				
		String out = request.getParameter("out");
		carnum = request.getParameter("carnum");
		parknum= request.getParameter("parknum");
		intime = request.getParameter("intime");
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date parsedDate = sdf.parse(intime);
		Timestamp writeDate = new Timestamp(parsedDate.getTime());
		
		outtime = request.getParameter("outtime");
		vo.setCarNum(carnum);
		vo.setInTime(writeDate);
		vo.setParkNum(parknum);
		int pay = Integer.parseInt(request.getParameter("pay"));
		
		dao.insertCalDB(vo, out, pay);
		
		return "/park/list.jsp";
	}

}
