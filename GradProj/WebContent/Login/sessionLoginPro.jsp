<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ch12.LogonDBBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 로그인 처리 페이지 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 처리</title>
</head>
<body>
<%
   String id = request.getParameter("id"); 
   String passwd = request.getParameter("passwd");
   
   //DB 커넥션, DB 쿼리 (LogonDBBean), Session 설정
   LogonDBBean logon = LogonDBBean.getInstance();
   int check =  logon.사용자체크(id,passwd);
   //check == 1 로그인 인증 sessionMain.jsp
   //check == 0 비밀번호 불일치 뒤로 이동
   //check == -1 아이디 불일치 뒤로 이동
   if (check == 1)
   {
	   session.setAttribute("id" , id);
	  
	   response.sendRedirect("sessionMain.jsp");
   } else if (check == 0)
   {
	   %>
	   <script>
	   alert("비밀번호가 일치하지 않습니다.");
	   history.back();</script>
	   
	   <% 
   } else  
   {
	   %>
	   <script>
	   alert("아이디가 일치하지 않습니다.");
	   history.back();
	   
	   
	  
	   <% 
   }
%>

</script>
</body>
</html>