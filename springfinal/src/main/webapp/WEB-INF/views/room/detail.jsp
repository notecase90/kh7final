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
