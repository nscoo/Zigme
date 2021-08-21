<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />
<!-- countdown bar css -->
<link rel="stylesheet" href="assets/css/stylesheet.css" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="assets/css/common.css">
<link rel="stylesheet" type="text/css" href="assets/css/container.css">
<link rel="stylesheet" type="text/css" href="assets/css/traffic.css">
<!-- 아이콘을 위한 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style type="text/css">
ul {
	padding-left: 0;
}

#input_traffic_1, #input_traffic_2 {
	float: left;
}

.pac-container {
	z-index: 1500 !important;
}
</style>

</head>

<body>
	<!--bootstrap 반응형 사용을 위해 제일 상위 class를 container로 설정함 -->
	<div class="container">
		<!-- header 시작 -->
		<div id="header">
			<div id="header_top">
				<div id="top_menu">
					<div id="mySidenav" class="sidenav">
						<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">X</a>
						<ul class="navi">
							<li><a href="#">출근길</a>
								<ul>
									<li><a href="#">날씨/미세먼지</a></li>
									<li><a href="#">코로나수치</a></li>
									<li><a href="#">대중교통정보</a></li>
									<li><a href="#">뉴스/주식정보</a></li>
									<br />
								</ul></li>
							<li><a href="#">회사안</a>
								<ul>
									<li><a href="#">메뉴추천</a></li>
									<li><a href="#">업무 주기능</a></li>
									<li><a href="#">커뮤니티</a></li>
									<li><a href="#">5분 스트레칭</a></li>
									<br />
								</ul></li>
							<li><a href="${pageContext.request.contextPath}/main.do">퇴근길</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/restaurant_search.do">Restaurant</a></li>
									<li><a
										href="${pageContext.request.contextPath}/music_select1.do">Music</a></li>
									<li><a
										href="${pageContext.request.contextPath}/hair_search.do">Beauty</a></li>
									<li><a href="${pageContext.request.contextPath}/nearby.do">Nearby</a></li>
									<li><a
										href="${pageContext.request.contextPath}/traffic_search.do">Transportation</a></li>
									<li><a href="${pageContext.request.contextPath}/mylist.do">My
											List</a></li>
									<br />
								</ul></li>
							<li><a href="#">실내</a>
								<ul>
									<li><a href="#">영화추천</a></li>
									<li><a href="#">오늘의 쇼핑</a></li>
									<li><a href="#">이직메이트</a></li>
									<li><a href="#">커뮤니티</a></li>
								</ul></li>
							<li><a href="#">실외</a>
								<ul>
									<li><a href="#">걷기장소추천</a></li>
									<li><a href="#">커뮤니티</a></li>
									<li><a href="#">문화</a></li>
									<li><a href="#">체육</a></li>
									<li><a href="#">교통정보보기</a></li>
								</ul></li>
						</ul>
					</div>
					<span style="font-size: 30px; cursor: pointer;" onclick="openNav()">&#9776;</span>
				</div>
				<div id="top_logo">
					<a href="${pageContext.request.contextPath}"> <span
						class="top_text" style="color: black;"> ZIGME </span>
					</a>
				</div>
				<div id="top_buttons">
					<button id="start" type="button" class="btn btn-default btn-xs">퇴근까지</button>
					<div id="button_time">
						<div class="countdown-bar" id="countdownC">
							<div></div>
							<div></div>
						</div>





					</div>
					<div id="button_top">
						<c:if test="${member == null}">
							<button type="button" class="btn btn-success btn-xs"
								onclick="location.href='${pageContext.request.contextPath}/login.do'">Login</button>
							<button type="button" class="btn btn-warning btn-xs"
								onclick="location.href='${pageContext.request.contextPath}/register.do'">회원가입</button>
						</c:if>
						<c:if test="${member != null}">
							<div id="login_top">
								<button type="button" class="btn btn-success btn-xs"
									onclick="location.href='${pageContext.request.contextPath}/edit.do'">Mypage</button>
								<button type="button" class="btn btn-warning btn-xs"
									onclick="location.href='${pageContext.request.contextPath}/logout.do'">로그아웃</button>
							</div>
						</c:if>
					</div>

				</div>
			</div>
			<div id="header_nav">
				<ul class="nav nav-tabs nav-justified">
					<li class="dropdown"><a id="dropdownMenu1" href="#"
						role="button" class="dropdown-toggle" data-toggle="dropdown"
						style="font-size: 20px;">Beauty<b class="caret"></b></a>
						<ul class="dropdown-menu" role="menu"
							aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem"
								href="${pageContext.request.contextPath}/hair_search.do">미용실</a></li>
							<li role="presentation"><a role="menuitem"
								href="${pageContext.request.contextPath}/nail_search.do">네일샵</a></li>
						</ul></li>
					<li><a
						href="${pageContext.request.contextPath}/music_select1.do"
						style="font-size: 20px;">Music</a></li>
					<li><a
						href="${pageContext.request.contextPath}/restaurant_search.do"
						style="font-size: 20px;">Restaurant</a></li>
					<li><a href="${pageContext.request.contextPath}/nearby.do"
						style="font-size: 20px;">Nearby</a></li>
					<li><a
						href="${pageContext.request.contextPath}/traffic_search.do"
						style="font-size: 20px;">Transportation</a></li>
					<li><a href="${pageContext.request.contextPath}/mylist.do"
						style="font-size: 20px;">MyList</a></li>
				</ul>
			</div>
			<div id="header_banner"></div>
		</div>
		<!-- header 끝-->





		<!-- traffic 시작-->
		<div id="traffic">
			<div class="traffic_content">
				<img src="assets/img/from.png">
				<div class="location">
					<button type="button" class="btn btn-warning"
						style="width: 200px; font-size: 20px;">출발지</button>
				</div>
				<div class="button_traffic">
					<input type="text" class="form-control" placeholder="어디에 계신가요?"
						style="width: 200px" id="input_traffic_1" />

					</button>
				</div>
				<div class="toggle_traffic">
					<ul class="navi1" style="padding-top: 20px">
						<li><a href="#">즐겨찾는 출발지</a>
							<ul>
								<li><a href="#">집</a></li>
								<li><a href="#">직장</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="traffic_content">
				<img src="assets/img/to.png">
				<div class="location">
					<button type="button" class="btn btn-warning"
						style="width: 200px; font-size: 20px;">도착지</button>
				</div>
				<div class="button_traffic">
					<input type="text" class="form-control" placeholder="어디로 가시나요?"
						style="width: 200px" id="input_traffic_2" />

					</button>
				</div>
				<div class="toggle_traffic">
					<ul class="navi1" style="padding-top: 20px">
						<li><a href="#">즐겨찾는 출발지</a>
							<ul>
								<li><a href="#">집</a></li>
								<li><a href="#">직장</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<span id="go_button"><button type="button"
					<%-- onclick="location.href='${pageContext.request.contextPath}/traffic_result.do'" --%>
					class=" btn btn-danger"
					style="width: 150px; font-size: 30px;">GO</button> </span>
		</div>








		<!-- footer 시작 -->
		<div id="footer">
			<div id="footer_content">
				<div id="footer_img">
					<a href="${pageContext.request.contextPath}/"><img
						src="assets/img/zigme_logo_rm.png" /></a>
				</div>
				<div id="footer_text">
					<div class="footer_row">
						<span class="glyphicon glyphicon-thumbs-up"> Name </span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PROJECT PORTFOLIO Big Data Class 8
					</div>
					<div class="footer_row">
						<span class="glyphicon glyphicon-user"> Developer </span> &nbsp;
						TEAM3
					</div>
					<div class="footer_row">
						<span class="glyphicon glyphicon-map-marker"> Address </span>
						&nbsp; 서울 서초구 서초대로 77길 55, 에이프로스퀘어 2층 EZEN IT
					</div>
					<br />
					<address>copyright&copy; team_3 / All right reserved</address>
				</div>
			</div>
		</div>

		<!-- footer 끝-->
	</div>
	<!-- Javascript -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/script.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtI5NB3WvBMz5UjZTr5nl_hJf1oprH9bA&callback=initAutocomplete&libraries=places"
		async defer></script>
	<script type="text/javascript">
	var startBtn = document.getElementById('start');
	
	startBtn.addEventListener("click", function() {

		// 카운트다운을 처음 설정하는 경우
		off_hour = parseInt(prompt("몇시에 퇴근하시나요? (24시 기준)"));
		console.log(off_hour);
		if ((typeof off_hour == "string") || (off_hour > 24)
				|| (isNaN(off_hour))) {
			alert("잘못된 입력입니다. 퇴근시간을 다시 설정해주세요!")
			return

		}

		off_minute = parseInt(prompt("몇분에 퇴근하시나요?"));
		if ((typeof off_minute != "number") || (off_minute > 60)
				|| (isNaN(off_minute))) {
			alert("잘못된 입력입니다. 퇴근시간을 다시 설정해주세요!")
			return

		}

		sessionStorage.setItem("off_hour", off_hour);
		sessionStorage.setItem("off_minute", off_minute);
		location.reload();

		console.log("수정된 퇴근 시간" + off_hour + ":" + off_minute);

		location.reload();
	});
	

	document.addEventListener("DOMContentLoaded", function() {

		var today = new Date();
		var now_hour = parseInt(('0' + today.getHours()).slice(-2));
		var now_minute = parseInt(('0' + today.getMinutes()).slice(-2));

		console.log("현재 시간" + now_hour + ":" + now_minute);
		
		if (sessionStorage.getItem('off_hour')==null || sessionStorage.getItem('off_minute')==null){
			
			startBtn.innerHTML = "퇴근 시간 설정하기"
			
		}
		
		else{
			var off_hour = sessionStorage.getItem('off_hour');
			var off_minute = sessionStorage.getItem('off_minute');
			if ((off_hour-now_hour)<=0){
				
				if ((off_hour-now_hour)==0 && (off_minute-now_minute)>=0){
					console.log("퇴근 시간" + off_hour + ":" + off_minute);
					startBtn.innerHTML = "퇴근까지 ~ "
					countdown('countdownC', 0, sessionStorage.getItem('off_hour')
							- now_hour, sessionStorage.getItem('off_minute')
							- now_minute, 10);
				} else {
					console.log("문제 있다")
					startBtn.innerHTML = "퇴근 시간 설정하기"
					countdown('countdownC',0,0,0,0);
				}
				
			} else {
				console.log("퇴근 시간" + off_hour + ":" + off_minute);
				startBtn.innerHTML = "퇴근까지 ~ "
				countdown('countdownC', 0, sessionStorage.getItem('off_hour')
						- now_hour, sessionStorage.getItem('off_minute')
						- now_minute, 10);
			}

		}
	});

		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}

		function initAutocomplete() {

			// 좌표 정보 전역변수 설정
			autocomplete_1 = new google.maps.places.Autocomplete((document
					.getElementById('input_traffic_1')), {
				types : [ 'geocode' ]
			});
			// 좌표 정보 전역변수 설정
			autocomplete_2 = new google.maps.places.Autocomplete((document
					.getElementById('input_traffic_2')), {
				types : [ 'geocode' ]
			});

		}

		$(document)
				.on(
						"click",
						"#go_button",
						function(e) {
							e.preventDefault();

							if (document.getElementById('input_traffic_1').value != "") {
								var place_1 = autocomplete_1.getPlace();
								var place_1_lat = place_1.geometry.location
										.lat();
								var place_1_lng = place_1.geometry.location
										.lng();

								if (document.getElementById('input_traffic_2').value != "") {
									var place_2 = autocomplete_2.getPlace();
									var place_2_lat = place_2.geometry.location
											.lat();
									var place_2_lng = place_2.geometry.location
											.lng();

									get_url = "${pageContext.request.contextPath}/traffic_result.do?s_lat="
											+ place_1_lat
											+ "&s_lng="
											+ place_1_lng
											+ "&e_lat="
											+ place_2_lat
											+ "&e_lng="
											+ place_2_lng;

									location.href = get_url;

								} else {
									alert("도착지를 입력하세요.")
								}

							} else {
								alert("출발지를 입력하세요.")
							}

							/* location.href='${pageContext.request.contextPath}/traffic_result.do' */

						});
	</script>
</body>

</html>