<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- icon 사용을 위한 CSS 의존성 등록(font awesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
        .fa-heart {
           color:red;
           cursor: pointer;
         }
    </style>
    <script>
        $(function(){
            //좋아요가 선택되어 있는지를 먼저 비동기 통신으로 확인 --> 초기 상태를 설정
            
            
            //그 다음에 누르면 어떻게 할지 이벤트 등을 설정
            $.ajax({
                url:"${pageContext.request.contextPath}/wish-check",
                method :"get",
                data : { 
                        roomNo : ${roomDto.roomNo}, memberNo : ${memberNo}
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
                                        roomNo : ${roomDto.roomNo}, memberNo : ${memberNo}
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
                                        roomNo : ${roomDto.roomNo}, memberNo : ${memberNo}
                                       },
                                       
                                success : function(resp){
                                    $(".wish-btn").hide();
                                    $(".nowish-btn").show();
                                }
                            });
                            });
            
                
            
                
            });
            
        
    </script>
<style>
	.title{
		font-size: 25px;
		font-weight: bold;
	}
	.content-box{
		display: flex;
    	flex-direction: column;
	}
	.content{
		padding: 5px;
	}
</style>
 <div>
        <!-- 체크확인 -->
        <i class="wish-btn  far fa-heart fa-3x"  data-roomNo="${roomDto.roomNo}"></i>
        <!--빈하트 -->
                        
        <i class="nowish-btn fas fa-heart fa-3x"  data-roomNo="${roomDto.roomNo}"></i>
        <!-- 꽉찬하트 -->
  </div>


<div>
	<div class="title">
		${roomDto.roomName}
	</div>
	<div>최대 인원  ${roomDto.roomCapa}명 · 침실 ${infacilityDto.bedCount}개 · 욕실 ${infacilityDto.bathCount}개 · 발코니 ${infacilityDto.balconyCount}개</div>
	<hr>
	
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
		<div class="content">
			숙소가 : ${roomPriceDto.dayPrice}원 (1박기준)
		</div>
	</div>
</div>


<a href="${root}/room/delete?roomNo=${roomDto.roomNo}">삭제</a>
<a href="${root}/room/edit?roomNo=${roomDto.roomNo}">수정</a>
<a href="${root}/review/insert?roomNo=${roomDto.roomNo}">리뷰쓰기</a>
<a href="${root}/review/onelist/${roomDto.roomNo}">리뷰보기</a>

<hr>


<style>
body{
	padding: 0 60px;
}
.thumnail {
	width:250px;
	height:250px;
}
.test{
	display: flex;
	flex-wrap: wrap;
}
.test3{
	width: 33%;
	display: flex;
    flex-direction: column;
    align-items: center;
    padding: 5px;
}
.text{
	padding: 5px;
    width: fit-content;
}
.option-box{
	display: flex;
}
.option{
	display: flex;
    align-items: center;
    padding: 2px 8px;
}
.fa-3x{
	padding-left: 5px;
}
</style>
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


<div class="test"></div>


<hr>

<h1>편의시설</h1>
<div class="option-box">
	<c:forEach var="facilityVO" items="${facilityList}">
		<div class="option">
			${facilityVO.optionName}
			<i class="${facilityVO.optionIcon}"></i>
		</div>
	</c:forEach>
</div>
<hr>

<div>
	<!-- 리뷰 -->
</div>


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
<div class="reservation">
	<label>₩${roomPriceDto.dayPrice} / 박</label>
	<form action="${root}/room/detail" method="post">
		<input type="hidden" name="reservationRoomNo" value="${roomDto.roomNo}">
		<label>체크인 :</label><input type="text" class="check checkIn" name="reservationCheckin" readonly>
		<label>체크아웃 :</label><input type="text" class="check checkOut" name="reservationCheckout" readonly>
		<label>인원 : </label><input type="number" class="guest" name="reservationGuest" min="1" value="1"><br>
		<label>총 금액 : </label><input type="text" class="totalAmount" name="reservationTotalAmount" readonly> 원<br>
		<input type="submit" value="예약하기"> 
	</form>
</div>

