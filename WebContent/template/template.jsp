<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<!-- 우리의 css -->
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/style.css"/>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>메인페이지</title>

</head>
<body>
<div class="container-fluid">
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
                     <div class="row">
                        <div class="col-md-12">
							<table class="table" border="1" cellspacing="0">
								<tr>
									<td align="center"><jsp:include page="../module/parking.jsp"/></td>
								</tr>
							</table>
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
                  <div class="col-md-2">
                  	<table class="table2" border="1">
						<tr>
							<td><jsp:include page="../module/menuboard.jsp"/></td>
						</tr>
					</table>
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
