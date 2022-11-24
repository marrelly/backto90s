<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
<%
/*
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("sessionLoginForm.jsp");
	return;
}*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이페이지</title>
<link rel ="stylesheet" href = "Member.css" type = "text/css">
</head>
<body>
<div class="big">
<form method = "POST" name = "form">
<center>
<hr>
<h1>마이페이지</h1>
<hr>
</center>


<input type = "submit" class = "bdbtn" value = "1.[회원정보변경]" onclick="javascript: form.action = 'sessionUpdateForm.jsp';"></td> 
<br><br><br>

 <input type = "submit" class = "bdbtn" value = "2.[회원탈퇴]" onclick="javascript: form.action = 'deleteForm.jsp';"></td>
<br><br><br>
  <input type = "submit" class = "bdbtn" value = "3.[회원조회]" onclick="javascript: form.action = 'info.jsp';"></td>
<br><br><br>
</form>
</div>
</body>
</html>