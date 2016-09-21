<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/park_board.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주차장 형태</title>
</head>
<body>
	<table cellspacing="1">
	<tr><th colspan="6"><p align="center"><font size="5" style="맑은고딕">W 주차 타워 1층 현황</font></p></th></tr>
		<tr>
		
			<c:if test="${avo1.carNum==null}">
			<td class="a">${avo1.parkNum}</td>
			</c:if>
			
			<c:if test="${avo1.carNum!=null}">
			<td class="b">${avo1.carNum}<br>${avo1.parkNum}<br>${avo1.inTime}</td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${avo2.carNum==null}">
			<td class="a">${avo2.parkNum}</td>
			</c:if>
			
			<c:if test="${avo2.carNum!=null}">
			<td class="b">${avo2.carNum}<br>${avo2.parkNum}<br>${avo2.inTime}</td>
			</c:if>
			
			<c:if test="${avo3.carNum==null}">
			<td class="a">${avo3.parkNum}</td>
			</c:if>
			
			<c:if test="${avo3.carNum!=null}">
			<td class="b">${avo3.carNum}<br>${avo3.parkNum}<br>${avo3.inTime}</td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${avo4.carNum==null}">
			<td class="a">${avo4.parkNum}</td>
			</c:if>
			
			<c:if test="${avo4.carNum!=null}">
			<td class="b">${avo4.carNum}<br>${avo4.parkNum}<br>${avo4.inTime}</td>
			</c:if>
		</tr>
		
		<tr>
		
			<c:if test="${bvo1.carNum==null}">
			<td class="a">${bvo1.parkNum}</td>
			</c:if>
			
			<c:if test="${bvo1.carNum!=null}">
			<td class="b">${bvo1.carNum}<br>${bvo1.parkNum}<br>${bvo1.inTime}</td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${bvo2.carNum==null}">
			<td class="a">${bvo2.parkNum}</td>
			</c:if>
			
			<c:if test="${bvo2.carNum!=null}">
			<td class="b">${bvo2.carNum}<br>${bvo2.parkNum}<br>${bvo2.inTime}</td>
			</c:if>
			
			<c:if test="${bvo3.carNum==null}">
			<td class="a">${bvo3.parkNum}</td>
			</c:if>
			
			<c:if test="${bvo3.carNum!=null}">
			<td class="b">${bvo3.carNum}<br>${bvo3.parkNum}<br>${bvo3.inTime}</td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${bvo4.carNum==null}">
			<td class="a">${bvo4.parkNum}</td>
			</c:if>
			
			<c:if test="${bvo4.carNum!=null}">
			<td class="b">${bvo4.carNum}<br>${bvo4.parkNum}<br>${bvo4.inTime}</td>
			</c:if>
		</tr>

		<tr>
		
			<c:if test="${cvo1.carNum==null}">
			<td class="a">${cvo1.parkNum}</td>
			</c:if>
			
			<c:if test="${cvo1.carNum!=null}">
			<td class="b">${cvo1.carNum}<br>${cvo1.parkNum}<br>${cvo1.inTime}</td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${cvo2.carNum==null}">
			<td class="a">${cvo2.parkNum}</td>
			</c:if>
			
			<c:if test="${cvo2.carNum!=null}">
			<td class="b">${cvo2.carNum}<br>${cvo2.parkNum}<br>${cvo2.inTime}</td>
			</c:if>
			
			<c:if test="${cvo3.carNum==null}">
			<td class="a">${cvo3.parkNum}</td>
			</c:if>
			
			<c:if test="${cvo3.carNum!=null}">
			<td class="b">${cvo3.carNum}<br>${cvo3.parkNum}<br>${cvo3.inTime}</td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${cvo4.carNum==null}">
			<td class="a">${cvo4.parkNum}</td>
			</c:if>
			
			<c:if test="${cvo4.carNum!=null}">
			<td class="b">${cvo4.carNum}<br>${cvo4.parkNum}<br>${cvo4.inTime}</td>
			</c:if>
		</tr>
		
		<tr>
		
			<c:if test="${dvo1.carNum==null}">
			<td class="a">${dvo1.parkNum}</td>
			</c:if>
			
			<c:if test="${dvo1.carNum!=null}">
			<td class="b">${dvo1.carNum}<br>${dvo1.parkNum}<br>${dvo1.inTime}</td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${dvo2.carNum==null}">
			<td class="a">${dvo2.parkNum}</td>
			</c:if>
			
			<c:if test="${dvo2.carNum!=null}">
			<td class="b">${dvo2.carNum}<br>${dvo2.parkNum}<br>${dvo2.inTime}</td>
			</c:if>
			
			<c:if test="${dvo3.carNum==null}">
			<td class="a">${dvo3.parkNum}</td>
			</c:if>
			
			<c:if test="${dvo3.carNum!=null}">
			<td class="b">${dvo3.carNum}<br>${dvo3.parkNum}<br>${dvo3.inTime}</td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${dvo4.carNum==null}">
			<td class="a">${dvo4.parkNum}</td>
			</c:if>
			
			<c:if test="${dvo4.carNum!=null}">
			<td class="b">${dvo4.carNum}<br>${dvo4.parkNum}<br>${dvo4.inTime}</td>
			</c:if>
		</tr>
		
		<tr>
		
			<c:if test="${evo1.carNum==null}">
			<td class="a">${evo1.parkNum}</td>
			</c:if>
			
			<c:if test="${evo1.carNum!=null}">
			<td class="b">${evo1.carNum}<br>${evo1.parkNum}<br>${evo1.inTime}</td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${evo2.carNum==null}">
			<td class="a">${evo2.parkNum}</td>
			</c:if>
			
			<c:if test="${evo2.carNum!=null}">
			<td class="b">${evo2.carNum}<br>${evo2.parkNum}<br>${evo2.inTime}</td>
			</c:if>
			
			<c:if test="${evo3.carNum==null}">
			<td class="a">${evo3.parkNum}</td>
			</c:if>
			
			<c:if test="${evo3.carNum!=null}">
			<td class="b">${evo3.carNum}<br>${evo3.parkNum}<br>${evo3.inTime}</td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${evo4.carNum==null}">
			<td class="a">${evo4.parkNum}</td>
			</c:if>
			
			<c:if test="${evo4.carNum!=null}">
			<td class="b">${evo4.carNum}<br>${evo4.parkNum}<br>${evo4.inTime}</td>
			</c:if>
		</tr>
	</table>
</body>
</html>