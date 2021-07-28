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
	
	$(function(){
		$("#price").on('input', function(){
			if($("#price").val()=="")
				$("#next-btn").attr("disabled", true);
			else
				$("#next-btn").attr("disabled", false);
		});
	});
	
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${root}/resources/css/room/price.css">
       
<div id="first">
        <div class="s" id="left">
            <div class="logo">
                <a href="#">
                    <i class="fab fa-airbnb fa-2x"></i>
                </a>
            </div>
            <div class="comment-box">
                <span class="comment">이제 요금을 설정하실 차례입니다</span>
            </div>
        </div>
        
        <div class="s" id="right">
        <form action="insert5" method="post">
            <div class="price-box">   
                <input id="price" name="dayPrice" min="10000"  type="number" placeholder="₩00"step="100"maxlength="6" oninput="maxLengthCheck(this)">
                <h3 id="on">1박 기준 요금입니다</h3>
            </div>
            <!-- 취소,다음 버튼 -->
            <div class="footer">
                <div id="footer-back-btn">
                    <button type="button" class="footer-btn"id="back-btn"onclick="history.back()">뒤로</button>
                </div>
                <div id="footer-next-btn">
                    <button type="submit" class="footer-btn"id="next-btn">다음</button>
                </div>             
            </div>
        </form>
        </div> 
    </div>