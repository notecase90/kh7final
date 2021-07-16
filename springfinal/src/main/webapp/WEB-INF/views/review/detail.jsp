<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<h1>리뷰 상세보기</h1>    

<ul>
	<li>숙소명 : ${reviewDto.roomName}</li>
	<li>작성일자 : ${reviewDto.reviewDate}</li>	
	<li>회원명 : ${reviewDto.memberName}</li>
	<li>내용 : ${reviewDto.reviewContent}</li>
	<li>별점 : ${reviewDto.reviewStar}</li>
</ul>

<a href="${root}/review/edit?reviewNo=${reviewDto.reviewNo}">수정</a>
<a href="${root}/review/delete?reviewNo=${reviewDto.reviewNo}">삭제</a>


