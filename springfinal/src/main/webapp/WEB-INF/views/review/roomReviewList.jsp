<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<p>
	${reviewVo}
</p>


<c:forEach var="reviewDto" items="${list}">
	<div>
		<ul>	
			<li>작성회원 : ${reviewDto.reviewMember}</li>
			<li>작성일자 : ${reviewDto.reviewDate}</li>
			<li>작성내용 : ${reviewDto.reviewContent}</li>
			<li>별점 : ${reviewDto.reviewStar}</li>
		</ul>		
	</div>
</c:forEach>

