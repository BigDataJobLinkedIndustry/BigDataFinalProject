/**
 * 
 */
function initEvent() {
	trdarCmprParam.stdrYmCd = $("#SVC_STDR_YM_CD").val();
	openTrdarCmpr();
	fn_getRPCT110304_7();
		
}	
	
function fn_getRPCT110303(arr) {
	
	function fn_getRPCT110309() {
		$.ajax({
			context : this,
			url : "/sgmc/customanals/getRPCT110309.json",
			type : "post",
			datatype : "json",
			data : {
				signguCdArr : arr
			},
			success : function(data) {

				for (var i = 0; i < data.length; i++) {
					var row = data[i];

				}
			}
		});
	}
	
	function fn_getRPCT110304_7() {
		
		var arr1 = new Array(); // 관심업종
		var arr2 = new Array(); // 관심지역
		
		
		if($("#indutySel.mList3 li a").parent(".selected").length > 0) {
			arr1 = $("#indutySel.mList3 li a").parent(".selected").find("a").attr("val");	
		}
		
		
		$(".mList3.t4 li a").parent(".selected").each(function() {
			arr2[arr2.length] = $(this).attr("signguCd");
		});
		
		if(arr1 == "") {
			arr1 = "";
		}
		
		if(arr2.length == 0) {
			arr2 = "";
		}
		
	
	}
	
	// 상권검색
	function openTrdarList(idx) {
		
		var arr1 = new Array();
		var arr2 = new Array();
		
		if($("#indutySel.mList3 li a").parent(".selected").length > 0) {
			arr1[arr1.length] = $("#indutySel.mList3 li a").parent(".selected").find("a").attr("val");
			
			var code = $("#indutySel.mList3 li a").parent(".selected").find("a").attr("val");
			
			trdarListParam.svcIndutyCd = code;
			
			if(code.indexOf("CS10") == 0) {
				trdarListParam.upperSvcIndutyCd = "CS100000";	
			}else if(code.indexOf("CS20") == 0) {
				trdarListParam.upperSvcIndutyCd = "CS200000";
			}else if(code.indexOf("CS30") == 0) {
				trdarListParam.upperSvcIndutyCd = "CS300000";
			}
			
		}
		
		
		$(".mList3.t4 li a").parent(".selected").each(function() {
			arr2[arr2.length] = $(this).attr("signguCd");
		});
		
		
		if(arr1.length == 0) {
			alert("업종을 선택하세요.");
			return;
		}			
		if(arr2.length == 0) {
			alert("한개 이상의 지역을 선택하세요.");
			return;
		}
		
		var pageIndexVal = $("#pageIndex").val();
		if(!pageIndexVal) {
			pageIndexVal = 1;
		}else {
			pageIndexVal = idx;
		}
		
		var trdarTemplate = $.ajax({
			type : "post",
			data : {
				svcIndutyCdArr : arr1,
				signguCdArr : arr2,				
				svcStdrYmCd : $("#SVC_STDR_YM_CD").val(),
				beginSimilrIndutyStorCo : getValue($("#BEGIN_SIMILR_INDUTY_STOR_CO")),
				endSimilrIndutyStorCo : getValue($("#END_SIMILR_INDUTY_STOR_CO")),
				beginFlpopCo : getValue($("#BEGIN_FLPOP_CO")),
				endFlpopCo : getValue($("#END_FLPOP_CO")),
				beginRepopCo : getValue($("#BEGIN_REPOP_CO")),
				endRepopCo : getValue($("#END_REPOP_CO")),
				beginWrcPopltnCo : getValue($("#BEGIN_WRC_POPLTN_CO")),
				endWrcPopltnCo : getValue($("#END_WRC_POPLTN_CO")),
				pageIndex : pageIndexVal,
				searchFnName : "openTrdarList"
			},
			url : "/sgmc/customanals/getRPCT110309.do",
			async : false,
		}).responseText;
		var template = openTrdarListTemplate(trdarTemplate);
		
		$("#trdarList").empty().append(template);// 템플릿으로 채운다.
		$("#totCntSpan").empty().htmlEmp("(" +$("#TotalRecordCount").val()+ "건)");

		
		for(var i=0; i<$("#TotalRecordCount").val(); i++){
			var orangeLth = $("#trdarList .mChart1.orange").eq(i).find('.selected').length;
			var blueLth = $("#trdarList .mChart1.blue").eq(i).find('.selected').length;
			var greenLth = $("#trdarList .mChart1.green").eq(i).find('.selected').length;
			
			$("#trdarList .mChart1.orange").eq(i).attr("title", "활성도지표 ; "+orangeLth);
			$("#trdarList .mChart1.blue").eq(i).attr("title", "성장성지표 ; "+blueLth);
			$("#trdarList .mChart1.green").eq(i).attr("title", "안정성지표 ; "+greenLth);
		}
		
		
		Custom.init();
	}
	
	function getValue(o)
	{
		if ( o.attr("value") == o.attr('title') )
		{
			return "";
		}else{
			return o.attr("value");
		}
	}	
}

