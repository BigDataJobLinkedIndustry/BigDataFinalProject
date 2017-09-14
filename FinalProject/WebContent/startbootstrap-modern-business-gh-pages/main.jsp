<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.bigdata.dto.ResultDTO"%>
<%@ page import="project.bigdata.dao.SearchDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>서울공공데이터를 활용한 빅데이터기반의 기계학습 상권분석</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/animate.min.css" />
<link rel="stylesheet" href="./css/ionicons.min.css" />
<link rel="stylesheet" href="./css/styles.css?v=<%=System.currentTimeMillis() %>" />

<!-- hihi -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

	
<!-- 메뉴클릭 이벤트 -->
<script type="text/javascript">
	function tabSetting() {
		// 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
		$('.tabPage').hide();
		$($('.current').find('a').attr('href')).show();

		// Tab 메뉴 클릭 이벤트 생성
		$('li').click(
				function(event) {
					var tagName = event.target.tagName; // 현재 선택된 태그네임
					var selectedLiTag = (tagName.toString() == 'A') ? $(
							event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
					var currentLiTag = $('li[class~=current]'); // 현재 current 클래그를 가진 탭
					var isCurrent = false;

					// 현재 클릭된 탭이 current를 가졌는지 확인
					isCurrent = $(selectedLiTag).hasClass('current');

					// current를 가지지 않았을 경우만 실행
					if (!isCurrent) {
						$($(currentLiTag).find('a').attr('href')).hide();
						$(currentLiTag).removeClass('current');

						$(selectedLiTag).addClass('current');
						$($(selectedLiTag).find('a').attr('href')).show();
					}

					return false;
				});
	}

	$(function() {
		// 탭 초기화 및 설정
		tabSetting();
	});
</script>
	
<!-- css영역 -->
<style>
/* 테이블버튼 */
button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #ffffff;
	padding: 10px 12px;
	background: -moz-linear-gradient(top, #f0f0f0 0%, #b8b8b8 25%, #6b6b6b 75%, #424242);
	background: -webkit-gradient(linear, left top, left bottom, from(#f0f0f0),
		color-stop(0.25, #b8b8b8), color-stop(0.75, #6b6b6b), to(#424242));
	-moz-border-radius: 15px;
	-webkit-border-radius: 15px;
	border-radius: 15px;
	border: 3px solid #171717;
	-moz-box-shadow: 0px 1px 3px rgba(000, 000, 000, 0.5), inset 0px 0px
		10px rgba(102, 072, 102, 0.7);
	-webkit-box-shadow: 0px 1px 3px rgba(000, 000, 000, 0.5), inset 0px 0px
		10px rgba(102, 072, 102, 0.7);
	box-shadow: 0px 1px 3px rgba(000, 000, 000, 0.5), inset 0px 0px 10px
		rgba(102, 072, 102, 0.7);
	text-shadow: 0px -1px 0px rgba(000, 000, 000, 0.4), 0px 1px 0px
		rgba(255, 255, 255, 0.3);
}

#three {
	background: #313131;
}

table {
	width: 60%;
	height: 100px;
	margin: auto;
	border-collapse:collapse;
    margin-bottom: 10px;
}

ul{
   list-style:none;
   }

li{
	float:left;
}

.mTheme1{
	text-align : center;
}

.html_text{
	border : 2px solid #444444;
	background-color : #FAFAFA; 
}

#trdar_cd_nm{
	text-align : center;
	color : black;
	width : 250px;
	height : 250px;
	font-size : 13px;
}

#columnchart {
	width : 150px;
	height : 200px;
}

#image_sajin {
	width : 150px;
	height : 250px; 
	float : center;
}

#chartdiv {
	width : 150px;
	height : 250px; 
}
#title_th{
	text-align : center;
	font-size : 20px;
}


form {
    width: 500px;
}

th, td {
    padding: 3px 10px;
}
.off-screen {
    display: none;
}
#nav {
    width: 500px;
    text-align: center;
}
#nav a {
    display: inline-block;
    padding: 3px 5px;
    margin-right: 10px;
    font-family:Tahoma;
    background: #ccc;
    color: #000;
    text-decoration: none;
}
#nav a.active {
    background: #333;
    color: #fff;
}

</style>
</head>

