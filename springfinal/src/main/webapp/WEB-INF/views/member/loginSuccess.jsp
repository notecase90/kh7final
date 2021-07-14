<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<h1>로그인 성공!</h1>
<p>${memberDto.memberId}님 안녕하세요.</p>

<a href="/final">홈으로</a>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>