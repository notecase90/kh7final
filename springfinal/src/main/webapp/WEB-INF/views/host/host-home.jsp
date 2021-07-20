<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<h1> 호스트 홈</h1>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<link rel="stylesheet" href="${root}/resources/css/price.css">
<style>
	#price{
	width: 60%;
	outline: auto;
	margin: 0px;
	font-size:16px;
	padding-left: 10px;
	text-align: left;
	}
</style>

<a href="room-type">숙소 등록</a>
<a href="room-manage">숙소 관리</a>
<a>메세지</a>

<br><br>
<div>
	<input type="hidden" name="dayPrice" value="50000">
</div>	
<div>
	<input type="text" id="price" name="b" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
<div>	
	<button id="equal">미리보기</button>
</div>	
	<span id="c"></span>
</div>

<script>
$(function(){
	// equal 이라는 아이디를 가진 버튼을 클릭하면 비동기통신으로 요청을 보낸 결과를 화면에 출력
	//= 단, 요청에 a와 b라는 이름의 데이터를 첨부해야 한다.
	
	$("#equal").click(function(){
		
		$.ajax({
			url:"${pageContext.request.contextPath}/data/test",
			data:{
				a:$("input[name=dayPrice]").val(),
				b:$("input[name=b]").val()
			},
			success:function(resp){
				$("#c").text(resp);
			}
		});
		
	});
});
</script>
