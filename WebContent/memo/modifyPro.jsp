<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
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