<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<%
	int roomHostNo = (int)session.getAttribute("hostNo");
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${root}/resources/css/room/roomInfo.css">
 

<div id="first">
	<div class="s" id="left">
    		<div class="logo">
                <a href="${root}">
                    <i class="fab fa-airbnb fa-2x"></i>
                </a>
            </div>
            <div class="comment-box">
                <span class="comment">숙소정보를 변경해보세요</span>
            </div>
	</div>
	<div class="s" id="right">
    <form action="edit" method="post" id="test-margin">
		<input type="hidden" name="roomHostNo" value="<%=roomHostNo%>">
		<input type="hidden" name="roomNo" value="${roomDto.roomNo}">
		<div class="btn-box">
			<div id="test-box">
				<input type="text" name="roomName" required placeholder="숙소명을 입력해주세요" class="room-info" autocomplete="off" value="${roomDto.roomName}">
				<input type="text" name="roomIntro" required placeholder="숙소소개를 입력해주세요" class="room-info" autocomplete="off"value="${roomDto.roomIntro}">
			</div>
			<div class="map-box">
				<input type="number" min="1"max="12" name="roomCapa" required placeholder="인원수" id="test"  value="${roomDto.roomCapa}">
				<input type="text" id="sample5_address" name="roomAdd" placeholder="주소" class="room-info" autocomplete="off"value="${roomDto.roomAdd}">
	       		<input type="button" onclick="sample5_execDaumPostcode()" value="검색" id="like-back-btn">
	        	<div id="map"></div>
			</div>
			<div class="time-box">
				<label id="text-2">체크인시간</label>
				<input type="time" name="roomIn" class="timepicker" value="${roomDto.roomIn}">
				<label id="text-2">체크아웃시간</label>
				<input type="time" name="roomOut" class="timepicker" value="${roomDto.roomOut}">
			</div>
		</div>
		 <div class="footer">
	                <div id="footer-back-btn">
	                    <button type="button" class="footer-btn"id="back-btn"onclick="history.back()">뒤로</button>
	                </div>
	                <div id="footer-next-btn">
	                    <button type="submit" class="footer-btn"id="next-btn">변경</button>
	                </div>             
	            </div>
    </form>
	</div>
</div>   

<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85fe8068e18976f1917f5b69d1e95020&libraries=services"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${roomDto.roomAdd}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });


        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
    </script>