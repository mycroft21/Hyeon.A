<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주차 현황 jsp</title>
</head>
<body>

<table align="center" width="340px">
	<tr>
		<td align="center">
			<b><font color="white" size="3" face="맑은고딕">주차가능대수</font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font color="red" size="5" face="맑은고딕">${cu} </font> <font color="orange" size="5" face="맑은고딕"> / ${all}</font>
			</b>
		</td>
	</tr>
</table>

</body>
</html>