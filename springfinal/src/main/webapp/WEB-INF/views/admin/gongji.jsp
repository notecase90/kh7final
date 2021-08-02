<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
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
      <h1>공지 사항</h1>
      <div class="container">
	
  <table class="table">
    <thead>
	      <tr>
	        <th>번호</th>
	        <th>내용</th>
	        <th>닉네임</th>
	         <th>시간</th>
	      </tr>
    </thead>
    <tbody>
     <c:forEach var="gongjiVo" items="${gongjiList}">
	      <tr>
	        <td>${gongjiVo.gongjiNo}</td>
	        <td>${gongjiVo.gongjiContent}</td>
	        <td>${gongjiVo.adminName}</td>
	         <td>
	        <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value="${gongjiVo.gongjiTime}"/>
	        </td>
	      </tr>
       </c:forEach> 
    </tbody>
    
  </table>

</div>
	
	<form action="gongji" method="post">
		<input type="text" name="gongjiContent">
		<input type="hidden" name="${gongjiDto.adminNo}">
		<input type="submit" value="등록">
	</form>
	
    </div>
  </div>
  
</div>
 
	
              

</body>
</html> 

	
	
	
