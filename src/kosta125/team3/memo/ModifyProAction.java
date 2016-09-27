package kosta125.team3.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.park.MemoVO;
import kosta125.team3.subcon.SubCon;

public class ModifyProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		MemoDAO dao = MemoDAO.getInstance();
		MemoVO vo = new MemoVO();

		vo.setMemoNum(Integer.parseInt(request.getParameter("memoNum")));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPass(request.getParameter("pass"));
		
		System.out.println(vo.getMemoNum());
		System.out.println(vo.getSubject());
		System.out.println(vo.getContent());
		System.out.println(vo.getPass());
		int check = dao.modify(vo);
		
		System.out.println("check: " + check);
		
		request.setAttribute("check", check);

		return "/memo/modifyPro.jsp";
	}

}
