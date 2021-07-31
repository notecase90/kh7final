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
<div class="container text-center">
	<h1>호스트 숙소 관리 페이지</h1>
	
	<table class="table text-center table-hover">
		<thead>
			<tr>
				<th>숙소번호</th>
				<th>숙소명</th>				
				<th>주소</th>
				<th>현재 예약건수</th>
				<th>메뉴</th>
			</tr>	
		</thead>
	<c:forEach var="HostRoomList" items="${HostRoomList}">
		<tbody>
			<td>${HostRoomList.roomNo}</td>
			<td><a href="${root}/room/detail/${HostRoomList.roomNo}">${HostRoomList.roomName}</a></td>
			<td>${HostRoomList.roomAdd}</td>
			<td>${HostRoomList.count}</td>
			<td>
			<a href="hostReservationDetail?roomNo=${HostRoomList.roomNo}" class="btn btn-primary">전체내역</a></button>
			<a href="#" class="btn btn-warning">수정</a></button>
			<a href="#" class="btn btn-danger">삭제</a></button>
			</td>			
		</tbody>
	</c:forEach>
	</table>
	
</div>