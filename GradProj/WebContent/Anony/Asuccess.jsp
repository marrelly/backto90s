<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 익명게시판 처리 부분입니다. -->
<%@ page import = "java.sql.*" %>   
<%@ page import = "ch12.*" %> 
<jsp:useBean id="mb" class="ch12.BbsDBBean"> 
<jsp:setProperty name = "mb" property = "*"/> 
</jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("sessionLoginForm.jsp");
	return;
}
%>
<%
   mb.setDate(new Timestamp(System.currentTimeMillis())); //member라는 객체에 폼에 내용이 없어서 오늘 날짜 임의적으로 집어넣어줌.
   BbsDAO bbs = BbsDAO.getInstance(); //연결하는 거 인서트 하는거 다 들어있음. //인스턴스와 동급 logon
   bbs.insertanony(mb);
%>
<!-- 게시물이 등록됨과 동시에 익명목록 게시판으로 되돌아감. -->
<script>
alert("게시물이 등록되었습니다.");
location.href = "AnonymouseForm.jsp";
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>익명게시판 게시물 등록완료</title>
</head>
<body>

</body>
</html>