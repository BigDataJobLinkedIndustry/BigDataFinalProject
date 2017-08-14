<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.bigdata.dto.ResultDTO" %>
<%@ page import="project.bigdata.dao.SearchDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서울시 상권분석</title>
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body class="main">
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
                <a class="navbar-brand" href="./index.jsp"> 서울시 상권 분석 </a>
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
 	<div id="body">
 		<div class="bg">
 		
 			<div class="mTitle11">
 				<h3 class="iAnalysis1">단계별 상권검색</h3>
 				<p class="txt">원하시는 상권의 조건으로 검색하여 분석 할 수 있습니다.</p>
 			</div>
 			
 			<!-- 단계 선택 -->
 			<div class="mList6 jsStepList">
 				<dl>
 				
 				<!-- 당신의 관심업종은? -->
 				<dt class="selected">
 					<strong class="tit"><a herf="###" id="bodyOne"><span class="ico">1단계</span>관심업종을 선택하세요.</a></strong>
 					<div class="rt">
 						<span class="tx1"></span>
 						<a href="###" class="iClose">선택항목 삭제</a>
 					</div>
 				</dt>
 				
 				<dd class="selected">
 					<div class="mTab1 t3 jsTabStep">
 						<ul>
 						<li class="selected"><a herf="###" title="선택됨">외식업</a></li>
 						<li><a href="###" tabindex="-1" id="menu_2">서비스업</a></li>
 						<li><a href="###" tabindex="-1" id="menu_3">도소매업</a></li>
 						</ul>
 					</div>
 					<!-- 업종, 구 선택 -->
 					
 					<!-- 업종 -->
 					<div id="indutySel" class="mList3 sep">
 						<!-- 외식업 -->
 						<div id="CS100000" class="co co1">
 							<h4 class="blind">외식업</h4>
 							<ul class="noline">
 							<li class="first i1"><a herf="###" val="CS100001">한식음식점<span class="ico"></span></a></li>
 							<li class="i2"><a href="###" val="CS100003">일식집<span class="ico"></span></a></li>
 							<li class="i3"><a href="###" val="CS100005">분식집<span class="ico"></span></a></li>
							<li class="i4"><a href="###" val="CS100007">치킨집<span class="ico"></span></a></li>
							<li class="i5"><a href="###" val="CS100010">호프간이주점<span class="ico"></span></a></li>
							</ul>
							<ul>
							<li class="first i6"><a href="###" val="CS100002">중국집<span class="ico"></span></a></li>
							<li class="i7"><a href="###" val="CS100004">양식집<span class="ico"></span></a></li>
							<li class="i8"><a href="###" val="CS100006">패스트푸드점<span class="ico"></span></a></li>
							<li class="i9"><a href="###" val="CS100008">제과점<span class="ico"></span></a></li>
							<li class="i10"><a href="###" val="CS100009" class="tabLast">커피음료<span class="ico"></span></a></li>				
 							</ul>
 						</div>
 						
 						<!-- 서비스업 -->
						<div id="CS200000" class="co co2 hidden">
							<h4 class="blind">서비스업</h4>
							<ul class="noline">
							<li class="first j1"><a href="###" val="CS200010">노래방<span class="ico"></span></a></li>
							<li class="j2"><a href="###" val="CS200016">미용실<span class="ico"></span></a></li>
							<li class="j3"><a href="###" val="CS200001">입시보습학원<span class="ico"></span></a></li>
							<li class="j4"><a href="###" val="CS200005">한의원<span class="ico"></span></a></li>
							<li class="j5"><a href="###" val="CS200011">PC방<span class="ico"></span></a></li>
							</ul>
							<ul>
							<li class="first j6"><a href="###" val="CS200018">피부관리실<span class="ico"></span></a></li>
							<li class="j7"><a href="###" val="CS200002">외국어학원<span class="ico"></span></a></li>
							<li class="j8"><a href="###" val="CS200015">노인요양시설<span class="ico"></span></a></li>
							<li class="j9"><a href="###" val="CS200012">당구장<span class="ico"></span></a></li>
							<li class="j10"><a href="###" val="CS200017">네일숍<span class="ico"></span></a></li>
							</ul>
							<ul>
							<li class="first j11"><a href="###" val="CS200003">예체능학원<span class="ico"></span></a></li>
							<li class="j12"><a href="###" val="CS200021">자동차수리<span class="ico"></span></a></li>
							<li class="j13"><a href="###" val="CS200013">골프연습장<span class="ico"></span></a></li>
							<li class="j14"><a href="###" val="CS200014">헬스클럽<span class="ico"></span></a></li>
							<li class="j15"><a href="###" val="CS200007">보육시설<span class="ico"></span></a></li>
							</ul>
							<ul>
							<li class="first j16"><a href="###" val="CS200022">자동차미용<span class="ico"></span></a></li>
							<li class="j17"><a href="###" val="CS200019">여관업<span class="ico"></span></a></li>
							<li class="j18"><a href="###" val="CS200009">인테리어<span class="ico"></span></a></li>
							<li class="j19"><a href="###" val="CS200006">일반의원<span class="ico"></span></a></li>
							<li class="j20"><a href="###" val="CS200020">세탁소<span class="ico"></span></a></li>
							</ul>
							<ul>
							<li class="first j21"><a href="###" val="CS200008">부동산중개업<span class="ico"></span></a></li>
							<li class="j22"><a href="###" val="CS200004" class="tabLast">치과의원<span class="ico"></span></a></li>
							<li class="j23"></li>
							<li class="j24"></li>
							<li class="j25"></li>
							</ul>
						</div>
						
 						<!-- 도소매업 -->
						<div id="CS300000" class="co co3 hidden">
							<h4 class="blind">도소매업</h4>
							<ul class="noline">
							<li class="first k1"><a href="###" val="CS300001">슈퍼마켓<span class="ico"></span></a></li>
							<li class="k2"><a href="###" val="CS300002">편의점<span class="ico"></span></a></li>
							<li class="k3"><a href="###" val="CS300003">컴퓨터판매수리<span class="ico"></span></a></li>
							<li class="k4"><a href="###" val="CS300004">휴대폰<span class="ico"></span></a></li>
							<li class="k5"><a href="###" val="CS300005">정육점<span class="ico"></span></a></li>
							</ul>
							<ul>
							<li class="first k6"><a href="###" val="CS300006">과일채소<span class="ico"></span></a></li>
							<li class="k7"><a href="###" val="CS300007">의류점<span class="ico"></span></a></li>
							<li class="k8"><a href="###" val="CS300008">패션잡화<span class="ico"></span></a></li>
							<li class="k9"><a href="###" val="CS300009">약국<span class="ico"></span></a></li>
							<li class="k10"><a href="###" val="CS300010">문구점<span class="ico"></span></a></li>
							</ul>
							<ul>
							<li class="first k11"><a href="###" val="CS300011" class="tabLast">화장품<span class="ico"></span></a></li>
							<li class="k12"></li>
							<li class="k13"></li>
							<li class="k14"></li>
							<li class="k15"></li>
							</ul>
						</div>
						<!-- //도소매업 -->
 						
 						
 						
 					</div> 				
 				</dd>
 				
 				</dl>
 			</div>
 			
 			
 		</div>
 	</div>
    
    
    
</body>
</html>