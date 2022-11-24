<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@page import = "ch12.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.*" %>
<!-- 질문 게시판 -->
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
QDBBean qbs = QDBBean.getInstance();
List<QDataBean> MyList = null;
MyList = qbs.getquest();
if (id == null) {
	response.sendRedirect("../Login/sessionLoginForm.jsp");
	return;
}

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>질문 게시판</title>
<link rel ="stylesheet" href = "../Login/Member.css" type = "text/css">
</head>

<body>
<div class="big">
<form method = "POST" action = "form">
<center>
<hr>
<h1>질문게시판

<input type = "submit" class = "hdbtn" value = "글쓰기" onclick="javascript: form.action = 'QwritePro.jsp';">
	
</h1>
<hr>
<h3>번호&nbsp;제목&nbsp;이름&nbsp;날짜&nbsp; 조회수 </h3>

<hr>
<%
System.out.println(MyList);
if(MyList.size()>0) {
	for(int i = 0; i < MyList.size(); i++) {
		//한 행씩 출력
		QDataBean qb = MyList.get(i);
	%>
	<tr>
	<td><%=qb.getNumber() %></td>
	<td><a href="Qview.jsp?number=<%=qb.getNumber()%>"><%=qb.getTitle() %></a></td>
	<td><%=qb.getName() %></td>
	<td><%=qb.getDate() %></td>
    <td><%=qb.getHit() %></td>
	
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
</div>
</body>
</html>