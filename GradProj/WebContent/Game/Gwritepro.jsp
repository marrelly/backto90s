<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>   
<%@ page import = "ch12.*" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게임공략법</title>
<link rel ="stylesheet" href = "../Login/Member.css" type = "text/css">
</head>
<body>
<center>
<hr>
<h1>게임 공략법</h1>
<hr>
<form method="post" action="writeSuccess.jsp"> 

<table>
<tr>
<td><label for="title">제목 </label></td>
<td><input type="text" name="title" id="title" required></td>
</tr>
<tr>
<td><label for="name">이름 </label></td>
<td><input type="text" name="name" id="name" required></td>
</tr>
<tr>
<td><label for="passwd">비밀번호 </label></td>
<td><input type="text" name="passwd" id="passwd" required></td>
</tr>
<tr>
</table>
<textarea name="content" id="content" cols="42.9" rows="10" placeholder='내용을 입력하세요.' 
required style=overflow-x:hidden; overflow-y:scroll; resize: none;﻿"></textarea><br>
<div id="button" style="padding-left:100px; padding-top:10px;">
<input class="bdbtn" type="submit" value="등록" >
<input class="bdbtn" type="button" value="목록" onclick="location.href='writeSuccess.jsp'">
</center>
</div>
</form>
</body>
</html>