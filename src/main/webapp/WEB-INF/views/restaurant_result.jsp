<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("UTF-8");

// 검색 페이지에서 선택한 옵션들 값
String loc = request.getParameter("loc");
String food = request.getParameter("food");
String review_count = request.getParameter("review_count");
String stars = request.getParameter("stars");

%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- 이수진 css,부트스트랩 시작-->
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />
<!-- countdown bar css -->
<link rel="stylesheet" href="assets/css/stylesheet.css" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="assets/css/common.css">
<link rel="stylesheet" type="text/css" href="assets/css/container.css">
<!-- 이수진 css,부트스트랩 끝 -->
<!-- body 부분 css 시작-->
<link rel="stylesheet" type="text/css"
	href="assets/css/result_gallery.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="assets/css/result.css">
<!-- 인스타그램 하트스타일-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- favicon -->
<link rel="icon" type="image/png" sizes="192x192" href="assets/img/favicon192.png"> 
<link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon32.png"> 
<link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon16.png">
<title>당신의 직장메이트, ZIGME</title>
<style type="text/css">
.fa-heart-o {
	color: red;
	cursor: pointer;
	font-size: 25px;
}

.fa-heart {
	color: red;
	cursor: pointer;
	font-size: 25px;

} 
.jumbo_info>p>span {
	font-size: 15px;
	color: #323232;
	width: 400px;
}

.jumbo_img>img {
	width: 350px;
	height: 220px;
	object-fit: cover;
	margin-top: 15px;
	margin-right: 30px;
}

.container .jumbotron {
	padding-left: 30px;
	padding-right: 60px;
	padding-top: 30px;
	padding-bottom: 40px;
	background-color: #eee;
	width: 1000px;
	margin: 0 auto;
}

.shop_title {
	margin-top: 10px;
}

#popupContent>#popup_content_2>div>div {
	font-size: 18px;
	height: 50px;
}

#popupContent>#popup_content_2 {
	height: 300px;
	border-bottom: 4px solid #cccccc;
	padding-left: 50px;
	padding-top: 30px;
	vertical-align: top;
}

#popupContent>#popup_content_3 {
	padding-top: 30px;
	padding-left: 50px;
	height: 140px;
}

#popupContent>#popup_content_3>.info_menu {
	height: 50px;
}

#popupContent>#popup_content_3>.info_menu>img>a {
	font-size: 18px;
}

#popupContent>#popup_content_4 {
	vertical-align: top;
	height: 300px;
	padding-left: 62px;
	padding-top: 30px;
	font-size: 20px;
}

#popupContent>#popup_content_4>#graph_left {
	vertical-align: top;
	width: 300px;
}

#popupContent>#popup_content_4>#graph_right {
	vertical-align: top;
	width: 300px;
	display: inline-block;
}

