<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/park_board.css"/>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="bg_white">

<table align="center">
<tr>
<td>
감사합니다.
<br> 
${vo.carNum } 차주님의 요금은 <br>
${pay } 입니다.


	<form action="payPro2.park" method="post">
			<input type="submit" value="출차">
			<input type="hidden" name="carnum" value="${vo.carNum}"/>
			<input type="hidden" name="parknum" value="${vo.parkNum}"/>
			<input type="hidden" name="intime" value="${vo.inTime}"/>
			<input type="hidden" name="outtime" value="${outtime}"/>
			<input type="hidden" name="pay" value="${pay }"/>
	</form>
</td>
</tr>
</table>
</div>
</body>
</html>