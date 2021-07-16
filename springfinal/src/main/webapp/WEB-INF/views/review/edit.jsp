<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<%
	int reviewNo = 21;
	int reviewRoomNo = 8;
	int reviewMember = 22;
%>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){
	$(".star").click(function(){
		var id = $(this).attr("id");
		var starNum = id.substring(4,5);
		
		for(var i = 1; i <=5; i++){
			var temp = "#star" + i;
			$(temp).attr("src", "${root}/resources/img/star-off.png");
		}
		for(var i = 1; i <=starNum; i++){
			var temp = "#star" + i;
			$(temp).attr("src", "${root}/resources/img/star-on.png");
		}
			$("#review_star").val(starNum);
	});
});
</script>

<h2>리뷰 수정</h2>    

<form action="edit" method="post" >
	<input type="hidden" name="reviewNo" value="<%=reviewNo%>">
	<input type="hidden" name="reviewRoomNo" value="<%=reviewRoomNo %>">
	<div>
		<img src="${root}/resources/img/star-on.png" style="width:30px;height:30px;" id="star1" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star2" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star3" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star4" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star5" class="star">
	</div>	
	<br><br>
	<div>	
		<textarea required name="reviewContent" value="${reviewDto.reviewContent}" rows="3" style="overflow: hidden; overflow-wrap: break-word; height: 20px;" required ></textarea>
	</div>
	<input type="hidden" name="reviewMember" value="<%=reviewMember %>">
	<input type="hidden" name="reviewStar" value="1" id="review_star">
	<br><br>
	<div>
		<input id="review_insert_button" type="submit" value="수정">
	</div>
	
</form>    