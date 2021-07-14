<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h1>숙소 상세</h1>    

<ul>
	<li>숙소명 : ${roomDto.roomName}</li>
	<li>숙소소개 : ${roomDto.roomIntro}</li>
	<li>주소 : ${roomDto.roomAdd}</li>
	<li>수용인원 : ${roomDto.roomCapa}</li>
	<li>체크인 : ${roomDto.roomIn}</li>
	<li>체크아웃 : ${roomDto.roomOut}</li>
</ul>

<a href="${pageContext.request.contextPath}/room/delete?roomNo=${roomDto.roomNo}">삭제</a>
<a href="${pageContext.request.contextPath}/room/edit?roomNo=${roomDto.roomNo}">수정</a>

<hr>

<h1>주변 관광 api 불러오기</h1>
<style>
.thumnail {
	width:250px;
	height:250px;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1038b1ced14e22e17b2cd601ec877523&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
							contentStr += "title : "+$(this).find("title").text()+"<img class='thumnail' src="+$(this).find("firstimage").text()+"><br>";
						});
						$(".test").append(contentStr);
					}
				}
			});	
        })
     }
});

</script>

<div class="test">
</div>

<hr>

<h1>편의시설</h1>

<hr>

<h1>내부시설</h1>

<hr>

<h1>숙소종류</h1>

