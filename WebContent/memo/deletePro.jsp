<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Delete Pro</title>

</head>
<body>
	<c:if test="${result==1}">
		<div align="center">성공적으로 삭제되었습니다.<br><button onclick="document.location.href='list.memo'">목록</button></div>
	</c:if>
	<c:if test="${result==0}">
		<div align="center">암호가 틀렸습니다.<br><button onclick="history.go(-1)">뒤로</button></div>
	</c:if>
</body>
</html>