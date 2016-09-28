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
		if(pass==null){
			pass="";
		}
		System.out.println("받아온 암호 : "+passwd);
		System.out.println("기존 암호 : "+pass);
		if(pass.equals(passwd)){
			dao.deleteMemo(memoNum);
			request.setAttribute("result", "1");
		} else{
			request.setAttribute("result", "0");
		}
		
		return "/memo/deletePro.jsp";
	}

}