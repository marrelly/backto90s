<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 회원가입 게시판 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어서오세요</title>
<link rel ="stylesheet" href = "Member.css" type = "text/css">
</head>
<body>
<div class="big">
<h1>회원가입</h1>
<form method = "POST" action = "insertMemberpro.jsp">
<table border = "1">
<tr>
<th>아이디 </th><td><input type = "text" name = "id"></td>
</tr>
<tr>
<th>비밀번호 </th><td><input type = "password" name = "passwd"></td>
</tr>
<tr>
<th>이름 </th><td><input type = "text" name = "name"> </td>
</tr>
<tr>
<th>나이 </th><td><input type = "text" name = "age" min="0" max="200"></td>
</tr>
<tr>
<th>성별 </th><td><input type="radio" name="gender" value="man">남성 
<input type="radio" name="gender" value="woman">여성</td>
</tr>
<tr>
<th>이메일 </th><td><input type="text" name="email"></td>
</tr>
</table>
<br>
<input type = "submit" value = "회원가입">

</form>
</div>
</body>
</html>

