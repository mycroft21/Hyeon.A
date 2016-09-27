package kosta125.team3.memo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.park.MemoVO;
import kosta125.team3.subcon.SubCon;

public class DeleteProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int memoNum = Integer.parseInt(request.getParameter("memoNum"));
		String passwd = request.getParameter("passwd");
		MemoDAO dao = MemoDAO.getInstance();
		MemoVO vo = dao.selectedVOAll(memoNum);
		String pass = vo.getPass();
		System.out.println("�޾ƿ� ��ȣ : "+passwd);
		System.out.println("���� ��ȣ : "+pass);
		if(pass.equals(passwd)){
			dao.deleteMemo(memoNum);
			request.setAttribute("result", "1");
		} else{
			request.setAttribute("result", "0");
			
		}
		
		return "/memo/deletePro.jsp";
	}

}