$(function() {
	guCdChk = false;
	serviceCdChk = false;
	
	//구선택
	$("#td2 button").unbind().bind("click",function() {
		//클릭한 것 구분
		$("#td2 button").parent().removeClass("selected");
		$(this).parent().addClass("selected");
		
		//선택 구 표시
		var guNM = $(this).text();
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
		//클릭한 것 구분
		$("#td3 button").parent().removeClass("selected");
		$(this).parent().addClass("selected");
		
		//선택된업종 표시
		var serviceNM = $(this).text();
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
		//상권 사진 url
		var url = "https://github.com/BigDataJobLinkedIndustry/ProjectImage/blob/master/images/"
		
		//서버와 데이터 송수신
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

					//결과를 반복해서 출력
					htmlText += "<tr>"
						+"<td>"+item.trdar_cd_nm+"</td>"
						+"<td><img src="+url+item.trdar_cd+".png?raw=true>"+"</td>"
						+"<td><div id='columnchart_values"+index+"'"+"</div></td>"
						+"<td><div id='chart_div"+index+"'"+"</div></td>"
						+"</tr>";
					
					showList(item,index);
				});
				//결과 리스트 출력
				$("#trdarList").html(htmlText);	
				
				//건수 출력
				$("#totCntSpan").html("(" +s_return.length+ "건)");
				
			}
			
		});
		
	});
});