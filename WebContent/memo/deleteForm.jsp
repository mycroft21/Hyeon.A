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
	<div class="scroll">
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
		</tr>
		<tr>
			<td colspan="2" class="content">${vo.content}</td>
		</tr>
	</table>
	<form name="delete" action="deletePro.memo" method="post">
		<table class="confirm">
			<tr>
				<td colspan="2">해당 메모를 정말 지우시려면 암호를 입력해주세요.</td>
			</tr>
			<tr>
				<td class="name1">암호</td><td class="name2"><input type="password" name="passwd" size="7"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="삭제"></button>&nbsp;<button name="cancel" onclick="history.go(-1)">취소</button></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>