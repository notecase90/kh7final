<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<p>
	${reviewVo}
</p>


<c:forEach var="reviewVo" items="${list}">
	<div>
		<ul>	
			<li>작성회원 : ${reviewVo.memberName}</li>
			<li>작성일자 : ${reviewVo.reviewDate}</li>
			<li>작성내용 : ${reviewVo.reviewContent}</li>
			<li>별점 : ${reviewVo.reviewStar}</li>
		</ul>		
	</div>
</c:forEach>

