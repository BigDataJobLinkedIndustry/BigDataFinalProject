/**
 * 
 */
var trdarCmprParam = {
	svcIndutyCd : 1,
	trdarNo : 1,
	stdrYmCd : "201606"
};

function openTrdarCmpr(chk) {
	// 보고서 템플릿을 가져온다.
	var tmpVal = new Date().getTime();
	var trdarTemplate = $.ajax({
		type : "GET", 
		url : "/sgmc/trdarcmpr/get_trdarcmpr.do?t=" + tmpVal,
		async : false,
	}).responseText;
	trdarTemplate = $(trdarTemplate);
	//console.log(trdarTemplate);
	
	
	trdarTemplate.find(".jsBtnCReport ").unbind().bind("click",function(){
		$(".lCReport").hide();
		$(this).next(".lCReport").show();
	});
	
	trdarTemplate.find(".jsBtnCancel").unbind().bind("click",function(){
		$(".lCReport").hide();
	});
	
	trdarTemplate.find("#cmprTrdarReport").unbind().bind("click",function(){
			
		var trdarNo = $(this).parent().parent().find("#trdarNo").val();
		var trdarSeCd = "A";
		var svcIndutyCd = $(this).parent().parent().find("input[name=svcIndutyCd]").val();
		var upperSvcIndutyCd = $(this).parent().parent().find("input[name=upperSvcIndutyCd]").val();
		var stdrYmCd = $("#SVC_STDR_YM_CD").val();

		// 닫기 초점
		$(this).parent().parent().parent().attr("class", 'chkCmpr' );
		$(this).parent().parent().attr("index", $(this).parent().parent().index());
		
		
		if(!svcIndutyCd) {
			alert("업종을 선택해주세요.");
			return;
		}
		
		// 태깅 - 20161018
		$(this).attr("onclick", "action_logging({_se_m5:\"골목상권 리포트 보기\"})");
		setTimeout(function(){
			$('#cmprTrdarReport').attr("onclick","");
			$('#cmprTrdarReport').removeAttr("onclick");
		}, 1000);
		
		trdarReprtOpen(trdarNo,trdarSeCd,svcIndutyCd,upperSvcIndutyCd,stdrYmCd);
	});
	
	
	trdarTemplate.find("h4").unbind().bind("click",function(){
		
		if ( $(this).parent().hasClass("selected"))
		{
			$(this).parent().removeClass("selected");
		}
		else
		{
			$(this).parent().addClass("selected");
			$('html, body').animate({scrollTop: $(document).height()}, 450);
		}	
		
	});
	
	trdarTemplate.find(".jsBtnConfirm").unbind().bind("click",function(){
		
		var svcIndutyCd = $(this).parent().parent().find("#indutyCombo").val();
		var trdarNo = $(this).parent().parent().find("#trdarNo").val();
		var cmprIdx = $(this).parent().parent().parent().parent().index();
		
		setTrderCmpr(trdarNo, svcIndutyCd, "confirm", cmprIdx);
	});

	
	trdarTemplate.find("#indutyCombo").unbind().bind("change",function(){
		$(this).parent().parent().find("#selectindutyCombo").html($(this).find("option:selected").text());
	});
	
	trdarTemplate.find("#upperIndutyCombo").unbind().bind("change",function(){
		$(this).parent().parent().find("#selectupperIndutyCombo").html($(this).find("option:selected").text());
		
		$.ajax({
			context : this,
			url : "/sgmc/trdarcmpr/get_svc_induty.json",
			type : "post",
			datatype : "json",
			data : {
				upperSvcIndutyCd : $(this).val(),
			},
			success : function(data) {
				var subCombo = $(this).parent().parent().find("#indutyCombo");
				$(this).parent().parent().find("#indutyCombo option").remove();
				
				
				for(var i=0; i < data.length; i++)
				{
					var row = data[i];
					if(i==0) {
						$(this).parent().parent().find("#selectindutyCombo").html(row.svcIndutyCdNm);
					}
					subCombo.append("<option value='" +row.svcIndutyCd + "'>" +row.svcIndutyCdNm+ "</option>");
				}
			}
		});

	});
	trdarTemplate.find("#upperIndutyCombo").focusin(function(){
		$(this).parent().parent().find("#selectupperIndutyCombo").css("text-decoration","underline");
	});
	trdarTemplate.find("#upperIndutyCombo").focusout(function(){
		$(this).parent().parent().find("#selectupperIndutyCombo").css("text-decoration","none");
	});

	trdarTemplate.find("#indutyCombo").focusin(function(){
		$(this).parent().parent().find("#selectindutyCombo").css("text-decoration","underline");
	});
	trdarTemplate.find("#indutyCombo").focusout(function(){
		$(this).parent().parent().find("#selectindutyCombo").css("text-decoration","none");
	});
	
	trdarTemplate.find("#trdarCmprBtn").unbind().bind("click",function(){
		
		// 태깅 - 20161018
		$(this).attr("onclick","action_logging({_se_m5:\""+$(this).text()+"})\"");
		setTimeout(function(){
			$("#trdarCmprBtn").attr("onclick","");
			$("#trdarCmprBtn").removeAttr("onclick");
		}, 1000);
		
		
		for(var i=0; i < $("#trdarCmprDiv input[name=svcIndutyCd]").length; i++)
		{
			var val = $("#trdarCmprDiv input[name=svcIndutyCd]").eq(i).val();
			if(val == "") {
				var msg = $("#trdarCmprDiv input[name=trdarNm]").eq(i).val();
				msg+="의 업종을 선택해주세요";
				alert(msg);
				return;
			}else{
		    	var urlStep = 0;    
				var urlOne = 0;       
				var urlArea = 0;
				var urlInduty = 0;
				var allData = {"signguCd":null, "adstrdCd":null, "trdarNo":null, "svcIndutyLclasCd":null, "svcIndutyMlsfcCd":null};
				
				urlStep = $(location).attr('href').indexOf("get_step_trdar_anals");
				urlOne = $(location).attr('href').indexOf("get_one_stop_trdar_cmpr");    
				urlArea = $(location).attr('href').indexOf("get_area_thema_trdar");    
				urlInduty = $(location).attr('href').indexOf("get_induty_thema_trdar");    
				
		       	if(urlStep > 0) { 
		       		initBiCtz("ODummy1081", allData);	
		    	}else if(urlOne > 0){
		    		allData.trdarNo =  $("#trdarCmprDiv #trdarNo").eq(i).val();
		    		allData.svcIndutyLclasCd = $("#trdarCmprDiv #upperSvcIndutyCd").eq(i).val();
		    		allData.svcIndutyMlsfcCd = $("#trdarCmprDiv #svcIndutyCd").eq(i).val();
		    		initBiCtz("ODummy1115", allData);	
		    	}else if(urlArea > 0){
		    		allData.trdarNo = $("#trdarCmprDiv #trdarNo").eq(i).val();
		    		allData.svcIndutyLclasCd =$("#trdarCmprDiv #upperSvcIndutyCd").eq(i).val();
		    		allData.svcIndutyMlsfcCd = $("#trdarCmprDiv #svcIndutyCd").eq(i).val();
		    		initBiCtz("ODummy1173", allData);	
		    	}else if(urlInduty > 0){
		    		allData.trdarNo =$("#trdarCmprDiv #trdarNo").eq(i).val();
		    		allData.svcIndutyLclasCd = $("#trdarCmprDiv #upperSvcIndutyCd").eq(i).val();
		    		allData.svcIndutyMlsfcCd = $("#trdarCmprDiv #svcIndutyCd").eq(i).val();
		    		initBiCtz("ODummy1201", allData);	
		    	}	    		
			}
		}
		
		getTrderCmprList();
	});
	
	
	
	trdarTemplate.find("#closeBtn, #cmprBtn, .iClose2").unbind().bind("click",function(){
		$(".mLayer3").hide();
		$(".modalBg").hide();
		
		if(winScrollTop != null) {
			 $(window).scrollTop(winScrollTop);
			 winScrollTop = null;
		}
		var id = $(this).attr('id');
		var classNm = $(this).attr('class');
		
		if(id=='closeBtn' || classNm=='iClose2'){
			//$('.mList4.t2 .rt .mBtn2').eq(0).focus();
			$('#trderCmprId_' + trdarCmprParam.trdarNo).focus();
		} else if(id=='cmprBtn'){
			$('#trdarCmprDiv .mSMakeup').find('h4 a').focus();
		}		
	});
	
	trdarTemplate.find("#cmprBtn").unbind().bind("click",function(){
		$(".mLayer3").hide();
		$(".modalBg").hide();
		//$("#trdarCmprBtn").attr("tabindex", -1).focus();
		
		// 태깅 - 20161018
		$(this).attr("onclick","action_logging({_se_m5:\""+$(this).text()+"})\"");
		setTimeout(function(){
			$("#cmprBtn").attr("onclick","");
			$("#cmprBtn").removeAttr("onclick");
		}, 1000);
				
		
		$('#trdarCmprDiv .mSMakeup').find('h4 a').focus();
	});
	
	
	
	
	$("#trdarCmprDiv").empty().append(trdarTemplate);// 템플릿으로 채운다.

	
	
	if(chk=="cmpr") {
		$(".mSMakeup .con2").removeClass("hidden");		
	}else{
		$(".mSMakeup .con2").hasClass("hidden");	
	}
	$(".mSMakeup .con2").hasClass("hidden");
	Custom.init();
}

