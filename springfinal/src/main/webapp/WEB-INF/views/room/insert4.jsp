<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<script>
$(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/data/room/allType",
		type:"get",
		dataType:"json",
		success:function(resp){
			for(var i=0; i<resp.length; i++) {
				$(".roomType").append(
						"<div><label for='fa-1'>"+resp[i].allTypeName+"</label> <input type='radio' id='fa-1' name='allTypeNo' value="+resp[i].allTypeNo+"> <i class='"+resp[i].allTypeIcon+"'></i><br></div>"
						);
			}
		}
		
	});	
		
	
})
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${root}/resources/css/room/roomType.css">

<div id="first">
        <div class="s" id="left">
        	<div class="logo">
                <a href="#">
                    <i class="fab fa-airbnb fa-2x"></i>
                </a>
            </div>
            <div class="comment-box">
                <span class="comment">호스팅할 숙소 유형을 알려주세요.</span>
            </div>   
        </div>
        <div class="s" id="right">
            <form action="insert4" method="post">
	            <div class="roomType">
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