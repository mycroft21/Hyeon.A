<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/memoStyle.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<c:if test="${ check == 1 }">
	<script type="text/javascript">
		alert("수정 완료!");
	</script>
	<meta http-equiv="Refresh" content="0; url=list.memo">
</c:if>

<c:if test="${ check != 1 }">
	<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>