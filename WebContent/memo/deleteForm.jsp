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
	<div class="whole_memo">
		<div class="space"></div>
		<div class="memo_subject"><b>${vo.subject}</b></div>
		<div class="memo_content">${vo.content}</div>
		<div class="memo_time">${vo.memoTime}</div>
	</div>
	<h4 align="center">메모를 지우시려면 암호를 입력해주세요.</h4>
	<form action="deletePro.memo" method="post">
		<table id="login_tb">
		<tr>
			<td align="center" id="login_td">
			<img src="/hyeonA/images/locked.png"> &nbsp; | &nbsp;
			<input type="password" name="passwd" size="20">
			<input type="hidden" name="memoNum" value="${vo.memoNum}">
			</td>
		</tr>
		</table>
		<br>
		<div align="center">
		<input type="submit" value="삭제">&nbsp;
		<button onclick="history.go(-1)">취소</button>
		</div>
	</form>
</body>
</html>