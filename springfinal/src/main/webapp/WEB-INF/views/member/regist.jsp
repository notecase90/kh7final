<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 부트 스트랩 적용 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/regist.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    
    <style>
    span{
    display: block;
    }
  
    
    </style>
    
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

<div class="container-600">
	<div class="row">
		<h2>가입 정보 입력</h2>
	</div>
	
			<!-- 부트스트랩 적용 도전-->
	<div class="container-600 text-center">
	<h4 class="card-title mt-3 text-center">계정 생성하기</h4>
	<p class="text-center">자유롭게 계정을 생성해보세요(* 필수 입력 정보입니다)</p>
	
	<!-- 아이디 구분선 -->
	
	
	<!-- 부트스트랩 끝 -->
	<div class="container-600 text-left">
	<form action="regist" method="post">
			<div class="row">
			<input type="text" name="memberId" id="id-input" required class="form-input form-input-underline"
						placeholder="아이디를 입력하세요 *"> 
					<span></span>
				  		 </div>
		
		
		<div class="row">
		    <input type="password" name="memberPw" id="pw-input"required class="form-input form-input-underline"
						placeholder="비밀번호*">
		</div>
		
		
		<div class="row">
			<input type="password" id="pw-reInput" class="form-input form-input-underline"
						placeholder="동일한 비밀번호를 한번 더 입력*">
						
		</div>
		<div id="pwCheck"></div>
		
		<div class="row">
			<input type="text" name="memberName" id="name-input" required class="form-input form-input-underline"
						placeholder="이름*">
		</div>
		
		
		<div class="row">
			<input type="date" name="memberBirth" required class="form-input form-input-underline" value="생년월일*">
		</div>
		
		
		<div class="row">
			<input type="text" name="memberEmail" class="form-input form-input-underline" required placeholder="이메일 주소 입력*">
			<span></span>
		</div>
		
		
		<div class="row">
			<input type="text" name="memberPhone" required class="form-input form-input-underline"
						placeholder="- 를 제외하고 입력 *(예 : 010XXXXXXXX)">
		</div>
		
		
		
		<div class="row text-center">
			<input type="submit" value="가입하기" class="btn-positive">
		</div>
		
		</div>
		<p class="text-center">이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/member/login"">로그인하기</a> </p> 
	</form>
	</div>
