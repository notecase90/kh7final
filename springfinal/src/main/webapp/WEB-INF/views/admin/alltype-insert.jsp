<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <head>  
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
     integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
     crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  </head>
 <script id="alltype-list-template" type="text/template">
	  <div> 
 		<div>
			<label>  
					<input type="checkbox" name="allTypeNo" value="allTypeNo">
					 allTypeIcon <span>allTypeName<span> <br> 
			</label>
		</div>
	  </div> 
 </script> 

 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
	
			$.ajax({
				url:"${pageContext.request.contextPath}/type-list",
				type:"get",
				dataType:"json",
				success:function(resp){
					$(".show-list").empty();
					for(var i=0; i<resp.length; i++){
						var template = $("#alltype-list-template").html();
						template = template.replace("allTypeIcon", resp[i].allTypeIcon);
						template = template.replace("allTypeName", resp[i].allTypeName);
						template = template.replace("allTypeNo", resp[i].allTypeNo);
						$(".show-list").append(template);

					}
				},
				error:function(){
					$(".show-list").text("불러오기 실패");
				}
				
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
       <h1>타입 조회/등록</h1>
      <div class="container">

<div class="show-list"></div>
<form action="alltype-insert" method="post">
	<input type="text" name="allTypeName" placeholder="name">
	<input type="text" name="allTypeIcon" placeholder='<i class="블라블라"></i>'>
	<input type="submit" value="등록"> 
</form>
	</div>
	
	
	
    </div>
  </div>
  
</div>
 
	
              

</body>
</html> 




