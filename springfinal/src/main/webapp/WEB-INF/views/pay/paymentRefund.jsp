<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="isHost" value="${not empty hostNo}"></c:set>

   <!-- icon 사용을 위한 CSS 의존성 등록(font awesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
	body{
	padding: 0 60px;
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

<h1>결제가 취소되었습니다.</h1>
결제시각 : ${paymentVO.paymentTime}<br>
회원ID : ${paymentVO.memberId}<br>
회원이름 : ${paymentVO.memberName}<br>
<hr>
숙소명 : ${paymentVO.roomName}
<hr>
인원수 : ${paymentVO.reservationGuest}<br> 
체크인 시간 :${paymentVO.reservationCheckin}<br> 
체크아웃 시간 :${paymentVO.reservationCheckout}<br>
금액 : ${paymentVO.reservationTotalAmount}<br>
<hr>
결제 상태 : ${paymentVO.paymentStatus}