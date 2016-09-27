<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/style.css"/>
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/park_board.css"/>
<title>차량검색</title>
</head>
<body>
<div class="search_form_wrap">
	<form action="searchPro.park" method="post" >
		<table class="search_form_table" >
			<tr height="20px">
				<th>차량검색</th>
			</tr>
			<tr>
				<td>검색할 차량번호를 입력해주세요<br><br>
				<input type="text" name="search" >&nbsp;&nbsp;
				<input type="submit" value="검색"></td>
			</tr>
		</table><br>
	</form>
</div>
</body>
</html>