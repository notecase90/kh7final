<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>내 결제 내역</h1>
<c:forEach var="paymentVO" items="${paymentList}">
		<a href="paymentDetail?paymentNo=${paymentVO.paymentReservationNo}">
	숙소명 : ${paymentVO.roomName}
		</a><br><br>
</c:forEach>