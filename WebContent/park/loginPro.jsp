<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Pro</title>
</head>
<body>
<c:if test="${result==1}">
<b>화면잠금을 해제하였습니다.</b><br><br><button style="width: 253px; height: 40px;" onclick="document.location.href='list.park?fnum=1f'">관리페이지로 이동</button>
</c:if>
<c:if test="${result==0}"><b>아이디나 패스워드가 바르지 않습니다.</b><br><br><button style="width: 253px; height: 40px;" onclick="history.go(-1)">뒤로가기</button></c:if>
</body>
</html>