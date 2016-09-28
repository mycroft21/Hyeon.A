<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<c:if test="${passwd != '' }">
	<script type="text/javascript">
		alert(" 등록 되었습니다. ");
	</script>
	<meta http-equiv="Refresh" content="0; url=list.memo">
</c:if>
<c:if test="${passwd == '' }">
	<script type="text/javascript">
		alert(" 비밀번호를 입력 해주세요. ");
		history.go(-1);
	</script>
</c:if>


