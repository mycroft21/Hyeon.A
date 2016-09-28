<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 페이지</title>
</head>
<body>
로그인이 필요합니다.<br>
	<form action="loginPro.park" method="post">
		아이디&nbsp;<input type="text" name="id" size="7"><br>
		패스워드&nbsp;<input type="password" name="password" size="7"><br>
		<input type="submit" value="로그인">
		<button>취소</button>
	</form>
</body>
</html>