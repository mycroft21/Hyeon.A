<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  type="text/css" href="/hyeonA/css/memoStyle.css"/>
<title>글쓰기 pro</title>
</head>
<body>
  <form method='POST' action='writePro.memo' class="write_form"> 
	    <table class="write_table"> 
		    <tr>
				<th class="write_th" colspan="2">메모 작성</th>
			</tr>
		    <tr> 
			    <td  class="write_td"><b>제&nbsp;&nbsp;&nbsp; 목</b></td> 
			    <td class="write_input"><input type='text' name='subject' size='42' placeholder=" 30자 이내 입력"  class="textbox_w"></td> 
		    </tr>
	   		 <tr> 
			    <td  class="write_td"><b>내&nbsp;&nbsp;&nbsp; 용</b></td> 
			    <td class="write_input"> 
			 	   <textarea wrap='hard' name='content'  rows='10' cols='45' placeholder=" CONTENTS"  class="textbox_w"></textarea> 
			    </td> 
	    	</tr> 
	    	<tr> 
			    <td  class="write_td"><b>비밀번호</b></td> 
			    <td class="write_input"><input type="password" name='password' size='15'  placeholder=" 비밀번호 입력"  class="textbox_w"></td> 
	   		 </tr>
	   		<tr> 
			   	<td colspan='2' > 
					 <input type='submit' value='글 저장'> 
				     <input type ="reset" value="다시 쓰기">
				     <input type="button" value="목록보기" onclick="location.href='list.memo'">
			    </td>
			</tr> 
	    </table> 
    </form> 

</body>
</html>