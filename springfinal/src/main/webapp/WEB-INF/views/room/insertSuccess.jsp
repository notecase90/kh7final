<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${root}/resources/css/room/success.css">

    <div id="first">
        <div class="s" id="left">
        	 <img src="${root}/resources/img/test.jpg" style="width: 100%; height: 100%;">
            <div class="logo">
                <a href="#">
                    <img src="http://placehold.it/50x50?text=logo">
                </a>
            </div>
        </div>
        <div class="s" id="right">
        	<div class="host-box">
	        	<button type="button" id="host-btn"><a href="${root}"/host/host-home id="host-btn-a">나가기</a></button>
	        </div>
	        <div class="all-box">
	            <div class="comment-box">
	            	<h1 class="comment">축하드립니다!</h1>
	            </div>  
	            <div class="span-box">
	            	<span>에어비앤비 호스트가 되신 것을 환영합니다. 호스트는 에어비앤비의 중심이라 할 수 있습니다. 이제 호스팅의 매력을 경험해 보세요.</span>
	            </div>
            </div>
              
            <div class="footer">
	            <div id="footer-next-btn">
	                <button type="button" class="footer-btn"id="next-btn"><a href="${root}/host/host-home" style="color: white;">호스팅의 세계로</a></button>
	            </div>             
            </div>
        </div>
    </div>    

