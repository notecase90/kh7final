<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/side.css">      
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>     
        
        
    </head>
    
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리 메뉴</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}/gongji">공지 사항</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}/alltype-insert">타입 등록/조회</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}/option-insert">옵션 등록/조회</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}/host-list">호스트 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="${pageContext.request.contextPath}/admin-logout">로그아웃</a>
                 
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                       
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}">Home</a></li>
                              
                            
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">내용</h1>
                   
                </div>
            </div>
        </div>
       
    </body>