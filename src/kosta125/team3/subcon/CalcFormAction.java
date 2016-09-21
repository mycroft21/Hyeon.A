package kosta125.team3.subcon;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.CalVO;
import kosta125.team3.park.ParkDAO;

public class CalcFormAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yy-mm");
		String ts = sdf.format(System.currentTimeMillis());
		
		request.setAttribute("month", ts);
		
		
		return "/park/calcForm.jsp";
	}

}
