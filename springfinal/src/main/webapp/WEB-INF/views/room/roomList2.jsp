<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="isHost" value="${not empty hostNo}"></c:set>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
            width: 30%;
            left: 30px ;
            box-sizing: border-box; 
        }        
        .btn-group{
        	width: fit-content;
        	display: flex;
        	right: 30px;
        }
        .logo-box{
            width: 100%;
             height: 10%;
             display: flex;
             justify-content: space-between;
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
        .fa{
        	width: fit-content;
        	display: flex;
    		align-items: center;
        }
        .list{
            width: 55%;
            display: flex;
    		flex-direction: column;
    		padding-left: 20px;
        }
        #map{
            width: 45%;
            height: auto;
            margin-top: 5px;
            position: relative;
        }
		.preview{
			width: 320px;
			height: 220px;
			border-radius: 7px;
		}
		.img{
			width: 320px;
			height: 220px;
		}
		.roombox{
			display: flex;
		}
		.roomInfo{
			padding-left: 10px;
		}
		.fa-airbnb{
			display: flex;
    		align-items: center;
    		color: #ff4567;
		}
		.astyle{
			color: black;
			text-decoration: none;
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


<div class="content">
	<div class="list">	
		<div style="margin-top: 4px; margin-bottom: 24px;width: 97%">
			<div style="border-bottom-width: 1px; border-bottom-color: rgb(235,235,235); border-bottom-style: solid;">	
			</div>
		</div>
		<c:forEach var="roomVo" items="${list}">
			<div class="roombox">
				<div class="img">
					<a href="detail/${roomVo.roomNo}" style="text-decoration: none;color: black;">
						<img class="preview" src="${root}/data/room/download/${roomVo.roomPicNo}">	
					</a>		
				</div>
				<div class="roomInfo">
					<a href="detail/${roomVo.roomNo}" style="text-decoration: none;color: black;font-size: 22px;">
						${roomVo.roomName}</a>
					<div style="margin-top: 10px; margin-bottom: 10px;height: 1px;width: 30px;">
						<div style="border-bottom-width: 1px; border-bottom-color: rgb(235,235,235); border-bottom-style: solid;">	
						</div>
					</div>	
					
					<a href="detail/${roomVo.roomNo}" style="text-decoration: none;color: black;font-weight: 200;font-size: 14px;">
						${roomVo.roomAdd}<br>
					</a>
					<a href="detail/${roomVo.roomNo}" style="text-decoration: none;color: black;font-weight: 200;font-size: 14px;">
						침실 ${roomVo.bedCount}개 · 욕실 ${roomVo.bathCount}개 · 발코니 ${roomVo.balconyCount}개
					</a>
				</div>	
			</div>
			<div style="margin-top: 24px; margin-bottom: 24px;width: 97%">
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
    center: new kakao.maps.LatLng(36.3295450541282, 127.442884593398), // 지도의 중심좌표
    level: 10 // 지도의 확대 레벨
};

 var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var addList = [
<c:forEach var="list" items="${list}">
   '${list.roomAdd}',
</c:forEach>   
] 
var imageSrc = "${root}/resources/img/home.png";  
 
//마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 



var geocoder = new kakao.maps.services.Geocoder();

for(var i=0;i<addList.length;i++){
   
geocoder.addressSearch(addList[i], function(result, status) {
        
        if (status === kakao.maps.services.Status.OK) {
           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
           console.log(result[0].x);
           console.log(result[0].y);
        }

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: coords, // 마커를 표시할 위치
        image : markerImage // 마커 이미지 
    });
    map.setCenter(coords);
});  
}

</script>