#popup_content_4>button {
	display: inline-block;
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


				<div id="header_banner">
					<div id="search_input" class="input-group">
						<%-- 						<input type="text" class="form-control"
							placeholder=<%=input_keyword%>> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fas fa-search"></i>
							</button>
						</span> --%>
					</div>
				</div>
			</div>
			<!-- header 끝-->
			<!-- 식당 검색결과 부분 시작-->
			<div class="container">
				<br> <br>
				<h1 style="text-align: center;">Best5</h1>
				<br />

				<c:choose>

					<%-- 조회 결과가 없는 경우 --%>
					<c:when test="${output == null || fn:length(output)==0 }">
						<h1>조회 결과가 없습니다.</h1>
					</c:when>
					<%-- 조회 결과가 있는 경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 대한 반복 처리 --%>
						<c:forEach var="item" items="${output}" varStatus="status"
							begin="1" end="5">
							<c:set var="loc" value="${item.loc}" />
							<c:set var="subject" value="${item.subject}" />
							<c:set var="resno" value="${item.resno}" />
							<c:set var="call" value="${item.call}" />
							<c:set var="address" value="${item.address}" />
							<c:set var="times" value="${item.times}" />
							<c:set var="name" value="${item.name}" />
							<c:set var="stars" value="${item.stars}" />
							<c:set var="ps" value="${item.ps}" />
							<c:set var="tags" value="${item.tags}" />
							<c:set var="review_count" value="${item.review_count}" />
							<c:set var="photo_1" value="${item.photo_1}" />
							<c:set var="photo_2" value="${item.photo_2}" />
							<c:set var="photo_3" value="${item.photo_3}" />
							<c:set var="menu_1" value="${item.menu_1}" />
							<c:set var="menu_2" value="${item.menu_2}" />

							<c:set var="name_2" value="${fn:replace(item.name,'&','')}" />
							<c:set var="name_2" value="${fn:replace(name_2,' ','')}" />
							<!-- 식당정보 필요함 -->
							<c:set var="resno" value="${item.resno}" />
							<br>
							<br>
							<br>
							<div class="jumbotron">
								<div class="jumbo_img">
									<img src="${photo_1}" alt="best5 사진"
										referrerpolicy="no-referrer">
								</div>
								<div class="shop_title">
									<a href="javascript:void(0);" style="text-decoration: none;"
										onClick="openPopup('${name_2}')"> <font
										style="color: #0077a3; font-size: 23px;">&nbsp;&nbsp;${name}&nbsp;&nbsp;</font>
										<span style="font-size: 30px"> <i
											class="fas fa-star fa-1x" style="color: #ffd400"></i>
									</span> <span style="font-size: 18px">${stars}</span> <span
										style="font-size: 15px">(${review_count})</span>
									</a>

								</div>
								<div class="jumbo_info">
									<p>
										<br /> <img src="assets/img/call.png" width="20px"
											height="20px">&nbsp;&nbsp;&nbsp;&nbsp;<span>전화번호
											: ${call}</span>
									</p>
									<p>
										<img src="assets/img/placeholder-filled-point.png"
											width="25px" height="25px">&nbsp;&nbsp;&nbsp;<span>주소
											: </span><span style="font-size: 12px;">${address}</span>
									</p>
									<p>
										<img src="assets/img/clock.png" alt="시간" width="25px"
											height="25px"> &nbsp;&nbsp;<span>${times}</span>
									</p>
									<p>
										<img src="assets/img/clipboard.png" width="25px" height="25px">
										<a href="${menu_1}" referrerpolicy="no-referrer"
											target="_blank"><span
											style="font-size: 15px; color: skyblue;">&nbsp;&nbsp;->
												메뉴판 이미지 링크</span></a>
								</div>
								<div class="jumbo_info"></div>
							</div>

							<div id="popupLayer" class="${name_2}">
								<div id="popupContent">
									<div id="popup_image_box">
										<img src="${photo_1}" width="240px" height="220px"
											referrerpolicy="no-referrer" /> <img src="${photo_2}"
											width="240px" height="220px" referrerpolicy="no-referrer" />
										<img src="${photo_3}" width="240px" height="220px"
											referrerpolicy="no-referrer" />
									</div>
									<div id="popup_content_1">
										<h3>
										<input type ="hidden" id="${name_2}" value=${resno}>
											<font style="color: #0077a3; font-size: 30px;">&nbsp;&nbsp;${name}&nbsp;&nbsp;</font>
											<span style="font-size: 30px"> <i
												class="fas fa-star fa-1x" style="color: #ffd400"></i>
											</span> <span id='star' style="font-size: 18px" class="${name_2}">${stars}</span>
											<span id='review' style="font-size: 15px" class="${name_2}">${review_count}</span>
											<span id ="heart" class="${name_2}"><i class="fa fa-heart-o" aria-hidden="true" onclick="heart('${name_2}','${name}')" ></i> </span>
										</h3>
									</div>
									<div id="popup_content_2">
										<div>
											<div id="info_num">
												<img src="assets/img/call.png" width="25px" height="25px">&nbsp;&nbsp;전화번호
												: ${call}
											</div>
											<div id="info_add">
												<img src="assets/img/add.png" width="25px" height="25px">&nbsp;&nbsp;주소
												: ${address}
											</div>
											<div id="info_time">
												<img src="assets/img/time.png" width="25px" height="25px">&nbsp;&nbsp;영업시간
												: ${times}
											</div>
											<div id="info_ps" style="padding-top: 3px;">
												<img src="assets/img/ps.png" width="25px" height="25px">&nbsp;&nbsp;편의시설
												: ${ps}
											</div>
											<div id="info_tags" style="padding-top: 3px;">
												<img src="assets/img/tag.png" width="25px" height="25px">&nbsp;&nbsp;검색
												키워드 : ${tags}
											</div>
										</div>
									</div>
									<div id="popup_content_3">
										<div class="info_menu">
											<img src="assets/img/etc.png" width="25px" height="25px">&nbsp;
											<a href="${menu_1}" referrerpolicy="no-referrer"
												target="_blank" style="font-size: 18px; color: skyblue;">->
												메뉴판 이미지 링크 1</a>
										</div>
										<div class="info_menu">
											<img src="assets/img/etc.png" width="25px" height="25px">&nbsp;
											<a href="${menu_2}" referrerpolicy="no-referrer"
												target="_blank" style="font-size: 18px; color: skyblue;">->
												메뉴판 이미지 링크 2</a>
										</div>
									</div>
									<div id="popup_content_4">
										<div id="graph_left" style="font-size: 18px">
											<button onclick="statistics('${name_2}')"
												class="btn btn-warning">직메의 점수 보기</button>
											<br> <br>
											<canvas id="avg_chart" class="${name_2}"></canvas>
										</div>
										<div id="graph_right" style="font-size: 18px">
											<font id="visualize" class="${name_2}"
												style="font-size: 20px; color: #404040; text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<-- 직메가 매긴<br/>추천 점수를 확인해보세요!</font>
										</div>

									</div>
								</div>
								<div class="b-close"></div>
							</div>


						</c:forEach>

					</c:otherwise>
				</c:choose>






				<br />
				<hr />
				<div id="normal_list">
					<ul id="gallery">
						<c:choose>
							<%-- 조회 결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output)==0 }">
								<h1>조회 결과가 없습니다.</h1>
							</c:when>
							<%-- 조회 결과가 있는 경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 대한 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status"
									begin="6" end="100">
									<c:set var="loc" value="${item.loc}" />
									<c:set var="subject" value="${item.subject}" />
									<c:set var="resno" value="${item.resno}" />
									<c:set var="call" value="${item.call}" />
									<c:set var="address" value="${item.address}" />
									<c:set var="times" value="${item.times}" />
									<c:set var="name" value="${item.name}" />
									<c:set var="stars" value="${item.stars}" />
									<c:set var="ps" value="${item.ps}" />
									<c:set var="tags" value="${item.tags}" />
									<c:set var="review_count" value="${item.review_count}" />
									<c:set var="photo_1" value="${item.photo_1}" />
									<c:set var="photo_2" value="${item.photo_2}" />
									<c:set var="photo_3" value="${item.photo_3}" />
									<c:set var="menu_1" value="${item.menu_1}" />
									<c:set var="menu_2" value="${item.menu_2}" />

									<c:set var="name_2" value="${fn:replace(item.name,'&','')}" />
									<c:set var="name_2" value="${fn:replace(name_2,' ','')}" />

									<%-- 일반 가게 리스트 --%>
									<li><a href="javascript:void(0);"
										style="text-decoration: none;"
										onClick="openPopup('${name_2}')"> <span class="thumb">
												<img src="${photo_1}" alt="이미지1" width="270px"
												height="150px" referrerpolicy="no-referrer" />
										</span> <span class="text" style="font-size: 15px;">${name}</span>
									</a></li>

									<%-- 일반 가게 리스트 팝업 --%>
									<div id="popupLayer" class="${name_2}">
								<div id="popupContent">
									<div id="popup_image_box">
										<img src="${photo_1}" width="240px" height="220px"
											referrerpolicy="no-referrer" /> <img src="${photo_2}"
											width="240px" height="220px" referrerpolicy="no-referrer" />
										<img src="${photo_3}" width="240px" height="220px"
											referrerpolicy="no-referrer" />
									</div>
									<div id="popup_content_1">
										<h3>
										<input type ="hidden" id="${name_2}" value=${resno}>
											<font style="color: #0077a3; font-size: 30px;">&nbsp;&nbsp;${name}&nbsp;&nbsp;</font>
											<span style="font-size: 30px"> <i
												class="fas fa-star fa-1x" style="color: #ffd400"></i>
											</span> <span id='star' style="font-size: 18px" class="${name_2}">${stars}</span>
											<span id='review' style="font-size: 15px" class="${name_2}">${review_count}</span>
											<span id ="heart" class="${name_2}"><i class="fa fa-heart-o" aria-hidden="true" onclick="heart('${name_2}','${name}')" ></i> </span>
										</h3>
									</div>
									<div id="popup_content_2">
										<div>
											<div id="info_num">
												<img src="assets/img/call.png" width="25px" height="25px">&nbsp;&nbsp;전화번호
												: ${call}
											</div>
											<div id="info_add">
												<img src="assets/img/add.png" width="25px" height="25px">&nbsp;&nbsp;주소
												: ${address}
											</div>
											<div id="info_time">
												<img src="assets/img/time.png" width="25px" height="25px">&nbsp;&nbsp;영업시간
												: ${times}
											</div>
											<div id="info_ps" style="padding-top: 3px;">
												<img src="assets/img/ps.png" width="25px" height="25px">&nbsp;&nbsp;편의시설
												: ${ps}
											</div>
											<div id="info_tags" style="padding-top: 3px;">
												<img src="assets/img/tag.png" width="25px" height="25px">&nbsp;&nbsp;검색
												키워드 : ${tags}
											</div>
										</div>
									</div>
									<div id="popup_content_3">
										<div class="info_menu">
											<img src="assets/img/etc.png" width="25px" height="25px">&nbsp;
											<a href="${menu_1}" referrerpolicy="no-referrer"
												target="_blank" style="font-size: 18px; color: skyblue;">->
												메뉴판 이미지 링크 1</a>
										</div>
										<div class="info_menu">
											<img src="assets/img/etc.png" width="25px" height="25px">&nbsp;
											<a href="${menu_2}" referrerpolicy="no-referrer"
												target="_blank" style="font-size: 18px; color: skyblue;">->
												메뉴판 이미지 링크 2</a>
										</div>
									</div>
									<div id="popup_content_4">
										<div id="graph_left" style="font-size: 18px">
											<button onclick="statistics('${name_2}')"
												class="btn btn-warning">직메의 점수 보기</button>
											<br> <br>
											<canvas id="avg_chart" class="${name_2}"></canvas>
										</div>
										<div id="graph_right" style="font-size: 18px">
											<font id="visualize" class="${name_2}"
												style="font-size: 20px; color: #404040; text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<-- 직메가 매긴<br/>추천 점수를 확인해보세요!</font>
										</div>

									</div>
								</div>
								<div class="b-close"></div>
							</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
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
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PROJECT PORTFOLIO Big Data Class
								8
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
			<!-- footer 끝-->
		</div>

		<!-- Javascript -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/script.js"></script>
		<script type="text/javascript" src="assets/js/bpopup.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script type="text/javascript">
			function statistics(name) {
				var ctx = $("#avg_chart."+name)[0].getContext('2d');
                var star = $("#star."+name)[0].innerHTML;
                var review = ($("#review."+name)[0].innerHTML)/10;
				var score = (((0.9*star)+(0.1*review)/10)/5.451)*100;
				var myChart = new Chart(ctx, {
					data : {
						labels : [ '별점', '리뷰수(개)' ],
						datasets : [
								{
									type : 'bar',
									label : name + '데이터',
									data : [star, review],
									backgroundColor : [
											'rgba(255, 159, 64, 0.2)',
											'rgba(255, 205, 86, 0.2)' ],
									borderColor : [ 'rgb(255, 159, 64)',
											'rgb(255, 205, 86)' ],
									borderWidth : 1
								}, {
									type : 'line',
									label : '동일 지역, 메뉴 평균치',
									data : [ ${avg_stars}, ${avg_rc}/10 ],

								} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});

				if (star > ${avg_stars} && review > ${avg_rc}) {

					if (score > 70) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;유명한 식당이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";

					} else if (score<70 && score>30) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;괜찮은 식당인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
					} else if (score < 30) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
					}

				} else if (star > ${avg_stars} && review < ${avg_rc}) {

					if (score > 70) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;유명한 식당이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";

					} else if (score<70 && score>30) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;괜찮은 식당인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
					} else if (score < 30) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
					}

				} else if (star<${avg_stars} && review>${avg_rc}) {

					if (score > 70) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;유명한 식당이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";

					} else if (score<70 && score>30) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;괜찮은 식당인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
					} else if (score < 30) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
					}

				} else if (star < ${avg_stars} && review < ${avg_rc}) {

					if (score >70) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;유명한 식당이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";

					} else if (score<70 && score>50) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;괜찮은 식당인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
					} else if (score < 30) {
						$("#visualize." + name)[0].innerHTML = "<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"
								+ name
								+ "</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
								+ Math.abs((star - 4.2).toFixed(1))
								+ "</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"
								+ Math.abs((review - 1.4).toFixed(1))
								+ "</font>십 개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
								+ score.toFixed(2)
								+ "</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
					}
				}

			}
			
			
			

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

			//사이드바 메뉴
			function openNav() {
				document.getElementById("mySidenav").style.width = "250px";
			}

			function closeNav() {
				document.getElementById("mySidenav").style.width = "0";
			}

			//상세팝업
        function openPopup(name) { 

        	var resno = document.getElementById(name).value;
        
        	$.ajax({
        		type : "POST",
        		url : "checklist3",
        		dataType : "json",
        		data : {
        			"resno" : resno
        		},
        	success : function(data){
        		if(data){
 	  	              $("#heart."+name).html('<i class="fa fa-heart" aria-hidden="true"></i>');
   	              	  $("#heart."+name).addClass("liked");
        		}else{
        			console.log('찜 목록아님')
        		}
        	},

        	})
            $("#popupLayer."+name).bPopup({
                    iframeAttr: 'frameborder=”auto”',
                    iframeAttr: 'frameborder=”0',
                    contentContainer: '.popupContent',

                    onOpen: function() {},

                    onClose: function() {}
                },
                function() {});
            
            
        }
	        //하트 색상 채우기
			 function heart(name,a){
	        	
			          $("#heart."+name).click(function(){
			        	 
			        	  //찜  취소
				          if($("#heart."+name).hasClass("liked")){
				        	  $.ajax({
				        		  type :"POST",
				        		  url : "cancel_basket3",
				        		  dataType : "json",
				        		  data :{"name": a},
				        		  success:function(data){ //삭제 
				        			  if(data == 1){ //삭제 성공
					                      $("#heart."+name).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
					                      $("#heart."+name).removeClass("liked");
				        			  }else{
											alert('취소 실패 잠시후에 다시 시도하세요');
				                      }
				        		  },
				        		  
				        	  })
			            }else{ //찜하기
			          	  $.ajax({
			        		  type : "POST",
			        		  url : "add_basket3",
			        		  dataType : "json",
			        		  data : {"name" : a},
			       	  		 success:function(data){
			       	  			 	if(data==3){
			       	  			 		alert('로그인 후 이용해주세요 로그인 페이지로 이동합니다');
			       	  			 		location.replace("login.do");
			       	  			 		return false;
			       	  			 	}else if(data ==-1){
			       	  			 		alert('저장 실패 다시 시도해주세요');
			       	  			 		return false;
			       	  			 	}
			       	  			 	else{
			       	  	              $("#heart."+name).html('<i class="fa fa-heart" aria-hidden="true"></i>');
			       	              	  $("#heart."+name).addClass("liked");
			       	  			 	}

			        		  },
			        		
			        	  })
			            }


			          });
			        }
		</script>
</body>

</html>