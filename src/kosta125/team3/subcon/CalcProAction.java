package kosta125.team3.subcon;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.CalVO;
import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class CalcProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ParkDAO pd = new ParkDAO();
		String date1 = sdf.format(request.getParameter("date1"));
		String date2 = sdf.format(request.getParameter("date2"));
		String month = sdf.format(request.getParameter("month"));
		
		
		
		System.out.println(date1);
		System.out.println(month);
		
		List<CalVO> list = pd.calc();
		int calPay = 0;

		
		
			if(month!=null){
				list = pd.calc(month,month);
			}
		if (date1 != null) {
			list = pd.calc(date1,date2);}
		
		
		list = pd.calc();
System.out.println(list);
		for (int i = 0; i < list.size(); i++) {
			calPay += list.get(i).getPay();
		}

		request.setAttribute("list", list);
		request.setAttribute("num", list.size());
		request.setAttribute("calPay", calPay);
		
		return "/park/calcPro.jsp";
	}

}
