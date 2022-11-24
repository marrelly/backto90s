
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>   
<%@ page import = "ch12.*" %> 


<!-- 게임게시판 입력 부분입니다. -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel ="stylesheet" href = "../Login/Member.css" type = "text/css">
</head>
<body>
<div class="big">
<center>
<hr>
<%
//전달된 피라미터 값 저장
int number = Integer.parseInt(request.getParameter("number"));
//객체 생성
GDBBean gbs = GDBBean.getInstance();
//기존의 글 정보를 가져오기
GDataBean gb = gbs.getGbs(number);
%>
<h1><%=gb.getTitle() %></h1>
<hr>
<tr>
<td id="no"> <h3>번호</h3> <%=gb.getNumber() %>.</td>
<td id="name"><h3>이름</h3> <%=gb.getName() %> </td>
<td id="content"> <h3>내용</h3> <%=gb.getContent() %> </td>
<td id="date"><h3>날짜</h3> <%=gb.getDate() %> </td>

</tr>
</center>
</div>
</body>

</html>