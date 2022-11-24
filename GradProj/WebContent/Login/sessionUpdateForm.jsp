<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ch12.*" %>
<!-- 회원수정게시판 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href = "Member.css" type = "text/css">
</head>
<body>
<div class="big">
<%
String id = (String)session.getAttribute("id");
/*if(id == null) {
	response.sendRedirect("sessionLoginForm.jsp");
	return;
}*/
//DB객체 생성
LogonDBBean logon = LogonDBBean.getInstance();
//getUserInfo(id)메소드 호출
LogonDataBean mb = logon.getUserInfo(id);
%>
<h1>회원정보 수정</h1>
<form method = "POST" action = "updatePro.jsp">
<table border = "1">
<tr>
<th>아이디 </th><td> <input type = "text" name = "id" value = "<%=mb.getId()%>" readonly></td>
</tr>
<tr>
<th>비밀번호 </th><td><input type = "text" name = "passwd" value ="<%=mb.getPasswd()%>"> </td>
</tr>
<tr>
<th>이름</th><td><input type = "text" name = "name" value = "<%=mb.getName() %>"> </td>
</tr>
<tr>
<th>나이 </th><td><input type="text" name="age" min="0" max="200" value="<%=mb.getAge() %>"></td>
</tr>
<tr>
<th>성별</th><td><input type="radio" name="gender" value="man" 
 <% if(mb.getGender() != null && mb.getGender().equals("남")) { %> checked <% } %>>남성
  <input type="radio" name="gender" value="woman" 
<% if(mb.getGender() != null && mb.getGender().equals("여")) { %> checked <% } %>>여성
</td>
</tr>
<tr>
<th>이메일 </th><td><input type="text" name="email" value="<%=mb.getEmail() %>"></td>
</tr>
</table>
<br>
<input type = "submit" value = "회원수정">
</form> 
</body>
</html>

