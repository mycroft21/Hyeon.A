<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<script type="text/javascript">

	alert("[ ${carNum} ] 차량이 [ ${parkNum} ] 위치에 정상적으로 등록되었습니다.\n W 주차 타워를 이용해주셔서 감사합니다.");

	location.href="registForm.park?fnum=${fnum}";
	
</script>