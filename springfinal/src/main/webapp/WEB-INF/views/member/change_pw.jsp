<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <form action="change_pw" method="post">
    	<div class="container-600">
	    	<div class="row">
	    		<input type="password" name="curPw" placeholder="현재 비밀번호 입력하세요" required>
	    	</div>
	    	
	    	<div class="row">
	    		<input type="password" name="newPw" placeholder="변경할 비밀번호 입력하세요" required>
	    	</div>
	    	
	    	<div class="row">
	    		<input type="submit" value="변경하기">
	    	</div>
    
    	</div>
    </form>
    
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
