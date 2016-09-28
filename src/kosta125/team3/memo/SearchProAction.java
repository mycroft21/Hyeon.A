package kosta125.team3.memo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
	    int startRow = Integer.parseInt(request.getParameter("startRow"));
	    int endRow = Integer.parseInt(request.getParameter("endRow"));
		
	    MemoDAO dao = new MemoDAO();
	    ArrayList<MemoVO> list2 = new ArrayList<MemoVO>();
		list2 = dao.search(keyField, keyWord, startRow, endRow);
		
		ArrayList<Integer> memoNum = new ArrayList<Integer>();
		ArrayList<String> subject = new ArrayList<String>();
		ArrayList<String> content = new ArrayList<String>();
				
		// 리스트 형식
		int pageSize = 6;   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    String pageNum = request.getParameter("pageNum");
	      
	    if( pageNum == null ) pageNum = "1";
	      
	    int currentPage = Integer.parseInt(pageNum);
	    startRow = (currentPage * pageSize ) - (pageSize-1) ;  
	    endRow = currentPage * pageSize ; 
	    int count = 0,  number = 0;	
	    
	    List list = null;
	    
	    count = dao.getListAllcount();  
	    
	    if( count > 0 ){
	        list = dao.getSelectAll(startRow, endRow ); 
	     } else {
	        list = Collections.EMPTY_LIST;
	     }
		
	    number = count - ( currentPage - 1 ) * pageSize ;
	     
	    request.setAttribute("currentPage", new Integer(currentPage));
	    request.setAttribute("startRow", new Integer(startRow));
	    request.setAttribute("endRow", new Integer(endRow));
	    request.setAttribute("count", new Integer(count));
	    request.setAttribute("pageSize", new Integer(pageSize));
	    request.setAttribute("number", new Integer(number));
	    request.setAttribute("list", list);
	    
		request.setAttribute("list2", list2);
		request.setAttribute("memoNum", memoNum);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);

		return "/memo/searchPro.jsp";
	}

}