package kosta125.team3.subcon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta125.team3.park.ParkDAO;
import kosta125.team3.park.ParkVO;

public class SearchProAction implements SubCon {

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		String A = request.getParameter("search");
		String check = "800";
		String fnum=request.getParameter("fnum");
		ParkVO vo = new ParkVO();
		
		ArrayList<ParkVO> list = new ArrayList<ParkVO>();
		ParkDAO da = new ParkDAO();
		list = da.search(A);

		ArrayList<String> carNum = new ArrayList<String>();
		ArrayList<ParkVO> carinfo = new ArrayList<ParkVO>();
		ArrayList<String> parkNum = new ArrayList<String>();

		if (list.size() != 0) {
			
			for (int i = 0; i < list.size(); i++) {

				vo=list.get(i);
				
				parkNum.add(vo.getParkNum());
				carNum.add(vo.getCarNum());
				carinfo.add(vo);
			}
		}
		
		request.setAttribute("carNum", carNum);
		request.setAttribute("carinfo", carinfo);
		
		System.out.println("carinfo : "+carinfo);
		System.out.println("carNum : "+carNum);
		

		ParkDAO dao = ParkDAO.getInstance();
		
		System.out.println("parkNum"+parkNum);
		
		if(parkNum.size()<=0){
			request.setAttribute("check", 0);
		}else{
		String cutNum = parkNum.get(0).substring(0, 2);
		
		System.out.println("cutNum"+cutNum);
		if(fnum==null){
			fnum="1F";
			switch (cutNum) {
			case "1F": fnum="1F"; break;
			case "2F": fnum="2F"; break;
			case "3F": fnum="3F"; break;
			case "4F": fnum="4F"; break;	
			}
		}
		
		List list1 = dao.list(fnum, 1);
		List list2 = dao.list(fnum, 2);
		List list3 = dao.list(fnum, 3);
		List list4 = dao.list(fnum, 4);
		List list5 = dao.list(fnum, 5);
		
		 
		if (carNum.size() > 0) {
			int x = carNum.size();
			request.setAttribute("check", x);
			request.setAttribute("fnum", fnum);
			request.setAttribute("search", A);
		} else {
			request.setAttribute("check", 0);
		}

		System.out.println("carNum.size() : "+carNum.size());
		

		for (int i = 1; i <= list1.size(); i++) {
			ParkVO temp = (ParkVO) list1.get(i - 1);
			String ts = "avo" + String.valueOf(i);
			
			int z = 0;
			for (int j = 0; j < carNum.size(); j++) {
				if (carNum.get(j).equals(temp.getCarNum())) {
					z++;
					String ta = "acar" + String.valueOf(i - 1);
					request.setAttribute(ta, j);
				}
			}
			if (z != 0) {
				String ta = "acar" + String.valueOf(i - 1);
				request.setAttribute(ta, check);
			}
			request.setAttribute(ts, temp);
		}

		for (int i = 1; i <= list2.size(); i++) {
			ParkVO temp = (ParkVO) list2.get(i - 1);
			String ts = "bvo" + String.valueOf(i);
			int z = 0;
			for (int j = 0; j < carNum.size(); j++) {
				if (carNum.get(j).equals(temp.getCarNum())) {
					z++;
					String ta = "bcar" + String.valueOf(i - 1);
					request.setAttribute(ta, j);
				}
			}
			if (z != 0) {
				String ta = "bcar" + String.valueOf(i - 1);
				request.setAttribute(ta, check);
			}
			request.setAttribute(ts, temp);
		}

		for (int i = 1; i <= list3.size(); i++) {
			ParkVO temp = (ParkVO) list3.get(i - 1);
			String ts = "cvo" + String.valueOf(i);
			int z = 0;
			for (int j = 0; j < carNum.size(); j++) {
				if (carNum.get(j).equals(temp.getCarNum())) {
					z++;
					String ta = "ccar" + String.valueOf(i - 1);
					request.setAttribute(ta, j);
				}
			}
			if (z != 0) {
				String ta = "ccar" + String.valueOf(i - 1);
				request.setAttribute(ta, check);

			}
			request.setAttribute(ts, temp);
		}

		for (int i = 1; i <= list4.size(); i++) {
			ParkVO temp = (ParkVO) list4.get(i - 1);
			String ts = "dvo" + String.valueOf(i);
			int z = 0;
			for (int j = 0; j < carNum.size(); j++) {
				if (carNum.get(j).equals(temp.getCarNum())) {
					z++;
					String ta = "dcar" + String.valueOf(i - 1);
					request.setAttribute(ta, j);
				}
			}
			if (z != 0) {
				String ta = "dcar" + String.valueOf(i - 1);
				request.setAttribute(ta, check);
			}
			request.setAttribute(ts, temp);
		}

		for (int i = 1; i <= list5.size(); i++) {

			ParkVO temp = (ParkVO) list5.get(i - 1);
			String ts = "evo" + String.valueOf(i);
			int z = 0;
			for (int j = 0; j < carNum.size(); j++) {
				if (carNum.get(j).equals(temp.getCarNum())) {
					z++;
					String ta = "ecar" + String.valueOf(i - 1);
					request.setAttribute(ta, j);
				}
			}
			if (z != 0) {
				String ta = "ecar" + String.valueOf(i - 1);
				request.setAttribute(ta, check);
			}
			request.setAttribute(ts, temp);
		}
		}
		return "/park/searchPro.jsp";
	}

}
