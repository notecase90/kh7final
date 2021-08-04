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
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/style.css">
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
    <script src="${root}/resources/js/location.js"></script>
    
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1038b1ced14e22e17b2cd601ec877523&libraries=services"></script>

<script>
$(function(){
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch('강원도', function(result, status) {
  
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        console.log(result[0].x);
        console.log(result[0].y);
        
        var key = "B4XmQQunYeblIH0aCEJgMU3xVZBMSMmfGNEyrgw3yW36SPd7mOmsU1W2IEmYwjaHiazJwtEfsdQgad0XKLMrkA==";
        
        $(function(){
	        $.ajax({
				url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList",
				data:{
					ServiceKey : key,
					numOfRows : 3,
					pageNo : 1,
					MobileOS : "ETC",
					MobileApp : "AppTest",
					arrange : "A",
					contentTypeId : 15,
					mapX : result[0].x,
					mapY : result[0].y,
					radius : 2000,
					listYN : "Y"	
				},
				type:"get",
				dataType:"xml",
				success:function(resp){
					var xmlData = $(resp).find("item");
					
					var listLength = xmlData.length;
					if(listLength) {
						var contentStr = "";
						var contentImgUrl = "";
						$(xmlData).each(function(index,data){		
							contentStr = "<img class='img-responsive img-rounded' src='"+$(this).find("firstimage").text()+"' style='width:300px;height:300px;'><br><br>"+"<h3>"+$(this).find("title").text()+"</h3>"+"<span class='text'>"+$(this).find("addr1").text()+"</span><br><br>";
// 							$("#carousel"+[index]).remove();
							$("#carousel"+[index]).append(contentStr);
							console.log([index]+2);
							
						});
						
					}
				}
			});	
        })
        
        
        
     }
});
});
</script>
</head>
<body>
	<main>
		<header>
			<h4><a href="#" class="text-muted">코로나19 대응 방안에 대한 최신 정보를 확인하세요.</a></h4>
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
	    					<li><a class="btn" href="${root}/pay/paymentList">나의 결제내역</a>
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
			</div><br><br>
			
	 <div class="text-center">
	  <a class="btn" href="${pageContext.request.contextPath}/room/search-type/아파트"><i class="fa fa-building fa-3x" aria-hidden="true"></i><span class="fa-2x">아파트</span></a>
	  <a class="btn" href="${pageContext.request.contextPath}/room/search-type/빌라"><i class="fas fa-city fa-3x" aria-hidden="true"></i><span class="fa-2x">빌라</span></a>
	  <a class="btn" href="${pageContext.request.contextPath}/room/search-type/한옥"><i class="fas fa-landmark fa-3x" aria-hidden="true"></i><span class="fa-2x">한옥</span></a>
	  <a class="btn" href="${pageContext.request.contextPath}/room/search-type/호텔"><i class="fas fa-hotel fa-3x" aria-hidden="true"></i><span class="fa-2x">호텔</span></a>
	</div><br><br>
    
  
 

  <!--두번째 페이지 시작 -->
  <div class="text-center">
    
      <a class="btn" href="${pageContext.request.contextPath}/room/list/서울"><i class="fas fa-place-of-worship fa-3x" aria-hidden="true"></i><span class="fa-2x">서울</span></a>
      <a class="btn" href="${pageContext.request.contextPath}/room/list/부산"><i class="fas fa-water fa-3x" aria-hidden="true"></i><span class="fa-2x">부산</span></a>
      <a class="btn" href="${pageContext.request.contextPath}/room/list/제주"><i class="fas fa-piggy-bank fa-3x" aria-hidden="true"></i><span class="fa-2x">제주</span></a>
      <a class="btn" href="${pageContext.request.contextPath}/room/list/인천"><i class="fas fa-campground fa-3x" aria-hidden="true"></i><span class="fa-2x">가평</span></a>
     
  </div>
  
			
		<div class="location-event">
			<br><br>
			<h3 class="text-center">지역별 추천 관광지</h3>
			<br>
			<div id="location-event1" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active text-center" id="carousel0">
			    </div>
			    <div class="carousel-item text-center" id="carousel1">
			    </div>
			    <div class="carousel-item text-center" id="carousel2">
			    </div>
			    <div class="carousel-item text-center" id="carousel01">
			    </div>
			    <div class="carousel-item text-center" id="carousel11">
			    </div>
			    <div class="carousel-item text-center" id="carousel21">
			    </div>
			    <div class="carousel-item text-center" id="carousel02">
			    </div>
			    <div class="carousel-item text-center" id="carousel12">
			    </div>
			    <div class="carousel-item text-center" id="carousel22">
			    </div>
			    
			  </div>
			  <a class="carousel-control-prev" href="#location-event1" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#location-event1" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>					
		</div>
			
			
		
	<section id="fourth_sec">
    <div class="fourth_box">
      <!-- 호스트되기 타이틀 -->
      <div class="mini_title">수백만명에 이르는 에어비엔비 호스트 커뮤니티 일원이 되어보세요.</div>
      <!-- 호스트되기 사진 -->
      <div class="fourth_card_box">

        <div class="fourth_card">
          <div class="fourth_img_box1"></div>
          <div class="card_title">숙소 호스트되기</div>
        </div>

        <div class="fourth_card">
          <div class="fourth_img_box2"></div>
          <div class="card_title">온라인 체험 호스팅하기</div>
        </div>

        <div class="fourth_card">
          <div class="fourth_img_box3"></div>
          <div class="card_title">체험 호스팅하기</div>
        </div>

		</div>
	</div>
  </section>
		
		</div>
		<section>
			
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>