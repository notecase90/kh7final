<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/layout.css">
	<script>
$(function(){
	$("#delete").on("click",function(e){
		var choice= window.confirm("정말 탈퇴하시겠습니까??");
			if(!choice){
			//return false; //이렇게만 하면 코드가 마무리되서 다른 코드를 입력하지 못한다
				e.preventDefault(); //return false 와 같은 기능이지만 이후에 추가 코드 작성이 가능
			}
		});
	});

	</script>

	
	
<!-- 	스타일 시작 -->
<style>
.link-btn
  {
 background-color: #56baed;
  border: none;
  color: white;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  border-radius: 3px 3px 3px 3px;
  margin: 5px 5px 5px 5px;
}
.title{
font-weight: bolder;
text-align: left;
}
.row{
text-align: left;
}

</style>
<!-- 스타일 끝 -->

	
	
	<div class="container-600">
	
					<div class="row text-center" >
						<h2 >나의 정보</h2>
					</div>
	
				<div class="row title">
					<span>회원번호</span>
				</div>
				<div class="row">
					<span class="form-input form-input-underline">${memberDto.memberNo}</span>
				</div>
				
				<div class="row title">
				<span>아이디</span>
				</div>
				<div class="row">
					<span class="form-input form-input-underline">${memberDto.memberId}</span>
				</div>
				
				<div class="row title">
				<span >이름</span>
				</div>
				<div class="row">
					<span class="form-input form-input-underline">${memberDto.memberName}</span>
				</div>
				
				<div class="row title">
				<span>생년월일</span>
				</div>
				<div class="row">
					<span class="form-input form-input-underline">${memberDto.memberBirth}</span>
				</div>
				
				<div class="row title">
				<span>이메일</span>
				</div>
				<div class="row">
					<span class="form-input form-input-underline">${memberDto.memberEmail}</span>
				</div>
				
				<div class="row title">
				<span>연락처</span>
				</div>
				<div class="row">
					<span class="form-input form-input-underline">${memberDto.memberPhone}</span>
				</div>
				
				<div class="row title">
				<span>가입입</span>
				</div>
				<div class="row">
					<span class="form-input form-input-underline">${memberDto.memberJoin}</span>
				</div>
				
	
	<!-- 이용 가능한 메뉴 구성 -->
	<div class="row">
		<a href="change_pw" class="link-btn">비밀번호 변경</a>
		<a href="change_info" class="link-btn">개인정보 변경</a>
		<a href="exit" class="link-btn confirm-link" id="delete">회원 탈퇴</a>
		<br>
		<a href="${pageContext.request.contextPath}" class="link-btn confirm-link" >메인으로</a>
		
	</div>
		
		
		
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	</div>
	
</div>

