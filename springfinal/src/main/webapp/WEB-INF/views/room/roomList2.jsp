<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<c:forEach var="roomDto" items="${list}">
		<div>
			<a href="detail/${roomDto.roomNo}">
				숙소명 : ${roomDto.roomName}
			</a><br><br>
		</div>
	</c:forEach>
</div>

<div>
	<a href="insert">등록하기</a>
</div>
