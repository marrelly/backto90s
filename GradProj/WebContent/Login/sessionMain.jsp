<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<link rel ="stylesheet" href = "Member.css" type = "text/css"> 
<title>초기화면</title>  
 
<!-- 메인 페이지 -->
<%
String id = (String)session.getAttribute("id"); //객체값 
if(id == null || id.equals("")) 
	{
		response.sendRedirect("sessionLoginForm.jsp");
		return;
	} 
 else {
%>
<audio autoplay><source src="../sound/modem.mp3" type="audio/mp3">오류</audio>


<body>



<div class="big">
<center>
<br><br><br>
<h1> Back to 90'S
<form method = "POST"  name = "form">

</center>


<input type = "submit"  class = "hdbtn" value = "로그아웃" onclick="javascript: form.action = 'Calling.jsp';">
&nbsp;<input type = "submit"  class = "hdbtn" value = "마이페이지" onclick="javascript: form.action = 'MypageForm.jsp';"> </h1>


<hr>

&nbsp;[ 기본 서비스 ]
&nbsp;&nbsp;  <input type = "submit" class = "bdbtn" value = "1.공지사항" onclick="javascript: form.action = '../Notice/NoticeForm.jsp';"> &nbsp;
&nbsp;&nbsp;  <input type = "submit" class = "bdbtn"value = "2.사이트소개" onclick="javascript: form.action = 'IntroduceForm.jsp';"> &nbsp;

  <br><br>
  &nbsp;[ 커뮤니티 ]
 &nbsp;&nbsp;&nbsp;&nbsp; <input type = "submit" class = "bdbtn"value = "11.질문게시판" onclick="javascript: form.action = '../FAQ/FAQForm.jsp';">
&nbsp; <input type = "submit" class = "bdbtn" value = "12.게임게시판" onclick="javascript: form.action = '../Game/GameForm.jsp';"> &nbsp;<!-- 공략법 컨텐츠 -->
&nbsp;&nbsp; <input type = "submit"class = "bdbtn" value = "13.익명게시판" onclick="javascript: form.action = '../Anony/AnonymouseForm.jsp';"> &nbsp;
  <input type = "submit" class = "bdbtn" value = "14.추억의 오락실" onclick="javascript: form.action = '../Game/Game2Form.jsp';">&nbsp;
  


<% 
 }
%>
<%
if(id.equals("admin1")){
	%>
	  <input type = "submit" class="bdbtn" value = "회원목록조회" onclick="javascript: form.action = 'list.jsp';">
	<% 
}
%>



</form>
</div>
</body>
</html>