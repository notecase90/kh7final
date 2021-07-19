<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>편의시설</h2>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/data/room/facility",
		type:"get",
		dataType:"json",
		success:function(resp){
			for(var i=0; i<resp.length; i++) {
				$(".facility").append(
						"<label for='fa-1'>"+resp[i].optionName+"</label><input type='checkbox' id='fa-1' name='optionNo' value="+resp[i].optionNo+">"+resp[i].optionNo+"<br>"
						);
			}
		}
		
	});	
		
	
})
</script>
<form class="facility" action="insert2" method="post">

<input type="submit" value="다음" style="width:100%">
</form>

