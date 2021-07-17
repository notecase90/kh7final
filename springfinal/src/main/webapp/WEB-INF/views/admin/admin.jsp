<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
     integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
     crossorigin="anonymous">
  
  <script id="alltype-list-template" type="text/template">
	  <div> 
 		
 		<span><h1>#1</h1></span>
		<span>#2</span>
	  </div> 
 </script>
 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$(".alltype-btn").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/type-list",
				type:"get",
				dataType:"json",
				success:function(resp){
					$(".show-list").empty();
					for(var i=0; i<resp.length; i++){
						var template = $("#alltype-list-template").html();
						template = template.replace("#1", resp[i].allTypeIcon);
						template = template.replace("#2", resp[i].allTypeName);						
						$(".show-list").append(template);
 						
// 						var top = $("<div>");
// 						var icon = $("<span>").html(resp[i].allTypeIcon);
// 						var span = $("<span>").text(resp[i].allTypeName);
						
						
// 						top.append(icon);
// 						top.append(span);
						
// 						$(".show-list").append(top);
					}
				},
				error:function(){
					$(".show-list").text("불러오기 실패");
				}
				
			});
			
		});
	});
</script>

<script>
	
</script>
     
</head>

<a href="alltype-insert">타입등록 하러가기</a>
<button class="alltype-btn">타입 조회</button>
<div class="show-list">
	
</div>



