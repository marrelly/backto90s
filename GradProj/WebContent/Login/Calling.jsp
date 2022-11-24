<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
 crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>접속</title>

<link rel ="stylesheet" href = "Loading.css" type = "text/css">

<script src="http://code.jquery.com/jquery-1.11.2.min.js" > </script>


<script type="text/javascript">
	function clickedBtn(){
		  
	//알림뜨고 메인페이지 연결
	alert("01412에 전화 거는중..");
	
	//로딩중
	showLoading();
		
	//로딩 숨기기(2초 후)
	setTimeout("hideLoading()", 2000);
	}
	
	//로딩 뜨기 함수
	function showLoading(){
		
	//화면의 높이와 너비를 구합니다.
	var maskHeight = $(document).height();
	var maskWidth  = window.document.body.clientWidth;
	
	//화면에 출력할 마스크를 설정해줍니다.
	var mask ="<div id='mask' style='position:absolute; z-index:1000; background-color:#000000; left:50; top:100;'></div>";
		 
	//화면에 레이어 추가
	$('body').append(mask)
		  
	 //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
	$('#mask').css({
	 'width' : maskWidth,
	  'height': maskHeight
	  ,'opacity' :'0.3'
	   });
	   
	  $("#loadingStatus").show();
   
	}
	
	//로딩숨기기함수
	function hideLoading(){
	 $("#mask").remove();
	 $("#loadingStatus").hide();
	  
	//화면 흐리기 추가
	
	
	//화면 넘기기
	location.href = "sessionLoginForm.jsp";
}


</script>

</head>
 
<body>

<div class="hibtn" ">
		<input type="button" id="hibtn" onclick="clickedBtn()" value="하이텔 체험하러 가기">
</div>

<div class="text-center">
  <div class="spinner-border text-light" id=loadingStatus role="status"  style="display: none;">
    <span class="sr-only">Loading...</span>
  </div>

</div>

 <!-- 하이텔 오디오 음원바꾸기 -->
 <!-- 
 <audio autoplay controls>
    <source src="audio/modemsound.mp3" type="audio/mp3 ">
</audio> -->

</body>
</html>