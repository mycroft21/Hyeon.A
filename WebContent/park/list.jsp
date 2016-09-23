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
		<tr>
			<c:if test="${avo1.carNum==null}">
			<td class="a"><div class="parkNum">${avo1.parkNum}</div></td>
			</c:if>
			
			<c:if test="${avo1.carNum!=null}">
			<td class="b"><div class="parkNum">${avo1.parkNum}<br></div><div class="carNum">${avo1.carNum}<br></div><div class="intime">${avo1.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${avo2.carNum==null}">
			<td class="a"><div class="parkNum">${avo2.parkNum}</div></td>
			</c:if>
			
			<c:if test="${avo2.carNum!=null}">
			<td class="b"><div class="parkNum">${avo2.parkNum}<br></div><div class="carNum">${avo2.carNum}<br></div><div class="intime">${avo2.inTime}</div></td>
			</c:if>
			
			<c:if test="${avo3.carNum==null}">
			<td class="a"><div class="parkNum">${avo3.parkNum}</div></td>
			</c:if>
			
			<c:if test="${avo3.carNum!=null}">
			<td class="b"><div class="parkNum">${avo3.parkNum}<br></div><div class="carNum">${avo3.carNum}<br></div><div class="intime">${avo3.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${avo4.carNum==null}">
			<td class="a"><div class="parkNum">${avo4.parkNum}</div></td>
			</c:if>
			
			<c:if test="${avo4.carNum!=null}">
			<td class="b"><div class="parkNum">${avo4.parkNum}<br></div><div class="carNum">${avo4.carNum}<br></div><div class="intime">${avo4.inTime}</div></td>
			</c:if>
		</tr>
		
		<tr>
			<c:if test="${bvo1.carNum==null}">
			<td class="a"><div class="parkNum">${bvo1.parkNum}</div></td>
			</c:if>
			
			<c:if test="${bvo1.carNum!=null}">
			<td class="b"><div class="parkNum">${bvo1.parkNum}<br></div><div class="carNum">${bvo1.carNum}<br></div><div class="intime">${bvo1.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${bvo2.carNum==null}">
			<td class="a"><div class="parkNum">${bvo2.parkNum}</div></td>
			</c:if>
			
			<c:if test="${bvo2.carNum!=null}">
			<td class="b"><div class="parkNum">${bvo2.parkNum}<br></div><div class="carNum">${bvo2.carNum}<br></div><div class="intime">${bvo2.inTime}</div></td>
			</c:if>
			
			<c:if test="${bvo3.carNum==null}">
			<td class="a"><div class="parkNum">${bvo3.parkNum}</div></td>
			</c:if>
			
			<c:if test="${bvo3.carNum!=null}">
			<td class="b"><div class="parkNum">${bvo3.parkNum}<br></div><div class="carNum">${bvo3.carNum}<br></div><div class="intime">${bvo3.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${bvo4.carNum==null}">
			<td class="a"><div class="parkNum">${bvo4.parkNum}</div></td>
			</c:if>
			
			<c:if test="${bvo4.carNum!=null}">
			<td class="b"><div class="parkNum">${bvo4.parkNum}<br></div><div class="carNum">${bvo4.carNum}<br></div><div class="intime">${bvo4.inTime}</div></td>
			</c:if>
		</tr>

		<tr>
			<c:if test="${cvo1.carNum==null}">
			<td class="a"><div class="parkNum">${cvo1.parkNum}</div></td>
			</c:if>
			
			<c:if test="${cvo1.carNum!=null}">
			<td class="b"><div class="parkNum">${cvo1.parkNum}<br></div><div class="carNum">${cvo1.carNum}<br></div><div class="intime">${cvo1.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${cvo2.carNum==null}">
			<td class="a"><div class="parkNum">${cvo2.parkNum}</div></td>
			</c:if>
			
			<c:if test="${cvo2.carNum!=null}">
			<td class="b"><div class="parkNum">${cvo2.parkNum}<br></div><div class="carNum">${cvo2.carNum}<br></div><div class="intime">${cvo2.inTime}</div></td>
			</c:if>
			
			<c:if test="${cvo3.carNum==null}">
			<td class="a"><div class="parkNum">${cvo3.parkNum}</div></td>
			</c:if>
			
			<c:if test="${cvo3.carNum!=null}">
			<td class="b"><div class="parkNum">${cvo3.parkNum}<br></div><div class="carNum">${cvo3.carNum}<br></div><div class="intime">${cvo3.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${cvo4.carNum==null}">
			<td class="a"><div class="parkNum">${cvo4.parkNum}</div></td>
			</c:if>
			
			<c:if test="${cvo4.carNum!=null}">
			<td class="b"><div class="parkNum">${cvo4.parkNum}<br></div><div class="carNum">${cvo4.carNum}<br></div><div class="intime">${cvo4.inTime}</div></td>
			</c:if>
		</tr>
		
		<tr>
			<c:if test="${dvo1.carNum==null}">
			<td class="a"><div class="parkNum">${dvo1.parkNum}</div></td>
			</c:if>
			
			<c:if test="${dvo1.carNum!=null}">
			<td class="b"><div class="parkNum">${dvo1.parkNum}<br></div><div class="carNum">${dvo1.carNum}<br></div><div class="intime">${dvo1.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${dvo2.carNum==null}">
			<td class="a"><div class="parkNum">${dvo2.parkNum}</div></td>
			</c:if>
			
			<c:if test="${dvo2.carNum!=null}">
			<td class="b"><div class="parkNum">${dvo2.parkNum}<br></div><div class="carNum">${dvo2.carNum}<br></div><div class="intime">${dvo2.inTime}</div></td>
			</c:if>
			
			<c:if test="${dvo3.carNum==null}">
			<td class="a"><div class="parkNum">${dvo3.parkNum}</div></td>
			</c:if>
			
			<c:if test="${dvo3.carNum!=null}">
			<td class="b"><div class="parkNum">${dvo3.parkNum}<br></div><div class="carNum">${dvo3.carNum}<br></div><div class="intime">${dvo3.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${dvo4.carNum==null}">
			<td class="a"><div class="parkNum">${dvo4.parkNum}</div></td>
			</c:if>
			
			<c:if test="${dvo4.carNum!=null}">
			<td class="b"><div class="parkNum">${dvo4.parkNum}<br></div><div class="carNum">${dvo4.carNum}<br></div><div class="intime">${dvo4.inTime}</div></td>
			</c:if>
		</tr>
		
		<tr>
			<c:if test="${evo1.carNum==null}">
			<td class="a"><div class="parkNum">${evo1.parkNum}</div></td>
			</c:if>
			
			<c:if test="${evo1.carNum!=null}">
			<td class="b"><div class="parkNum">${evo1.parkNum}<br></div><div class="carNum">${evo1.carNum}<br></div><div class="intime">${evo1.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>
			
			<c:if test="${evo2.carNum==null}">
			<td class="a"><div class="parkNum">${evo2.parkNum}</div></td>
			</c:if>
			
			<c:if test="${evo2.carNum!=null}">
			<td class="b"><div class="parkNum">${evo2.parkNum}<br></div><div class="carNum">${evo2.carNum}<br></div><div class="intime">${evo2.inTime}</div></td>
			</c:if>
			
			<c:if test="${evo3.carNum==null}">
			<td class="a"><div class="parkNum">${evo3.parkNum}</div></td>
			</c:if>
			
			<c:if test="${evo3.carNum!=null}">
			<td class="b"><div class="parkNum">${evo3.parkNum}<br></div><div class="carNum">${evo3.carNum}<br></div><div class="intime">${evo3.inTime}</div></td>
			</c:if>
			
			<td class="c"></td>	
				
			<c:if test="${evo4.carNum==null}">
			<td class="a"><div class="parkNum">${evo4.parkNum}</div></td>
			</c:if>
			
			<c:if test="${evo4.carNum!=null}">
			<td class="b"><div class="parkNum">${evo4.parkNum}<br></div><div class="carNum">${evo4.carNum}<br></div><div class="intime">${evo4.inTime}</div></td>
			</c:if>
		</tr>
	</table>
</body>
</html>