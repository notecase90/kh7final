<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>

.fab{
            width: 100px;
            font-size: 35px;
        }
.fa-airbnb{
			display: flex;
    		align-items: center;
    		color: #ff4567;
		}                     
</style>



<div class="container">
<br><br>
<div class="header float-left">
	<h1>결제 상세 정보</h1>
</div>
<div class="logo float-right">
    <a href="${root}" style="text-decoration: none;">
    	<i class="fab fa-airbnb"></i>
    </a>
</div>
<div class="clearfix"></div>
<br><br>
<hr>
숙소 이름 : ${paymentVO.roomName}
<hr>
결제시각 : ${paymentVO.paymentTime}<br>
회원ID : ${paymentVO.memberId}<br>
회원이름 : ${paymentVO.memberName}<br>
<hr>
결제 상태 : ${paymentVO.paymentStatus}
<hr>
인원수 :${paymentVO.reservationGuest}<br> 
체크인 시간 :${paymentVO.reservationCheckin}<br> 
체크아웃 시간 :${paymentVO.reservationCheckout}<br>
금액 : ${paymentVO.reservationTotalAmount}<br>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
$(function(){
	
	var sdt = new Date("${paymentVO.reservationCheckin}");
	console.log(sdt);
	var edt = new Date();
	console.log(edt);
	var dateDiff = Math.ceil((sdt.getTime()-edt.getTime())/(1000*3600*24));
	console.log(dateDiff);

	var refundRate = 1;
	if(dateDiff > 2) { // 예약일로부터 2일 이상 남은 경우
		refundRate = 1;
	}
	else if(dateDiff == 2){ // 전날 취소일 경우
		refundRate = 0.9;
	}
	else if(dateDiff < 0) {
		refundRate = 0;
		$("#refund").hide();
	}
	else { // 당일 취소일 경우
		refundRate = 0.5;
	}
	var cancel_amount = ${paymentVO.reservationTotalAmount} * refundRate;
	$("#refund").attr("href","paymentRefund?paymentNo=${paymentVO.paymentReservationNo}&cancel_amount="+cancel_amount);
	
	if(!refundRate == 0) {
		$(".refundAmount").text("예약 취소시 금액 : "+cancel_amount);		
	}
	
	if('${paymentVO.paymentStatus}' == '취소'){
		$("#refund").hide();
	}
})
</script>
<hr>
<span class="refundAmount"></span>
<br><br>
<div class="float-right">
<a class="btn" href="${pageContext.request.contextPath}/">메인페이지로</a>
<a class="btn btn-info" href="paymentList">내 결제 리스트로</a>
<a class="btn btn-danger" id="refund">결제 취소</a>
</div>    
</div>