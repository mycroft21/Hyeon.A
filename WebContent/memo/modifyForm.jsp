<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/memoStyle.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script type="text/javascript">
	function nullCheck() {
		var pw = document.forms['modify'].elements['pass'].value;

		if (pw.length < 1) {
			alert("암호가 입력되지 않았습니다.");
		} else {
			document.forms['modify'].submit();
		}
	};
</script>

<title>메모 수정</title>
</head>
<body>
	<form name="modify" action="modifyPro.memo" method="post" class="modify_form">
		<input type="hidden" name="memoNum" value="${ memoNum }">
			<table class="modify_table">
				<tr>
					<th class="write_th" colspan="2">메모 수정</th>
				</tr>
				<tr>
					<td class="write_td"><b>제&nbsp;&nbsp;&nbsp; 목</b></td>
					<td class="write_input"> <input type="text" name="subject" size='42'  class="textbox_w" value="${ subject }">
					</td>
				</tr>
				<tr>
					<td class="write_td"><b>내&nbsp;&nbsp;&nbsp; 용</b></td>
					<td class="write_input"> <textarea rows="10" cols="45"  class="textbox_w" name="content">${ content }</textarea>
					</td>
				</tr>
				<tr>
					<td class="write_td"><b>등 록 시 간</b></td>
					<td class="write_input"> ${ memoTime }</td>
				</tr>
				<tr>
					<td class="write_td" ><b>비 밀 번 호</b></td>
					<td class="write_input">
					<input type="password" size="10" name="pass"  class="textbox_w">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="nullCheck();">
						<button onclick="history.go(-1)">취소</button>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>