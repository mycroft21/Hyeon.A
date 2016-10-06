<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.login {
	background-color: rgba(255, 255, 265, 0.6);
	height: 530px;
	width: 950px;
	border-radius: 10px;
}
</style>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/style.css" />
<link rel="stylesheet" type="text/css" href="/hyeonA/css/park_board.css" />

<title>메인페이지</title>
</head>
<body>
	<!-- 전체틀 -->
	<div class="park_container">
	 	<!-- 탑_로고 -->
		<div class="parking_top">
			<jsp:include page="../module/top.jsp" />
		</div>
	
		<!-- 상황판,주차공간-->
		<div class="parking_wrap">
			<!--주차공간 grid -->
			<div class="login" align="center" width="800">
				<br>
				<br>
				<jsp:include page="${CONTENT}" />
			</div>

			<!--상황판 grid -->
			<div class="op_board">
				<table id="temp_table">
					<tr id="temp_tr">
						<td id="temp_td"><jsp:include page="../module/bottom_1.jsp" /></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- 전체틀end -->
</body>
</html>