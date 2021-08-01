<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
        *{
            position: relative;
            width: 100%;
            height: 100%;
        }
        body{
            margin: 0px;
        }
        .logo{
            display: inline;
            left: 30px ;
            box-sizing: border-box; 
        }        
        .logo-box{
            width: 100%;
             height: 10%;
        }
        .content{
            height: 90%;
            width: 100%;
            display: flex;
        }
        .fab{
            width: 100px;
            font-size: 35px;
        }
        .list{
            width: 55%;
            display: flex;
    		flex-direction: column;
    		padding-left: 10px;
        }
        #map{
            width: 45%;
            height: 100%;
        }
        .title{
			font-size: 25px;
			font-weight: bold;
		}
		.roomName{
			height: auto; 
			width: 65%;
			text-decoration: none;
			font-size: 25px;
   			font-weight: 600;
		}
</style>   


<div class="logo-box">
	<div class="logo">
            <a href="#" style="text-decoration: none;">
                <i class="fab fa-airbnb"></i>
            </a>
	</div>
</div>


<div class="content">
	<div class="list">
		<c:forEach var="roomVo" items="${list}">
		<div>
		
		</div>
			<div class="roomName">
				<a href="detail/${roomVo.roomNo}" style="text-decoration: none;color: black;">
					${roomVo.roomName}</a>
			</div>
			<div>
				<a href="detail/${roomVo.roomNo}" style="text-decoration: none;color: black;font-weight: 200;font-size: 14px;">
					${roomVo.roomAdd}<br>
				</a>
				<a href="detail/${roomVo.roomNo}" style="text-decoration: none;color: black;font-weight: 200;font-size: 14px;">
					침실 ${roomVo.bedCount}개 · 욕실 ${roomVo.bathCount}개 · 발코니 ${roomVo.balconyCount}개
				</a>
			</div>
			<div style="margin-top: 24px; margin-bottom: 4px;">
				<div style="border-bottom-width: 1px; border-bottom-color: rgb(235,235,235); border-bottom-style: solid;">	
				</div>
			</div>
		</c:forEach>

		
	</div>
	<!-- 
	<div>
		<a href="insert">등록하기</a>
	</div>	
	 -->


	
	<div id="map"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1038b1ced14e22e17b2cd601ec877523&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
{
    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
},
{
    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
},
{
    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
},
{
    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
}
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
}
</script>
