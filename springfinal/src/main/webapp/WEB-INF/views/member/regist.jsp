<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 부트 스트랩 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/regist.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    
    <!-- 끝 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		
		$('#id-input').blur(function(){
			var idVal =$('#id-input').val();
			var regex = /^[A-za-z0-9]{2,20}/;
			if(!regex.test(idVal)){
				alert("8~20자 이내의 영문소문자, 숫자만 가능");
				$('#id-input').val('');
			}
		});
		
		$('#pw-input').blur(function(){
			var pwVal=$('#pw-input').val();
			var regex=/^[a-zA-Z0-9]{8,16}/;
			if(!regex.test(pwVal)){
				alert("8~16자 이내의 영문 대문자 소문자, 숫자만 가능");
				$('#pw-input').val('');
			}
			
		});
		$('#pw-reInput').keyup(function(){
			
			var pwVal = $('#pw-input').val();
			var pwReVal = $('#pw-reInput').val();
			
			if(pwVal == pwReVal){
						$('#pwCheck').text("패스워드가 일치합니다");
						$('#pwCheck').css('color','green');
			}
			else{
						$('#pwCheck').text("패스워드가 일치하지 않습니다");
						$('#pwCheck').css('color','red');
			}
		});
		
		$('#name-input').blur(function(){
			var nameVal = $('#name-input').val();
			var regex = /^[가-힣]{2,7}/;
			if(!regex.test(nameVal)){
				alert("이름은 한글 2~7글자입니다");
				$('#name-input').val('');
			}
			
		});
		
	});

	</script>
	
	<script>
	
		//아이디 중복검사
		//아이디 입력창의 input/blur 시점에 비동기통신을 이용하여 화면을 유지한채로 아이디 중복검사 수행
	$(function(){
		//아이디 입력창의 input/blur 시점에 비동기통신을 이용하여 화면을 유지한 채로 아이디 중복검사 수행
		$("input[name=memberId]").blur(function(){
			//this : 입력창
			var memberId = $(this).val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/member/checkId",
				data:{
					memberId : memberId
				},
				type:"post",
				success:function(resp){//"Y"는 사용가능, "N"은 사용중으로 처리
					if(resp === "Y") {
						$("input[name=memberId] + span").text("사용 가능한 아이디입니다");
						$("input[name=memberId] + span").css('color','green');
					}
					else if(resp === "N"){
						$("input[name=memberId] + span").text("이미 사용중인 아이디입니다");
						$("input[name=memberId] + span").css('color','red');
					}
				}
			});
			
		});		
		
		//회원가입시 이메일 중복확인
			$("input[name=memberEmail]").blur(function(){
			//this : 입력창
			var memberEmail = $(this).val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/member/checkEmail",
				data:{
					memberEmail : memberEmail
				},
				type:"post",
				success:function(resp){//"Y"는 사용가능, "N"은 사용중으로 처리
					if(resp === "Y") {
						$("input[name=memberEmail] + span").text("사용 가능한 이메일 주소입니다");
						$("input[name=memberEmail] + span").css('color','green');
					}
					else if(resp === "N"){
						$("input[name=memberEmail] + span").text("이미 사용중인 이메일 주소입니다");
						$("input[name=memberEmail] + span").css('color','red');
					}
				}
			});
			
		});		
		
		
	//마지막 괄호	
	});
		</script>

<div class="container-800">
	<div class="row">
		<h2>가입 정보 입력</h2>
	</div>
	
			<!-- 부트스트랩 적용 도전-->
	<div class="container-1000">
	<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 800px;">
	<h4 class="card-title mt-3 text-center">계정 생성하기</h4>
	<p class="text-center">자유롭게 계정을 생성해보세요</p>
	
	<!-- 아이디 구분선 -->
	
	
	<!-- 부트스트랩 끝 -->
	
	<form action="regist" method="post">
		<div class="form-group input-group">
			<div class="input-group-prepend">
				  <span class="input-group-text"> <i class="fa fa-id-card"></i> </span>
				  		 </div>
			<input type="text" name="memberId" id="id-input" required class="form-control"
						placeholder="아이디를 입력하세요">
			<span></span>
		</div>
		
		
		<div class="form-group input-group">
			<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
			<input type="password" name="memberPw" id="pw-input"required class="form-control"
						placeholder="비밀번호">
		</div>
		
		
		<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
			<input type="password" id="pw-reInput" class="form-control"
						placeholder="동일한 비밀번호를 한번 더 입력">
						<span id="pwCheck"></span>
		</div>
		
		
		<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
			<input type="text" name="memberName" id="name-input" required class="form-control"
						placeholder="이름">
		</div>
		
		
		<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-birthday-cake"></i> </span>
		 </div>
			<input type="date" name="memberBirth" required class="form-control" placeholder="생년월일">
		</div>
		
		
		<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
			<input type="text" name="memberEmail" class="form-control" required placeholder="이메일 주소 입력">
			<span></span>
		</div>
		
		
		<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone" aria-hidden="true"></i> </span>
		 </div>
			<input type="text" name="memberPhone" required class="form-control"
						placeholder="- 를 제외하고 입력 (예 : 010XXXXXXXX)">
		</div>
		
		
		
		<div class="form-group">
			<input type="submit" value="가입하기" class="btn btn-primary btn-block">
		</div>
		
		<p class="text-center">이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/member/login"">로그인하기</a> </p> 
	</form>
</div>
	</div>
