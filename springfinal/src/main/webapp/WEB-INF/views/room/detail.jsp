<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isHost" value="${not empty hostNo}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- icon 사용을 위한 CSS 의존성 등록(font awesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="${root}/resources/css/room/detail.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script>
        $(function(){
            //좋아요가 선택되어 있는지를 먼저 비동기 통신으로 확인 --> 초기 상태를 설정
            
          	var memberNo = ${memberNo};
          	var roomNo = ${roomDto.roomNo};
            //그 다음에 누르면 어떻게 할지 이벤트 등을 설정
            
         
            $.ajax({
                url:"${pageContext.request.contextPath}/wish-check",
                method :"get",
                data : { 
                        roomNo : roomNo, memberNo : memberNo
                       },
                success : function(resp){
                    console.log("체크");
                 
                    	
                    
                    if(resp){//값이 있을경우					
                        $(".nowish-btn").show();//꽉찬하트를 보여준다
                        $(".wish-btn").hide();
                    }		    
                    else{
                        $(".wish-btn").show();
                        $(".nowish-btn").hide();
                    }
                  
                }
            });
            		
                        $(".nowish-btn").click(function(){//꽉찬하트 클릭시 function
                            console.log("삭제2");
                            $.ajax({
                                
                                url :"${pageContext.request.contextPath}/wish-delete",
                                method : "get",
                                data : {
                                        roomNo : roomNo, memberNo : memberNo
                                       },
                                       
                                success : function(resp){
                                    console.log("삭제1");
                                    $(".wish-btn").show();//성공시 꽉찬하트를 숨기고
                                    $(".nowish-btn").hide();//빈하트를 보여준다
                                }
                            });
                            
                        });
                        
                        $(".wish-btn").click(function(){	
                            console.log("좋아요");
                            $.ajax({
                                url :"${pageContext.request.contextPath}/wish-insert",
                                method : "get",				
                                data : {
                                        roomNo : roomNo, memberNo :memberNo
                                       },
                                       
                                success : function(resp){
                                    $(".wish-btn").hide();
                                    $(".nowish-btn").show();
                                }
                            });
                            });
           
                
            
                
            });
            
        
    </script>

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

<div>
	<div class="title" style="display: flex;align-items: center;">
		${roomDto.roomName}
		<div>
        <c:choose>
        	<c:when test="${!isLogin}">
		        <i class="wish-btn  far fa-heart "  data-roomNo="${roomDto.roomNo}"></i>
		        <!--빈하트 -->
            </c:when>
            <c:otherwise>            
		        <i class="nowish-btn fas fa-heart"  data-roomNo="${roomDto.roomNo}"></i>
		        <!-- 꽉찬하트 -->
        	</c:otherwise>
        </c:choose>
  </div>
	</div>
	<div>최대 인원  ${roomDto.roomCapa}명 · 침실 ${infacilityDto.bedCount}개 · 욕실 ${infacilityDto.bathCount}개 · 발코니 ${infacilityDto.balconyCount}개</div>
	<hr>
	
<div class="roomImage">
	<h2 class="title">숙소 이미지</h2>
	<div id="roomImage" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active text-center">
				<img class="preview" src="${root}/data/room/download/${roomPicDto[0].roomPicNo}">
			</div>
			<c:forEach var="roomPicDto" items="${roomPicDto}" begin="1">
			<div class="carousel-item text-center">
			     <img class="preview" src="${root}/data/room/download/${roomPicDto.roomPicNo}">  
			</div>
			</c:forEach>
			  <a class="carousel-control-prev" href="#roomImage" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#roomImage" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
	</div>
</div>
</div>
<hr>
<div class="test-box">
	<div class="content-box">
		<div class="content">
			<i class="${roomTypeVO.allTypeIcon}"></i>
			${roomTypeVO.allTypeName}
		</div>
		<div class="content">
			${roomDto.roomIntro}
		</div>
		<div class="content">
			${roomDto.roomAdd}
		</div>
		<div class="content">
			체크인 : ${roomDto.roomIn}
		</div>
		<div class="content">
			체크아웃 : ${roomDto.roomOut}
		</div>
	</div>
	
	<c:set var="RoomHostNo" value="${roomDto.roomHostNo}"></c:set>  <!-- 세션의 hostNo와 숙소페이지의 hostNo가 같으면 예약창을 감춘다. -->
	<c:set var="SessionHostNo" value="${hostNo}"></c:set>
	<c:set var="memberNo" value="${memberNo}"></c:set>
	<c:if test="${RoomHostNo ne SessionHostNo || not empty memberNo}">
	<!-- 예약 -->
	<div class="reservation">
		<label>₩${roomPriceDto.dayPrice} / 박</label>
			<form action="${root}/room/detail" method="post">
				<input type="hidden" name="reservationRoomNo" value="${roomDto.roomNo}">
				<div class="check">
					<label>체크인 </label><input type="text" class="check checkIn" name="reservationCheckin" readonly>
				</div>
				<div class="check">
					<label>체크아웃 </label><input type="text" class="check checkOut" name="reservationCheckout" readonly>
				</div>
				<div class="two" style="margin-right: 16px;margin-bottom: 2px;">
					<label style="margin-bottom: 0;">인원 </label><input type="number" class="guest" name="reservationGuest" min="1" value="1">
				</div>
				<div class="two">
					<label style="margin-bottom: 0;">총 금액 </label><input type="text" class="totalAmount" name="reservationTotalAmount" readonly> 원<br>
				</div>
				<div class="two" style="margin-top: 15px;margin-right: 16px;">
					<input type="submit" value="예약하기" id="submit"> 
				</div>
			</form>
	</div>
	</c:if>
</div>

</div>

<c:if test="${RoomHostNo eq SessionHostNo}">
<a href="${root}/room/delete?roomNo=${roomDto.roomNo}">삭제</a>
<a href="${root}/room/edit?roomNo=${roomDto.roomNo}">수정</a>
</c:if>
<c:if test="${isLogin && RoomHostNo ne SessionHostNo && reservationDto.reservationMemberNo eq memberNo}">
<a href="${root}/review/insert?roomNo=${roomDto.roomNo}">리뷰쓰기</a>
</c:if>
<hr>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1038b1ced14e22e17b2cd601ec877523&libraries=services"></script>

<script>
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch('${roomDto.roomAdd}', function(result, status) {
  
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
					numOfRows : 5,
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
						$(xmlData).each(function(){					
							contentStr += "<div class='test3'><img class='thumnail' src="+$(this).find("firstimage").text()+">"+"<div class='text'>"+$(this).find("title").text()+"</div>"+"</div>";
						});
						$(".test").append(contentStr);
					}
				}
			});	
        })
     }
});
</script>

