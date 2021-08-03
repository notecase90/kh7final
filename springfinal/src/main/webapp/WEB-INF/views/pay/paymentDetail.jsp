<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> 
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="isHost" value="${not empty hostNo}"></c:set>

<!-- icon 사용을 위한 CSS 의존성 등록(font awesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	body{
	padding: 0 100px;
}
        .logo{
            width: 30%;
            left: 30px ;
            box-sizing: border-box; 
        }        
        .btn-group{
        	width: fit-content;
        	display: flex;
        	right: 30px;
        	align-items: center;
        }
        .logo-box{
            width: 100%;
             display: flex;
             justify-content: space-between;
             margin: 10px 0;
        }		
		.fa-airbnb{
			display: flex;
    		align-items: center;
    		color: #ff4567;
		}
		.fab {
		    width: 100px;
		    font-size: 35px;
		}
		.fa {
		    width: fit-content;
		    display: flex;
		    align-items: center;
		}
		.btn{
			display: flex;
   			align-items: center;
   			color: black;
    		text-decoration: none;
    		justify-content: flex-end;
    		padding: 0 15px;
		}
		.user{
			width: fit-content;
			color: black;
		}
		#name{
			font-size: 20px;
    		font-weight: 100;
    		padding-bottom: 5px;
		}
		     #footer-back-btn{
           margin-left: 48px;
       }
       #footer-next-btn{
           margin-right: 48px;
       }
       #back-btn{
            width: auto;
	    padding-top: 14px;
	    padding-bottom: 14px;
	    padding-left: 24px;
	    padding-right: 24px;
	    background: #db0b64;
	    color: white;
       }

       #next-btn{
           width: auto;
	    padding-top: 14px;
	    padding-bottom: 14px;
	    padding-left: 24px;
	    padding-right: 24px;
	    background: black;
	    color: white;
       }
       .footer-btn{
            position: relative;
            line-height: 20px;
           font-weight: 600;
           border-radius: 8px;
           outline: none;
           font-size: 16px;
           display: inline-block;
           text-align: center;
           border: none;
       }
       .footer{
	       padding-top: 10px;
	       display: flex;
	    	justify-content: space-between;
       }
       .refundAmount{
       	color: red;
    font-weight: 200;
    font-size: 13px;
       }
       #date{
       	font-size: 17px;
    font-weight: 800;
    padding: 3 0;
       }
       #info{
       
       }
</style>

<div class="logo-box">
	<div class="logo">
            <a href="${root}" style="text-decoration: none;">
                <i class="fab fa-airbnb"></i>
            </a>
	</div>

	<div class="btn-group">
		<c:choose>
			<c:when test="${!isLogin}"> <!-- 비회원일때 -->
				<a class="btn" href="${root}/member/regist">호스트 모드 생성</a>
			</c:when>
		<c:otherwise>
			<c:if test="${isHost}">
				<a class="btn" href="${root}/host/host-home">호스트 모드 전환</a>
			</c:if>
			<c:if test="${!isHost}">
				<a class="btn" href="${root}/email/certEmail">호스트 모드 생성</a>
			</c:if>			
		</c:otherwise>
		</c:choose>
		<a class="user" href="#"><i class="fa fa-user" aria-hidden="true"></i></a>				     
	</div>
</div>
    
<h1>결제 상세 정보</h1>
<div class="all">
<div id="name">숙소명 : ${paymentVO.roomName}
</div>
<hr>
<div id="info">
	결제 일자 : <fmt:formatDate value="${paymentVO.paymentTime}" pattern="yyyy년 MM월 dd일"/><br>
	결제 상태 : ${paymentVO.paymentStatus}
</div>
<c:if test="${paymentVO.roomHostNo eq SessionHostNo}">
회원ID : ${paymentVO.memberId}<br>
회원이름 : ${paymentVO.memberName}<br>
</c:if>


<hr>
인원수 : ${paymentVO.reservationGuest}<br> 
<div id="date">
	체크인 <fmt:formatDate value="${paymentVO.reservationCheckin}" pattern="yyyy년 MM월 dd일"/>  - 
	체크아웃  <fmt:formatDate value="${paymentVO.reservationCheckout}" pattern="yyyy년 MM월 dd일"/><br>
</div>
결제금액 : ${paymentVO.reservationTotalAmount}원<br>
</div>

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
	
	if(!${paymentVO.paymentStatus == '취소'}){
		var cancel_amount = ${paymentVO.reservationTotalAmount} * refundRate;
		$(".refund").attr("href","paymentRefund?paymentNo=${paymentVO.paymentReservationNo}&cancel_amount="+cancel_amount);
		$(".refundAmount").text("예약 취소시 환불금액 : "+cancel_amount+"원");
	}
	
})
</script>
<hr>
<div class="refundAmount"></div>

<div class="footer">
	<c:if test="${paymentVO.paymentStatus == '취소'}">
		<button class="footer-btn"id="next-btn"><a class="#" style="text-decoration: none;color: white;">취소 완료</a></button>
	</c:if>
	<c:if test="${paymentVO.paymentStatus != '취소'}">
		<button class="footer-btn"id="next-btn"><a class="refund" style="text-decoration: none;color: white;">결제 취소</a></button>
	</c:if>
	<button class="footer-btn"id="back-btn"><a href="paymentList" style="text-decoration: none;color: white;">나의 결제 목록</a></button>
</div>