$(document).ready(function(){
	var indutyStepChk = false;
	var signguStepChk = false;
	
	// 탭 클릭
	$("#upjongMainTab li a").click(function(){
		var idx = $(this).parent().index();
		$("#upjongMainTab li").removeClass("selected");
		$("#upjongMainTab li").eq(idx).addClass("selected");
		
		$(".tabupjong").addClass("hidden");
		$(".tabupjong").eq(idx).removeClass("hidden");
		
	});;
	
	
	// 상권검색
	$(".mBtn2").click(function(){
		
		// 태깅 - 20161018$('#oneRepView #upperIndutyCombo option:selected').text()
		
		$(this).attr("onclick", "action_logging({_se_m5:\""+$(this).text()+"\")");
		setTimeout(function(){
			$('.jsStepList .mBtn2').attr("onclick","");
			$('.jsStepList .mBtn2').removeAttr("onclick");
		}, 1000);
		
		openTrdarList(1);	

		var signguCd = $(".mList3.t4 li.selected").attr('signgucd');
		var lisLclasCd = $("#indutySel li.selected").parent().parent().attr('id');
		var lisMlsflCd = $("#indutySel li.selected").children().attr('val');
		var allData = {"signguCd":signguCd, "adstrdCd":null, "trdarNo":null, "svcIndutyLclasCd":lisLclasCd, "svcIndutyMlsfcCd":lisMlsflCd};
		
		if(signguStepChk == true && indutyStepChk == true){
			initBiCtz('ODummy1077', allData);
		}
	});
	
	// 관심업종 선택
	$("#indutySel.mList3 li a").click(function(){
		
		$("#indutySel.mList3 li a").parent().removeClass("selected");
		$("#indutySel.mList3 li a").removeAttr("title", "");
		$(this).parent().addClass("selected");
		$(this).attr("title", "선택됨");
		
		// 태깅 추가 - 20161017
		$(this).parent().parent().parent().find('a').attr("onclick","");
		$(this).parent().parent().parent().find('a').removeAttr("onclick");
		var selectInduty = $(this).text();
		$(this).attr("onclick","action_logging({_se_m3:\""+selectInduty+"\"})");
		
		$(".mList6 dt").eq(0).find(".tx1").html($(this).html());
		
    	if($('#indutySel li').hasClass("selected")){
    		indutyStepChk = true;
    	}else {
    		indutyStepChk = false;
    	}
	});
	
	// 관심업종 선택(삭제)
	$(".mList6 dt").eq(0).find(".iClose").click(function(){
		$("#indutySel.mList3 li a").parent().removeClass("selected");
		$(".mList6 dt").eq(0).find(".tx1").html("선택해주세요");
	});
	
	
	// 행정동 선택
	$(".mList3.t4 li a").click(function(){
		
		var signguCdArr = new Array();
		$(".mList3.t4 li a").parent(".selected").each(function() {
			
			signguCdArr[signguCdArr.length] = $(this).attr("signguCd");
		});
		

    	if($(this).parent().hasClass("selected")){
    		signguStepChk = true;
    	}else {
    		signguStepChk = false;
    	}			
		
		//$(".mList3.t4 li a").parent(".selected").length
		var txt = $(".mList3.t4 li a").parent(".selected").find("a").eq(0).text();
		
		var selectCnt = $(".mList3.t4 li a").parent(".selected").length;
		if(selectCnt > 1) {
			txt += "(외 " + (selectCnt -1) + "건)";
		}
		$(".mList6 dt").eq(1).find(".tx1").html(txt);
		
		if( $(".mList3.t4 li a").parent(".selected").length > 0) {
			fn_getRPCT110303(signguCdArr);	
		}else{
			$("#RPCT110303 tbody").empty();
			$(".mList6 dt").eq(1).find(".tx1").html("선택해주세요");
		}
		
	});
	
	// 행정동 선택(삭제)
	$(".mList6 dt").eq(1).find(".iClose").click(function(){
		
		$(".mList3.t4 li a").parent(".selected").removeClass("selected");
		$("#RPCT110303 tbody").empty();
		$(".mList6 dt").eq(1).find(".tx1").html("선택해주세요");
						
	});
	
	
	$(".mList3 li a").click(function(){
		fn_getRPCT110304_7();
	});
	
	$(".jsText").blur(function(){
		if ( $(this).attr("value") != "" )
		{
			var numPattern = /([^0-9])/;
			var numPattern = $(this).attr("value").match(numPattern);
		
			if(numPattern != null){
				
				if(getValue($(this)) != "") {
				
					alert("숫자만 입력해 주세요!");
					$(this).attr("value", "");
					$(this).focus();
				}
				
			}
			
		}
	});
	
	
	
	//원하는 상권의 조건은? 
	$("#delbtn3").click(function(){

		$("#BEGIN_SIMILR_INDUTY_STOR_CO").val("").blur();
		$("#END_SIMILR_INDUTY_STOR_CO").val("").blur();
		$("#BEGIN_FLPOP_CO").val("").blur();
		$("#END_FLPOP_CO").val("").blur();
		$("#BEGIN_REPOP_CO").val("").blur();
		$("#END_REPOP_CO").val("").blur();
		$("#BEGIN_WRC_POPLTN_CO").val("").blur();
		$("#END_WRC_POPLTN_CO").val("").blur();
		
	});
	
	stdrYm();
	
	initEvent();
});

	