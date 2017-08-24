<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.bigdata.dto.ResultDTO"%>
<%@ page import="project.bigdata.dao.SearchDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>상권분석</title>
<meta name="description"
	content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Codeply">
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/animate.min.css" />
<link rel="stylesheet" href="./css/ionicons.min.css" />
<link rel="stylesheet" href="./css/styles.css" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

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
}
</style>
<script type="text/javascript"
	src="../startbootstrap-modern-business-gh-pages/js/resultList.js"></script>
<script type="text/javascript"
	src="../startbootstrap-modern-business-gh-pages/js/select.js"></script>

</head>

<body>

	<!-- 위에 메뉴바 -->
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
					class="ion-ios-analytics-outline"></i>TEAM NAME</a>
			</div>
			<div class="navbar-collapse collapse" id="bs-navbar">
				<ul class="nav navbar-nav">
					<li><a class="page-scroll" href="#one"> Area Select Page </a>
					</li>
					<li><a class="page-scroll" href="#two"> Service Select
							Page </a></li>
					<li><a class="page-scroll" href="#three"> Result Page </a></li>
			</div>
		</div>
	</nav>

	<!-- Header Carousel -->
	<header id="first">
		<div class="header-content">
			<div class="inner">
				<h1 class="cursive">TITLE</h1>
				<h4>If you select area and service then we offer a chart</h4>
				<hr>
				<a href="#one" class="btn btn-primary btn-xl page-scroll"> Let's
					Go </a>
			</div>
		</div>
	</header>

	<br>
	<section class="bg-primary" id="one">
		<!-- Page Content -->
		<div class="container">
			<!-- Marketing Icons Section -->
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
					<h2 class="margin-top-0 text-primary">
						관심지역을 선택해주세요.<span class="tx1">선택해주세요</span>
					</h2>
					<p class="text-faded">

					<table id="table2">
						<tr id="tr2">
							<td id="td2">
								<button value="11680">강남구</button>
							</td>
							<td id="td2">
								<button value="11740">강동구</button>
							</td>
							<td id="td2">
								<button value="11305">강북구</button>
							</td>
							<td id="td2">
								<button value="11500">강서구</button>
							</td>
							<td id="td2">
								<button value="11620">관악구</button>
							</td>
							<td id="td2">
								<button value="11215">광진구</button>
							</td>
							<td id="td2">
								<button value="11530">구로구</button>
							</td>
							<td id="td2">
								<button value="11545">금천구</button>
							</td>
							<td id="td2">
								<button value="11350">노원구</button>
							</td>
						</tr>
						<tr id="tr2">
							<td id="td2">
								<button value="11320">도봉구</button>
							</td>
							<td id="td2">
								<button value="11230">동대문구</button>
							</td>
							<td id="td2">
								<button value="11590">동작구</button>
							</td>
							<td id="td2">
								<button value="11440">마포구</button>
							</td>
							<td id="td2">
								<button value="11410">서대문구</button>
							</td>
							<td id="td2">
								<button value="11650">서초구</button>
							</td>
							<td id="td2">
								<button value="11200">성동구</button>
							</td>
							<td id="td2">
								<button value="11290">성북구</button>
							</td>
							<td id="td2">
								<button value="11710">송파구</button>
							</td>
						</tr>
						<tr id="tr2">
							<td id="td2">
								<button value="11470">양천구</button>
							</td>
							<td id="td2">
								<button value="11560">영등포구</button>
							</td>
							<td id="td2">
								<button value="11170">용산구</button>
							</td>
							<td id="td2">
								<button value="11380">은평구</button>
							</td>
							<td id="td2">
								<button value="11110">종로구</button>
							</td>
							<td id="td2">
								<button value="11140">중구</button>
							</td>
							<td id="td2">
								<button value="11260">중랑구</button>
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

	<section id="two">
		<div class="container">
			<!-- Marketing Icons Section -->
			<div class="row">
				<div
					class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
					<h2 class="margin-top-0 text-primary">
						관심업종을 선택하세요 <span class="tx2">선택해주세요</span>
					</h2>
					<div class="tabWrap">
						<ul class="tab_Menu">
							<li class="tabMenu current"><a href="#tabContent01"> 외식업
							</a></li>
							<li class="tabMenu"><a href="#tabContent02"> 서비스업 </a></li>
							<li class="tabMenu"><a href="#tabContent03"> 도소매업 </a></li>
						</ul>
						<div class="tab_Content_Wrap">
							<div id="tabContent01" class="tabPage">
								<table id="table3">
									<tr id="tr3">
										<td id="td3"><button value="CS100001">한식음식점</button></td>
										<td id="td3"><button value="CS100003">일식집</button></td>
										<td id="td3"><button value="CS100005">분식집</button></td>
										<td id="td3"><button value="CS100007">치킨집</button></td>
										<td id="td3"><button value="CS100010">호프간이주점</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS100002">중국집</button></td>
										<td id="td3"><button value="CS100004">양식집</button></td>
										<td id="td3"><button value="CS100006">패스트푸드점</button></td>
										<td id="td3"><button value="CS100008">제과점</button></td>
										<td id="td3"><button value="CS100009">커피음료</button></td>
									</tr>
								</table>
							</div>
							<div id="tabContent02" class="tabPage">
								<table id="table3">
									<tr id="tr3">
										<td id="td3"><button value="CS200010">노래방</button></td>
										<td id="td3"><button value="CS200016">미용실</button></td>
										<td id="td3"><button value="CS200001">입시보습학원</button></td>
										<td id="td3"><button value="CS200005">한의원</button></td>
										<td id="td3"><button value="CS200011">PC방</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200018">피부관리실</button></td>
										<td id="td3"><button value="CS200002">외국어학원</button></td>
										<td id="td3"><button value="CS200015">노인요양시설</button></td>
										<td id="td3"><button value="CS200012">당구장</button></td>
										<td id="td3"><button value="CS200017">네일숍</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200003">예체능학원</button></td>
										<td id="td3"><button value="CS200021">자동차수리</button></td>
										<td id="td3"><button value="CS200013">골프연습장</button></td>
										<td id="td3"><button value="CS200014">헬스클럽</button></td>
										<td id="td3"><button value="CS200007">보육시설</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200022">자동차미용</button></td>
										<td id="td3"><button value="CS200019">여관업</button></td>
										<td id="td3"><button value="CS200009">인테리어</button></td>
										<td id="td3"><button value="CS200006">일반의원</button></td>
										<td id="td3"><button value="CS200020">세탁소</button></td>
									</tr>
									<tr id="tr3">
										<td id="td3"><button value="CS200008">부동사중개업</button></td>
										<td id="td3"><button value="CS200004">치과의원</button></td>
									</tr>
								</table>
							</div>
							<div id="tabContent03" class="tabPage">
								<table id="table3">
									<tr id="tr3">
										<td id="td3"><button value="CS300001">슈퍼마켓</button></td>
										<td id="td3"><button value="CS300002">편의점</button></td>
										<td id="td3"><button value="CS300003">컴퓨터판매수리</button></td>
										<td id="td3"><button value="CS300004">휴대폰</button></td>
										<td id="td3"><button value="CS300005">정육점</button></td>
									</tr>
									<tr id="table3">
										<td id="td3"><button value="CS300006">과일채소</button></td>
										<td id="td3"><button value="CS300007">의류점</button></td>
										<td id="td3"><button value="CS300008">패션잡화</button></td>
										<td id="td3"><button value="CS300009">약국</button></td>
										<td id="td3"><button value="CS300010">문구점</button></td>
									</tr>
									<tr id="table3">
										<td id="td3"><button value="CS300011">화장품</button></td>
									</tr>
								</table>
							</div>
						</div>
					</div>


					<div class="mButton1">
						<span class="gRight"> <a id="btn" href="#three"
							class="btn btn-default btn-xl page-scroll"> SEARCH </a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="container-fluid" id="three">
		<div class="row">
			<h2 class="text-center text-primary">Result Page</h2>
			<div class="media wow fadeInRight">
				<div class="mTheme1">
					<span class="iArr"></span> <span class="txt"><em
						class="txtEm2">선택된 골목상권</em> 검색결과입니다.<span id="totCntSpan"></span></span>
				</div>
				<div></div>
				<table id="trdarList">
				
				</table>

			</div>
		</div>
	</section>



	<aside class="bg-dark">
		<div class="container text-center">
			<div class="call-to-action">
				<h2 class="text-primary">Made by Team Name</h2>
			</div>
			<hr />
			<br>
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<div class="row">
						<h6 class="wide-space text-center">Name, Name, Name, Name</h6>

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
</body>


</html>