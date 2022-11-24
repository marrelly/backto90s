<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "ch12.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.*" %>

<!-- 익명게시판 입니다. -->
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
BbsDAO bbs = BbsDAO.getInstance();
List<BbsDBBean> MyList = null;
MyList = bbs.getMembers();
if (id == null) {
	response.sendRedirect("../Login/sessionLoginForm.jsp");
	return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel ="stylesheet" href = "../Login/Member.css" type = "text/css">
</head>
<body>
<div class="big">

<form method = "POST" action = "Awritepro.jsp">
<center>
<hr>
<h1>익명게시판
<input type = "button" value = "글쓰기" onclick = "location.href='Awritepro.jsp'">
</h1>
<hr>
<table border="1">
<tr>
<th id="number"> <h3>번호</h3> </th>
<th id="title"> <h3>제목</h3> </th>
<th id="name"><h3>이름</h3> </th>
<th id="date"><h3>날짜</h3> </th>
<th id="view"><h3>조회수</h3></th>
</tr>
<%
System.out.println(MyList);
if(MyList.size()>0) {
	for(int i = 0; i < MyList.size(); i++) {
		//한 행씩 출력
		BbsDBBean mb = MyList.get(i);
	%>
	<tr>
	<td><%=mb.getNumber() %></td>
	<td><a href="view.jsp?number=<%=mb.getNumber()%>"><%=mb.getTitle()%></a>
	</td>
	<td><%=mb.getName() %></td>
	<td><%=mb.getDate() %></td>
    <td><%=mb.getHit() %></td>
	</tr>
	<% 
	}
} else {//list.size() == 0
		%>
		<tr>
		<td colspan = "5"> 글이 없습니다... </td>
		</tr>
		<% }
%>
</table>
</center>
</form>
</body>