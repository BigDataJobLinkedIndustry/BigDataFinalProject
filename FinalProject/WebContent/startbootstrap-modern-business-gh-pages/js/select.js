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
		var obj = new Object();
		obj.guCd = $("#td2.selected button").val();
		obj.serviceCd = $("#td3.selected button").val();
		
		var jsonData = JSON.stringify(obj);
		var htmlText = "";
		$.ajax({
			type : "post",
			url : "../selectAll.project",
			datatype : "json",
			data : {
				json : jsonData
				},			
			success : function(data){
				var s_return = $.parseJSON(data);
				
				$.each(s_return, function(index, item){
					//console.log(item.trdar_cd);
					//console.log(item.trdar_cd_nm);
					
					//console.log(index);
					htmlText += "<tr width = 200 height = 200>"
						+"<td>"+item.trdar_cd_nm+"</td>"
						+"<td><div id='columnchart_values"+index+"'"+"</div></td>"
						+"<td><div id='chart_div"+index+"'"+"</div></td>"
						+"</tr>";
					
					showList(item,index);
				});
				$("#trdarList").html(htmlText);	
			}
			
		});
		
	});
});