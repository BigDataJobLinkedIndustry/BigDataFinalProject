$(function() {
	guCdChk = false;
	serviceCdChk = false;
	
	//구선택
	$("#td2 button").unbind().bind("click",function() {
		$("#td2 button").parent().removeClass("selected");
		$(this).parent().addClass("selected");
		console.log($(this).val());
		
		//선택 구 표시
		var guNM = $(this).text();
		console.log(guNM);
		$(this).attr("onclick","action_logging({_se_m3:\""+guNM+"\"})");
		$("#one h2").eq(0).find(".tx1").html($(this).html());
		
		//선택유무
		if($('#td2 button').hasClass("selected")){
    		guCdChk = true;
    	}else {
    		guCdChk = false;
    	}
	})
	
	
	//업종선택
	$("#td3 button").unbind().bind("click",function() {
		$("#td3 button").parent().removeClass("selected");
		$(this).parent().addClass("selected");
		console.log($(this).val());
		//선택된업종 표시
		var serviceNM = $(this).text();
		console.log(serviceNM);
		$(this).attr("onclick","action_logging({_se_m3:\""+serviceNM+"\"})");
		$("#two h2").eq(0).find(".tx2").html($(this).html());
		
		//선택유무
		if($('#td3 button').hasClass("selected")){
    		serviceCdChk = true;
    	}else {
    		serviceCdChk = false;
    	}
	})

	//상권검색
	$("#btn").click(function(){
		var htmlText="";
		var obj = new Object();
		obj.guCd = $("#td2.selected button").val();
		obj.serviceCd = $("#td3.selected button").val();
		
		var jsonData = JSON.stringify(obj);
		$.ajax({
			type : "post",
			url : "../selectAll.project",
			datatype : "json",
			data : {
				json : jsonData
				},
			success : function(data){
				//console.log(data.length);//listJson의 길이와 같은걸 보면 data로 Json 배열이 잘 들어오기는함
				var listJson = decodeURIComponent(data);//디코딩하여 변수에 담는다.
				var s_return = $.parseJSON(listJson);//controller에서 return된 JSON Text를 JSON Object로 변경
				
				for(var i=0; i<s_return.length; i++){
					htmlText +="<tr>"
						+"<td>"+s_return[i].trdar_cd+"</td>"
						+"<td>"+s_return[i].trdar_cd_nm+"</td>"
						+"<td>"+s_return[i].danger+"</td>"
						+"<td>"+s_return[i].sales_degree+"</td>"
						+"</tr>"
				}
				$("#trdarList").html(htmlText);
			}
			
		});
		
	});
});