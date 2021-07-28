<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
        *{
            position: relative;
            width: 100%;
            height: 100%;
        }
        body{
            margin: 0px;
        }
        .logo{
            display: inline;
            left: 30px ;
            box-sizing: border-box; 
        }        
        .logo-box{
            width: 100%;
             height: 10%;
        }
        .content{
            height: 90%;
            width: 100%;
            display: flex;
        }
        .fab{
            width: 100px;
            font-size: 35px;
        }
        .list{
            width: 60%;
            display: flex;
    		flex-direction: column;
        }
        .map{
            background-color: burlywood;
            width: 40%;
        }
</style>   

<div class="logo-box">
	<div class="logo">
            <a href="#" style="text-decoration: none;">
                <i class="fab fa-airbnb"></i>
            </a>
	</div>
</div>

<div class="content">
	<div class="list">
		<c:forEach var="roomDto" items="${list}">
			<div>
				<a href="detail/${roomDto.roomNo}">
					숙소명 : ${roomDto.roomName}</a>
			</div>
		</c:forEach>
	</div>
	<!-- 
	<div>
		<a href="insert">등록하기</a>
	</div>	
	 -->

	
	<div class="map">

	</div>
</div>
