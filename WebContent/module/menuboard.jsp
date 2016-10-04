<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>메뉴보드!!</title>
</head>
<body>
	<div align="center" >
  		 <a href="/hyeonA/list.park?fnum=1f" class="list-group-item list-group-item-danger" >
  			 <span class="glyphicon glyphicon-blackboard" aria-hidden="true"></span><br>주차현황</a>
  		 
 		 <a href="/hyeonA/registForm.park?fnum=1f" class="list-group-item list-group-item-warning">
 			 <span class="glyphicon glyphicon-edit" aria-hidden="true"></span><br>주차등록</a>
 		 
 		 <a href="/hyeonA/payForm.park?fnum=1f" class="list-group-item list-group-item-warning">
 			 <span class="glyphicon glyphicon-share" aria-hidden="true"></span><br>주차해지</a>
 		 
 		 <a href="/hyeonA/searchForm.park" class="list-group-item list-group-item-warning">
 			 <span class="glyphicon glyphicon-search" aria-hidden="true"></span><br>차량검색</a>
 		 
 		 <a href="/hyeonA/calcForm.park" class="list-group-item list-group-item-Primary">
 			 <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span><br>매출정산</a>
 			 
 		 <a href="/hyeonA/list.memo" class="list-group-item list-group-item-success">
 			 <span class="glyphicon glyphicon glyphicon-pencil" aria-hidden="true"></span><br>메모</a>
	
		 <a href="/hyeonA/logout.park" class="list-group-item list-group-item-info">
 			 <span class="glyphicon glyphicon glyphicon-lock" aria-hidden="true"></span><br>화면잠금</a>
	</div>
</body>
</html>