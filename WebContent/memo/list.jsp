<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트</title>
</head>
		<c:if test="${count == 0}">
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>



		
<c:if test="${count > 0}">

<table>
<tr>
<th>글번호</th>
<th>제목</th>
<th>작성시간</th>
</tr>

			<c:forEach items = "${list }" var = "list" >
<tr>
<td><a href="">${list.memoNum }</a></td>
<td><a href="">${list.subject }</a></td>
<td><a href="">${list.content }</a></td>
</tr>
</c:forEach>
			</table>
		</c:if>



<br>

	<c:if test="${count > 0}">
			<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1 )}"/>
			<c:set var="startPage" value="${1}"/>
			<c:set var="pageBlock" value="${5}"/>
			
			<fmt:parseNumber var="result" value="${currentPage / pageBlock}" integerOnly="true" />
			
			<c:if test="${(currentPage % pageBlock) != 0}">
				<c:set var="startPage" value="${result * pageBlock + 1}"/>
			</c:if>
			
			<c:if test="${(currentPage % pageBlock) == 0}">
				<c:set var="startPage" value="${(result - 1) * pageBlock + 1}"/>
			</c:if>
			
			<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
			
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

</body>
</html>