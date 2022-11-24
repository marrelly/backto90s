<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 로그아웃 페이지 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate(); //session의 값이 삭제됨.
%>
<!--  스크리트로 팝업 창 만들기 (로그아웃창) -->
<script>
alert("로그아웃");
location.href("sessionMain.jsp"); 
</script>
</body>
</html>