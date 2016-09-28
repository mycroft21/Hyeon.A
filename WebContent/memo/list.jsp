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
	boder: 1px solid balck;
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
		src="/hyeonA/images/edit.png" />
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
			src="/hyeonA/images/edit.png" />
			새글쓰기 ^^</a>
		<br>

		<c:forEach items="${list }" var="list">
			<div id="first">
				<div id="second">
					<div class="right">
						<form action="modifyForm.memo" method="post" name="sendmody">
							글번호 :
							<c:out value="${list.memoNum }" />
								<input type="image" class="img2"
								src="/hyeonA/images/remove.png"
								value=" 글번호 : ${list.memoNum }"> <input type="hidden"
								value="${list.memoNum }" name="memoNum"/>

						</form>

						<form action="deleteForm.memo" method="post" name="sendmody">
							<input type="image"
								src="/hyeonA/images/can.png"
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
				<input type="image" src="/hyeonA/images/search.png" value="검색" />
			</td>
		</tr>
	</table>
</form>

</body>
</html>