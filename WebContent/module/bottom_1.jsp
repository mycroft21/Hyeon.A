<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주차 현황 jsp</title>
</head>
<body>

<table align="center" width="600px" >
	<tr>
		<td colspan="4" align="center">
			<b><font color="white" size="3" face="맑은고딕">1층 주차가능대수</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="red" size="5" face="맑은고딕">${cu} </font>
			<font color="orange" size="5" face="맑은고딕"> / ${all}</font>
			</b>
		</td>
	</tr>		
	<tr>
		<td>
			<b><font color="white" size="3" face="맑은고딕">A 구역</font></b>&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="red" size="5" face="맑은고딕">${cuA} </font>
			<font color="orange" size="5" face="맑은고딕"> / ${partA}</font>
		</td>
		<td>
			<b><font color="white" size="3" face="맑은고딕">B 구역</font></b>&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="red" size="5" face="맑은고딕">${cuB} </font>
			<font color="orange" size="5" face="맑은고딕"> / ${partB}</font>
		</td>
		<td>
			<b><font color="white" size="3" face="맑은고딕">C 구역</font></b>&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="red" size="5" face="맑은고딕">${cuC} </font>
			<font color="orange" size="5" face="맑은고딕"> / ${partC}</font>
		</td>
		<td>
			<b><font color="white" size="3" face="맑은고딕">D 구역</font></b>&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="red" size="5" face="맑은고딕">${cuD} </font>
			<font color="orange" size="5" face="맑은고딕"> / ${partD}</font>
		</td>
	</tr>
</table>

</body>
</html>