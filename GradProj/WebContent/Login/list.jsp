<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@page import = "ch12.*" %>
<%@page import = "java.util.List" %>
<!-- 전체회원 목록 보기 -->
<!-- 관리자만 볼 수 있음-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel ="stylesheet" href = "Member.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="big">
<h1>전체회원목록</h1>
<hr>
<%
//세션값 가져오기
String id = (String) session.getAttribute("id");
//세션값 없으면 sessionLoginForm.jsp로 이동
if (id == null || !id.equals("admin")) {
	response.sendRedirect("sessionLoginForm.jsp");
	return;
}
//DB 객체생성 
LogonDBBean logon = LogonDBBean.getInstance();
List<LogonDataBean>list = null;
list = logon.getMembers();
%>

<table border ="1">
<tr>
<th>아이디</th><th>패스워드</th><th>이름</th>
<th>가입일자</th><th>성별</th><th>이메일</th><th>나이</th>
</tr>
<% 
if(list.size()>0) {
	for(int i = 0; i < list.size(); i++) {
		//한 행씩 출력
		LogonDataBean mb = list.get(i);
	%>
	<tr>
	<td><%=mb.getId() %></td>
	<td><%=mb.getPasswd() %></td>
	<td><%=mb.getName() %></td>
	<td><%=mb.getReg_date() %></td>
    <td><%=mb.getGender() %></td>
	<td><%=mb.getEmail() %></td>
    <td><%=mb.getAge() %></td>
	</tr>
	<% 
	}
} else {//list.size() == 0
		%>
		<tr>
		<td colspan = "7"> 회원이 존재하지 않습니다.. </td>
		</tr>
		<% 
}
%>

</table>
</body>
<h3><a href = "sessionMain.jsp">메인화면</a></h3>
</html>