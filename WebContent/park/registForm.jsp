<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/style.css" />
<link rel="stylesheet" type="text/css" href="/hyeonA/css/park_board.css" />

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	<!--
	function button_event(registBtn){
      	var name = registBtn;
      	var carNum = document.forms[name].elements["carNum"].value;
      	var parkNum = document.forms[name].elements["parkNum"].value;
      	if (confirm("[" + carNum + "] 차량을 [" + parkNum + "] 위치에 정말로 등록하시겠습니까?") == true){    // 확인
        	document.forms[name].submit();
      	} else {   // 취소
      		return false;
      	}
	}
	//-->
</script>

<title>주차등록</title>
</head>
<body>
<div>
	<table cellspacing="1">	
		<!-- a행 -->
		<tr>
			<c:if test="${avo1.carNum==null}">
				<td class="a"><div class="parkNum">${avo1.parkNum}</div>
					<form action="registPro.park" method="get" name="f1a1" >
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br>
						<input type="hidden" name="parkNum" value="${avo1.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1a1');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${avo1.carNum!=null}">
				<td class="b"><div class="parkNum">${avo1.parkNum}<br></div><div class="carNum">${avo1.carNum}<br></div><div class="intime">${avo1.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${avo2.carNum==null}">
				<td class="a"><div class="parkNum">${avo2.parkNum}</div>
					<form action="registPro.park" method="get" name="f1b1">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${avo2.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1b1');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${avo2.carNum!=null}">
				<td class="b"><div class="parkNum">${avo2.parkNum}<br></div><div class="carNum">${avo2.carNum}<br></div><div class="carNum">${avo1.carNum}<br></div><div class="intime">${avo2.inTime}</div></td>
			</c:if>

			<c:if test="${avo3.carNum==null}">
				<td class="a"><div class="parkNum">${avo3.parkNum}</div>
					<form action="registPro.park" method="get" name="f1c1">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br>
						<input type="hidden" name="parkNum" value="${avo3.parkNum}">
						<input type="submit" value="등록" onclick="button_event('f1c1');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${avo3.carNum!=null}">
				<td class="b"><div class="parkNum">${avo3.parkNum}<br></div><div class="carNum">${avo3.carNum}<br></div><div class="carNum">${avo1.carNum}<br></div><div class="intime">${avo3.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${avo4.carNum==null}">
				<td class="a"><div class="parkNum">${avo4.parkNum}</div>
					<form action="registPro.park" method="get" name="f1d1">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${avo4.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1d1');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${avo4.carNum!=null}">
				<td class="b"><div class="parkNum">${avo4.parkNum}<br></div><div class="carNum">${avo4.carNum}<br></div><div class="carNum">${avo1.carNum}<br></div><div class="intime">${avo4.inTime}</div></td>
			</c:if>
		</tr>

		<!-- b행 -->
		<tr>
			<c:if test="${bvo1.carNum==null}">
				<td class="a"><div class="parkNum">${bvo1.parkNum}</div>
					<form action="registPro.park" method="get" name="f1a2">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${bvo1.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1a2');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${bvo1.carNum!=null}">
				<td class="b"><div class="parkNum">${bvo1.parkNum}<br></div><div class="carNum">${bvo1.carNum}<br></div><div class="intime">${bvo1.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${bvo2.carNum==null}">
				<td class="a"><div class="parkNum">${bvo2.parkNum}</div>
					<form action="registPro.park" method="get" name="f1b2">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${bvo2.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1b2');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${bvo2.carNum!=null}">
				<td class="b"><div class="parkNum">${bvo2.parkNum}<br></div><div class="carNum">${bvo2.carNum}<br></div><div class="intime">${bvo2.inTime}</div></td>
			</c:if>

			<c:if test="${bvo3.carNum==null}">
				<td class="a"><div class="parkNum">${bvo3.parkNum}</div>
					<form action="registPro.park" method="get" name="f1c2">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${bvo3.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1c2');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${bvo3.carNum!=null}">
				<td class="b"><div class="parkNum">${bvo3.parkNum}<br></div><div class="carNum">${bvo3.carNum}<br></div><div class="intime">${bvo3.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${bvo4.carNum==null}">
				<td class="a"><div class="parkNum">${bvo4.parkNum}</div>
					<form action="registPro.park" method="get" name="f1d2">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${bvo4.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1d2');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${bvo4.carNum!=null}">
				<td class="b"><div class="parkNum">${bvo4.parkNum}<br></div><div class="carNum">${bvo4.carNum}<br></div><div class="intime">${bvo4.inTime}</div></td>
			</c:if>
		</tr>

		<!-- c행 -->
		<tr>
			<c:if test="${cvo1.carNum==null}">
				<td class="a"><div class="parkNum">${cvo1.parkNum}</div>
					<form action="registPro.park" method="get" name="f1a3">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${cvo1.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1a3');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${cvo1.carNum!=null}">
				<td class="b"><div class="parkNum">${cvo1.parkNum}<br></div><div class="carNum">${cvo1.carNum}<br></div><div class="intime">${cvo1.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${cvo2.carNum==null}">
				<td class="a"><div class="parkNum">${cvo2.parkNum}</div>
					<form action="registPro.park" method="get" name="f1b3">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${cvo2.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1b3');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${cvo2.carNum!=null}">
				<td class="b"><div class="parkNum">${cvo2.parkNum}<br></div><div class="carNum">${cvo2.carNum}<br></div><div class="intime">${cvo2.inTime}</div></td>
			</c:if>

			<c:if test="${cvo3.carNum==null}">
				<td class="a"><div class="parkNum">${cvo3.parkNum}</div>
					<form action="registPro.park" method="get" name="f1c3">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${cvo3.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1c3');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${cvo3.carNum!=null}">
				<td class="b"><div class="parkNum">${cvo3.parkNum}<br></div><div class="carNum">${cvo3.carNum}<br></div><div class="intime">${cvo3.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${cvo4.carNum==null}">
				<td class="a"><div class="parkNum">${cvo4.parkNum}</div>
					<form action="registPro.park" method="get" name="f1d3">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${cvo4.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1d3');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${cvo4.carNum!=null}">
				<td class="b"><div class="parkNum">${cvo4.parkNum}<br></div><div class="carNum">${cvo4.carNum}<br></div><div class="intime">${cvo4.inTime}</div></td>
			</c:if>
		</tr>

		<!-- d행 -->
		<tr>
			<c:if test="${dvo1.carNum==null}">
				<td class="a"><div class="parkNum">${dvo1.parkNum}</div>
					<form action="registPro.park" method="get" name="f1a4">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${dvo1.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1a4');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${dvo1.carNum!=null}">
				<td class="b"><div class="parkNum">${dvo1.parkNum}<br></div><div class="carNum">${dvo1.carNum}<br></div><div class="intime">${dvo1.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${dvo2.carNum==null}">
				<td class="a"><div class="parkNum">${dvo2.parkNum}</div>
					<form action="registPro.park" method="get" name="f1b4">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${dvo2.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1b4');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${dvo2.carNum!=null}">
				<td class="b"><div class="parkNum">${dvo2.parkNum}<br></div><div class="carNum">${dvo2.carNum}<br></div><div class="intime">${dvo2.inTime}</div></td>
			</c:if>

			<c:if test="${dvo3.carNum==null}">
				<td class="a"><div class="parkNum">${dvo3.parkNum}</div>
					<form action="registPro.park" method="get" name="f1c4">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${dvo3.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1c4');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${dvo3.carNum!=null}">
				<td class="b"><div class="parkNum">${dvo3.parkNum}<br></div><div class="carNum">${dvo3.carNum}<br></div><div class="intime">${dvo3.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${dvo4.carNum==null}">
				<td class="a"><div class="parkNum">${dvo4.parkNum}</div>
					<form action="registPro.park" method="get" name="f1d4">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${dvo4.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1d4');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${dvo4.carNum!=null}">
				<td class="b"><div class="parkNum">${dvo4.parkNum}<br></div><div class="carNum">${dvo4.carNum}<br></div><div class="intime">${dvo4.inTime}</div></td>
			</c:if>
		</tr>

		<!-- e행 -->
		<tr>
			<c:if test="${evo1.carNum==null}">
				<td class="a"><div class="parkNum">${evo1.parkNum}</div>
					<form action="registPro.park" method="get" name="f1a5">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${evo1.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1a5');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${evo1.carNum!=null}">
				<td class="b"><div class="parkNum">${evo1.parkNum}<br></div><div class="carNum">${evo1.carNum}<br></div><div class="intime">${evo1.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${evo2.carNum==null}">
				<td class="a"><div class="parkNum">${evo2.parkNum}</div>
					<form action="registPro.park" method="get" name="f1b5">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${evo2.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1b5');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${evo2.carNum!=null}">
				<td class="b"><div class="parkNum">${evo2.parkNum}<br></div><div class="carNum">${evo2.carNum}<br></div><div class="intime">${evo2.inTime}</div></td>
			</c:if>

			<c:if test="${evo3.carNum==null}">
				<td class="a"><div class="parkNum">${evo3.parkNum}</div>
					<form action="registPro.park" method="get" name="f1c5">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${evo3.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1c5');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${evo3.carNum!=null}">
				<td class="b"><div class="parkNum">${evo3.parkNum}<br></div><div class="carNum">${evo3.carNum}<br></div><div class="intime">${evo3.inTime}</div></td>
			</c:if>

			<td class="c"></td>

			<c:if test="${evo4.carNum==null}">
				<td class="a"><div class="parkNum">${evo4.parkNum}</div>
					<form action="registPro.park" method="get" name="f1d5">
						<input type="text" name="carNum" size="8" maxlength="8" placeholder="차량번호 입력"><br> 
						<input type="hidden" name="parkNum" value="${evo4.parkNum}"> 
						<input type="submit" value="등록" onclick="button_event('f1d5');return false;">
					</form>
				</td>
			</c:if>

			<c:if test="${evo4.carNum!=null}">
				<td class="b"><div class="parkNum">${evo4.parkNum}<br></div><div class="carNum">${evo4.carNum}<br></div><div class="intime">${evo4.inTime}</div></td>
			</c:if>
		</tr>
	</table>
</div>
</body>
</html>