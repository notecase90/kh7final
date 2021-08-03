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
		.all{
			display: flex;
    		justify-content: space-between;
    		font-weight: 200;
    		font-size: 18px;
    		padding-top: 15px;
		}
		.next-btn{
			width: auto;
padding-top: 14px;
padding-bottom: 14px;
padding-left: 24px;
padding-right: 24px;
background: #db0b64;
color: white;
		}
		#next-btn{
			position: relative;
line-height: 20px;
font-weight: 600;
border-radius: 8px;
outline: none;
font-size: 16px;
display: inline-block;
text-align: center;
border: none;
text-align: center;
		}
		#part1{
			padding-left: 50px;
		}
		#part2{
			padding-right: 50px;
		}
		.bold{
			font-weight: 800;
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
<h1>예약확인페이지</h1>  <!-- 숙소 detail페이지에서 결제 시 넘어오는 페이지 -->
<hr>
<div class="all">
	<div id="part1">

	숙소명 : ${ReservationVO.roomName}<br>
	숙소소개 : ${ReservationVO.roomIntro}<br>
	숙소주소 : ${ReservationVO.roomAdd}<br>
	최대수용인원 : ${ReservationVO.roomCapa}<br>
	<div class="bold">
	숙소 체크인 시간 : ${ReservationVO.roomIn}<br>
	숙소 체크아웃 시간: ${ReservationVO.roomOut}
	</div>
</div>


<div id="part2">

	예약번호 : ${ReservationVO.reservationNo}<br>
	예약일 : ${ReservationVO.reservationDate}<br>
	<div class="bold">
	체크인 : ${ReservationVO.reservationCheckin}<br>
	체크아웃 : ${ReservationVO.reservationCheckout}
	</div>
	게스트 수 : ${ReservationVO.reservationGuest}<br>
	금액 : ${ReservationVO.reservationTotalAmount}원 (1박기준)<br>


</div>
</div>
<hr style="margin: 20 0;">

<form action="${root}/pay/confirm" method="post" style="display: flex;
    justify-content: flex-end;">
	<input type="hidden" name="partner_order_id" value="${ReservationVO.reservationNo}">
	<input type="hidden" name="partner_user_id" value="${ReservationVO.reservationMemberNo}">
	<input type="hidden" name="item_name" value="${ReservationVO.roomName}">
	<input type="hidden" name="quantity" value="1">
	<input type="hidden" name="total_amount" value="${ReservationVO.reservationTotalAmount}">
	<input type="hidden" name="tax_free_amount" value="0">
	<button type="submit" class="next-btn" id="next-btn">카카오페이 결제</button>
</form>