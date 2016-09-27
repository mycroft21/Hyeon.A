<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/memoStyle.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Delete Form</title>
</head>
<body>
	<table class="check">
		<tr>
			<th colspan="2"><h3>지우실 메모를 확인해주세요.</h3></th>
		</tr>
		<tr>
			<td class="name1">메모제목</td><td class="name2">${vo.subject}</td>
		</tr>
		<tr>
			<td class="name1">작성일자</td><td class="name2">${vo.memoTime}</td>
		</tr>
		<tr>
			<td colspan="2">메모내용</td>
			<td colspan="2" class="content">${vo.content}</td>
		</tr>
	</table>
	<form name="delete">
		<table class="confirm">
		
		</table>
	</form>
</body>
</html>