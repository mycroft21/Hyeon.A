<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>payPro.jsp</title>
</head>
<body>


<c:if test="${ pay != NULL }">
	<h1> ${ carNum } 차주님 주차요금은 ${ pay } 입니다~</h1>
</c:if>

<c:if test="${ pay == NULL }">
	<h1> ${ carNum } 차주님 주차요금은 ${ pay } 입니다~</h1>
</c:if>


</body>
</html>