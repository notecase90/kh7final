<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- bootstrap 이용을 위한 CSS의존성 등록-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="undefined" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>
.btn-box{
	display: flex;
    justify-content: space-between;   
}
.ok{
	color: forestgreen;
}
.fas{
	padding: 5px;
}
.far{
	padding: 5px;
}
.check-box{
	display: flex;
	justify-content: center;
}
</style>      
        
<div class="container-fluid">

        <div class="jumbotron text-center mt-3">
            <h1 style="word-break: keep-all;">호스트계정을 위해 이메일 인증을 해주세요</h1>
            <p>인증번호를 보내드립니다</p>
        </div>
        
        <div class="check-box">
            <i class="fas fa-check-circle fa-2x ok"></i>
            <i class="fas fa-check-circle fa-2x "></i>
            <i class="fas fa-check-circle fa-2x "></i>
        </div>

        <div class="row mt-5">
            <div class="col-md-6 offset-sm-3">

                <form action="certEmail" method="post" class="form">

                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" style="padding-bottom: 4px;">
                                <i class="far fa-envelope-open"></i>
                            </span>
                        </div>
                        <input type="text" name="email"placeholder="이메일 주소" class="form-control" required autocomplete="off">
                    </div>

                    <div class="btn-box">
                        <button type="reset" class="btn btn-secondary ">Reset</button>
                        <input type="submit" class="btn btn-primary " value="인증 요청">
                    </div>
                    

                </form>

            </div>
        </div>

    </div>