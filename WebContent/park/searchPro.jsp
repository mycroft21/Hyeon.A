<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>차량검색 pro</title>
</head>
<body>
	<c:if test="${parknum==null }">
		<jsp:include page="list.jsp"/>
		조회하시는 차가 없습니다.
	</c:if>
	
	

	
	<p><font size="5" style="font-style:'맑은고딕' ; text-align: center;" >주차 조회 현황</font></p>
	<table border="1" cellspacing="0">
		<tr height="75px">
			<td width="120px">A-1</td>
			<td rowspan="5" width="120px"></td>
			<td width="120px">B-1</td>
			<td width="120px">C-1</td>
			<td rowspan="5" width="120px"></td>		
			<td width="120px">D-1</td>
		</tr>
		
		<tr height="75px">
			<td width="120px">A-2</td>
			<td width="120px">B-2</td>
			<td width="120px">C-2</td>
			<td width="120px">D-2</td>
		</tr>

		<tr height="75px">
			<td width="120px">A-3</td>
			<td width="120px">B-3</td>
			<td width="120px">C-3</td>
			<td width="120px">D-3</td>
		</tr>
		
		<tr height="75px">
			<td width="120px">A-4</td>
			<td width="120px">B-4</td>
			<td width="120px">C-4</td>
			<td width="120px">D-4</td>
		</tr>
		
		<tr height="75px">
			<td width="120px">A-5</td>
			<td width="120px">B-5</td>
			<td width="120px">C-5</td>
			<td width="120px">D-5</td>
		</tr>
	</table>
	</c:choose>

</body>
</html>