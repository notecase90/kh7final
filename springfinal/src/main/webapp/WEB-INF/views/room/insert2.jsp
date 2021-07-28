<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/data/room/facility",
		type:"get",
		dataType:"json",
		success:function(resp){
			for(var i=0; i<resp.length; i++) {
				$(".facility").append(
						"<div class='icon'><label for='fa-1'>"+resp[i].optionName+"</label> <input type='checkbox' id='fa-1' name='optionNo' value="+resp[i].optionNo+"> <i class='"+resp[i].optionIcon+"'></i><br></div>"
						);
			}
		}
		
	});	
		
	
})
</script>
<link rel="stylesheet" href="${root}/resources/css/room/facility.css">

<div id="first">
	<div class="s" id="left">
    	<div class="logo">
            <a href="#">
                <i class="fab fa-airbnb fa-2x"></i>
            </a>
    	</div>
    	<div class="comment-box">
            <span class="comment">편의시설을 설정하실 차례입니다</span>
    	</div>
	</div>
        <div class="s" id="right">
        	<form action="insert2" method="post">
		        <div id="facility-box">
		        	<div class="facility">	
					</div>  
		        </div>
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

