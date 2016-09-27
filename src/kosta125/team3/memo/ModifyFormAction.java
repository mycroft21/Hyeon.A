package kosta125.team3.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.park.MemoVO;
import kosta125.team3.subcon.SubCon;

public class ModifyFormAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		int memoNum = Integer.parseInt(request.getParameter("memoNum"));

		MemoDAO dao = MemoDAO.getInstance();
		MemoVO vo = dao.selectedVOAll(memoNum);
		
		request.setAttribute("memoNum", vo.getMemoNum());
		request.setAttribute("subject", vo.getSubject());
		request.setAttribute("content", vo.getContent());
		request.setAttribute("memoTime", vo.getMemoTime());
		request.setAttribute("pass", vo.getPass());

		return "/memo/modifyForm.jsp";
	}

}
