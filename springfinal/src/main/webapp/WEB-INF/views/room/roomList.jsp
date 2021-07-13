<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<c:forEach var="roomDto" items="${list}">
		숙소명 : ${roomDto.roomName}
		숙소소개 : ${roomDto.roomIntro}
		주소 : ${roomDto.roomAdd}
		수용인원 : ${roomDto.roomCapa}
		체크인 : ${roomDto.roomIn}
		체크아웃 : ${roomDto.roomOut}
	</c:forEach>
</div>
