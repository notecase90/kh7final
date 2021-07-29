<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<h1>결제 상세 정보</h1>
<hr>
결제 상태 : ${paymentVO.paymentStatus}
<hr>
결제시각 : ${paymentVO.paymentTime}<br>
회원ID : ${paymentVO.memberId}<br>
회원이름 : ${paymentVO.memberName}<br>
<hr>
숙소 이름 : ${paymentVO.roomName}
호스트 번호 : ${paymentVO.roomHostNo}
<hr>
인원수 :${paymentVO.reservationGuest}<br> 
체크인 시간 :${paymentVO.reservationCheckin}<br> 
체크아웃 시간 :${paymentVO.reservationCheckout}<br>
금액 : ${paymentVO.reservationTotalAmount}<br>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){
	
	var sdt = new Date("${paymentVO.reservationCheckin}");
// 	console.log(sdt);
	var edt = new Date();
// 	console.log(edt);
	var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));
	console.log(dateDiff);

	var refundRate = 1;
	if(dateDiff > 2) { // 예약일로부터 2일 이상 남은 경우
		refundRate = 1;
	}
	else if(dateDiff == 2){ // 전날 취소일 경우
		refundRate = 0.9;
	}
	else { // 당일 취소일 경우
		refundRate = 0.5;
	}
	
	var cancel_amount = ${paymentVO.reservationTotalAmount} * refundRate;
	$(".refund").attr("href","paymentRefund?paymentNo=${paymentVO.paymentReservationNo}&cancel_amount="+cancel_amount);
	$(".refundAmount").text("예약 취소시 금액 : "+cancel_amount);
})
</script>
<hr>
<span class="refundAmount"></span>

<button><a href="${pageContext.request.contextPath}/">메인페이지로</a></button>
<button><a href="paymentList">내 결제 리스트로</a></button>
<button><a class="refund">결제 취소</a></button>