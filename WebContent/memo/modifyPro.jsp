<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<c:if test="${ check == 1 }">
	<script type="text/javascript">
		alert("���� �Ϸ�!");
	</script>
	<meta http-equiv="Refresh" content="0; url=list.memo">
</c:if>

<c:if test="${ check != 1 }">
	<script type="text/javascript">
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
</c:if>