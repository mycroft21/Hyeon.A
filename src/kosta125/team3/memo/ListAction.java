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

public class ListAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		int pageSize = 6;   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    
	    String pageNum = request.getParameter("pageNum");
	    String keyField = request.getParameter("keyField");
	    String keyWord = request.getParameter("keyWord");
	          
	    if(pageNum == null) {
	    	pageNum = "1";
	    }
	    
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage * pageSize ) - (pageSize-1) ;
	    int endRow = currentPage * pageSize ; 
	    int count = 0,  number = 0;
	    
	    if(startRow <= 0) {	// 글 시작 열이 0보다 같거나 작다면 1로 보냄
	    	startRow = 1;
	    }
	
	    MemoDAO dao = new MemoDAO();
	    List list = null;
	    
	    if(keyWord == null) {	// 검색키워드가 없다면
	    	count = dao.getListAllcount();	// 총 메모 수
	    	
	    	if( count > 0 ){
		       list = dao.getSelectAll(startRow, endRow); 
		       
		    } else {
		       list = Collections.EMPTY_LIST;	// null은 아니지만 size가 0인 상수값
		    }
	    	
	    } else {	// 검색키워드가 있다면
	    	count = dao.searchCount(keyField, keyWord);	// 검색 시 총 메모 수
	    	
	    	if( count > 0 ){
	    		list = dao.search(keyField, keyWord, startRow, endRow);
	    		
			} else {
			    list = Collections.EMPTY_LIST;
			}
	    }
	    
	    System.out.println("카운트" + count);   
	    
	    number = count - ( currentPage - 1 ) * pageSize ;
	    int pageCount = Math.round(count / pageSize + ( count % pageSize == 0 ? 0 : 1 ));
	    
	    request.setAttribute("currentPage", new Integer(currentPage));
	    request.setAttribute("pageSize", new Integer(pageSize));
	    request.setAttribute("number", new Integer(number));
	    request.setAttribute("keyField", keyField);
	    request.setAttribute("keyWord", keyWord);
	    request.setAttribute("list", list);
	    request.setAttribute("count", count);
	    request.setAttribute("pageCount", pageCount);
	    
	    return "/memo/list.jsp";
	}

}
