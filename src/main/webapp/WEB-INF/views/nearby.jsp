<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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

<!-- 아이콘을 위한 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<!-- favicon -->
<link rel="icon" type="image/png" sizes="192x192" href="assets/img/favicon192.png"> 
<link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon32.png"> 
<link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon16.png">
<style type="text/css">
ul {
	padding-left: 0;
}

#head_banner {
	position: relative;
	height: 420px;
	overflow: hidden;
	background-image: url(assets/img/nearby.jpg);
	background-size: cover;
}
</style>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 550px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

#head_banner {
	position: relative;
	height: 420px;
	overflow: hidden;
	background-image: url(assets/img/nearby.jpg);
	background-size: cover;
}
</style>
</head>
<body>

	<div class="container">
		<!-- header 시작 -->
		<div id="header">
			<div id="header_top">
				<div id="top_menu">
					<div id="mySidenav" class="sidenav">
						<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">X</a>
						<ul class="navi">
							<li><a href="http://itproject.ezenac.co.kr/ilchooL/">출근길</a>
                                <ul>
                                    <li><a href="http://itproject.ezenac.co.kr/ilchooL/">날씨/미세먼지</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/ilchooL/">코로나수치</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/ilchooL/contents/contents_transport.do">대중교통정보</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/ilchooL/contents/contents_news.do">뉴스/주식정보</a></li>
                                </ul>
                            </li>
                            <li><a href="http://itproject.ezenac.co.kr/zigme/">회사안</a>
                                <ul>
                                    <li><a href="http://itproject.ezenac.co.kr/zigme/menu/menu_main">메뉴추천</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/zigme/help/help_main">업무 주기능</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/zigme/help_ajax/help_comm.do">커뮤니티</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/zigme/util/util_main">5분 스트레칭</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}">퇴근길</a>
                               <ul>
                                    <li><a href="${pageContext.request.contextPath}/restaurant_search.do">Restaurant</a></li>
                                    <li><a href="${pageContext.request.contextPath}/music_select1.do">Music</a></li>
                                    <li><a href="${pageContext.request.contextPath}/hair_search.do">Beauty</a></li>
                                    <li><a href="${pageContext.request.contextPath}/nearby.do">Nearby</a></li>
                                    <li><a href="${pageContext.request.contextPath}/traffic_search.do">Transportation</a></li>
                                    <li><a href="${pageContext.request.contextPath}/mylist.do">My List</a></li>
                                	<br/>
                                </ul>
                            </li>
                            <li><a href="http://itproject.ezenac.co.kr/homely">실내활동</a>
                                <ul>
                                    <li><a href="http://itproject.ezenac.co.kr/homely/movie/movie_main.do">영화추천</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/homely/Homely_Shopping/shopping_main.do">오늘의 쇼핑</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/homely/job/job_main.do">이직메이트</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/homely/community/community_main.do">커뮤니티</a></li>
                                </ul>
                            </li>
                            <li><a href="http://itproject.ezenac.co.kr/goodspring/">실외활동</a>
                                <ul>
                                    <li><a href="http://itproject.ezenac.co.kr/goodspring/walkPage/walk_index.do">걷기장소추천</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/goodspring/commPage/comm_index.do">커뮤니티</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/goodspring/casPage/cas_index.do">문화,체육</a></li>
                                    <li><a href="http://itproject.ezenac.co.kr/goodspring/bicyclePage/bicycle_index.do">따릉이정보보기</a></li>
                                </ul>
                            </li>
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

			<div id="head_banner" style="margin-bottom: 50px;">
				<div class="text">
					<span id="banner_text"
						style="float: left; padding-left: 15px; padding-top: 10px; color: white;">퇴근하기도
						바쁜 당신을 위한 <br />주변위치 정보 한눈에 모아보기!
					</span>
				</div>
			</div>
		</div>
		<div style="margin-bottom: 20px; text-align: center;">
			<button class="btn btn-warning" onclick="address()">원하는 위치를
				입력하기</button>
		</div>
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<ul id="category">
				<li id="BK9" data-order="0"><span class="category_bg bank"></span>
					은행</li>
				<li id="MT1" data-order="1"><span class="category_bg mart"></span>
					마트</li>
				<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
					약국</li>
				<li id="OL7" data-order="3"><span class="category_bg oil"></span>
					주유소</li>
				<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
					카페</li>
				<li id="CS2" data-order="5"><span class="category_bg store"></span>
					편의점</li>
			</ul>
		</div>


		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec3431bf4421193b0c663484256ae020&libraries=services"></script>
		<script src="assets/js/script.js"></script>
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

			document
					.addEventListener(
							"DOMContentLoaded",
							function() {

								var today = new Date();
								var now_hour = parseInt(('0' + today.getHours())
										.slice(-2));
								var now_minute = parseInt(('0' + today
										.getMinutes()).slice(-2));

								console.log("현재 시간" + now_hour + ":"
										+ now_minute);

								if (sessionStorage.getItem('off_hour') == null
										|| sessionStorage.getItem('off_minute') == null) {

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

			// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
			var placeOverlay = new kakao.maps.CustomOverlay({
				zIndex : 1
			}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
			markers = [], // 마커를 담을 배열입니다
			currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level : 5
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 지도에 idle 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'idle', searchPlaces);

			// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
			contentNode.className = 'placeinfo_wrap';

			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
			addEventHandle(contentNode, 'mousedown',
					kakao.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart',
					kakao.maps.event.preventMap);

			// 커스텀 오버레이 컨텐츠를 설정합니다
			placeOverlay.setContent(contentNode);

			// 각 카테고리에 클릭 이벤트를 등록합니다
			addCategoryClickEvent();

			// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
			function addEventHandle(target, type, callback) {
				if (target.addEventListener) {
					target.addEventListener(type, callback);
				} else {
					target.attachEvent('on' + type, callback);
				}
			}

			// 카테고리 검색을 요청하는 함수입니다
			function searchPlaces() {
				if (!currCategory) {
					return;
				}

				// 커스텀 오버레이를 숨깁니다 
				placeOverlay.setMap(null);

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();

				ps.categorySearch(currCategory, placesSearchCB, {
					useMapBounds : true
				});
			}

			//장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(map);

			ps.keywordSearch(keyword, placesSearchCB);

			function address() {
				var keyword = prompt("원하는 곳의 주소나 역이름을 입력해주세요!", "");
				ps.keywordSearch(keyword, placesSearchCB);
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {

					var bounds = new kakao.maps.LatLngBounds();
					for (var i = 0; i < data.length; i++) {

						bounds.extend(new kakao.maps.LatLng(data[i].y,
								data[i].x));
					}
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);

					// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
					displayPlaces(data);
				} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
					// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

				} else if (status === kakao.maps.services.Status.ERROR) {
					// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

				}
			}

			//지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {

				// 마커를 생성하고 지도에 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : new kakao.maps.LatLng(place.y, place.x)
				});

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event
						.addListener(
								marker,
								'click',
								function() {
									// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
									infowindow
											.setContent('<div style="padding:5px;font-size:12px;">'
													+ place.place_name
													+ '</div>');
									infowindow.open(map, marker);
								});
			}

			// 지도에 마커를 표출하는 함수입니다
			function displayPlaces(places) {

				// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
				// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
				var order = document.getElementById(currCategory).getAttribute(
						'data-order');

				for (var i = 0; i < places.length; i++) {

					// 마커를 생성하고 지도에 표시합니다
					var marker = addMarker(new kakao.maps.LatLng(places[i].y,
							places[i].x), order);

					// 마커와 검색결과 항목을 클릭 했을 때
					// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
					(function(marker, place) {
						kakao.maps.event.addListener(marker, 'click',
								function() {
									displayPlaceInfo(place);
								});
					})(marker, places[i]);
				}
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, order) {
				var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
				imgOptions = {
					spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
					spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset : new kakao.maps.Point(11, 28)
				// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize, imgOptions), marker = new kakao.maps.Marker(
						{
							position : position, // 마커의 위치
							image : markerImage
						});

				marker.setMap(map); // 지도 위에 마커를 표출합니다
				markers.push(marker); // 배열에 생성된 마커를 추가합니다

				return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
			function displayPlaceInfo(place) {
				var content = '<div class="placeinfo">'
						+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
						+ place.place_name + '</a>';

				if (place.road_address_name) {
					content += '    <span title="' + place.road_address_name + '">'
							+ place.road_address_name
							+ '</span>'
							+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
							+ place.address_name + ')</span>';
				} else {
					content += '    <span title="' + place.address_name + '">'
							+ place.address_name + '</span>';
				}

				content += '    <span class="tel">' + place.phone + '</span>'
						+ '</div>' + '<div class="after"></div>';

				contentNode.innerHTML = content;
				placeOverlay
						.setPosition(new kakao.maps.LatLng(place.y, place.x));
				placeOverlay.setMap(map);
			}

			// 각 카테고리에 클릭 이벤트를 등록합니다
			function addCategoryClickEvent() {
				var category = document.getElementById('category'), children = category.children;

				for (var i = 0; i < children.length; i++) {
					children[i].onclick = onClickCategory;
				}
			}

			// 카테고리를 클릭했을 때 호출되는 함수입니다
			function onClickCategory() {
				var id = this.id, className = this.className;

				placeOverlay.setMap(null);

				if (className === 'on') {
					currCategory = '';
					changeCategoryClass();
					removeMarker();
				} else {
					currCategory = id;
					changeCategoryClass(this);
					searchPlaces();
				}
			}

			// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
			function changeCategoryClass(el) {
				var category = document.getElementById('category'), children = category.children, i;

				for (i = 0; i < children.length; i++) {
					children[i].className = '';
				}

				if (el) {
					el.className = 'on';
				}
			}
		</script>

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
	</div>
</body>
</html>