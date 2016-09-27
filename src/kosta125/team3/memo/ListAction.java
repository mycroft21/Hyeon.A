package kosta125.team3.memo;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.MemoDAO;
import kosta125.team3.subcon.SubCon;

public class ListAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 int pageSize = 6;   
	      SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	      String  pageNum = request.getParameter("pageNum");
	      
	      if( pageNum == null ) pageNum = "1";
	      
	      int currentPage = Integer.parseInt(pageNum);
	      int startRow = (currentPage * pageSize ) - (pageSize-1) ;  
	      int endRow = currentPage * pageSize ; 
	      int count = 0,  number = 0;
	      
	      List list = null;
	      
	      MemoDAO dao = MemoDAO.getInstance(); 
	      
	      count = dao.getListAllcount();  
	      
	      if( count > 0 ){
	         list = dao.getSelectAll(startRow, endRow ); 
	      } else {
	         list=Collections.EMPTY_LIST;
	      }
	      number = count - ( currentPage - 1 ) * pageSize ;
	      request.setAttribute("currentPage", new Integer(currentPage));
	      request.setAttribute("startRow", new Integer(startRow));
	      request.setAttribute("endRow", new Integer(endRow));
	      request.setAttribute("count", new Integer(count));
	      request.setAttribute("pageSize", new Integer(pageSize));
	      request.setAttribute("number", new Integer(number));
	      request.setAttribute("list", list);
	      
	      return "/memo/list.memo";
	}

}
