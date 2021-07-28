<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>결제가 취소되었습니다.</h1>
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
<hr>
결제 상태 : ${paymentVO.paymentStatus}