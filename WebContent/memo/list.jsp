<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#first {
	background-color: white;
	margin: 5px auto;
	margin-left: 30px;
	width: 200px;
	height: 180px;
	float: left;
}

#second {
	background-color: lightgray;
	position: relative;
	height: 50px;
}

#third {
	background-color: white;
	padding: 3px;
	height: 130px;
	overflow-y:auto;
}

.control {
	width: 120px;
}

.list_wrap {
	width: 700px;
}

.right {
	position: absolute;
	right: 0;
	padding: 2px;
	width: 110px;
}

.left {
	position: absolute;
	left: 0;
	top: 25px;
	padding: 2px;
	width: 80px;
}

.img {
	width: 20px;
	height: 20px;
}

.img2 {
	width: 20px;
	height: 20px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트</title>
</head>
<c:if test="${count == 0}">
	<a href="writeForm.memo"><img class="img"
		src="http://cfile3.uf.tistory.com/image/2026913C4F10CAF2136955" />
		새글쓰기 ^^</a>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
</c:if>


<div class="list_wrap">

	<c:if test="${count > 0}">

		<a href="writeForm.memo"><img class="img"
			src="http://cfile3.uf.tistory.com/image/2026913C4F10CAF2136955" />
			새글쓰기 ^^</a>
		<br>

		<c:forEach items="${list }" var="list">
			<div id="first">
				<div id="second">
					<div class="right">
						<form action="modifyForm.memo" method="post" name="sendmody">
							글번호 :
							<c:out value="${list.memoNum }" />
							&nbsp; <input type="image" class="img2"
								src="data:image/jpeg;base64,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"
								value=" 글번호 : ${list.memoNum }"> <input type="hidden"
								value="${list.memoNum }" name="memoNum"/>

						</form>
						&nbsp;

						<form action="deleteForm.memo" method="post" name="sendmody">
							<input type="image"
								src="data:image/png;base64,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"
								class="img2"> <input type="hidden"
								value="${list.memoNum }" name="memoNum" />
						</form>
					</div>
					<div class="left">${list.subject }</div>
				</div>
				<div id="third">${list.content }</div>
			</div>
		</c:forEach>

	</c:if>

	<br>
	<div class="control">
		<c:if test="${count > 0}">
			<c:set var="pageCount"
				value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1 )}" />
			<c:set var="startPage" value="${1}" />
			<c:set var="pageBlock" value="${5}" />

			<fmt:parseNumber var="result" value="${currentPage / pageBlock}"
				integerOnly="true" />

			<c:if test="${(currentPage % pageBlock) != 0}">
				<c:set var="startPage" value="${result * pageBlock + 1}" />
			</c:if>

			<c:if test="${(currentPage % pageBlock) == 0}">
				<c:set var="startPage" value="${(result - 1) * pageBlock + 1}" />
			</c:if>

			<c:set var="endPage" value="${startPage + pageBlock - 1}" />

			<c:if test="${startPage > 5}">
				<a href="list.memo?pageNum=${startPage - 5}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="list.memo?pageNum=${i}">[${i}]</a>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<a href="list.memo?pageNum=${startPage+5}">[다음]</a>
			</c:if>
		</c:if>
	</div>
</div>

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