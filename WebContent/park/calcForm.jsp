<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<!-- 버튼부 -->
		<form action="calcPro.park" method="post" name="calcform" >
		<br>
		<a href="calcPro.park"> 당일 정산 보기</a> <br> 
		
	
		<%-- <input type="month" name="month" value="${month }">
		<input type="submit"			value="월정산 보기"> --%>
		 <br>
		 검색할 특정 차량의 번호를 입력하세요! &nbsp;&nbsp;
		 <input type = "text" name = "carNum"  class="textbox">&nbsp;<input type="submit" value="검색">
		 
		 <br><br>
				 <input type="date" name="date1" class="datebox"> - <input type="date" name="date2"  class="datebox">  
				 <input type="submit" value="검색" > 
				<input type="reset" value="초기화" ><br>
			</form>
	</div>


</body>
</html>