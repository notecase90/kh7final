<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
%>    
회원번호 : ${memberNo}
    
<h1>인증성공! </h1>

<form action="${root}" method="post">
	<input type="hidden" name="hostMemberNo" value="${memberNo}">
	<input type="text" name="hostIntro">
	<input type="submit" value="호스트페이지이동">
</form>