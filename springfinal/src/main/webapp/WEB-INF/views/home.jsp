<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="isHost" value="${not empty hostNo}"></c:set>
<c:set var="isAdmin" value="${not empty adminNo}"></c:set>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>내가 만든 홈페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/layout.css">

	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

	<style>
.carousel-control-prev-icon { background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E"); } 
.carousel-control-next-icon { background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E"); }
.main-img {
	width:100%;
	height:480px;
	background-image: url("${root}/resources/img/4.jpg");
	padding:100px;
}
.footer-img {
	width:100%;
	height:300px;
	background-image: url("${root}/resources/img/6.jpg");
	padding:20px;
}

  

	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    <script>
    $(function(){
   	 $.datepicker.setDefaults({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
   	});
   	$(".check.checkIn").datepicker({
 	   minDate: "+1D",
 	   onClose:function(selectedDate) {
 		   var curDate = $(".checkIn").datepicker("getDate");  // Date return
 		   curDate.setDate( curDate.getDate() + 1 );
 		   $(".check.checkOut").datepicker("option", "minDate", curDate);	  
 	   }
    });
    $(".check.checkOut").datepicker();
    });
    </script>

<script>
	$(function(){
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		var bir = $(".start");		
		bir.value = today;
	});
</script>


</head>
<body>
	<main>
		<header>
			<h4><a href="http://ncov.mohw.go.kr/" class="text-muted">코로나19 대응 방안에 대한 최신 정보를 확인하세요.</a></h4>
			<h4>${gongji.gongjiContent}</h4>
		</header>
		<div class="container">
			<div class="header-side">
				<div class="btn-toolbar pull-right">
				  <div class="btn-group">
				  <c:choose>
				  	<c:when test="${!isLogin}"> <!-- 비회원일때 -->
				  		<a class="btn btn-large text-white" href="${root}/member/regist">호스트 되기</a>
				  	</c:when>
					<c:otherwise>
					<c:if test="${isHost}">
						<a class="btn btn-large text-white" href="${root}/host/host-home">호스트 모드 전환</a>
					</c:if>
				  	<c:if test="${!isHost}">
				  		<a class="btn btn-large text-white" href="${root}/email/certEmail">호스트 모드 생성</a>
				  	</c:if>			
					</c:otherwise>
				  </c:choose>
				    <a class="btn text-white" href="#"><i class="fa fa-user" aria-hidden="true"></i></a>
				     <a class="btn dropdown-toggle text-white" data-toggle="dropdown" href="#">
				     	<i class="fa fa-bars" aria-hidden="true"></i>
				     </a>
				     <ul class="dropdown-menu">
				     <c:choose>
				     	<c:when test="${isLogin}">
	    					<li><a class="btn" href="${root }/member/myinfo">마이페이지</a></li>
	    					<li><a class="btn" href="${root}/member/logout">로그아웃</a></li>
	    					<li><a class="btn" href="${root}/member/wish-list">위시리스트</a></li>	    			
	    					<li><a class="btn" href="${root}/chat/main">메세지</a></li>			
				     	</c:when>
						
						<c:otherwise>
	    					<li><a class="btn" href="${root }/member/regist">회원가입</a></li>
	    					<li><a class="btn" href="${root }/member/login">로그인</a></li>
						</c:otherwise>
						
				     </c:choose>
				     
  					 </ul>
				  </div>
				</div>
			</div>
			
		
			<div class="main-img">

			<form class="form-search text-center" action="${root}/search" method="post">
<!-- 				<input type="text" class="form-control" placeholder="검색어 입력" name="keyword"> -->
				<input type="text" class="form-control start check checkIn" name="checkIn"><span class="text-light">부터</span>
				<input type="text" class="form-control end check checkOut" name="checkOut"><span class="text-light">까지</span>
			

				<input type="submit" class="btn btn-primary form-control" value="검색하기">
			</form>
			</div>
		
			<div class="go-btn text-center">
				<h2 class="text-left">숙소별 바로가기</h2>
				<div class="btn text-center">
				  <div class="btn-group">
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/아파트"><i class="fa fa-building fa-3x" aria-hidden="true"></i><span class="fa-2x">아파트</span></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/빌라"><i class="fas fa-city fa-3x" aria-hidden="true"></i><span class="fa-2x">빌라</span></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/한옥"><i class="fas fa-landmark fa-3x" aria-hidden="true"></i><span class="fa-2x">한옥</span></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/호텔"><i class="fas fa-hotel fa-3x" aria-hidden="true"></i><span class="fa-2x">호텔</span></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/게스트하우스"><i class="fas fa-home fa-3x" aria-hidden="true"></i><span class="fa-2x">게스트하우스</span></a>
				    <hr><hr>
				  </div>
				</div>
			</div>
			
			<div class="location-btn text-center">
				<h2 class="text-left">지역별 바로가기</h2>
				<div class="btn text-center">
				  <div class="btn-group">
				    <a class="btn" href="${pageContext.request.contextPath}/room/list/서울"><img src="http://placehold.it/100x100?text=서울" class="rounded"></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/list/대전"><img src="http://placehold.it/100x100?text=Daejeon" class="rounded"></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/list/제주"><img src="http://placehold.it/100x100?text=Jeju" class="rounded"></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/list/인천"><img src="http://placehold.it/100x100?text=Incheon" class="rounded"></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/list/광주"><img src="http://placehold.it/100x100?text=Gwangju" class="rounded"></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/list/부산"><img src="http://placehold.it/100x100?text=Busan" class="rounded"></a>
				    <hr><hr>
				  </div>
				</div>
			
			</div>
			
			<div class="location-event">
				<h3 class="text-center">지역별 추천 관광지</h3>
				<div id="location-event" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active text-center">
			     <img src="${root}/resources/img/5.jpg" style="width:300px;height:300px;">
			     <span>안녕하세요</span>
			     <span>내용입니다.</span>
			    </div>
			    <div class="carousel-item text-center">
			     <img src="${root}/resources/img/6.jpg" style="width:300px;height:300px;">
			     <span>안녕하세요</span>
			     <span>내용입니다.</span>
			    </div>
			    <div class="carousel-item text-center">
			      <img src="${root}/resources/img/4.jpg" style="width:300px;height:300px;">
			     <span>안녕하세요</span>
			     <span>내용입니다.</span>
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#location-event" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#location-event" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			</div>
		
		<div class="review text-center clearfix">
			<h3>여행 후기</h3>
			<div class="row-fluid">
				<div class="span4">안녕하세요</div>
				<div class="span4 offset1">안녕하세요</div>
				<div class="span4 offset2">안녕하세요</div>
			</div>
			<div class="row-fluid">
				<div class="span4">안녕하세요</div>
			</div>
		
			
		</div>
		
		</div>
		<section>
			
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>