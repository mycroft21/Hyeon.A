package kosta125.team3.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.subcon.SubCon;

public class Controller extends HttpServlet{

	/*서브 컨트롤러를 담아놓고 사용할 맵*/
	private Map classMap = new HashMap<>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
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
			/*1회차에 담기는 값 : command = list.park*/
			String className = pr.getProperty(command);
			/*1회차에 담기는 값 : className = kosta125.team3.subcon.ListAction*/
			try {
				Class notClass = Class.forName(className);
				/*클래스로서의 기능을 하도록 해당 경로명의 클래스를 '선언'*/
				Object classInstance = notClass.newInstance();
				/*객체로서의 기능을 하도록 해당 객체를 생성*/
				classMap.put(command, classInstance);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}/*while*/
		
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(classMap);
		String view = null;
		SubCon subcon = null;
		
		try {
			String fullCommand = request.getRequestURI();
			/*fullCommand = hyeonA/List.park*/
			System.out.println("fullCommand : "+fullCommand);//확인용
			String projectName = request.getContextPath();
			/*projectName = hyeonA*/
			String classKey = null;
			/*이 변수에는 fullCommand - projectName이 들어갈 예정*/
			
			if(fullCommand.indexOf(projectName)==0){
				classKey = fullCommand.substring(projectName.length()+1);
				System.out.println(classKey);
			}
			
			subcon = (SubCon) classMap.get(classKey);
			System.out.println("subcon : "+subcon);
			view = subcon.process(request, response);
			System.out.println("view : "+view);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("CONTENT", view);
		RequestDispatcher rd = request.getRequestDispatcher("template/template.jsp");
		rd.forward(request, response);
		/*해당 내용을 템플릿으로 보냅니다.*/
	}
	
}
