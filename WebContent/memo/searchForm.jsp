<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 검색</title>
</head>
<body>
<form action="searchPro.memo" method="post">
	<table>
		<tr>
			<td>
				<select name="keyField">
					<option value="0"> --- 선택 --- </option>
					<option value="memoNum"> 글번호 </option>
					<option value="subject"> 글제목 </option>
					<option value="content"> 글내용 </option>
				</select> 
				
				<input type="text" name="keyWord" />
				<input type="submit" value="검색" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>