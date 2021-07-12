<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="container-600">
	<div class="row">
		<h2>가입 정보 입력</h2>
	</div>
	
	<form action="regist" method="post">
		<div class="row text-left">
			<label>아이디</label>
			<input type="text" name="memberId" required class="form-input form-input-underline"
						placeholder="아이디">
		</div>
		<div class="row text-left">
			<label>비밀번호</label>
			<input type="password" name="memberPw" required class="form-input form-input-underline"
						placeholder="비밀번호">
		</div>
		<div class="row text-left">
			<label>비밀번호 재확인</label>
			<input type="password" class="form-input form-input-underline"
						placeholder="동일한 비밀번호를 한번 더 입력">
		</div>
		<div class="row text-left">
			<label>이름</label>
			<input type="text" name="memberName" required class="form-input form-input-underline"
						placeholder="이름">
		</div>
		<div class="row text-left">
			<label>생년월일</label>
			<input type="date" name="memberBirth" required class="form-input form-input-underline">
		</div>
		
		<div class="row text-left">
			<label>이메일</label>
			<input type="text" name="memberEmail" class="form-input form-input-underline">
		</div>
		
		<div class="row text-left">
			<label>전화번호</label>
			<input type="text" name="memberPhone" required class="form-input form-input-underline"
						placeholder="- 를 포함하여 입력 (예 : 010-XXXX-XXXX)">
		</div>
		<div class="row">
			<input type="submit" value="가입" class="form-btn form-btn-positive">
		</div>
	</form>
</div>

