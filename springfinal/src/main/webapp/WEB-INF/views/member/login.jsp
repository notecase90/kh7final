<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container-600">

	<div class="row">
    	<h1>로그인 페이지</h1> 
	</div>
	
	<form action="login" method="post">
	<div class="row">
		아이디: <input type="text" name="memberId" required>
		<br><br>
		비밀번호: <input type="password" name="memberPw" required>
		<br><br>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">		
	</div>
	</form>
	<a href="find-id">아이디찾기</a>
	<a href="find-pw">비밀번호찾기</a>

</div>