<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정산부</title>
</head>

<body>
	<div class="calc_wrap">
		<div class="calc">
			<!-- 버튼부  -->
			<form action="calcPro.park" method="post" name="calcPro">
				<br> <br> <br> <input type="date" name="date1">
				부터 <input type="date" name="date2"> 까지 <input type="submit"
					value="전송"> <input type="reset" value="초기화"><br>
			</form>
			<!-- 내용 표시부 디폴트 당일 정산 내역 -->
		<div class="calc_table_wrap"	>
				<table class="calc_top">
						<tr>
							<th class="top_th1">주차장 번호</th>
							<th class="top_th2">차량번호</th>
							<th class="top_th3">입차 시간</th>
							<th class="top_th4">출차 시간</th>
							<th class="top_th5">요금</th>
						</tr>
				</table>
			<div class="calc_mid">
				<table class="calc_table_mid">
							<c:forEach var="list" items="${list }">
								<tr>
									<td class="calc_cell_1"><c:out value="${list.parkNum }" /></td>
									<td class="calc_cell_1"><c:out value="${list.carNum }" /></td>
									<td class="calc_cell_2"><c:out value="${list.inTime }" /></td>
									<td class="calc_cell_2"><c:out value="${list.outTime }" /></td>
									<td class="calc_cell_1"><c:out value="${list.pay }" /></td>
								</tr>
							</c:forEach>
				</table>
			</div>
					<table class="calc_bottom">
							<tr>
								<td class="calc_table_td" colspan="3"><b>총 매출</b></td>
								<td class="calc_table_td" colspan="2"><b><c:out value="${calPay }" /></b></td>
							</tr>
					</table>
			</div>
		</div>
	</div>		
</body>
</html>