<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css" integrity="undefined" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script id="content" type="text/template">
	  <div> 
 		
 		
		<span>#1 :</span>
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
			
			var user = $("<span>").text(messageObject.memberName);
			var time = $("<span>").text(messageObject.sendTime);
			var content = $("<span>").text(messageObject.message);
			var tag = $("<div>");
			
			tag.append(user).append(" : ").append(content);
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

.container {
  border: 2px solid #ff4567;;
  background-color: white;
  border-radius: 5px;
  padding: 10px;
  margin: 0 auto;
}


.darker {
  border-color: #ccc;
  background-color: #ddd;
}


.container::after {
  content: "";
  clear: both;
  display: table;
}

/* Style images */
.container img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

/* Style the right image */
.container img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.layout{
	margin:0 auto;
	text-align : center;
	
}
#user-input{
	width : 70%;
}
.logo-box{
            width: 100%;
             height: 10%;
             display: flex;
             justify-content: space-between;
        }
.fa-airbnb{
			
    		color: #ff4567;
		}
</style>
</head>
<body>
<div class="logo-box">
            <a href="${pageContext.request.contextPath}" style="text-decoration: none;">
                <i class="fab fa-airbnb fa-3x"></i>
            </a>
            
	</div>
<div class="container">
	<h2 style="text-align: center;">${chatName}</h2>
  <div id="message-area"></div>
  
  <div class="layout">
	 <input type="text" id="user-input"> <button id="send">전송</button>
</div>	
</div>
 
</body>