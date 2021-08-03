$(function(){
		
var geocoder = new kakao.maps.services.Geocoder();
geocoder.addressSearch('서울특별시', function(result, status) {
  
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        console.log(result[0].x);
        console.log(result[0].y);
        
        var key = "B4XmQQunYeblIH0aCEJgMU3xVZBMSMmfGNEyrgw3yW36SPd7mOmsU1W2IEmYwjaHiazJwtEfsdQgad0XKLMrkA==";
        
        $(function(){
	        $.ajax({
				url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList",
				data:{
					ServiceKey : key,
					numOfRows : 3,
					pageNo : 1,
					MobileOS : "ETC",
					MobileApp : "AppTest",
					arrange : "A",
					contentTypeId : 15,
					mapX : result[0].x,
					mapY : result[0].y,
					radius : 2000,
					listYN : "Y"	
				},
				type:"get",
				dataType:"xml",
				success:function(resp){
					var xmlData = $(resp).find("item");
					
					var listLength = xmlData.length;
					if(listLength) {
						var contentStr = "";
						var contentImgUrl = "";
						$(xmlData).each(function(index,data){		
							contentStr = "<img class='img-responsive img-rounded' src='"+$(this).find("firstimage").text()+"' style='width:300px;height:300px;'><br><br>"+"<h3>"+$(this).find("title").text()+"</h3>"+"<span class='text'>"+$(this).find("addr1").text()+"</span><br><br>";
// 							$("#carousel"+[index]).remove();
							$("#carousel"+[index]+1).append(contentStr);			
						});
						
					}
				}
			});	
        })
        
        
        
     }

});
	
	geocoder.addressSearch('부산광역시 해운대구', function(result, status) {
	  
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        console.log(result[0].x);
	        console.log(result[0].y);
	        
	        var key = "B4XmQQunYeblIH0aCEJgMU3xVZBMSMmfGNEyrgw3yW36SPd7mOmsU1W2IEmYwjaHiazJwtEfsdQgad0XKLMrkA==";
	        
	        $(function(){
		        $.ajax({
					url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList",
					data:{
						ServiceKey : key,
						numOfRows : 3,
						pageNo : 1,
						MobileOS : "ETC",
						MobileApp : "AppTest",
						arrange : "A",
						contentTypeId : 15,
						mapX : result[0].x,
						mapY : result[0].y,
						radius : 2000,
						listYN : "Y"	
					},
					type:"get",
					dataType:"xml",
					success:function(resp){
						var xmlData = $(resp).find("item");
						
						var listLength = xmlData.length;
						if(listLength) {
							var contentStr = "";
							var contentImgUrl = "";
							$(xmlData).each(function(index,data){		
								contentStr = "<img class='img-responsive img-rounded' src='"+$(this).find("firstimage").text()+"' style='width:300px;height:300px;'><br><br>"+"<h3>"+$(this).find("title").text()+"</h3>"+"<span class='text'>"+$(this).find("addr1").text()+"</span><br><br>";
//	 							$("#carousel"+[index]).remove();
								$("#carousel"+[index]+2).append(contentStr);			
							});
							
						}
					}
				});	
	        })
    
	     }
	});
});