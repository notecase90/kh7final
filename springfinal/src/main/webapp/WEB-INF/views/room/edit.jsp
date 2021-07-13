<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int roomHostNo = 2;
%>

<h2>숙소 정보 수정하기</h2>    

<form action="edit" method="post">
	<input type="hidden" name="roomHostNo" value="<%=roomHostNo%>">
	<div>
		<label>숙소명</label>
		<input type="text" name="roomName" required value="${roomDto.roomName}">
	</div>
    <div>
		<label>숙소소개</label>
		<input type="text" name="roomIntro" required value="${roomDto.roomIntro}">
	</div>
    <div>
        <label>숙소주소</label>
		<input type="text" id="sample5_address" name="roomAdd" value="${roomDto.roomAdd}">
        <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	</div>
    <div>
		<label>수용가능인원</label>
		<input type="number" min="1" name="roomCapa" required value="${roomDto.roomCapa}">
	</div>
	<div>
		<label>체크인시간</label>
		<input type="time" name="roomIn" class="timepicker" value="${roomDto.roomIn}">
	</div>
	<div>
		<label>체크아웃시간</label>
		<input type="time" name="roomOut" class="timepicker" value="${roomDto.roomOut}">
	</div>
	<div>
		<input type="submit" value="등록">
  	 	<input type="reset" value="취소">
	</div>
</form>    

<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

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