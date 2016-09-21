package kosta125.team3.subcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class RegistProAction implements SubCon {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ParkVO vo = new ParkVO();
		
		vo.setCarNum(request.getParameter("carNum"));
		vo.setParkNum(request.getParameter("parkNum"));
		
		ParkDAO dao = ParkDAO.getInstance();
		dao.regist(vo);
		
		request.setAttribute("carNum", vo.getCarNum());
		request.setAttribute("parkNum", vo.getParkNum());
		
		return "/park/registPro.jsp";
	}

}
