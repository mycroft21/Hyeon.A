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

	/*���� ��Ʈ�ѷ��� ��Ƴ��� ����� ��*/
	private Map classMap = new HashMap<>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	/*init() method : ������ ó�� ������ �� �ʿ��� ������ �մϴ�.*/
	/*���� ��Ʈ�ѷ��� �����ؼ� �ʿ� ��Ƶΰ� ������*/
	/*process(request, response) method�� ����� �غ� �մϴ�.*/
	public void init(ServletConfig config) throws ServletException {
		
		String proper = config.getInitParameter("propertyConfig");
		/*config.getInitParameter() - web.xml�� init-param�� ���� ������ ���� �޾ƿ��� ��ɾ��Դϴ�.*/
		/*proper�� ���� String ���� E:/HyeonA/hyeonA/WebContent/WEB-INF/command.properties�Դϴ�.*/
		Properties pr = new Properties();
		/*Properties�� Map�� ��� ���� Ŭ�����Դϴ�.*/
		/*������ HashMap�� ������ �о�� �� ����, Properties��*/
		/*������ �о ������ ��Ƴ� �� �ֽ��ϴ�.*/
		FileInputStream fis = null;
		
		try {
			
			fis = new FileInputStream(proper);
			/*FileInputStream�� �̿��� command.properties ������ �ҷ����ϴ�.*/
			pr.load(fis);
			/*�� ������ ������ Properties ��ü�� ����ϴ�.*/ 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null)
				try {
					fis.close();
					/*����� ���� fis ��ü�� �ݽ��ϴ�.*/
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		Iterator proIter = pr.keySet().iterator();
		/*���ͷ����͸� �̿��� Properties�� ������ ���� �غ� �մϴ�.*/
		
		while(proIter.hasNext()){
			String command = (String) proIter.next();
			/*1ȸ���� ���� �� : command = list.park*/
			String className = pr.getProperty(command);
			/*1ȸ���� ���� �� : className = kosta125.team3.subcon.ListAction*/
			try {
				Class notClass = Class.forName(className);
				/*Ŭ�����μ��� ����� �ϵ��� �ش� ��θ��� Ŭ������ '����'*/
				Object classInstance = notClass.newInstance();
				/*��ü�μ��� ����� �ϵ��� �ش� ��ü�� ����*/
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
	         System.out.println("fullCommand : " + fullCommand); //Ȯ�ο�
	         /*fullCommand = hyeonA/List.park*/
	         
	         String projectName = request.getContextPath();
	         System.out.println("projectName : " + projectName);
	         /*projectName = hyeonA*/
	         String classKey = null;
	         /*�� �������� fullCommand - projectName�� �� ����*/
	         
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
	    		  /*�ش� ������ ���ø����� �����ϴ�.*/
	    	  }
	      }
	   }
}
