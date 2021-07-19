<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>내부시설</h2>


<form action="insert3" method="post">
    <div>
		<label>침실 수</label>
		<input type="number" min="1" name="bedCount" required placeholder="침실 수">
	</div>
	<div>
		<label>욕실 수</label>
		<input type="number" min="1" name="bathCount" required placeholder="욕실 수">
	</div>
	<div>
		<label>발코니 수</label>
		<input type="number" min="1" name="balconyCount" required placeholder="발코니 수">
	</div>
		<input type="submit" value="다음">
  	 	<input type="reset" value="취소">
</form>    
