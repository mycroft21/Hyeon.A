package kosta125.team3.memo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.park.MemoVO;
import kosta125.team3.subcon.SubCon;

public class SearchProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String keyField = request.getParameter("keyField");
	    String keyWord = request.getParameter("keyWord");
		
	    MemoDAO dao = new MemoDAO();
	    ArrayList<MemoVO> list = new ArrayList<MemoVO>();
		
		list = dao.search(keyField, keyWord);
		
		ArrayList<Integer> memoNum = new ArrayList<Integer>();
		ArrayList<String> subject = new ArrayList<String>();
		ArrayList<String> content = new ArrayList<String>();
		
		request.setAttribute("memoNum", memoNum);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);

		return "/memo/searchPro.jsp";
	}

}