<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

	alert(" [ ${carNum} ] 님 안녕히 가십시오\n W 주차 타워를 이용해주셔서 감사합니다.");
	location.href="payForm.park?fnum=${fnum}";
	
</script>


