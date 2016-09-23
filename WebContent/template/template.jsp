<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/style.css" />
<link rel="stylesheet" type="text/css" href="/hyeonA/css/park_board.css" />

<title>메인페이지</title>
</head>
<body>
	<div class="parking_top">
		<jsp:include page="../module/top.jsp" />
	</div>
	<!-- 전체틀 -->
	<div class="park_container">
		<!-- 상황판,주차공간-->

		<div class="parking_wrap">
			<div align="left">
				<font size="2" face="맑은고딕" color="#b4b4b4"> <b>Pangyo W Tower 1F</b>&nbsp;&nbsp;
				</font>
			</div>
			<!--주차공간 grid -->
			<div class="park" align="center">
				<br>
				<br>
				<jsp:include page="${CONTENT}" />
			</div>

			<!--상황판 grid -->
			<div class="op_board">
				<table id="temp_table">
					<tr id="temp_tr">
						<td id="temp_td"><jsp:include page="../module/bottom_1.jsp" /></td>
						<td id="temp_td"><jsp:include page="../module/bottom_2.jsp" /></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 상황판,주차공간end-->
		<div class="menu">
			<jsp:include page="../module/menuboard.jsp" />
		</div>
	</div>
	<!-- 전체틀end -->
</body>
</html>