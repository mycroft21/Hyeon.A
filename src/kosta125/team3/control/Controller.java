package kosta125.team3.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import kosta125.team3.park.LoginVO;
import kosta125.team3.park.ParkDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta125.team3.subcon.LogoutAction;
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
	/*서브 컨트롤러를 생성해서 맵에 담아두고 꺼내서*/
	/*process(request, response) method를 사용할 준비를 합니다.*/
	public void init(ServletConfig config) throws ServletException {
		
		String proper = config.getInitParameter("propertyConfig");
		/*config.getInitParameter() - web.xml의 init-param을 통해 설정한 값을 받아오는 명령어입니다.*/
		/*proper에 담기는 String 값은 E:/HyeonA/hyeonA/WebContent/WEB-INF/command.properties입니다.*/
		Properties pr = new Properties();
		/*Properties는 Map을 상속 받은 클래스입니다.*/
		/*하지만 HashMap은 파일을 읽어올 수 없고, Properties는*/
		/*파일을 읽어서 내용을 담아낼 수 있습니다.*/
		FileInputStream fis = null;
		
		try {
			
			fis = new FileInputStream(proper);
			/*FileInputStream을 이용해 command.properties 파일을 불러냅니다.*/
			pr.load(fis);
			/*그 파일의 내용을 Properties 객체에 담습니다.*/ 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null)
				try {
					fis.close();
					/*사용이 끝난 fis 객체를 닫습니다.*/
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		Iterator proIter = pr.keySet().iterator();
		/*이터레이터를 이용해 Properties의 내용을 빼낼 준비를 합니다.*/
		
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
	      System.out.println(classMap.size());
	      String view = null;
	      SubCon subcon = null;
	      
	      ParkDAO dao = ParkDAO.getInstance();
	      int all = dao.setAll();
	      int cu = dao.setCu();
	      int partA = dao.setPartAll("A");
	      int partB = dao.setPartAll("B");
	      int partC = dao.setPartAll("C");
	      int partD = dao.setPartAll("D");
	      int cuA = dao.setCuA();
	      int cuB = dao.setCuB();
	      int cuC = dao.setCuC();
	      int cuD = dao.setCuD();      
	      
	      request.setAttribute("all", all);
	      request.setAttribute("cu", cu);
	      request.setAttribute("partA", partA);
	      request.setAttribute("partB", partB);
	      request.setAttribute("partC", partC);
	      request.setAttribute("partD", partD);
	      request.setAttribute("cuA", cuA);
	      request.setAttribute("cuB", cuB);
	      request.setAttribute("cuC", cuC);
	      request.setAttribute("cuD", cuD);
	      
	      try {
	         String fullCommand = request.getRequestURI();
	         System.out.println("fullCommand : " + fullCommand); //확인용
	         /*fullCommand = hyeonA/List.park*/
	         
	         String projectName = request.getContextPath();
	         System.out.println("projectName : " + projectName);
	         /*projectName = hyeonA*/
	         String classKey = null;
	         /*이 변수에는 fullCommand - projectName이 들어갈 예정*/
	         
	         if(fullCommand.indexOf(projectName)==0){
	            classKey = fullCommand.substring(projectName.length()+1);
	            System.out.println("classKey : " + classKey);
	         }
	         
	         subcon = (SubCon) classMap.get(classKey);
	         System.out.println("subcon : " + subcon);
	         
	         view = subcon.process(request, response);
	         System.out.println("view : " + view);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      HttpSession session = request.getSession();
	      LoginVO lvo = (LoginVO) session.getAttribute("admin");
	      request.setAttribute("CONTENT", view);
	      System.out.println(lvo);
	      
	      if(lvo == null) {
	    	  if(view.contains("loginPro")) {
	    	  } else {
	    		  request.setAttribute("CONTENT", "/park/login.jsp");
	    	  }
	    	  
	    	  RequestDispatcher rd = request.getRequestDispatcher("/template/logintemp.jsp");
	    	  rd.forward(request, response);
	    	  
	      } else {
	    	  if(view.contains("loginPro")) {
	    		  RequestDispatcher rd = request.getRequestDispatcher("/template/logintemp.jsp");
	    		  rd.forward(request, response);
	    	  } else {
	    		  RequestDispatcher rd = request.getRequestDispatcher("/template/template.jsp");
	    		  rd.forward(request, response);
	    		  /*해당 내용을 템플릿으로 보냅니다.*/
	    	  }
	      }
	   }
}
