<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="isHost" value="${not empty hostNo}"></c:set>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- bootstrap 이용을 위한 CSS의존성 등록-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="undefined" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
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
		.title{
			text-decoration: none;
		    font-size: 20px;
		    font-weight: 600;
		    color: black;
		}
		.title:hover{
			color: #db0b64;
		}
		.box{
			padding: 10px;
		}
		.btn-box{
	display: flex;
    justify-content: space-between;
}
#list-btn{
	width: auto;
padding-top: 14px;
padding-bottom: 14px;
padding-left: 24px;
padding-right: 24px;
background: #db0b64;
color: white;
}
.list-btn{
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
#no{
	font-size: 20;
    text-align: center;
    font-weight: 100;
    padding-bottom: 5px;
    
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

<div class="container-fluid">

        <div class="jumbotron text-center mt-3">
            <h1 style="word-break: keep-all;">나의 결제내역을 확인해보세요!</h1>
            <p>숙소명을 클릭하면 자세한 내역이 나옵니다</p>
        </div>
            
	<div class="row mt-5">
		<div class="col-md-6 offset-sm-3">

			<div class="paymentbox">
				<c:forEach var="paymentVO" items="${paymentList}">
					<div class="box">
						<a href="paymentDetail?paymentNo=${paymentVO.paymentReservationNo}" class="title">
					${paymentVO.roomName}
						</a><br>
						<fmt:formatDate value="${paymentVO.paymentTime}" pattern="yyyy년 MM월 dd일"/> 						
					</div>		
				</c:forEach>
				<c:if test="${empty paymentList}">
					<div id="no">아직 예약내역이 없습니다.
						<button type="button" id="list-btn" class="list-btn">
							<a href="${root}/room/list"style="text-decoration: none;color: white;">숙소 둘러보기</a>
						</button>
					</div>	
				</c:if>
			</div>
	  </div>
	</div>
</div>