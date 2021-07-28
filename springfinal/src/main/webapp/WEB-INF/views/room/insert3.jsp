<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${root}/resources/css/room/inFacility.css">

    <div id="first">
        <div class="s" id="left">
            <div class="logo">
                <a href="#">
                    <i class="fab fa-airbnb fa-2x"></i>
                </a>
            </div>
            <div class="comment-box">
                <span class="comment">숙소에 있는 내부시설 개수를 알려주세요.</span>
            </div>
        </div>
        <div class="s" id="right">
            <form action="insert3" method="post">
                <div class="text-box">
                    <div class="group">
                        <label id="text-2"  class="font-size">침실 </label>
                        <input type="number" min="1" name="bedCount" required placeholder="침실 수" class="text">
                    </div>
                    <div class="group">
                        <label id="text-2"  class="font-size">욕실 </label>
                        <input type="number" min="1" name="bathCount" required placeholder="욕실 수" class="text">
                    </div>
                    <div class="group">
                        <label class="font-size">발코니</label>
                        <input type="number" min="1" name="balconyCount" required placeholder="발코니 수" class="text" id="text-3">
                    </div>    
                </div>  
                <div class="footer">
                    <div id="footer-back-btn">
                        <button type="button" class="footer-btn"id="back-btn"onclick="history.back()">뒤로</button>
                    </div>
                    <div id="footer-next-btn">
                        <button type="submit" class="footer-btn"id="next-btn">다음</button>
                    </div>
                </div>
            </form>  
        </div>
    </div>