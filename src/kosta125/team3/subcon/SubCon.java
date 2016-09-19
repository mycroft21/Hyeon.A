package kosta125.team3.subcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
