package kosta125.team3.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.park.MemoVO;
import kosta125.team3.subcon.SubCon;

public class WriteProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		MemoVO vo = new MemoVO();
		
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPass(request.getParameter("password"));
		
		MemoDAO dao = MemoDAO.getInstance();
		
		String password = request.getParameter("passwd");
		String pass = vo.getPass();
		if(pass.equals(password)){
			dao.insert(vo);
			request.setAttribute("result", "1");
		} else{
			request.setAttribute("result", "0");
		}
		return "/memo/writePro.jsp";
	}

}
