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
	     
	    if( pageNum == null ) pageNum = "1";
	     
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage * pageSize ) - (pageSize-1) ;
	    int endRow = currentPage * pageSize ; 
	    int count = 0,  number = 0;
	    
	    if(startRow <= 0) {	// �� ���� ���� 0���� ���ų� �۴ٸ� 1�� ����
	    	startRow = 1;
	    }
	
	    MemoDAO dao = new MemoDAO();
	    List list = null;
	    
	    if(keyWord == null) {	// �˻�Ű���尡 ���ٸ�
	    	count = dao.getListAllcount();	// �� �޸� ��
	    	
	    	if( count > 0 ){
		       list = dao.getSelectAll(startRow, endRow); 
		       
		    } else {
		       list = Collections.EMPTY_LIST;	// null�� �ƴ����� size�� 0�� �����
		    }
	    	
	    } else {	// �˻�Ű���尡 �ִٸ�
	    	count = dao.searchCount(keyField, keyWord);	// �˻� �� �� �޸� ��
	    	
	    	if( count > 0 ){
	    		list = dao.search(keyField, keyWord, startRow, endRow);
	    		
			} else {
			    list = Collections.EMPTY_LIST;
			}
	    }
	    
	    System.out.println("ī��Ʈ" + count);    
	    number = count - ( currentPage - 1 ) * pageSize ;
	    
	    request.setAttribute("currentPage", new Integer(currentPage));
	    request.setAttribute("pageSize", new Integer(pageSize));
	    request.setAttribute("number", new Integer(number));
	    request.setAttribute("keyField", keyField);
	    request.setAttribute("keyWord", keyWord);
	    request.setAttribute("list", list);
	    request.setAttribute("count", count);
	    
	    return "/memo/list.jsp";
	}

}
