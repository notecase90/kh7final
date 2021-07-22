<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="wishVo" items="${list}">	
		<div>
			<br>
			사진 : ${wishVo.roomImg}
			<br>
			이름 : ${wishVo.roomName}
		</div>
	</c:forEach>
	
</body>
</html>