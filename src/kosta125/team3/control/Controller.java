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
			String className = pr.getProperty(command);
		}
		
	}
	
	
	
}
