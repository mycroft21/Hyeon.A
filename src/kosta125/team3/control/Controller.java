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

	/*���� ��Ʈ�ѷ��� ��Ƴ��� ����� ��*/
	private Map classMap = new HashMap<>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	/*init() method : ������ ó�� ������ �� �ʿ��� ������ �մϴ�.*/
	/*���� ��Ʈ�ѷ��� �����ؼ� �ʿ� ��Ƶΰ� ������ process() method��*/
	/*����� �غ� �մϴ�.*/
	public void init(ServletConfig config) throws ServletException {
		
		String proper = config.getInitParameter("propertyConfig");
		/*config.getInitParameter() - web.xml�� init-param�� ���� ������ ���� �޾ƿ��� ��ɾ��Դϴ�.*/
		/*proper�� ���� String ���� E:/HyeonA/hyeonA/WebContent/WEB-INF/command.properties�Դϴ�.*/
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
		String view = null;
		SubCon subcon = null;
		
		try {
			String fullCommand = request.getRequestURI();
			/*fullCommand = hyeonA/List.park*/
			System.out.println("fullCommand : "+fullCommand);//Ȯ�ο�
			String projectName = request.getContextPath();
			/*projectName = hyeonA*/
			String classKey = null;
			/*�� �������� fullCommand - projectName�� �� ����*/
			
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
		/*�ش� ������ ���ø����� �����ϴ�.*/
	}
	
}
