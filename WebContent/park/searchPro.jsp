<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/hyeonA/css/park_board.css" />
<link rel="stylesheet" type="text/css" href="/hyeonA/css/style.css" />
<title>차량검색 pro</title>
</head>
<body>
	<div class="search">

		<c:if test="${check == 0 }">
			<script type="text/javascript">
				alert(" 조회하신 차량이 없습니다. ");
				history.go(-1);
			</script>
		</c:if>

		<c:if test="${check != 0 }">
			<c:if test="${search=='' }">
				<script type="text/javascript">
					alert("정확한 차량번호를 입력해주세요.");
					history.go(-1);
				</script>
			</c:if>
			<c:if test="${search !='' }">
				<script type="text/javascript">
					var str = "";
				</script>
				<c:forEach var="carinfo" items="${carinfo}" >
					<script type="text/javascript">
						str = str + " ${carinfo.carNum}번 차량은 ${carinfo.parkNum}에 있습니다.\n";
					</script>
				</c:forEach>
				<script type="text/javascript">
					alert(str);
				</script>
			</c:if>
		</c:if>
		<div class = 'bnt'>
			<a class='button' href="/hyeonA/searchPro.park?fnum=1F&search=${search }">1F</a>
			<a class='button' href="/hyeonA/searchPro.park?fnum=2F&search=${search }">2F</a> 
			<a class='button' href="/hyeonA/searchPro.park?fnum=3F&search=${search }">3F</a>
			<a class='button' href="/hyeonA/searchPro.park?fnum=4F&search=${search }">4F</a>
		</div>
			<table cellspacing="1">
				<tr>
					<c:if test="${acar0!=800}">
						<td class="a">${avo1.parkNum}</td>
					</c:if>

					<c:if test="${acar0==800}">
						<td class="b">${avo1.carNum}<br>${avo1.parkNum}<br>${avo1.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${acar1!=800}">
						<td class="a">${avo2.parkNum}</td>
					</c:if>

					<c:if test="${acar1==800}">
						<td class="b">${avo2.carNum}<br>${avo2.parkNum}<br>${avo2.inTime}</td>
					</c:if>

					<c:if test="${acar2!=800}">
						<td class="a">${avo3.parkNum}</td>
					</c:if>

					<c:if test="${acar2==800}">
						<td class="b">${avo3.carNum}<br>${avo3.parkNum}<br>${avo3.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${acar3!=800}">
						<td class="a">${avo4.parkNum}</td>
					</c:if>

					<c:if test="${acar3==800}">
						<td class="b">${avo4.carNum}<br>${avo4.parkNum}<br>${avo4.inTime}</td>
					</c:if>
				</tr>

				<tr>

					<c:if test="${bcar0!=800}">
						<td class="a">${bvo1.parkNum}</td>
					</c:if>

					<c:if test="${bcar0==800}">
						<td class="b">${bvo1.carNum}<br>${bvo1.parkNum}<br>${bvo1.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${bcar1!=800}">
						<td class="a">${bvo2.parkNum}</td>
					</c:if>

					<c:if test="${bcar1==800}">
						<td class="b">${bvo2.carNum}<br>${bvo2.parkNum}<br>${bvo2.inTime}</td>
					</c:if>

					<c:if test="${bcar2!=800}">
						<td class="a">${bvo3.parkNum}</td>
					</c:if>

					<c:if test="${bcar2==800}">
						<td class="b">${bvo3.carNum}<br>${bvo3.parkNum}<br>${bvo3.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${bcar3!=800}">
						<td class="a">${bvo4.parkNum}</td>
					</c:if>

					<c:if test="${bcar3==800}">
						<td class="b">${bvo4.carNum}<br>${bvo4.parkNum}<br>${bvo4.inTime}</td>
					</c:if>
				</tr>

				<tr>

					<c:if test="${ccar0!=800}">
						<td class="a">${cvo1.parkNum}</td>
					</c:if>

					<c:if test="${ccar0==800}">
						<td class="b">${cvo1.carNum}<br>${cvo1.parkNum}<br>${cvo1.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${ccar1!=800}">
						<td class="a">${cvo2.parkNum}</td>
					</c:if>

					<c:if test="${ccar1==800}">
						<td class="b">${cvo2.carNum}<br>${cvo2.parkNum}<br>${cvo2.inTime}</td>
					</c:if>

					<c:if test="${ccar2!=800}">
						<td class="a">${cvo3.parkNum}</td>
					</c:if>

					<c:if test="${ccar2==800}">
						<td class="b">${cvo3.carNum}<br>${cvo3.parkNum}<br>${cvo3.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${ccar3!=800}">
						<td class="a">${cvo4.parkNum}</td>
					</c:if>

					<c:if test="${ccar3==800}">
						<td class="b">${cvo4.carNum}<br>${cvo4.parkNum}<br>${cvo4.inTime}</td>
					</c:if>
				</tr>

				<tr>

					<c:if test="${dcar0!=800}">
						<td class="a">${dvo1.parkNum}</td>
					</c:if>

					<c:if test="${dcar0==800}">
						<td class="b">${dvo1.carNum}<br>${dvo1.parkNum}<br>${dvo1.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${dcar1!=800}">
						<td class="a">${dvo2.parkNum}</td>
					</c:if>

					<c:if test="${dcar1==800}">
						<td class="b">${dvo2.carNum}<br>${dvo2.parkNum}<br>${dvo2.inTime}</td>
					</c:if>

					<c:if test="${dcar2!=800}">
						<td class="a">${dvo3.parkNum}</td>
					</c:if>

					<c:if test="${dcar2==800}">
						<td class="b">${dvo3.carNum}<br>${dvo3.parkNum}<br>${dvo3.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${dcar3!=800}">
						<td class="a">${dvo4.parkNum}</td>
					</c:if>

					<c:if test="${dcar3==800}">
						<td class="b">${dvo4.carNum}<br>${dvo4.parkNum}<br>${dvo4.inTime}</td>
					</c:if>
				</tr>

				<tr>

					<c:if test="${ecar0!=800}">
						<td class="a">${evo1.parkNum}</td>
					</c:if>

					<c:if test="${ecar0==800}">
						<td class="b">${evo1.carNum}<br>${evo1.parkNum}<br>${evo1.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${ecar1!=800}">
						<td class="a">${evo2.parkNum}</td>
					</c:if>

					<c:if test="${ecar1==800}">
						<td class="b">${evo2.carNum}<br>${evo2.parkNum}<br>${evo2.inTime}</td>
					</c:if>

					<c:if test="${ecar2!=800}">
						<td class="a">${evo3.parkNum}</td>
					</c:if>

					<c:if test="${ecar2==800}">
						<td class="b">${evo3.carNum}<br>${evo3.parkNum}<br>${evo3.inTime}</td>
					</c:if>

					<td class="c"></td>

					<c:if test="${ecar3!=800}">
						<td class="a">${evo4.parkNum}</td>
					</c:if>

					<c:if test="${ecar3==800}">
						<td class="b">${evo4.carNum}<br>${evo4.parkNum}<br>${evo4.inTime}</td>
					</c:if>
				</tr>
			</table>

	</div>
</body>
</html>