package kosta125.team3.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.park.MemoVO;
import kosta125.team3.subcon.SubCon;

public class DeleteFormAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int memoNum = Integer.parseInt(request.getParameter("memoNum"));
		MemoDAO dao = MemoDAO.getInstance();
		MemoVO vo = dao.selectedVO(memoNum);
		request.setAttribute("vo", vo);
		return "/memo/deleteForm.jsp";
	}

}
