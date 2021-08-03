<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<%
	int reviewNo = 21;
	int reviewRoomNo = 8;
	int reviewMember = 22;
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- bootstrap 이용을 위한 CSS의존성 등록-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="undefined" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

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
<style>
.btn-box{
	display: flex;
    justify-content: space-between;
}
.star{
	margin: 0 3px;
}
#star-box{
	display: flex;
	justify-content: center;
	padding-bottom: 20px;
}
</style>

 <div class="container-fluid">

        <div class="jumbotron text-center mt-3">
            <h1 style="word-break: keep-all;">리뷰를 수정해주세요</h1>
            <p>리뷰는 본인외엔 수정/삭제가 불가합니다</p>
        </div>
        
        

        <div class="row mt-5">
            <div class="col-md-6 offset-sm-3">

<form action="edit" method="post" >
	<input type="hidden" name="reviewNo" value="<%=reviewNo%>">
	<input type="hidden" name="reviewRoomNo" value="<%=reviewRoomNo %>">
	<div id="star-box">
		<img src="${root}/resources/img/star-on.png" style="width:30px;height:30px;" id="star1" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star2" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star3" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star4" class="star">
		<img src="${root}/resources/img/star-off.png" style="width:30px;height:30px;" id="star5" class="star">
	</div>	
	
	<div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" style="padding-bottom: 4px;">
                                <i class="far fa-edit"></i>
                            </span>
                        </div>
                        <input type="text" name="reviewContent" value="${reviewDto.reviewContent}" class="form-control" required autocomplete="off">
                        <input type="hidden" name="reviewMember" value="<%=reviewMember %>">
						<input type="hidden" name="reviewStar" value="1" id="review_star">
                    </div>

                    <div class="btn-box">
                        <button type="reset" class="btn btn-secondary ">Reset</button>
                        <input type="submit" class="btn btn-primary " value="수정">
                    </div>
                    

                </form>

            </div>
        </div>

    </div>