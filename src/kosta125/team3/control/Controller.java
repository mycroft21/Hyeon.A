package kosta125.team3.control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	/*init() method : 서버를 처음 시작할 때 필요한 설정을 합니다.*/
	/*서브 컨트롤러를 생성해서 맵에 담아두고 꺼내서 process() method를*/
	/*사용할 준비를 합니다.*/
	public void init(ServletConfig config) throws ServletException {
		
		String proper = config.getInitParameter("propertyConfig");
		/*config.getInitParameter() - web.xml의 init-param을 통해 설정한 값을 받아오는 명령어입니다.*/
		/*proper에 담기는 String 값은 E:/HyeonA/hyeonA/WebContent/WEB-INF/command.properties입니다.*/
		Properties pr = new Properties();
		FileInputStream fis = null;
		
		try {
			
			fis = new FileInputStream(proper);
			pr.load(fis);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null)
				try {
					fis.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		Iterator proIter = pr.keySet().iterator();
		
		while(proIter.hasNext()){
			String command = (String) proIter.next();
			String className = pr.getProperty(command);
		}
		
	}
	
	
	
}
