<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
 <%@ page import = "java.sql.*" %>   
<%@ page import = "ch12.*" %>

<!-- 공지게시판 입력 부분입니다. -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel ="stylesheet" href = "../Login/Member.css" type = "text/css">
<title>Insert title here</title>
</head>
<body>
<div class="big">
<center>
<hr>
<%
//전달된 피라미터 값 저장
int number = Integer.parseInt(request.getParameter("number"));
//객체 생성
NDBBean nbs = NDBBean.getInstance();
//기존의 글 정보를 가져오기
NDataBean nb = nbs.getNbs(number);
%>

<h1><%=nb.getTitle() %></h1>
<hr>

<tr>
<td id="no"> <h3>번호</h3> <%=nb.getNumber() %>.</td>
<td id="name"><h3>이름</h3> <%=nb.getName() %> </td>
<td id="content"> <h3>내용</h3> <%=nb.getContent() %> </td>
<td id="date"><h3>날짜</h3> <%=nb.getDate() %> </td>

</tr>



	

</center>
</div>
</body>
</html>