<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/pulse/bootstrap.min.css" integrity="undefined" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<style>
.row{
font-weight: bolder;
}

</style>


<div class="container-600">
	<div class="row">
		<h2>회원 정보 변경</h2>
	</div>
	
	<form action="change_info" method="post">
		<div class="row text-left">
			<label>이름</label>
			<input type="text" name="memberName" required class="form-input form-input-underline"
							value="${memberDto.memberName}">
		</div>
		<div class="row text-left">
			<label>생년월일</label>
			<input type="date" name="memberBirth" required class="form-input form-input-underline"
							value="${memberDto.memberBirth}">
			</div>
		
		<div class="row text-left">
			<label>이메일</label>
			<input type="text" name="memberEmail" class="form-input form-input-underline"
							value="${memberDto.memberEmail}">
		</div>
	
		<div class="row text-left">
			<label>연락처</label>
			<input type="text" name="memberPhone" required class="form-input form-input-underline"
							value="${memberDto.memberPhone}">
		</div>
		
		
		<div class="row text-left">
			<label>현재비밀번호</label>
			<input type="password" name="memberPw" required class="form-input form-input-underline">
		</div>
		
		<!-- 오류인 상황에는 오류 메세지를 추가해준다 -->
		<c:if test="${param.error != null}">
		<div class="row">
			<h5 class="error">정보가 일치하지 않습니다</h5>
		</div>
		</c:if>
		 
		<div class="row text-center">
			<input type="submit" value="수정하기" class="btn btn-info col"">
			<input type="reset" value="취소하기"  class="btn btn-outline-info col">
			<a href="${pageContext.request.contextPath}/member/myinfo" class="btn btn-secondary col">마이페이지</a>
		</div>
		
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  