<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script> 
$(function(){
	$("input[name=f1]").on("input",function(){
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
				$(".preview1").attr("src",url);
				},
				error:function(){
					window.alert("업로드 실패..");
				}
			});
		}
		else {
			
		}
	});
	
	$("input[name=f2]").on("input",function(){
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
				$(".preview2").attr("src",url);
				},
				error:function(){
					window.alert("업로드 실패..");
				}
			});
		}
		else {
			
		}
	});	
	
	$("input[name=f3]").on("input",function(){
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
				$(".preview3").attr("src",url);
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
<style>
.carousel-control-prev-icon { background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E"); } 
			.carousel-control-next-icon { background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23000' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E"); }
</style>
<div id="first">
	<div class="s" id="left">
		<div class="logo">
			<a href="#">
				<i class="fab fa-airbnb fa-2x"></i>
			</a>
		</div>
		<div class="comment-box">
			<span class="comment">이제 숙소 사진을 올려주세요 <br><br>이미지는 3장까지 업로드됩니다.</span>
		</div>
	</div>
	<div class="s" id="right">   
	
		<div class="fileUpload">
			<div id="fileUpload" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
			    	<div class="carousel-item active text-center">
						<div style="margin:25px 0px;">
							<img id="preview" class="preview1">
						</div>
					    <div class="filebox">
							<label for="file-upload1">업로드</label>
							<input type="file" id="file-upload1" name="f1" accept=".jpg,.png,.gif" multiple>
						</div>  
			   		</div>
			    	<div class="carousel-item text-center">
						<div style="margin:25px 0px;">
							<img id="preview" class="preview2">
						</div>  
			    		<div class="filebox">
							<label for="file-upload2">업로드</label>
							<input type="file" id="file-upload2" name="f2" accept=".jpg,.png,.gif" multiple>
						</div>  
			    	</div>
			   		<div class="carousel-item text-center">
						<div style="margin:25px 0px;">
							<img id="preview" class="preview3">
						</div>  
				      	<div class="filebox">
							<label for="file-upload3">업로드</label>
							<input type="file" id="file-upload3" name="f3" accept=".jpg,.png,.gif" multiple>
						</div>  
			    	</div>
			  </div>
			  <a class="carousel-control-prev" href="#fileUpload" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#fileUpload" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
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