<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<!-- 버튼부 -->
		<form action="calcPro.park" method="post" name="calcform" >
		<a href="calcPro.park"> 당일 정산 보기</a> <br> 
		
		<input type="month" name="month" value="${month }">
		<input type="submit"			value="월정산 보기">
		 <br>
				 <input type="date" name="date1">
		부터 <input type="date" name="date2"> 까지 <input type="submit"
			value="전송">
			<input type="reset" value="초기화"><br>
			</form>
	</div>


</body>
</html>