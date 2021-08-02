<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
     integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
     crossorigin="anonymous">
     
 <script id="option-list-template" type="text/template">
	  <div> 
 		<div>
			<c
			<label>  
					 <input type="checkbox" name="optionNo" value="optionNo" class="checked">
					 optionIcon
					 <span>optionName<span> <br> 
			</label>
		</div>
	  </div> 

 </script>
 </head>
  
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
				$.ajax({
				url:"${pageContext.request.contextPath}/option-list",
				type:"get",
				dataType:"json",
				success:function(resp){
					$(".show-list").empty();
					for(var i=0; i<resp.length; i++){
						var check = $("input[type=checkbox]").val();
						var template = $("#option-list-template").html();
						template = template.replace("optionIcon", resp[i].optionIcon);
						template = template.replace("optionName", resp[i].optionName);
						template = template.replace("optionNo", resp[i].optionNo);
						$(".show-list").append(template);
						
					}
				},
				error:function(){
					$(".show-list").text("불러오기 실패");
				}
			});
			
				$(".checkDelete").click(function(){
	
				var arr = [];
				var check = $(".checked").val();
				$("input[name=optionNo]:checked").each(function(idx){
					arr.push("input[name=optionNo]:checked:eq('+idx+')").next().val();
				});
					alert(arr);
				$.ajax({
					url : "${pageContext.request.contextPath}/option-delete",
					data :	{ arr : arr },
					success : function(data){
						if(data = 1){
							alert("삭제성공");
						}
						
					}				
				});
			});	
			
	});
	</script>

<style>

  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #000;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }

</style>
</head>
<body>
  <div id="page-wrapper">
  <!-- 사이드바 -->
   <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="${pageContext.request.contextPath}">홈</a>
      </li>
      <li><a href="${pageContext.request.contextPath}/gongji">공지 사항</a></li>
      <li><a href="${pageContext.request.contextPath}/host-list">호스트 관리</a></li>
      <li><a href="${pageContext.request.contextPath}/alltype-insert">타입 등록/조회</a></li>
      <li><a href="${pageContext.request.contextPath}/option-insert">옵션 등록/조회</a></li>
      <li><a href="${pageContext.request.contextPath}/admin-logout">로그아웃</a></li>
  
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1>옵션 등록/조회</h1>
      <div class="container">
      <div class="show-list">	</div>
	<form action="option-insert" method="post">
		<input type="text" name="optionName" placeholder="name">
		<input type="text" name="optionIcon" placeholder='<i class="블라블라"></i>'>
		<input type="submit" value="등록"> 
	</form>
	
	<input type="button" value="삭제" class="checkDelete">
</div>
	
	
	
    </div>
  </div>
  
</div>


</body>
</html>