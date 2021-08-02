<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<link rel="stylesheet" href="${root}/resources/css/common.css">
<link rel="stylesheet" href="${root}/resources/css/layout.css">
<link rel="stylesheet" href="${root}/resources/css/room/price.css">
<link rel="stylesheet" href="${root}/resources/css/host/hostHome.css">
<html>


<style>

</style>

	<div class="container-600 text-center">
		<br><br><br><br>
			<h1> 호스트 홈</h1>
			<p> 원하시는 메뉴를 선택하세요</p>
		
		<br><br><br><br><br><br><br><br>
		<div class='btn-container'>
			  <button class='btn btn--shockwave is-active' >
			   <a href="${root}/room/insert_start">숙소 등록</a>
			  </button>
			  <button class='btn btn--jump'>
			    <a href="hostRoomList">숙소 관리</a>
			  </button>
			  <button class='btn btn--blink'>
			   <a>메세지</a>
			  </button>
		</div>	

<div class="container footer-img">
			호스트 번호 : ${hostNo}
</div>
			
			
</div>
<script>
document.addEventListener('click', click);

function click(e) {
  let el
  
  el = e.target
  
  if (el !== e.currentTarget) {
    if(el.nodeName === 'BUTTON') {
      
       if(el.classList.contains('is-active')) {
         el.classList.remove('is-active')
       } else {
         el.classList.add('is-active')
       }
    }
  }
  event.stopPropagation()
}
</script>
</html>