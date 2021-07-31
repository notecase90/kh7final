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
                <a href="#">
                    <i class="fab fa-airbnb fa-2x"></i>
                </a>
            </div>
            <div class="comment-box">
                <span class="comment">숙소정보를 입력하실 차례입니다</span>
            </div>
	</div>
	<div class="s" id="right">
    <form action="insert" method="post" id="test-margin">
		<input type="hidden" name="roomHostNo" value="<%=roomHostNo%>">
		<div class="btn-box">
			<div id="test-box">
				<input type="text" name="roomName" required placeholder="숙소명을 입력해주세요" class="room-info" autocomplete="off">
				<input type="text" name="roomIntro" required placeholder="숙소소개를 입력해주세요" class="room-info" autocomplete="off">
			</div>
			<div class="map-box">
				<input type="number" min="1"max="12" name="roomCapa" required placeholder="인원수" id="test">
				<input type="text" id="sample5_address" name="roomAdd" placeholder="주소" class="room-info" autocomplete="off">
	       		<input type="button" onclick="sample5_execDaumPostcode()" value="검색" id="like-back-btn">
	        	<div id="map"></div>
			</div>
			<div class="time-box">
				<label id="text-2">체크인시간</label>
				<input type="time" name="roomIn" class="timepicker">
				<label id="text-2">체크아웃시간</label>
				<input type="time" name="roomOut" class="timepicker">
			</div>
		</div>
		 <div class="footer">
	                <div id="footer-back-btn">
	                    <button type="button" class="footer-btn"id="back-btn"onclick="history.back()">뒤로</button>
	                </div>
	                <div id="footer-next-btn">
	                    <button type="submit" class="footer-btn"id="next-btn">다음</button>
	                </div>             
	            </div>
    </form>
	</div>
</div>   

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85fe8068e18976f1917f5b69d1e95020&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
    
        //지도를 미리 생성
        var map = new daum.maps.Map(mapContainer, mapOption);
        //주소-좌표 변환 객체를 생성
        var geocoder = new daum.maps.services.Geocoder();
        //마커를 미리 생성
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map
        });
    
    
        function sample5_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.address; // 최종 주소 변수
    
                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("sample5_address").value = addr;
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function(results, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {
    
                            var result = results[0]; //첫번째 결과의 값을 활용
    
                            // 해당 주소에 대한 좌표를 받아서
                            var coords = new daum.maps.LatLng(result.y, result.x);
                            // 지도를 보여준다.
                            mapContainer.style.display = "block";
                            map.relayout();
                            // 지도 중심을 변경한다.
                            map.setCenter(coords);
                            // 마커를 결과값으로 받은 위치로 옮긴다.
                            marker.setPosition(coords)
                        }
                    });
                }
            }).open();
        }
    </script>