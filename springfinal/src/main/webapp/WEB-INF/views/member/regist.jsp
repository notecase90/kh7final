<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
				url:"${pageContext.request.contextPath}/member/test3",
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
// 		$("input [name=memberEamil]").blur(function(){
// 			var memberEmail = $(this).val();
// 		});
		
		
	//마지막 괄호	
	});
		</script>

<div class="container-600">
	<div class="row">
		<h2>가입 정보 입력</h2>
	</div>
	
	<form action="regist" method="post">
		<div class="row text-left">
			<label>아이디</label>
			<input type="text" name="memberId" id="id-input" required class="form-input form-input-underline"
						placeholder="아이디">
			<span></span>
		</div>
		
		
		<div class="row text-left">
			<label>비밀번호</label>
			<input type="password" name="memberPw" id="pw-input"required class="form-input form-input-underline"
						placeholder="비밀번호">
		</div>
		
		
		<div class="row text-left">
			<label>비밀번호 재확인</label>
			<input type="password" id="pw-reInput" class="form-input form-input-underline"
						placeholder="동일한 비밀번호를 한번 더 입력">
						<span id="pwCheck"></span>
		</div>
		
		<div class="row text-left">
			<label>이름</label>
			<input type="text" name="memberName" id="name-input" required class="form-input form-input-underline"
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
						placeholder="- 를 제외하고 입력 (예 : 010XXXXXXXX)">
		</div>
		<div class="row">
			<input type="submit" value="가입" class="form-btn form-btn-positive">
		</div>
	</form>
</div>

