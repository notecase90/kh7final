<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>${chatName}</h1>
<hr>


<input type="text" id="user-input">
<button id="send">전송</button>

<div id="message-area">

</div>




<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

  <script id="content" type="text/template">
	  <div> 
 		
 		<p>#1</p>
		<span>#2 : </span>
		<span>#3</span>
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
				template = template.replace("#1", resp[i].sendTime);
				template = template.replace("#2", resp[i].memberName);
				template = template.replace("#3", resp[i].message);
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