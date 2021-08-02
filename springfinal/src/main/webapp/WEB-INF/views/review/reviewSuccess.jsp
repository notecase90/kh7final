<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- bootstrap 이용을 위한 CSS의존성 등록-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="undefined" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script> 
<style>
.btn-box{
	display: flex;
    justify-content: space-between;
}
</style>
    <div class="container-fluid">

        <div class="jumbotron text-center mt-3">
            <h1 style="word-break: keep-all;">리뷰등록이 완료되었습니다. 감사합니다!</h1>
        </div>

        <div class="row mt-5">
            <div class="col-md-6 offset-sm-3">

                    <div class="btn-box">
                   		 <a href="${root}">
                   		 	<button type="button" class="btn btn-secondary ">메인</button>
                   		 </a>                
                        	<a href="${root}/room/list">
                        		<button type="button" class="btn btn-primary ">다른숙소보러가기 </button>
                        	</a>
                       
                    </div>
            </div>
        </div>

    </div>
