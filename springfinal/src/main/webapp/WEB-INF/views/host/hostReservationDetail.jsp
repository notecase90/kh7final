<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
<div class="container">
	<br>
	<h1>결제/예약 정보</h1>
	<br>
	<c:forEach var="PaymentVO" items="${ReservationList}">
	
		<div class="accordion" id="accordion2">
			<div class="float-left">
				<div class="accordion-heading pull-left">
	      		 	<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${PaymentVO.paymentReservationNo}">
	      				 <h2 class="badge badge-light" style="font-size:20px;">${PaymentVO.memberName} 회원(${PaymentVO.memberId})님의 예약</h2> 
	    		 	</a>	    		 	
	    		</div> 		
	    		<div id="collapse${PaymentVO.paymentReservationNo}" class="accordion-body collapse in">
			    	<div class="accordion-inner text-left">
			        	<span class="badge badge-info">결제일</span> 
			        	<label>${PaymentVO.paymentTime}</label><br>			        	
			        	<span class="badge badge-info">희망 체크인 시간</span> 
			        	<label>${PaymentVO.reservationCheckin}</label><br>
			        	<span class="badge badge-info">희망 체크아웃 시간</span> 
			        	<label>${PaymentVO.reservationCheckout}</label><br>
			        	<span class="badge badge-info">게스트 수</span> 
			        	<label>${PaymentVO.reservationGuest}</label><br>
			        	<span class="badge badge-primary">총 금액</span> 
			        	<label>${PaymentVO.reservationTotalAmount} 원</label><br>
			        	<span class="badge badge-primary">결제상태</span>
			        	<label>${PaymentVO.paymentStatus}</label>        	
			    	</div>
	   			</div>
   			</div>
   			<div class="float-right" style="margin-right:300px;">
	    		<a href="#" class="btn btn-primary">채팅</a></button>
	    		<a href="#" class="btn btn-danger">예약취소</a></button>
	    	</div>
	    	<div class="clearfix"></div>
	    	<br><br>	   
		</div>	
		
	</c:forEach>
	<c:if test="${empty ReservationList}">
		<h3>예약 내역이 비어있습니다.</h3>
	</c:if>
	
</div>