<body>
	<!-- 홈페이지 상단 메뉴바 -->
	<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#first"><i
					class="ion-ios-analytics-outline"></i>김반장</a>
			</div>
			<div class="navbar-collapse collapse" id="bs-navbar">
				<ul class="nav navbar-nav">
					<li><a class="page-scroll" href="#one"> Area Select Page </a></li>
					<li><a class="page-scroll" href="#two"> Service Select Page </a></li>
					<li><a class="page-scroll" href="#three"> Result Page </a></li>
			</div>
		</div>
	</nav>

	<!-- Header Carousel -->
	<header id="first">
		<div class="header-content">
			<div class="inner">
				<h1 class="cursive">TRADING-AREA ANALYSIS</h1>
				<h4>빅데이터를 기반으로 창업자에게 상권 정보 제공</h4>
				<hr>
				<a href="#one" class="btn btn-primary btn-xl page-scroll"> Let's
					Go </a>
			</div>
		</div>
	</header>

	<br>
	<!-- 지역 선택 영역 -->
	<section class="bg-primary" id="one">
		<!-- Page Content -->
		<div class="container">
			<!-- Marketing Icons Section -->
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
					<h2 class="margin-top-0 text-primary" align="left">
						관심지역을 선택해주세요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="tx1" align="right"> 지역 </span>
					</h2>
					<p class="text-faded">

					<table id="table2">
						<tr id="tr2">
							<td id="td2">
								<button value="11680" style="width:120px">강남구</button>
							</td>
							<td id="td2">
								<button value="11740" style="width:120px">강동구</button>
							</td>
							<td id="td2">
								<button value="11305" style="width:120px">강북구</button>
							</td>
							<td id="td2">
								<button value="11500" style="width:120px">강서구</button>
							</td>
							<td id="td2">
								<button value="11620" style="width:120px">관악구</button>
							</td>
						</tr>
						<tr id="tr2">
							<td id="td2">
								<button value="11215" style="width:120px">광진구</button>
							</td>
							<td id="td2">
								<button value="11530" style="width:120px">구로구</button>
							</td>
							<td id="td2">
								<button value="11545" style="width:120px">금천구</button>
							</td>
							<td id="td2">
								<button value="11350" style="width:120px">노원구</button>
							</td>
							<td id="td2">
								<button value="11320" style="width:120px">도봉구</button>
							</td>
						</tr>
						<tr id="tr2">
						<td id="td2">
								<button value="11230" style="width:120px">동대문구</button>
							</td>
							<td id="td2">
								<button value="11590" style="width:120px">동작구</button>
							</td>
							<td id="td2">
								<button value="11440" style="width:120px">마포구</button>
							</td>
							<td id="td2">
								<button value="11410" style="width:120px">서대문구</button>
							</td>
							<td id="td2">
								<button value="11650" style="width:120px">서초구</button>
							</td>
						</tr>
						<tr id="tr2">
						<td id="td2">
								<button value="11200" style="width:120px">성동구</button>
							</td>
							<td id="td2">
								<button value="11290" style="width:120px">성북구</button>
							</td>
							<td id="td2">
								<button value="11710" style="width:120px">송파구</button>
							</td>
							<td id="td2">
								<button value="11470" style="width:120px">양천구</button>
							</td>
							<td id="td2">
								<button value="11560" style="width:120px">영등포구</button>
							</td>
						</tr>
						<tr id="tr2">
						<td id="td2">
								<button value="11170" style="width:120px">용산구</button>
							</td>
							<td id="td2">
								<button value="11380" style="width:120px">은평구</button>
							</td>
							<td id="td2">
								<button value="11110" style="width:120px">종로구</button>
							</td>
							<td id="td2">
								<button value="11140" style="width:120px">중구</button>
							</td>
							<td id="td2">
								<button value="11260" style="width:120px">중랑구</button>
							</td>
						</tr>
					</table>
					</p>
					<a href="#two" class="btn btn-default btn-xl page-scroll"> NEXT
					</a> <br>
				</div>
			</div>
		</div>
	</section>
	<!-- 서비스업종 선택 영역 -->
	<section id="two">
		<div class="container">
			<!-- Marketing Icons Section -->
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
					<h2 class="margin-top-0 text-primary">
						관심업종을 선택하세요 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="tx2">업종</span>
					</h2>
					<div class="tabWrap">
						<ul class="tab_Menu">
							<li class="tabMenu current"><a href="#tabContent01"> 외식업</a></li>
							<li class="tabMenu"><a href="#tabContent02"> 서비스업 </a></li>
							<li class="tabMenu"><a href="#tabContent03"> 도소매업 </a></li>
						</ul>
						<div class="tab_Content_Wrap">
							<div id="tabContent01" class="tabPage">
								<table id="table3">
									<tr id="tr3">
										<td id="td3"><button value="CS100001" style="width:120px">한식음식점</button></td>
										<td id="td3"><button value="CS100003" style="width:120px">일식집</button></td>
										<td id="td3"><button value="CS100005" style="width:120px">분식집</button></td>
										<td id="td3"><button value="CS100007" style="width:120px">치킨집</button></td>
										<td id="td3"><button value="CS100010" style="width:120px">호프간이주점</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS100002" style="width:120px">중국집</button></td>
										<td id="td3"><button value="CS100004" style="width:120px">양식집</button></td>
										<td id="td3"><button value="CS100006" style="width:120px">패스트푸드점</button></td>
										<td id="td3"><button value="CS100008" style="width:120px">제과점</button></td>
										<td id="td3"><button value="CS100009" style="width:120px">커피음료</button></td>
									</tr>
								</table>
							</div>
							<div id="tabContent02" class="tabPage">
								<table id="table3">
									<tr id="tr3">
										<td id="td3"><button value="CS200010" style="width:120px">노래방</button></td>
										<td id="td3"><button value="CS200016" style="width:120px">미용실</button></td>
										<td id="td3"><button value="CS200001" style="width:120px">입시보습학원</button></td>
										<td id="td3"><button value="CS200005" style="width:120px">한의원</button></td>
										<td id="td3"><button value="CS200011" style="width:120px">PC방</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200018" style="width:120px">피부관리실</button></td>
										<td id="td3"><button value="CS200002" style="width:120px">외국어학원</button></td>
										<td id="td3"><button value="CS200015" style="width:120px">노인요양시설</button></td>
										<td id="td3"><button value="CS200012" style="width:120px">당구장</button></td>
										<td id="td3"><button value="CS200017" style="width:120px">네일숍</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200003" style="width:120px">예체능학원</button></td>
										<td id="td3"><button value="CS200021" style="width:120px">자동차수리</button></td>
										<td id="td3"><button value="CS200013" style="width:120px">골프연습장</button></td>
										<td id="td3"><button value="CS200014" style="width:120px">헬스클럽</button></td>
										<td id="td3"><button value="CS200007" style="width:120px">보육시설</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200022" style="width:120px">자동차미용</button></td>
										<td id="td3"><button value="CS200019" style="width:120px">여관업</button></td>
										<td id="td3"><button value="CS200009" style="width:120px">인테리어</button></td>
										<td id="td3"><button value="CS200006" style="width:120px">일반의원</button></td>
										<td id="td3"><button value="CS200020" style="width:120px">세탁소</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200008" style="width:120px">부동사중개업</button></td>
										<td id="td3"><button value="CS200004" style="width:120px">치과의원</button></td>
									</tr>
								</table>
							</div>
							<div id="tabContent03" class="tabPage">
								<table id="table3">
									<tr id="tr3">
										<td id="td3"><button value="CS300001" style="width:120px">슈퍼마켓</button></td>
										<td id="td3"><button value="CS300002" style="width:120px">편의점</button></td>
										<td id="td3"><button value="CS300003" style="width:120px">컴퓨터판매</button></td>
										<td id="td3"><button value="CS300004" style="width:120px">휴대폰</button></td>
										<td id="td3"><button value="CS300005" style="width:120px">정육점</button></td>
									</tr>
									<tr id="table3">
										<td id="td3"><button value="CS300006" style="width:120px">과일채소</button></td>
										<td id="td3"><button value="CS300007" style="width:120px">의류점</button></td>
										<td id="td3"><button value="CS300008" style="width:120px">패션잡화</button></td>
										<td id="td3"><button value="CS300009" style="width:120px">약국</button></td>
										<td id="td3"><button value="CS300010" style="width:120px">문구점</button></td>
									</tr>
									<tr id="table3">
										<td id="td3"><button value="CS300011" style="width:120px">화장품</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<br>
					<!-- 검색버튼 -->
					<div class="mButton1">
						<span class="gRight"> <a id="btn" href="#three"
							class="btn btn-default btn-xl page-scroll"> SEARCH </a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 결과화면 영역 -->
	<section class="container-fluid" id="three">
		<div class="row">
			<h2 class="text-center text-primary">Result Page</h2>
			<div class="media wow fadeInRight">
				<div class="mTheme1">
					<span class="iArr"></span><span class="txt">선택된 골목상권 검색결과입니다.<span id="totCntSpan"></span></span>
				</div>
				<div></div>
				<br>
				<table id="paginated">
					<form action="" id="setRows">
						<p>showing
							<input type="text" name="rowPerPage" value="20">
						</p>
					</form>
				
					<thead>
						<tr>
							<th id='title_th'> 상권이름 </th>
							<th id='title_th'> 상권사진 </th>
							<th id='title_th'> 예상매출 </th>
							<th id='title_th'> 창업위험도 </th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</section>

	<!-- 제작자 표시 영역 -->
	<aside class="bg-dark">
		<div class="container text-center">
			<div class="call-to-action">
				<h2 class="text-primary">Made by 김반장</h2>
			</div>
			<hr />
			<br>
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<div class="row">
						<h6 class="wide-space text-center">강영선, 김성준, 김충환, 조강흠</h6>

					</div>
				</div>
			</div>
		</div>
	</aside>

	<!--scripts loaded here -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.easing.min.js"></script>
	<script src="./js/wow.js"></script>
	<script src="./js/scripts.js"></script>	
	<script type="text/javascript" src="../startbootstrap-modern-business-gh-pages/js/drawingCharts.js?v=<%=System.currentTimeMillis() %>"></script>
	<script type="text/javascript" src="../startbootstrap-modern-business-gh-pages/js/select.js?v=<%=System.currentTimeMillis() %>"></script>
	
</body>
</html>