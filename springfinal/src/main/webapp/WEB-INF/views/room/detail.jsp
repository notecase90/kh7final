<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/layout.css">
	
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<h1>숙소종류</h1>
	숙소종류이름 : ${roomTypeVO.allTypeName} <br>
	숙소종류아이콘명 : ${roomTypeVO.allTypeIcon}
	아이콘 : <i class="${roomTypeVO.allTypeIcon}"></i>

<h1>숙소 상세</h1>    

<ul>
	<li>숙소명 : ${roomDto.roomName}</li>
	<li>숙소소개 : ${roomDto.roomIntro}</li>
	<li>주소 : ${roomDto.roomAdd}</li>
	<li>수용인원 : ${roomDto.roomCapa}</li>
	<li>체크인 : ${roomDto.roomIn}</li>
	<li>체크아웃 : ${roomDto.roomOut}</li>
	<li>숙소가 : ${roomPriceDto.dayPrice}원 (1박기준)</li>
</ul>

<a href="${root}/room/delete?roomNo=${roomDto.roomNo}">삭제</a>
<a href="${root}/room/edit?roomNo=${roomDto.roomNo}">수정</a>
<a href="${root}/review/insert?roomNo=${roomDto.roomNo}">리뷰쓰기</a>
<a href="${root}/review/onelist/${roomDto.roomNo}">리뷰보기</a>

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
	<c:forEach var="facilityVO" items="${facilityList}">
		${facilityVO.optionName}
	</c:forEach>

<hr>

<h1>내부시설</h1>
	침실 수 : ${infacilityDto.bedCount} 개 <br>
	욕실 수 : ${infacilityDto.bathCount} 개 <br>
	발코니  : ${infacilityDto.balconyCount} 개
<hr>



