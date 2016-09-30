package kosta125.team3.subcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta125.team3.park.LoginDAO;
import kosta125.team3.park.LoginVO;

public class LoginAction implements SubCon{

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginVO vo = new LoginVO();
		LoginDAO dao = LoginDAO.getInstance();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		vo.setId(id);
		vo.setPassword(password);
		
		HttpSession session = request.getSession();
		
		int result = dao.loginCheck(vo);
		
		if(result == 1) {
			session.setAttribute("admin", vo);
			request.setAttribute("result", 1);
		} else {
			session.invalidate();
			request.setAttribute("result", 0);
		}
		
		return "/park/loginPro.jsp";
	}
	
}