function getTrderCmprList() {

	$.ajax({
		context : this,
		url : "/sgmc/trdarcmpr/get_cmpr_list.json",
		type : "post",
		datatype : "json",
		data : {
			stdrYmCd : trdarCmprParam.stdrYmCd
		},
		success : function(list) {
			openTrdarCmpr("cmpr");
		}

	});
}


function setTrderCmpr(trdarNo, svcIndutyCd, confirm, idx) {
			
	// 태깅 - 20161018
	$("#trderCmprId_"+trdarNo).attr("onclick", "action_logging({_se_m5:\"골목상권 비교하기\"})");
	setTimeout(function(){
		$("#trderCmprId_"+trdarNo).attr("onclick","");
		$("#trderCmprId_"+trdarNo).removeAttr("onclick");
	}, 1000);
			
	
	if(!confirm) {
		if($("#trdarCmprDiv input[name=trdarNm]").length >= 4) {
			alert("비교함은 4개까지 등록 가능합니다.");
			return;
		}
	}
	
	trdarCmprParam.trdarNo = trdarNo;
	trdarCmprParam.svcIndutyCd = svcIndutyCd;
	trdarCmprParam.idx = idx;
	
	$.ajax({
		context : this,
		url : "/sgmc/trdarcmpr/set_trdarcmpr.json",
		type : "post",
		datatype : "json",
		data : {
			trdarNo : trdarCmprParam.trdarNo,
			svcIndutyCd : trdarCmprParam.svcIndutyCd
		},
		success : function(list) {
			
			openTrdarCmpr();
			
			if(!confirm) {
				
				winScrollTop = $(window).scrollTop();
				$("#trdarCmprConfrm, #modalBg").show();
				$("#trdarCmprConfrm").attr("tabindex", -1).focus();
				
				$("#tcTrdarNm").html($("#trdarCmprDiv .tit").last().html());				
			}
			$('.jsBtnCReport').eq(trdarCmprParam.idx).focus();
		}

	});
}

function deleteTrdarcmpr(trdarNo) {
	
	trdarCmprParam.trdarNo = trdarNo;
	
	$.ajax({
		context : this,
		url : "/sgmc/trdarcmpr/delete_trdarcmpr.json",
		type : "post",
		datatype : "json",
		data : {
			trdarNo : trdarCmprParam.trdarNo
		},
		success : function(list) {
			openTrdarCmpr();
			var elLength = $("#trdarCmprDiv .smakeupCon .txt.jsBtnCReport").length;
			if(elLength > 1){
				$("#trdarCmprDiv .smakeupCon .txt.jsBtnCReport").eq(elLength-1).focus();
			} else if(elLength==1) {
				$("#trdarCmprDiv .smakeupCon .txt.jsBtnCReport").eq(0).focus();
			}
			
		}

	});
}



