<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!-- 삭제 게시판 -->
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("sessionLoginForm.jsp");
	return;
}
%>
<link rel ="stylesheet" href = "Member.css" type = "text/css">
<body>
<div class="big">
<h1>회원탈퇴</h1>
<form action = "deletePro.jsp" method = "POST">
<table>
<tr>
<th>아이디</th><td><input type = "text" name = "id" value ="<%=id %>" readonly = "readonly"></td>
</tr>
<tr>
<th>비밀번호</th><td><input type = "text" name = "passwd"></td>
</tr>
</table><br>
<input type = "submit" class="bdbtn" value = "회원탈퇴">
</form>
</div>
</body>
</html>