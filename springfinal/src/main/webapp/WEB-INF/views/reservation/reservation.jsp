<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>예약확인페이지</h1>  <!-- 숙소 detail페이지에서 결제 시 넘어오는 페이지 -->

<ul>
	<li>호스트 번호 : ${ReservationVO.roomHostNo}</li>
	<li>숙소명 : ${ReservationVO.roomName}</li>
	<li>숙소소개 : ${ReservationVO.roomIntro}</li>
	<li>숙소주소 : ${ReservationVO.roomAdd}</li>
	<li>수용인원 : ${ReservationVO.roomCapa}</li>
	<li>숙소 체크인 : ${ReservationVO.roomIn}</li>
	<li>숙소 체크아웃 : ${ReservationVO.roomOut}</li>
</ul>
<hr>
<ul>
	<li>예약번호 : ${ReservationVO.reservationNo}</li>
	<li>예약회원번호 : ${ReservationVO.reservationMemberNo}</li>
	<li>예약일 : ${ReservationVO.reservationDate}</li>
	<li>체크인 : ${ReservationVO.reservationCheckin}</li>
	<li>체크아웃 : ${ReservationVO.reservationCheckout}</li>
	<li>게스트 수 : ${ReservationVO.reservationGuest}</li>
	<li>총 금액 : ${ReservationVO.reservationTotalAmount}원 (1박기준)</li>
</ul>
<hr>

<form action="${pageContext.request.contextPath}/pay/confirm" method="post">
	<input type="hidden" name="partner_order_id" value="${ReservationVO.reservationNo}">
	<input type="hidden" name="partner_user_id" value="${ReservationVO.reservationMemberNo}">
	<input type="hidden" name="item_name" value="${ReservationVO.roomName}">
	<input type="hidden" name="quantity" value="1">
	<input type="hidden" name="total_amount" value="${ReservationVO.reservationTotalAmount}">
	<input type="hidden" name="tax_free_amount" value="0">
	<input type="submit" value="카카오페이 결제">
</form>