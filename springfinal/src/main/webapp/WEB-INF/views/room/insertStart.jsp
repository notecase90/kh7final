<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${root}/resources/css/room/start.css">

    <div id="first">
        <div class="s" id="left">
	        <img src="${root}/resources/img/test.jpg" style="width: 100%; height: 100%;">
        </div>
        <div class="s" id="right">
	        <div class="host-box">
	        	<button type="button" id="host-btn"><a href="${root}"/host/host-home id="host-btn-a">나가기</a></button>
	        </div>
        	<div class="all-box">
	            <div class="comment-box">
	            	<h1 class="comment">간단한 절차로 호스팅 시작하기</h1>
	            </div>  
	            <div class="span-box">
	            	<span>에어비앤비 호스트가 되어보세요. 에어비앤비에서 모든 과정을 도와드립니다.</span>
	            </div>
            </div>
            <div class="footer">
	            <div id="footer-next-btn">
	                <button type="button" class="footer-btn"id="next-btn"><a href="${root}/room/insert" style="color: white;">시작하기</a></button>
	            </div>             
            </div>
        </div>
    </div>    