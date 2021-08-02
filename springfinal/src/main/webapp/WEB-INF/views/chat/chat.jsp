<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" integrity="undefined" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script id="content" type="text/template">
	  <div> 
 		
 		
		<span>#1 : </span>
		<span>#2</span>
	  </div> 
 </script>
<script>
	$(function(){
		var chatName = "${chatName}";
		$.ajax({
			url :"${pageContext.request.contextPath}/message-list",
			data:{
					chatName : chatName
				 },
			type:"get",
			dataType:"json",
			success:function(resp){
			for(var i =0; i<resp.length; i++){
				var template = $("#content").html();				
// 				template = template.replace("#1", resp[i].sendTime);
				template = template.replace("#1", resp[i].memberName);
				template = template.replace("#2", resp[i].message);
				$("#message-area").append(template);
				
			 }
			console.log(resp);
		   }
		});
		var uri = "ws://localhost:8080/project/chat";
		window.socket = new WebSocket(uri);
		
		
		
		console.log(window.socket);
		window.socket.onopen = function(){
			
		
			var message = {chatType:1, chatName:"${chatName}"};
			var json = JSON.stringify(message);
			window.socket.send(json);
		};
		window.socket.onclose = function(){
	
		};
		window.socket.onerror = function(){
	
		};
		window.socket.onmessage = function(message){

			
			var messageObject = JSON.parse(message.data);//String --> JSON Object
			console.log(messageObject);
			
			var user = $("<span>").css("font-size", "1.3rem").text(messageObject.memberName);
			var time = $("<span>").text(messageObject.sendTime);
			var content = $("<p>").text(messageObject.message);
			var tag = $("<div>");
			
			tag.append(user).append(time).append(content);
			$("#message-area").append(tag);
			
			$("#user-input").val("");
		};
	
		$("#send").click(function(){
			if(!window.socket) return;
			
			
			
			var text = $("#user-input").val();
			if(!text) return;
			
			var message = {chatType:2, chatName:"${chatName}", content:text};
			var json = JSON.stringify(message);			
			window.socket.send(json);
			console.log(message);
		});
		
	});

	$(window).on("beforeunload", function(){
		if(!window.socket) return;
		
		var message = {chatType:3, chatName:"${chatName}"};
		var json = JSON.stringify(message);
		window.socket.send(json);
	});
	
	
</script>
<style>
	.wrapper {
	   display: grid;
	   place-items: center;
	   min-height: 100vh;
	}
	.layout{
	   width:30%;
	   height:700px;
	   border: solid 1px #e1e3e9;
	}
	#user-input{
	   width:25%;	
	}
	#send{
		width:5%;
	}
	.bottom{
		width:100%;
		display:inline;
		
	}
	
</style>
<body>
<div class="wrapper">
	<h1>${chatName}</h1>

	<div class="justify-content-center layout">
		<div id="message-area"></div>
	</div>
	
	<div class="bottom">
		<input type="text" id="user-input">
		<button id="send">전송</button>
	</div>
</div>
</body>