<div class="title" style="margin-bottom: 20px">주변 관광 안내</div>
<div class="test"></div>


<hr>

<div class="title">숙소내 편의시설</div><br>
<div class="option-box">
	<c:forEach var="facilityVO" items="${facilityList}">
		<div class="option">
			${facilityVO.optionName}
			<i class="${facilityVO.optionIcon}"></i>
		</div>
	</c:forEach>
</div>
<hr>


<div class="title" style="margin-bottom: 5px;">후기</div>
<div class="review-list">
	<c:forEach var="reviewVo" items="${reviewVo}">
		<div class="review-box">
			<div id="name">
				${reviewVo.memberName}
			</div>
			<div id="star">
				<c:if test="${reviewVo.reviewStar== 1}">
					<i style="color: darkblue;padding: 3px 0;"class="fas fa-star"></i>
				</c:if>
				<c:if test="${reviewVo.reviewStar== 2}">
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
				</c:if>
				<c:if test="${reviewVo.reviewStar== 3}">
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
				</c:if>
				<c:if test="${reviewVo.reviewStar== 4}">
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
				</c:if>
				<c:if test="${reviewVo.reviewStar== 5}">
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
					<i style="color: darkblue;"class="fas fa-star"></i>
				</c:if>
			</div>
			<div id="date">${reviewVo.reviewDate}</div>
			
			<div id="cotent">
			${reviewVo.reviewContent}
			<c:if test="${reviewVo.reviewMember eq memberNo}">
				<a class="mine"href="${root}/review/edit?reviewNo=${reviewVo.reviewNo}">수정</a>
				<a class="mine"href="${root}/review/delete?reviewNo=${reviewVo.reviewNo}">삭제</a>				
			</c:if>
			</div>
		</div>

	</c:forEach>
</div>

<hr>

<div>
	<div class="title" style="padding-bottom: 15px;">숙소주소</div>
		<div style="padding-bottom: 15px;">${roomDto.roomAdd}</div>
	<div id="map" style="width:100%;height:350px;margin-bottom: 30px;"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1038b1ced14e22e17b2cd601ec877523&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  
//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var imageSrc = "${root}/resources/img/home.png", // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(59, 59), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
//주소로 좌표를 검색합니다
geocoder.addressSearch('${roomDto.roomAdd}', function(result, status) {
// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 마커가 표시될 위치입니다 
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords,
        image: markerImage
    });
    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
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
          
	
	
	$(".check.checkOut,.guest").on("change",function(){
		var checkIn = new Date($(".checkIn").val());
		var checkOut = new Date($(".checkOut").val());
		var dif = (checkOut - checkIn) / 1000 / 60 / 60 / 24;
		var guest = $(".guest").val();
		var totalAmount = ${roomPriceDto.dayPrice} * dif * guest;
		if(!isNaN(totalAmount)){
			$(".totalAmount").val("");
			$(".totalAmount").val(totalAmount);			
		}
	});
});
</script>

<hr>

<div class="title">
<i class="fas fa-crown" style="color: #ff385c;"></i>
호스트 : ${hostVo.memberName}님</div>


	<p id="join">
		가입일 : 
		<fmt:formatDate value="${hostVo.hostJoin}" pattern="yyyy년 MM월 dd일"/> 
	</p>
<div class="host-box">	
	<div class="host-info">
		<div style="font-weight: bold;">호스트님의 소개한마디</div>
		<div>
			${hostVo.hostIntro}
		</div>
	</div>


	<div class="a-box">
		<a href="${pageContext.request.contextPath}/chat/${roomDto.roomName}" id="contact">호스트에게 연락하기</a>
	</div>

</div>
