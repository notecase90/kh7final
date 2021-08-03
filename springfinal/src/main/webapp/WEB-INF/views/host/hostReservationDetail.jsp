<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
$(function(){
	$("#reservationRefund").click(function(e){
		e.preventDefault();
		var url = $(this).attr("href");
		console.log(url);
		$("#modal").modal("show");
		$('#refund').click(function(){
			location.href = url;
		});
		$("#chat").click(function(){
			location.href = $("#chatBtn").attr("href");
		});
	});
	
	$("#back").click(function(){
		location.href="${root}/host/hostRoomList";
	});
});
</script>

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
	<br>
	<a href="${root}" style="text-decoration: none;">
    	<i class="fab fa-airbnb"></i>
    </a>
    <br><br>
	<div class="float-left">
	<h1>결제/예약 정보</h1>
	</div>
	<div class="float-right" style="margin:10px 305px 0px 0px;">
	<a id="back"><i class="fas fa-arrow-alt-circle-left fa-3x"></i></a>
	</div>
	<div class="clearfix"></div>
	<br><br>
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
	    		<a id="chatBtn" href="${root}/chat/${PaymentVO.roomName}" class="btn btn-primary">채팅</a>
	    		<c:if test="${PaymentVO.paymentStatus eq '승인'}">
	    		<a href="${root}/pay/paymentDetail?paymentNo=${PaymentVO.paymentReservationNo}" class="btn btn-danger" id="reservationRefund">예약취소</a>
	    		</c:if>
	    	</div>
	    	<div class="clearfix"></div>
	    	<br><br>	   
		</div>	
		
	</c:forEach>
	<c:if test="${empty ReservationList}">
		<h3>예약 내역이 비어있습니다.</h3>
	</c:if>
	

<div class="modal fade" id="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">해당 예약건을 취소합니다.</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>※ 해당 예약을 취소하시기 전, 이용자와 채팅을 통한 협의가 없을 경우 문제가 될 수 있습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="chat">채팅 해보기</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="refund">예약취소</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
</div>