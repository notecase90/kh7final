<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script> 
$(function(){
	$("input[name=f]").on("input",function(){
		if(this.files && this.files.length > 0) {
			
			var fd = new FormData();
			fd.append("f",this.files[0]);
			var that = this;
			
			$.ajax({
				url:"${pageContext.request.contextPath}/data/room/homePic",
				type:"post",
				processData:false,
				contentType:false,
				data:fd,
				success:function(resp){
				var url = "${pageContext.request.contextPath}/data/room/download/"+resp.roomPicNo;
				$("#preview").attr("src",url);
				},
				error:function(){
					window.alert("업로드 실패..");
				}
			});
		}
		else {
			
		}
	});	
});
</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${root}/resources/css/room/roomPic.css">

<div id="first">
	<div class="s" id="left">
		<div class="logo">
			<a href="#">
				<i class="fab fa-airbnb fa-2x"></i>
			</a>
		</div>
		<div class="comment-box">
			<span class="comment">이제 숙소 사진을 올려주세요</span>
		</div>
	</div>
	<div class="s" id="right">   

			<div class="file-box">
				<div class="filebox">
					<label for="file-upload">업로드</label>
					<input type="file"id="file-upload"name="f" accept=".jpg,.png,.gif" multiple>
				</div>  
				<div>
					<img id="preview">
				</div>  
			</div>    
				<div class="footer">
					<div id="footer-back-btn">
			                <button type="button" class="footer-btn"id="back-btn"onclick="history.back()">뒤로</button>
					</div>
					<div id="footer-next-btn">
						<button type="submit" class="footer-btn"id="next-btn"><a href="insert_success" id="a-next">다음</a></button>
					</div>             
				</div>

	</div>
</div>