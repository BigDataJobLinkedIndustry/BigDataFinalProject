<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.bigdata.dto.ResultDTO" %>
<%@ page import="project.bigdata.dao.SearchDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script>
	$(document).ready(function () {
		$("button").toggle(
		function (){$(this).css("background-color", "LightGray")},
		function (){$(this).css("background-color", "GhostWhite")}
	);
	});
</script>

<style>
#th1 { font-size : 30px; }
#td1 { font-size : 12px; }
#th2 { font-size : 30px; border : 2px solid}
#td2 { font-size : 30px; border : 2px solid}
#table2 { border : 2px solid; text-align : center;}
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    
	<title>서울시 상권분석</title>
	
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
</head>

<body>

    <!-- 위에 메뉴바 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"> 상권 분석 </a>
            </div>
            </div>
    </nav>

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- 슬라이드 사진 -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Two');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Three');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header><br>
<input type="hidden" id= "SVC_STDR_YM_CD" value='201704'>

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
            
            <table>
            	<tr>
            		<th id = "th1"> 상권분석 </th>
            		<td id = "td1" rowspan = "2"> 원하시는 상권의 조건으로 검색하여 분석 할 수 있습니다. </td>
            	</tr>
            	<tr>
            		<td> </td>
            		<td> </td>
            	</tr>
            </table>
            
            <h3> 관심지역을 선택하세요 </h3>
            <table id = "table2">
            <tr id = "tr2">
            	<td id = "td2"> <button name= style = "background-color : GhostWhite">강남구</button></td>
            	<td id = "td2"> <button style = "width : 136px;background-color : GhostWhite">강동구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">강북구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">강서구</button></td>
            	<td id = "td2"> <button style = "width : 136px;background-color : GhostWhite">관악구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">광진구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">구로구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">금천구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">노원구</button></td>
            </tr>
            <tr id = "tr2">
            	<td id = "td2"> <button style = "background-color : GhostWhite">도봉구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">동대문구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">동작구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">마포구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">서대문구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">서초구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">성동구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">성북구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">송파구</button></td>
            </tr>
            <tr id = "tr2">
            	<td id = "td2"> <button style = "background-color : GhostWhite">양천구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">영등포구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">용산구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">서초구</button></td>
            	<td id = "td2"> <button style = "width : 136px;background-color : GhostWhite">성동구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">은평구</button></td>
            	<!-- <td id = "td2"> <button style = "background-color : GhostWhite">종로구</button></td> -->
            	<td><a href = "#" onclick="return false;">종로구<span class="ico"></span></a> </td>
            	<td id = "td2"> <button style = "width : 106px;background-color : GhostWhite">중구</button></td>
            	<td id = "td2"> <button style = "background-color : GhostWhite">중랑구</button></td>
            </tr>
            </table><br>
            
            
            <h3> 관심업종을 선택하세요 </h3>
            <<button> click </button>
            <table id = "#ttt">
            	<tr>
            		<td> <button>외식업</button> </td>
            		<td> <button>서비스업</button> </td>
            		<td> <button>도소매업</button> </td>
            	</tr>
            </table>

         	<ul>
         		<li><a href="<%= request.getContextPath() %>/selectAll.project">상권검색</a>
         	</ul>
            <!-- <form action="./result.jsp" method="post" enctype="multipart/form-data">
				<input type="submit" value="상권검색">
			</form> -->
      
			</div>
		</div>
	</div>
            
</body>
</html>