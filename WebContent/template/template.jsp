<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<!-- 우리의 css -->
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/style.css"/>


<title>메인페이지</title>

</head>
<body>
<div class="container">
   <div class="row">
      <div class="col-md-12">
         <div class="row">
            <div class="col-md-1">
            </div>
            
            <div class="col-md-10">
            <!-- 상황판, 주차공간틀 div -->
               <div class="row">
                  <div class="col-md-10">
                     <!-- 주차공간 div -->
                     <div class="row park_wrap">
                        <div class="col-md-12 park_div">
							<jsp:include page="${ CONTENT }"/>
                        </div>
                     </div>
                     <!-- 주차공간 div end -->
                     
                     <!-- 상황판 div -->
                     <div class="row">
						<div class="col-md-6">
							<jsp:include page="../module/bottom_1.jsp"></jsp:include>
						</div>
						<div class="col-md-6">
							<jsp:include page="../module/bottom_2.jsp"></jsp:include>
						</div>
                     </div>
                     <!-- 상황판 div end -->
                     
                  </div>
                  <!-- 상황판, 주차공간틀 div end -->
                  
                  <!-- 메뉴바 div -->
                  <div class="menu_wrap">
                  	<jsp:include page="../module/menuboard.jsp"/>
                  </div>
                  <!-- 메뉴바 div end -->
                  
               </div>
               <!-- 상황판, 주차공간틀 메뉴보드 row div end -->
               
            </div>
            <!-- 전체틀(10) div end -->
            
            <div class="col-md-1">
            </div>
            
         </div>
      </div>
   </div>
</div>
</body>
</html>
