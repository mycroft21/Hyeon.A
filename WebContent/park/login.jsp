<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/style.css" />
<meta charset="EUC-KR">
<title>�α��� ������</title>

</head>
<body>
<center>
<h4>ȭ�� ����� �������ּ���.</h4>
</center><br>
	<form action="loginPro.park" method="post">
		<table id="login_tb">
		<tr>
			<td align="center" id="login_td">
			<img src="/hyeonA/images/user.png"> &nbsp; | &nbsp;
			<input type="text" name="id" size="20">
			</td>
		</tr>
		</table>
		<br>
		<table id="login_tb">
		<tr>
			<td align="center" id="login_td">
			<img src="/hyeonA/images/locked.png"> &nbsp; | &nbsp;
			<input type="password" name="password" size="20">
			</td>
		</tr>
		</table>
		<br>
		<div align="center">
		<input type="submit" value="ȭ���������" style="width: 253px; height: 40px;">
		</div>
	</form>
</body>
</html>