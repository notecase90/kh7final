<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
.table td, .table th{
	vertical-align: middle;
}
</style>
<script>
$(function(){
	$("#reservationRooms").hide();
	
	$("#allRoomBtn").click(function(){
		$("#allRooms").fadeIn(350);
		$("#reservationRooms").hide();
	});
	
	$("#reservationRoomBtn").click(function(){
		$("#allRooms").hide();
		$("#reservationRooms").fadeIn(350);
	});
	
});
</script>
<div class="container text-center">
	<br><br>
	<h1>호스트 숙소 관리 페이지</h1>
	<br><br>
	<div class="float-right">
	<button id="allRoomBtn" class="btn btn-success">전체 숙소</button>
	<button id="reservationRoomBtn" class="btn btn-success">예약 리스트</button><br><br>
	</div>
	<br><br>
	<table id="reservationRooms" class="table text-right table-hover">
		<thead>
			<tr>				
				<th style="padding-right:30px;">숙소명</th>				
				<th style="padding-right:90px;">주소</th>
				<th>현재 예약건수</th>
				<th style="padding-right:43px;">메뉴</th>
			</tr>	
		</thead>
	<c:forEach var="HostReservationList" items="${HostReservationList}">
		<tbody>			
			<td><a href="${root}/room/detail/${HostReservationList.roomNo}">${HostReservationList.roomName}</a></td>
			<td>${HostReservationList.roomAdd}</td>
			<td>${HostReservationList.count}</td>
			<td>
			<a href="hostReservationDetail?roomNo=${HostReservationList.roomNo}" class="btn btn-primary">예약 상세</a></button>			
			</td>			
		</tbody>
	</c:forEach>
	</table>
	
	
	<table id="allRooms" class="table text-center table-hover">
		<thead>
			<tr>
				<th>썸네일</th>				
				<th>숙소명</th>				
				<th>주소</th>
				<th>수용인원</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>작성여부</th>
			</tr>	
		</thead>
	<c:forEach var="HostRoomList" items="${HostRoomList}" varStatus="status">
		<tbody>
			<td>
				<img class="img-thumbnail" src="${root}/data/room/download/${HostRoomPicNo[status.index]}" style="width:200px;height:200px;">
			</td>			
			<td><a href="${root}/room/detail/${HostRoomList.roomNo}">${HostRoomList.roomName}</a></td>
			<td>${HostRoomList.roomAdd}</td>
			<td>${HostRoomList.roomCapa}</td>
			<td>${HostRoomList.roomIn}</td>
			<td>${HostRoomList.roomOut}</td>
			<td>
			<c:choose>
				<c:when test="${HostRoomList.roomInsertComplete eq 1}">
				작성완료
				</c:when>
				<c:when test="${HostRoomList.roomInsertComplete eq 0}">
				작성중
				</c:when>
			</c:choose>
			</td>			
		</tbody>
	</c:forEach>
	</table>
</div>