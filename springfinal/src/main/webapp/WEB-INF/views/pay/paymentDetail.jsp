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

<button><a href="${pageContext.request.contextPath}/">메인페이지로</a></button>
<button><a href="paymentList">내 결제 리스트로</a></button>
<button><a href="paymentRefund?paymentNo=${paymentVO.paymentReservationNo}&cancel_amount=${paymentVO.reservationTotalAmount}">결제 취소</a></button>