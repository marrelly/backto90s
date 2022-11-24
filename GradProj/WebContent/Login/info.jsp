<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ch12.*" %>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("sessionLoginForm.jsp");
}
%>
<!-- 회원 정보 게시판 (특정 유저꺼만 볼 수 있음) -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel ="stylesheet" href = "Member.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보게시판</title>
</head>
<body>
<div class="big">
<%
//DB객체생성
LogonDBBean logon = LogonDBBean.getInstance();
//getMember(id) 메소드 호출
LogonDataBean mb = logon.getUserInfo(id);
%>
<h1>회원정보 조회</h1>
<hr>
아이디 : <%=mb.getId()%><br>
비밀번호 :<%=mb.getPasswd() %><br>
이름 : <%=mb.getName() %><br>
가입날짜 : <%=mb.getReg_date() %><br>
나이 : <%=mb.getAge() %><br>
성별 : <%=mb.getGender() %><br>
이메일 : <%=mb.getEmail() %><br>
<br>
<a href = "sessionMain.jsp">메인화면</a>
</body>
</html>