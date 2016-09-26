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

		ArrayList<String> list = new ArrayList<String>();
		
		
		ParkDAO da = new ParkDAO();

		list = da.search(A);

		ArrayList<String> carNum = new ArrayList<String>();
		ArrayList<ParkVO> carinfo = new ArrayList<ParkVO>();

		if (list.size() != 0) {
			
			for (int i = 0; i < list.size(); i=i+2) {
				ParkVO vo = new ParkVO();

				vo.setCarNum("");vo.setParkNum("");
				
				vo.setCarNum(list.get(i));
				vo.setParkNum(list.get(i+1));
			
				carNum.add(vo.getCarNum());
				
				System.out.println("\n"+vo.getCarNum()+"\n");
				System.out.println("vo="+vo);
				
				carinfo.add(vo);
			}
		}
		
		request.setAttribute("carNum", carNum);
		request.setAttribute("carinfo", carinfo);

		

		String fnum = "1F";

		ParkDAO dao = ParkDAO.getInstance();

		List list1 = dao.list(fnum, 1);
		List list2 = dao.list(fnum, 2);
		List list3 = dao.list(fnum, 3);
		List list4 = dao.list(fnum, 4);
		List list5 = dao.list(fnum, 5);

		if (carNum.size() > 0) {
			int x = carNum.size();
			request.setAttribute("cheak", x);
		} else {
			request.setAttribute("cheak", 0);
		}

		System.out.println(carNum.size());

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

		return "/park/searchPro.jsp";
	}

}
