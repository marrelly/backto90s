<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ch12.*" %>

<jsp:useBean id = "mb" class ="ch12.LogonDataBean" >
<jsp:setProperty property = "*" name = "mb" />
</jsp:useBean>

<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("sessionLoginForm.jsp");
}

%>

<%
   LogonDBBean logon = LogonDBBean.getInstance();
   int result = logon.수정(mb);
   //check == 1 "수정성공" sessionMain.jsp 이동
   //check == 0 "패스워드틀림" 뒤로이동
   if(result == 1) {
	  %>
	  <script type = "text/javascript">
	  alert("회원 정보 수정이 완료되었습니다.");
	  location.href = "sessionMain.jsp"
	  </script>
	  <% 
	  
   }else {  //check == 0
	   %>
	   <script type = "text/javascript">
	   alert("일치하지 않는 비밀번호 입니다.");
	   history.back();
	   </script>
	   <%
   }
 %>