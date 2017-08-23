$(function() {
	guCdChk = false;
	serviceCdChk = false;
	
	//구선택
	$("#td2 button").unbind().bind("click",function() {
		$("#td2 button").parent().removeClass("selected");
		$(this).parent().addClass("selected");
		
		//선택 구 표시
		var guNM = $(this).text();
		$(this).attr("onclick","action_logging({_se_m3:\""+guNM+"\"})");
		$(".container .head1").eq(0).find(".tx1").html($(this).html());
		
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
		
		//선택된업종 표시
		var serviceNM = $(this).text();
		$(this).attr("onclick","action_logging({_se_m3:\""+serviceNM+"\"})");
		$(".container .head2").eq(0).find(".tx2").html($(this).html());
		
		//선택유무
		if($('#td3 button').hasClass("selected")){
    		serviceCdChk = true;
    	}else {
    		serviceCdChk = false;
    	}
	})

	//상권검색
	$(".mBtn2").click(function(){
		var guCd = $("#td2.selected button").val();
		var serviceCd = $("#td3.selected button").val();
		var insertCd = {"guCd":guCd, "serviceCd":serviceCd};
		//console.log(guCd);
		//console.log(serviceCd);
		//console.log(insertCd);
		
		$.ajax({
			type : "post",
			url : "../selectAll.project",
			datatype : "json",
			data : insertCd,			
			success : function(data){
				
			}
			
		});
		
	});
});