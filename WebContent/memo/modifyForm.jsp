<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/memoStyle.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메모 수정</title>
</head>
<body>
	<form name="modify" action="modifyPro.memo" method="post">
		<input type="hidden" name="memoNum" value="${ memoNum }">
		<div class="scroll">
			<table>
				<tr>
					<td align="center" colspan="2">
						<h4>
							<b>메모 수정</b>
						</h4>
					</td>
				</tr>
				<tr>
					<td align="center"><b>제목</b></td>
					<td><input type="text" name="subject" value="${ subject }">
					</td>
				</tr>
				<tr>
					<td align="center"><b>내용</b></td>
					<td><textarea rows="10" cols="50" name="content">${ content }</textarea>
					</td>
				</tr>
				<tr>
					<td align="center"><b>등록시간</b></td>
					<td>${ memoTime }</td>
				</tr>
				<tr>
					<td align="center"><b>비밀번호</b></td>
					<td><input type="password" size="10" maxlength="10"
						name="pass"> <input type="submit" value="수정"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>