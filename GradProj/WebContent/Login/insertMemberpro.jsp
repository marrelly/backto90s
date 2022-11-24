<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<%@ page import = "ch12.*" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!-- 회원가입 처리 게시판 -->
<!-- 빈추가 -->
<jsp:useBean id="mb" class="ch12.LogonDataBean"/> 
<jsp:setProperty name = "mb" property = "*"/> 

<% 
	mb.setReg_date(new Timestamp(System.currentTimeMillis())); //member라는 객체에 폼에 내용이 없어서 오늘 날짜 임의적으로 집어넣어줌.

	 //연결하는 거 인서트 하는거 다 들어있음. //인스턴스와 동급 logon	
	 //엄청 중요함 //set으로 저장하고 있는 member 넘겨줌.
	//DB에 연동시켜줄 수 있는 코드임.
  	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 자바빈을 통해서 값 넘겨주고 받아오는 작업이 필요 -->
<%	// ---> 2.
		if (mb.getId() == null || mb.getPasswd() == null || mb.getName() == null
			|| mb.getGender() == null || mb.getEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {  // ---> 3.
			LogonDBBean logon = LogonDBBean.getInstance();
			int result = logon.insertMember(mb);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else  {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'sessionLoginForm.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>