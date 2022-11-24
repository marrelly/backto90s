<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 로그인 페이지 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인하기</title>
<link rel ="stylesheet" href = "Member.css" type = "text/css">
</head>
<body>
<br><br><br><br><br><br><br>
<form method = "POST" class="big" action = "sessionLoginPro.jsp">
<center>
<p style="font-size:100px;"> Back To 90's</style>
<br><br><br>
<hr>

<h2>아이디&nbsp;<input type = "text" name = "id"> 
비밀번호&nbsp;<input type = "password" name = "passwd">
<input type = "submit" class="bdbtn" value = "로그인">
<input type = "button" class="bdbtn" value = "회원가입" onclick = "location.href='insertMemberForm.jsp'">
</h2>
</center>
<br>
</form>
</body>
</html>