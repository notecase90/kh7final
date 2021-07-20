<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	  }
	
	
</script>

<link rel="stylesheet" href="${root}/resources/css/price.css">
       
<h2>숙소 가격 설정</h2>

<form action="insert5" method="post">
	
	<div class="price-box">   
		<input id="price" name="dayPrice" min="10000"  type="number" placeholder="₩10000 ~ ₩999999"step="100"maxlength="6" oninput="maxLengthCheck(this)">
	</div>

	<div>
	<p>1박 기준 요금입니다</p>
		<input type="submit" value="다음">
		<input type="reset" value="취소">
	</div>
</form>


