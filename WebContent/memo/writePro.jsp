<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert(" 등록 되었습니다. ");
		location.href="list.memo";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert(" 비밀번호를 입력해주세요 ");
		history.go(-1);
	</script>
</c:if>


