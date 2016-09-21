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
<div class="calc">
	<div>
		<!-- 버튼부  -->
		<form action="calcPro.park" method="post" name="calcPro">
			 <input type="date" name="date1"> 부터
			 <input type="date" name="date2"> 까지 <input type="submit" value="전송">
			 <input type="reset" value="초기화"><br>
			<button>초기화면</button>
		</form>
	</div>
	<div>
		<!-- 내용 표시부 디폴트 당일 정산 내역 -->
		<table class="calc_table">
			<tr>
				<th>요금 합산</th>
				<th><c:out value="${calPay }" />
			</tr>
			<tr>
				<th>주차장 번호</th>
				<th>차량번호</th>
				<th>입차 시간</th>
				<th>출차 시간</th>
				<th>요금</th>
			</tr>
			<c:forEach var="list" items="${list }">
				<tr>
					<td><c:out value="${list.parkNum }" /></td>
					<td><c:out value="${list.carNum }" /></td>
					<td><c:out value="${list.inTime }" /></td>
					<td><c:out value="${list.outTime }" /></td>
					<td><c:out value="${list.pay }" /></td>
			</c:forEach>
			<tr>
			</tr>
		</table>
	</div>
</div>	
</body>
</html>