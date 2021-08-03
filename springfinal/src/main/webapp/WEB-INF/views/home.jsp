<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<head>
	<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
  <c:set var="isLogin" value="${not empty memberNo}"></c:set>
  <c:set var="isHost" value="${not empty hostNo}"></c:set>
  <c:set var="isAdmin" value="${not empty adminNo}"></c:set>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숙소, 체험, 장소를 모두 한 곳에서 - 에어비앤비</title>
  <!-- favicon -->
  <link rel="shortcut icon" href="img/airbnb.ico" type="image/x-icon">
  <!-- 폰트오썸 아이콘 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
    integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
    crossorigin="anonymous" />
  <link rel="stylesheet" href="${root}/resources/css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
	<link rel="stylesheet" type="menu.css">
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
.logo{
	style:red;
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
  <!-- 메인페이지 시작 -->
  <header id="main-page">
    <!-- 네비게이션 메뉴바 -->
    
    <nav class="main-navi">
        
      <div class="logo">
        <a href="${root}">
          <i class="fab fa-airbnb"></i>airbnb
      
        </a>
      </div>
      <div class="search">
        <div><h4><a href="#" class="text-muted">코로나19 대응 방안에 대한 최신 정보를 확인하세요.</a></h4></div>
        <div><h4>${gongji.gongjiContent}</h4></div>
      </div>
      <div class="menu">
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
      </div>
      
    </nav>
    
    <!-- 글자박스 -->
 	
			<div class="main-img">

			<form class="form-search text-center" action="${root}/search" method="post">
<!-- 				<input type="text" class="form-control" placeholder="검색어 입력" name="keyword"> -->
				<input type="text" class="form-control start check checkIn" name="checkIn"><span class="text-light">부터</span>
				<input type="text" class="form-control end check checkOut" name="checkOut"><span class="text-light">까지</span>
			

				<input type="submit" class="btn btn-primary form-control" value="검색하기">
			</form>
			</div>


  <!-- 첫번째페이지시작 -->
  
    <!-- 카드박스 -->
    
      <a class="btn" href="${pageContext.request.contextPath}/room/search-type/아파트"><i class="fa fa-building fa-3x" aria-hidden="true"></i><span class="fa-2x">아파트</span></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/빌라"><i class="fas fa-city fa-3x" aria-hidden="true"></i><span class="fa-2x">빌라</span></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/한옥"><i class="fas fa-landmark fa-3x" aria-hidden="true"></i><span class="fa-2x">한옥</span></a>
				    <a class="btn" href="${pageContext.request.contextPath}/room/search-type/호텔"><i class="fas fa-hotel fa-3x" aria-hidden="true"></i><span class="fa-2x">호텔</span></a>
				  
    
  
 

  <!--두번째 페이지 시작 -->
  <section id="second_sec">
    
      <a class="btn" href="${pageContext.request.contextPath}/room/list/서울"><i class="fas fa-place-of-worship fa-3x" aria-hidden="true"></i><span class="fa-2x">서울</span></a>
      <a class="btn" href="${pageContext.request.contextPath}/room/list/부산"><i class="fas fa-water fa-3x" aria-hidden="true"></i><span class="fa-2x">부산</span></a>
      <a class="btn" href="${pageContext.request.contextPath}/room/list/제주"><i class="fas fa-piggy-bank fa-3x" aria-hidden="true"></i><span class="fa-2x">제주</span></a>
      <a class="btn" href="${pageContext.request.contextPath}/room/list/인천"><i class="fas fa-campground fa-3x" aria-hidden="true"></i><span class="fa-2x">가평</span></a>
     
  
  </section>


  <!-- 세번째 페이지 시작-->
  <section id="third_sec">
   
      
      <!-- 체험선택 사진 -->
      
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

     

  
  </section>

  <!-- 네번째 페이지 시작 -->
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

  </section>

  <!-- 마지막 -->
  <footer>
    <table>
      <tr>
        <th>소개</th>
        <th>커뮤니티</th>
        <th>호스팅하기</th>
        <th>에어비엔비 지원</th>
      </tr>

      <tr>
        <td>에어비앤비 이용방법</td>
        <td>다양성 및 소속감</td>
        <td>숙소호스팅</td>
        <td>에어비앤비의 코로나 19대응 방안</td>
      </tr>

      <tr>
        <td>뉴스룸</td>
        <td>접근성</td>
        <td>온라인 체험 호스팅하기</td>
        <td>도움말 센터</td>
      </tr>

      <tr>
        <td>투자자 정보</td>
        <td>에어비앤비 어소시에이트</td>
        <td>체험 호스팅하기</td>
        <td>예약 취소 옵션</td>
      </tr>

      <tr>
        <td>에어비앤비 플러스</td>
        <td>구호 인력을 위한 숙소</td>
        <td>책임감있는 호스팅</td>
        <td>에어비앤비 이웃 민원 지원</td>
      </tr>

      <tr>
        <td>에어비앤비Luxe</td>
        <td>친구 초대하기</td>
        <td>자료센터</td>
        <td>신뢰와안전</td>
      </tr>

      <tr>
        <td>호텔투나잇</td>
        <td>Airbnb.org</td>
        <td>커뮤니티 센터</td>
      </tr>

      <tr>
        <td>에어비앤비 비즈니스 프로그램</td>
      </tr>

      <tr>
        <td>올림픽</td>
      </tr>

      <tr>
        <td>채용정보</td>
      </tr>

      <tr> </tr>
    </table>
    <div class="last_footer">
      <div>
        <span>© 2021 Airbnb, Inc. All rights reserved </span>
        <span>·</span>
        <span class="here"> 개인정보처리 방침 </span>
        <span>·</span>
        <span class="here"> 이용약관 </span>
        <span>·</span>
        <span class="here"> 사이트맵 </span>
        <span>·</span>
        <span class="here"> 한국의 변경된 환불 정책 </span>
        <span>·</span>
        <span class="here"> 회사 세부정보 </span>
      </div>

      <div class="icons">
        <div>
          <button class="button">
            <i class="fas fa-globe"></i>
            <span>한국어(KR)</span>
          </button>
          <button class="button">
            <i class="fas fa-won-sign"></i>
            <span>KRW</span>
          </button>
        </div>
        <div class="items">
          <i class="fab fa-facebook-f"></i>
          <i class="fab fa-twitter"></i>
          <i class="fab fa-instagram-square"></i>
          <i class="fas fa-blog"></i>
          <i class="fab fa-microblog"></i>
        </div>
      </div>
    </div>
  </footer>
</body>

</html>
		<section>
			
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>