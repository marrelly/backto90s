<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "ch12.*" %>
<%@page import="java.sql.*" %>
<!-- 삭제 처리 게시판 -->
<%--액션태그 useBean 생성 --%>
<jsp:useBean id="mb" class="ch12.LogonDataBean">
<jsp:setProperty property = "*" name = "mb"/>
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
//DB 객체생성
LogonDBBean logon = LogonDBBean.getInstance();
//int check = 메소드 호출 deleteMember(mb)
int check = logon.삭제(mb);
//check == 1 "삭제성공" sessionLoginForm.jsp
//check == 0 "패스워드틀림" 뒤로이동
 if(check == 1) {
	 //세션의 초기화
	 session.invalidate();
	  %>
	  <script type = "text/javascript">
	  alert("회원탈퇴 하셨습니다.");
	  location.href = "sessionLoginForm.jsp";
	  </script>
	  <% 
	  
  
   }else { //check == 0
	   %>
	   <script type = "text/javascript">
	   alert("비밀번호가 일치하지 않습니다.");
	   history.back();
	   </script>
	   <%
   }
%>
	
	
	
	


