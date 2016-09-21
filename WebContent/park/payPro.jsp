<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

 <c:if test="${ pay != NULL }">
<script type="text/javascript">
	alert("  ${ carNum } 차주님 주차요금은 ${ pay } 원 입니다~ ");
	location.href="list.park?fnum=1f"
</script>
</c:if>