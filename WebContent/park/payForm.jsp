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
	function btnClick(d) {

		var name = d;
		var endDate = new Date();
 		var startDate = new Date(document.forms[name].elements["hidd"].value);
 		
 		
 		var day = (endDate.getDate()-endDate.getHours())*24*60;
 		var hours = (endDate.getHours()-endDate.getHours())*60;
 		var min = (endDate.getMinutes()-startDate.getMinutes());
 		var tmp = hours+min;
		//var tmp = (endDate.getTime()-startDate.getTime())/60000; 
		 var pay = tmp*100;  

		if (confirm('요금은 '+pay+'원 입니다. 정말 차량을 정말로 출차하시겠습니까?') == true) {
			//if(confirm(pay + " 차량을 정말로 출차하시겠습니까?") == true) {
						document.forms[name].elemnts["pay"].value = pay;
			          document.forms[name].submit();
		} else {
			return false;
		}
	};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주차장 형태</title>
</head>
<body>
	<div>
		<table cellspacing="1">
			<tr>

				<c:if test="${avo1.carNum==null}">
					<td class="a">${avo1.parkNum}</td>
				</c:if>

				<c:if test="${avo1.carNum!=null}">
					<td class="b">${avo1.carNum}<br>${avo1.inTime}<br>
						<form action="payPro.park" method="post" name="f1">
							<input type="submit" value="출차"
								onclick="btnClick('f1');return false;"> <input type="hidden"
								value="${avo1time}" name="hidd"> <input type="hidden"
								name="carNum" value="${avo1.carNum}" /> <input type="hidden"
								name="parkNum" value="${avo1.parkNum}" /> <input type="hidden"
								name="inTime" value="${avo1.inTime}" /><input type="hidden"
								name="pay" value = ""/>

						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${avo2.carNum==null}">
					<td class="a">${avo2.parkNum}</td>
				</c:if>

				<c:if test="${avo2.carNum!=null}">
					<td class="b">${avo2.carNum}<br>${avo2.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차" onclick="return false; btnClick('a2');"> <input type="hidden"
								value="${avo2.inTime}" name="hidd"> <input type="hidden"
								name="carNum" value="${avo2.carNum}" /> <input type="hidden"
								name="parkNum" value="${avo2.parkNum}" /> <input type="hidden"
								name="inTime" value="${avo2.inTime}" />
						</form>
					</td>
				</c:if>

				<c:if test="${avo3.carNum==null}">
					<td class="a">${avo3.parkNum}</td>
				</c:if>

				<c:if test="${avo3.carNum!=null}">
					<td class="b">${avo3.carNum}<br>${avo3.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${avo3.carNum}" /> <input type="hidden"
								name="parkNum" value="${avo3.parkNum}" /> <input type="hidden"
								name="inTime" value="${avo3.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${avo4.carNum==null}">
					<td class="a">${avo4.parkNum}</td>
				</c:if>

				<c:if test="${avo4.carNum!=null}">
					<td class="b">${avo4.carNum}<br>${avo4.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${avo4.carNum}" /> <input type="hidden"
								name="parkNum" value="${avo4.parkNum}" /> <input type="hidden"
								name="inTime" value="${avo4.inTime}" />
						</form>
					</td>
				</c:if>
			</tr>

			<tr>

				<c:if test="${bvo1.carNum==null}">
					<td class="a">${bvo1.parkNum}</td>
				</c:if>

				<c:if test="${bvo1.carNum!=null}">
					<td class="b">${bvo1.carNum}<br>${bvo1.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${bvo1.carNum}" /> <input type="hidden"
								name="parkNum" value="${bvo1.parkNum}" /> <input type="hidden"
								name="inTime" value="${bvo1.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${bvo2.carNum==null}">
					<td class="a">${bvo2.parkNum}</td>
				</c:if>

				<c:if test="${bvo2.carNum!=null}">
					<td class="b">${bvo2.carNum}<br>${bvo2.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${bvo2.carNum}" /> <input type="hidden"
								name="parkNum" value="${bvo2.parkNum}" /> <input type="hidden"
								name="inTime" value="${bvo2.inTime}" />
						</form>
					</td>
				</c:if>

				<c:if test="${bvo3.carNum==null}">
					<td class="a">${bvo3.parkNum}</td>
				</c:if>

				<c:if test="${bvo3.carNum!=null}">
					<td class="b">${bvo3.carNum}<br>${bvo3.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${bvo3.carNum}" /> <input type="hidden"
								name="parkNum" value="${bvo3.parkNum}" /> <input type="hidden"
								name="inTime" value="${bvo3.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${bvo4.carNum==null}">
					<td class="a">${bvo4.parkNum}</td>
				</c:if>

				<c:if test="${bvo4.carNum!=null}">
					<td class="b">${bvo4.carNum}<br>${bvo4.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${bvo4.carNum}" /> <input type="hidden"
								name="parkNum" value="${bvo4.parkNum}" /> <input type="hidden"
								name="inTime" value="${bvo4.inTime}" />
						</form>
					</td>
				</c:if>
			</tr>

			<tr>

				<c:if test="${cvo1.carNum==null}">
					<td class="a">${cvo1.parkNum}</td>
				</c:if>

				<c:if test="${cvo1.carNum!=null}">
					<td class="b">${cvo1.carNum}<br>${cvo1.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${cvo1.carNum}" /> <input type="hidden"
								name="parkNum" value="${cvo1.parkNum}" /> <input type="hidden"
								name="inTime" value="${cvo1.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${cvo2.carNum==null}">
					<td class="a">${cvo2.parkNum}</td>
				</c:if>

				<c:if test="${cvo2.carNum!=null}">
					<td class="b">${cvo2.carNum}<br>${cvo2.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${cvo2.carNum}" /> <input type="hidden"
								name="parkNum" value="${cvo2.parkNum}" /> <input type="hidden"
								name="inTime" value="${cvo2.inTime}" />
						</form>
					</td>
				</c:if>

				<c:if test="${cvo3.carNum==null}">
					<td class="a">${cvo3.parkNum}</td>
				</c:if>

				<c:if test="${cvo3.carNum!=null}">
					<td class="b">${cvo3.carNum}<br>${cvo3.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${cvo3.carNum}" /> <input type="hidden"
								name="parkNum" value="${cvo3.parkNum}" /> <input type="hidden"
								name="inTime" value="${cvo3.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${cvo4.carNum==null}">
					<td class="a">${cvo4.parkNum}</td>
				</c:if>

				<c:if test="${cvo4.carNum!=null}">
					<td class="b">${cvo4.carNum}<br>${cvo4.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${cvo4.carNum}" /> <input type="hidden"
								name="parkNum" value="${cvo4.parkNum}" /> <input type="hidden"
								name="inTime" value="${cvo4.inTime}" />
						</form>
					</td>
				</c:if>
			</tr>

			<tr>

				<c:if test="${dvo1.carNum==null}">
					<td class="a">${dvo1.parkNum}</td>
				</c:if>

				<c:if test="${dvo1.carNum!=null}">
					<td class="b">${dvo1.carNum}<br>${dvo1.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${dvo1.carNum}" /> <input type="hidden"
								name="parkNum" value="${dvo1.parkNum}" /> <input type="hidden"
								name="inTime" value="${dvo1.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${dvo2.carNum==null}">
					<td class="a">${dvo2.parkNum}</td>
				</c:if>

				<c:if test="${dvo2.carNum!=null}">
					<td class="b">${dvo2.carNum}<br>${dvo2.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${dvo2.carNum}" /> <input type="hidden"
								name="parkNum" value="${dvo2.parkNum}" /> <input type="hidden"
								name="inTime" value="${dvo2.inTime}" />
						</form>
					</td>
				</c:if>

				<c:if test="${dvo3.carNum==null}">
					<td class="a">${dvo3.parkNum}</td>
				</c:if>

				<c:if test="${dvo3.carNum!=null}">
					<td class="b">${dvo3.carNum}<br>${dvo3.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${dvo3.carNum}" /> <input type="hidden"
								name="parkNum" value="${dvo3.parkNum}" /> <input type="hidden"
								name="inTime" value="${dvo3.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${dvo4.carNum==null}">
					<td class="a">${dvo4.parkNum}</td>
				</c:if>

				<c:if test="${dvo4.carNum!=null}">
					<td class="b">${dvo4.carNum}<br>${dvo4.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${dvo4.carNum}" /> <input type="hidden"
								name="parkNum" value="${dvo4.parkNum}" /> <input type="hidden"
								name="inTime" value="${dvo4.inTime}" />
						</form>
					</td>
				</c:if>
			</tr>

			<tr>

				<c:if test="${evo1.carNum==null}">
					<td class="a">${evo1.parkNum}</td>
				</c:if>

				<c:if test="${evo1.carNum!=null}">
					<td class="b">${evo1.carNum}<br>${evo1.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${evo1.carNum}" /> <input type="hidden"
								name="parkNum" value="${evo1.parkNum}" /> <input type="hidden"
								name="inTime" value="${evo1.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${evo2.carNum==null}">
					<td class="a">${evo2.parkNum}</td>
				</c:if>

				<c:if test="${evo2.carNum!=null}">
					<td class="b">${evo2.carNum}<br>${evo2.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${evo2.carNum}" /> <input type="hidden"
								name="parkNum" value="${evo2.parkNum}" /> <input type="hidden"
								name="inTime" value="${evo2.inTime}" />
						</form>
					</td>
				</c:if>

				<c:if test="${evo3.carNum==null}">
					<td class="a">${evo3.parkNum}</td>
				</c:if>

				<c:if test="${evo3.carNum!=null}">
					<td class="b">${evo3.carNum}<br>${evo3.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${evo3.carNum}" /> <input type="hidden"
								name="parkNum" value="${evo3.parkNum}" /> <input type="hidden"
								name="inTime" value="${evo3.inTime}" />
						</form>
					</td>
				</c:if>

				<td class="c"></td>

				<c:if test="${evo4.carNum==null}">
					<td class="a">${evo4.parkNum}</td>
				</c:if>

				<c:if test="${evo4.carNum!=null}">
					<td class="b">${evo4.carNum}<br>${evo4.inTime}<br>
						<form action="payPro.park" method="post">
							<input type="submit" value="출차"> <input type="hidden"
								name="carNum" value="${evo4.carNum}" /> <input type="hidden"
								name="parkNum" value="${evo4.parkNum}" /> <input type="hidden"
								name="inTime" value="${evo4.inTime}" />
						</form>
					</td>
				</c:if>
			</tr>
		</table>
	</div>
</body>
</html>