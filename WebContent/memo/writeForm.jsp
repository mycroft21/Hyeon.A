<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기 pro</title>
</head>
<body>
<div>
  <form method='POST' action='writePro.memo'> 
	    <table border='1' width='500' cellspacing="0"> 
		    <tr height="20"  > 
			    <td width='170' align='center' >제목</td> 
			    <td><input type='text' name='subject' size='48' ></td> 
		    </tr>
		    <tr height="20"  > 
			    <td align='center' >비밀번호</td> 
			    <td><input type="password" name='password' size='48'></td> 
	   		 </tr>
	   		 <tr> 
			    <td align='center' >내용</td> 
			    <td> 
			    <textarea wrap='hard' rows='10' name='content' cols='50'></textarea> 
			    </td> 
	    	</tr> 
	   		<tr> 
			   	<td align='right' colspan='2' style="padding-right:25"> 
				 <input type='submit' value='글 저장'> 
			     <input type ="reset" value="다시 쓰기">
			     <input type="button" value="목록보기" onclick="location.href='list.memo'">
			    </td>
			</tr> 
	    </table> 
    </form> 
</div>
</body>
</html>