<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 게임게시판 처리 부분입니다. -->
<%@ page import = "java.sql.*" %>   
<%@ page import = "ch12.*" %> 
<jsp:useBean id="gb" class="ch12.GDataBean"> 
<jsp:setProperty name = "gb" property = "*"/> 
</jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("../Login/sessionLoginForm");
	return;
}
%>
<%
   gb.setDate(new Timestamp(System.currentTimeMillis())); //member라는 객체에 폼에 내용이 없어서 오늘 날짜 임의적으로 집어넣어줌.
   GDBBean gbs = GDBBean.getInstance(); //연결하는 거 인서트 하는거 다 들어있음. //인스턴스와 동급 logon
   gbs.insertGame(gb);
%>
<!-- 게시물이 등록됨과 동시에 게임 게시판으로 되돌아감. -->
<script>
alert("게시물이 등록되었습니다.");
location.href = "GameForm.jsp";
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>