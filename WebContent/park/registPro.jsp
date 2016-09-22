<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<script type="text/javascript">
function cancle(){
	var p = document.1fa1;
	if(p.carNum == " " ){
		alert("취소되었습니다.")
		return;	
	}else{
		confirm("[ ${carNum} ] 차량을 정말로 등록하시겠습니까?");
		p.action="list.park?fnum=1f";
		p.mode.value="cancle";
		p.submit();
		/* alert("[ ${parkNum} ] 위치에 [ ${carNum} ] 차량이 정상적으로 등록되었습니다.\n W 주차 타워를 이용해주셔서 감사합니다.");	 */
		/* location.href="registForm.park?fnum=1f"; */
	}
}
</script>


