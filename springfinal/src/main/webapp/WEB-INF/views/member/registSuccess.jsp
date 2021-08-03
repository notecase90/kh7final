<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">  
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css">  
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/regist.css">  
      
      <div class="container-600 text-center">
		<h1>회원가입 성공!</h1>
		<p>보금자리에 오신 것을 환영합니다.</p>
      </div>
      
      <div class="row text-center">
      	<img src="${pageContext.request.contextPath}/resources/img/vacation.jpg" width="30%">
      </div>

			<div class="row text-center">
				<a href="${pageContext.request.contextPath}/member/login" class="btn-positive">로그인</a>
				<a href="${pageContext.request.contextPath}" class="btn-normal">홈으로</a>
			</div>

