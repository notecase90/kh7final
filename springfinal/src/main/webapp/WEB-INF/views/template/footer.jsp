<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    		</section>
		<footer class="text-black">
		<div class="container footer-img">
			<h5>KHAcademy Final-Project &copy;</h5>
			<hr>
			세션 ID : ${pageContext.session.id} , 
			회원 번호 : ${memberNo} , 
			로그인 : ${not empty memberNo},
			호스트 번호 : ${hostNo}
		</div>
		</footer>
	</main>
</body>
</html>