<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.bigdata.dto.ResultDTO"%>
<%@ page import="project.bigdata.dao.SearchDAO"%>
<%@ page import="project.bigdata.dto.ResultDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
    function tabSetting() {
        // 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
        $('.tabPage').hide();
        $($('.current').find('a').attr('href')).show();
 
        // Tab 메뉴 클릭 이벤트 생성
        $('li').click(function (event) {
            var tagName = event.target.tagName; // 현재 선택된 태그네임
            var selectedLiTag = (tagName.toString() == 'A') ? $(event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
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
 
    $(function () {
        // 탭 초기화 및 설정
        tabSetting();
    });
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script>
   $(document).ready(function () {
      $("button").toggle(
      function (){$(this).css("background-color", "yellow")},
      function (){$(this).css("background-color", "#edeee8")}
   );
   });
</script>

<style>
#th1 {
	font-size: 30px;
}

#td1 {
	font-size: 12px;
}

#th2 {
	font-size: 30px;
	border: 2px solid
}

#td2 {
	font-size: 30px;
	border: 2px solid
}

#table2 {
	border: 2px solid;
	text-align: center;
}

#th3 {
	font-size: 30px;
	border: 2px solid
}

#td3 {
	font-size: 30px;
	border: 2px solid
}

#table3 {
	border: 2px solid;
	text-align: center;
}

.tabWrap {
	width: 800px;
	height: 300px;
}

.tab_Menu {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

.tabMenu {
	width: 150px;
	margin: 0px;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 10px;
	float: left;
}

.tabMenu a {
	color: #000000;
	font-weight: bold;
	text-decoration: none;
}

.current {
	background-color: #FFFFFF;
	border: 1px solid blue;
	border-bottom: hidden;
}

.tabPage {
	width: 800px;
	height: 300px;
	float: left;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>상권분석</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">


<script type="text/javascript"
	src="../startbootstrap-modern-business-gh-pages/js/select.js"></script>
</head>

<body>

	<!-- 위에 메뉴바 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"> 상권 분석 </a>
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
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide One');"></div>
				<div class="carousel-caption">
					<h2>Caption 1</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Two');"></div>
				<div class="carousel-caption">
					<h2>Caption 2</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Three');"></div>
				<div class="carousel-caption">
					<h2>Caption 3</h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>
	<br>

	<!-- Page Content -->
	<div class="container">
		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<table>
					<tr>
						<th id="th1">상권분석</th>
						<td id="td1" rowspan="2">원하시는 상권의 조건으로 검색하여 분석 할 수 있습니다.</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
				<h3 class="head1">
					관심지역을 선택해주세요.<span class="tx1">선택해주세요</span>
				</h3>

				<table id="table2">
					<tr id="tr2">
						<td id="td2">
							<button value="11680">강남구</button>
						</td>
						<td id="td2">
							<button value="11740" style="width: 136px">강동구</button>
						</td>
						<td id="td2">
							<button value="11305">강북구</button>
						</td>
						<td id="td2">
							<button value="11500">강서구</button>
						</td>
						<td id="td2">
							<button value="11620" style="width: 136px">관악구</button>
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
							<button value="11110" style="width: 136px">종로구</button>
						</td>
						<td id="td2">
							<button value="11140" style="width: 106px">중구</button>
						</td>
						<td id="td2">
							<button value="11260">중랑구</button>
						</td>
					</tr>
				</table>
				<br>



				<h3 class="head2">
					관심업종을 선택하세요 <span class="tx2">선택해주세요</span>
				</h3>
				<div class="tabWrap">
					<ul class="tab_Menu">
						<li class="tabMenu current"><a href="#tabContent01"> 외식업
						</a></li>
						<li class="tabMenu"><a href="#tabContent02"> 서비스업 </a></li>
						<li class="tabMenu"><a href="#tabContent03"> 도소매업 </a></li>
					</ul>
					<div class="tab_Content_Wrap">
						<div id="tabContent01" class="tabPage">
							<table id="table3" width="1035">
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
							<table id="table3" width="1035">
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
							<table id="table3" width="1035">
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
						<span class="gRight">
							<a href="###" class="mBtn2 m2 blue">상권검색</a>
						</span>
				</div>

			</div>
			
			<div class="mTheme1">
				<span class="iArr"></span>
				<span class="txt"><em class="txtEm2">선택된 골목상권</em> 검색결과입니다.<span id="totCntSpan">(0건)</span></span>
			</div>
			
			<!-- 검색결과 -->
			<div id="trdarList"></div>
			<!-- //검색결과 -->
			
		</div>
	</div>
	<footer></footer>
</body>


</html>