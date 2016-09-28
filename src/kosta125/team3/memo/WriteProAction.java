package kosta125.team3.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.park.MemoVO;
import kosta125.team3.subcon.SubCon;

public class WriteProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		MemoDAO dao = MemoDAO.getInstance();
		MemoVO vo = new MemoVO();
		
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPass(request.getParameter("password"));

		dao.insert(vo);
		
		return "/memo/writePro.jsp";
	}

}
