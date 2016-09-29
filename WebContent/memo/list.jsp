<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/hyeonA/css/memoStyle.css" />

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트</title>
</head>
<div class="list_wrap">

	<!-- 메모 쓰기 -->
	<a href="writeForm.memo"><br>
		<img class="img2" src="/hyeonA/images/edit.png" />새 메모 쓰기
	</a><br><br>

	<c:if test="${count == 0}">
		<table>
			<tr>
				<td align="center"><br>게시판에 저장된 메모가 없습니다.</td>
			</tr>
		</table>
	</c:if>
	
	<div class="memo_list_wrap">
		<c:if test="${count > 0}">
			<c:forEach items="${list}" var="list">
				<!-- 메모 전체 틀 -->
				<div class="memo_wrap">
					<!-- 메모 윗 부분 -->
					<div class="memo_top">
						<!-- 메모 번호 div -->
						<div class="memo_top_1">
							<b>메모 번호 : <c:out value="${list.memoNum}" /></b>
							
							<!-- 메모 삭제 -->
							<form action="deleteForm.memo" method="post" name="sendmody" class="form_num">
								<input type="image" src="/hyeonA/images/can.png" class="img2" />
								<input type="hidden" value="${list.memoNum}" name="memoNum" />
							</form>
							
							<!-- 메모 수정 -->
							<form action="modifyForm.memo" method="post" name="sendmody" class="form_num">
								<input type="image" src="/hyeonA/images/remove.png" class="img2" value=" 글번호 : ${list.memoNum}" /> 
								<input type="hidden" value="${list.memoNum}" name="memoNum" />
							</form>	
						</div>
						
						<!-- 메모 제목 -->
						<div class="memo_top_2">${list.subject}</div>
					</div>
					
					<!-- 메모 내용 -->
					<div
						onmouseover="this.style.overflow='auto'"
				onmouseout="this.style.overflow='hidden'"
					 class="memo_bottom">${list.content}</div>	
				</div> 
			</c:forEach>
		</c:if>
	</div><br>
	
	<!-- 페이지 번호/검색 틀 -->
		<div class="pageNum_wrap">
			<c:if test="${count > 0}">
				<c:set var="pageCount" value="${pageCount}" />
				<c:set var="startPage" value="${1}" />
				<c:set var="pageBlock" value="${5}" />

				<fmt:parseNumber var="result" value="${currentPage / pageBlock}" integerOnly="true" />

				<c:if test="${(currentPage % pageBlock) != 0}">
					<c:set var="startPage" value="${result * pageBlock + 1}" />
				</c:if>

				<c:if test="${(currentPage % pageBlock) == 0}">
					<c:set var="startPage" value="${(result - 1) * pageBlock + 1}" />
				</c:if>
				
				<c:set var="endPage" value="${startPage + pageBlock -1}" />

				<c:if test="${pageCount <= 5}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<c:if test="${pageCount > 5 && pageCount > endPage }">
					<c:set var="endPage" value="${startPage + pageBlock - 1}" />
				</c:if>

				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<c:if test="${startPage > 5}">
					<a href="list.memo?pageNum=${startPage-5}&keyField=${keyField}&keyWord=${keyWord}">[이전]</a>
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="list.memo?pageNum=${i}&keyField=${keyField}&keyWord=${keyWord}">[${i}]</a>
				</c:forEach>

				<c:if test="${endPage < pageCount}">
					<a href="list.memo?pageNum=${startPage+5}&keyField=${keyField}&keyWord=${keyWord}">[다음]</a>
				</c:if>
			</c:if>
			
			<!-- 메모 검색 -->
			<form action="list.memo" method="post" class="list_search_form">
				<table class="list_search_table">
					<tr>
						<td>
							<select name="keyField">
								<c:if test="${keyField == 'subject'}">
									<option value="subject" selected="selected">글제목</option>
								</c:if>
	
								<c:if test="${keyField != 'subject'}">
									<option value="subject">글제목</option>
								</c:if>
	
								<c:if test="${keyField == 'memoNum'}">
									<option value="memoNum" selected="selected">글번호</option>
								</c:if>
	
								<c:if test="${keyField != 'memoNum'}">
									<option value="memoNum">글번호</option>
								</c:if>
	
								<c:if test="${keyField == 'content'}">
									<option value="content" selected="selected">글내용</option>
								</c:if>
	
								<c:if test="${keyField != 'content'}">
									<option value="content">글내용</option>
								</c:if>
							</select>
							
							<input type="hidden" value="${currentPage}" name="currentPage" />
						</td>
						
						<td>&nbsp;
							<c:if test="${keyWord == null}">
								<input type="text" name="keyWord" class="search_textbox" />
							</c:if>
	
							<c:if test="${keyWord != null}">
								<input type="text" name="keyWord" value="${keyWord}" class="search_textbox">
							</c:if>
						</td>
						
						<td>&nbsp;
							<input type="image" src="/hyeonA/images/search.png" class="img" value="검색" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>