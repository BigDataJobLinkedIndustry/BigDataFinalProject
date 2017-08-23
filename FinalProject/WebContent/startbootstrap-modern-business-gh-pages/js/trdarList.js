/**
 * 
 */
var trdarListParam = {
	svcIndutyCd : "",
	upperSvcIndutyCd : "",
	stdrYmCd : "201606"
};

function setTrderCmprList(trdarCd) {
	
	if(trdarListParam.svcIndutyCd == "") {
		setTrderCmpr(trdarCd);	
	}else{
		setTrderCmpr(trdarCd, trdarListParam.svcIndutyCd);
	}
	
}

function openTrdarListTemplate(trdarTemplate)
{
	
	trdarTemplate = $(trdarTemplate);
	
	trdarTemplate.find(".trdarReport").unbind().bind("click",function(){ 
		
		$(".mLayer1, .modalBg").hide();
		$(".lCReport").hide();
		$(this).next(".lCReport").show();
	
		if(trdarListParam.upperSvcIndutyCd != "") {
			$(this).next().find("#upperIndutyCombo").val(trdarListParam.upperSvcIndutyCd);	
			$(this).next().find("#upperIndutyCombo").trigger('change');
		}
		
		$(this).parent().parent().parent().parent().attr("class", "chkList");
		$(this).attr('index', $('#trdarList .trdarReport').index($(this)));
		
	});
	
	trdarTemplate.find(".jsBtnConfirm").unbind().bind("click",function(){

		// 태깅 - 20161018
		$(this).attr("onclick", "action_logging({_se_m5:\"골목상권 리포트 보기\"})");
		setTimeout(function(){
			$('.jsBtnConfirm').attr("onclick","");
			$('.jsBtnConfirm').removeAttr("onclick");
		}, 1000);
		
		var trdarNo = $(this).parent().parent().find("#trdarNo").val();
		var trdarSeCd = "A";
		var svcIndutyCd = $(this).parent().parent().find("#indutyCombo").val();
		var upperSvcIndutyCd = $(this).parent().parent().find("#upperIndutyCombo").val();
		var stdrYmCd = $("#SVC_STDR_YM_CD").val();
		
		trdarReprtOpen(trdarNo,trdarSeCd,svcIndutyCd,upperSvcIndutyCd,stdrYmCd);
		$(".lCReport").hide();
	});
	
	
	
	
	trdarTemplate.find(".jsBtnCancel").unbind().bind("click",function(){
		$(".lCReport").hide();
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
				
				if(trdarListParam.svcIndutyCd != "") {
					subCombo.val(trdarListParam.svcIndutyCd);	
					subCombo.trigger('change');
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
	
	Custom.init();
	
	return trdarTemplate;
}
