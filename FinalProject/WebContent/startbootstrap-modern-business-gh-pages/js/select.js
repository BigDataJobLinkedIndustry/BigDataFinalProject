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
					htmlText += "<tr class = 'html_text'>"
						+"<td id = 'trdar_cd_nm'>"+(index+1)+"."+item.trdar_cd_nm+"</td>"
						+"<td id = 'image_sajin'><img src="+url+item.trdar_cd+".png?raw=true></td>"
						+"<td id = 'columnchart'><div id='columnchart_values"+index+"'"+"</div></td>"
						+"<td id = 'chartdiv'><div id='chart_div"+index+"'"+"</div></td>"
						+"</tr>";
					showList(item,index);
				});
				//결과 리스트 출력
				$('#paginated tbody').html(htmlText);
				//건수 출력
				$("#totCntSpan").html("(" +s_return.length+ "건)");
			}
		});
		
		//페이징
		var $setRows = $('#setRows');

		$setRows.submit(function (e) {
		    e.preventDefault();
		    var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

		    var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
		    if (!rowPerPage) {
		        alert(zeroWarning);
		        return;
		    }
		    $('#nav').remove();
		    var $products = $('#paginated');

		    $products.before('<span id="nav">');


		    var $tr = $($products).find('tbody tr');
		    var rowTotals = $tr.length;
		    console.log(rowTotals);

		    var pageTotal = Math.ceil(rowTotals/ rowPerPage);
		    var i = 0;

		    for (; i < pageTotal; i++) {
		        $('<a href="#"></a>')
		                .attr('rel', i)
		                .html(i + 1)
		                .appendTo('#nav');
		    }

		    $tr.addClass('off-screen')
		            .slice(0, rowPerPage)
		            .removeClass('off-screen');

		    var $pagingLink = $('#nav a');
		    $pagingLink.on('click', function (evt) {
		        evt.preventDefault();
		        var $this = $(this);
		        if ($this.hasClass('active')) {
		            return;
		        }
		        $pagingLink.removeClass('active');
		        $this.addClass('active');

		        // 0 => 0(0*4), 4(0*4+4)
		        // 1 => 4(1*4), 8(1*4+4)
		        // 2 => 8(2*4), 12(2*4+4)
		        // 시작 행 = 페이지 번호 * 페이지당 행수
		        // 끝 행 = 시작 행 + 페이지당 행수

		        var currPage = $this.attr('rel');
		        var startItem = currPage * rowPerPage;
		        var endItem = startItem + rowPerPage;

		        $tr.css('opacity', '0.0')
		                .addClass('off-screen')
		                .slice(startItem, endItem)
		                .removeClass('off-screen')
		                .animate({opacity: 1}, 300);

		    });

		    $pagingLink.filter(':first').addClass('active');

		});
		$setRows.submit();
	});
});