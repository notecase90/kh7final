<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<c:forEach var="reviewVo" items="${list}">
		<div>
			<a href="detail/${reviewVo.reviewNo}">
				숙소명 : ${reviewVo.roomName}
			</a><br><br>
		</div>
	</c:forEach>
</div>

<div>
	<a href="insert">등록하기</a>
</div>