<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/memoStyle.css"/>
<title>�޸� ����</title>
</head>
<body>
<form name="modify" action="modifyPro.memo" method="post">
<input type="hidden" name="memoNum" value="${ memoNum }">
<div class="scroll">
	<table>
	<tr>
		<td align="center" colspan="2">
			<h4><b>�޸� ����</b></h4>
		</td>
	</tr>
	<tr>
		<td align="center">
			<b>����</b>	
		</td>
		<td>
			<input type="hidden" name="subject" value="${subject}">
<textarea rows="1" cols="50" name="subject">
${ subject }
</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">
			<b>����</b>
		</td>
		<td>
			<input type="hidden" name="content" value="${content}">
<textarea rows="10" cols="50" name="content">
${ content }
</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">
			<b>��Ͻð�</b>
		</td>
<td>
${ memoTime }
</td>
	</tr>
	<tr>
		<td align="center">
			<b>��й�ȣ</b>
		</td>
		<td>
			<input type="password" size="10" maxlength="10" name="pass">
			<input type="submit" value="����">
		</td>
	</tr>
	</table>
</div>
</form>
</body>
</html>