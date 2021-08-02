<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/regist.css">
    
    	<div class="container-400 text-center">
    <form action="change_pw" method="post">
	    	<div class="row">
	    		<input type="password" name="curPw" placeholder="현재 비밀번호" 
	    		required class="form-input form-input-underline">
	    	</div>
	    	
	    	<div class="row">
	    		<input type="password" name="newPw" placeholder="변경할 비밀번호"
	    		 required class="form-input form-input-underline">
	    	</div> 
	    	
	    	<div class="row">
	    		<input type="submit" value="변경하기" class="btn-positive">
	    	</div>
    
    	</div>
    </form>
    
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
