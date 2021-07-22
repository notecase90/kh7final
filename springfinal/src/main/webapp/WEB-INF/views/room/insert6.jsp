<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>ajax로 업로드 후 다운로드로 preview 보이기</h1>

<input type="file" name="f" accept=".jpg,.png,.gif" multiple>
<br>
<img id="preview" width="200">
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

<button><a href="insert_success">완료</a></button>