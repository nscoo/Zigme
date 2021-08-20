<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
    <!-- countdown bar css -->
    <link rel="stylesheet" href="assets/css/stylesheet.css" />
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/container.css" />
    <style type="text/css">
    /** 자기멋대로 지정되는 user agent stylesheet때문에 css따로지정해줌*/
    ul {
        padding-left: 0;
    }
    
    </style>
</head>

<body>
    <div class="container">
        <div id="header">
            <div id="header_top">
                <div id="top_menu">
                    <div id="mySidenav" class="sidenav">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">X</a>
                        <ul class="navi">
                            <li><a href="#">출근길</a>
                                <ul>                                 <li><a href="#">날씨/미세먼지</a></li>
                                    <li><a href="#">코로나수치</a></li>
                                    <li><a href="#">대중교통정보</a></li>
                                    <li><a href="#">뉴스/주식정보</a></li>
                                    <br />
                                </ul>
                            </li>
                            <li><a href="#">회사안</a>
                                <ul>
                                    <li><a href="#">메뉴추천</a></li>
                                    <li><a href="#">업무 주기능</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <li><a href="#">5분 스트레칭</a></li>
                                    <br />
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/main.do">퇴근길</a>
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
                            <li><a href="#">실내</a>
                                <ul>
                                    <li><a href="#">영화추천</a></li>
                                    <li><a href="#">오늘의 쇼핑</a></li>
                                    <li><a href="#">이직메이트</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                </ul>
                            </li>
                            <li><a href="#">실외</a>
                                <ul>
                                    <li><a href="#">걷기장소추천</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <li><a href="#">문화</a></li>
                                    <li><a href="#">체육</a></li>
                                    <li><a href="#">교통정보보기</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <span style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776;</span>
                </div>
                <div id="top_logo">
                    <a href="${pageContext.request.contextPath}">
                        <span class="top_text" style="color: black;">
                            ZIGME
                        </span>
                    </a>
                </div>
                <div id="top_buttons">
                    <button type="button" class="btn btn-default btn-xs">퇴근까지</button>
                    <div id="button_time">
                        <div class="countdown-bar" id="countdownC">
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                    <div id="button_top">
                    	<c:if test="${member == null}">
                        <button type="button" class="btn btn-success btn-xs" onclick="location.href='${pageContext.request.contextPath}/login.do'">Login</button>
                        <button type="button" class="btn btn-warning btn-xs" onclick="location.href='${pageContext.request.contextPath}/register.do'">회원가입</button>
                   		</c:if>
                   		<c:if test="${member != null}">
                   		<div id = "login_top">
                  		 <button type="button" class="btn btn-success btn-xs" onclick="location.href='${pageContext.request.contextPath}/edit.do'">Mypage</button>
                   		<button type="button" class="btn btn-warning btn-xs" onclick="location.href='${pageContext.request.contextPath}/logout.do'">로그아웃</button> 
                   		</div>
                   		</c:if>
                    </div>
                    
                </div>
            </div>
            <div id="header_nav">
                <ul class="nav nav-tabs nav-justified">
                    <li class="dropdown">
                        <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" style="font-size: 20px;">Beauty<b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        	<li role="presentation"><a role="menuitem" href="${pageContext.request.contextPath}/hair_search.do">미용실</a></li>
                            <li role="presentation"><a role="menuitem" href="${pageContext.request.contextPath}/nail_search.do">네일샵</a></li> 
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/music_select1.do" style="font-size: 20px;">Music</a></li>
                    <li><a href="${pageContext.request.contextPath}/restaurant_search.do" style="font-size: 20px;">Restaurant</a></li>
                    <li><a href="${pageContext.request.contextPath}/nearby.do" style="font-size: 20px;">Nearby</a></li>
                    <li><a href="${pageContext.request.contextPath}/traffic_search.do" style="font-size: 20px;">Transportation</a></li>
                    <li><a href="${pageContext.request.contextPath}/mylist.do" style="font-size: 20px;">MyList</a></li>
                </ul>
            </div>
            <div id="header_banner">
                <div class="text">
                    <span id="banner_text" style="float: left; padding-left: 15px; padding-top: 10px;">업무에 지친 당신...
                        <br />퇴근 후 여유를 누리세요~</span>
                </div>
            </div>
        </div>
        <div class="block">
            <div id="block_top">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/nail_search.do">
                            <img src="assets/img/beauty.png" alt="사진" width="150" height="150" />
                        </a>
                        <span class="text">beauty</span>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/music_select1.do">
                            <img src="assets/img/music.png" alt="사진" width="150" height="150">
                        </a>
                        <span class="text">music</span>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/restaurant_search.do">
                            <img src="assets/img/restaurant.png" alt="사진" width="150" height="150">
                        </a>
                        <span class="text">restaurant</span>
                    </li>
                </ul>
            </div>
            <div id="block_bottom">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/nearby.do">
                            <img src="assets/img/map.png" alt="사진" width="150" height="150">
                        </a>
                        <span class="text">nearby</span>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/traffic_search.do">
                            <img src="assets/img/bus.png" alt="사진" width="150" height="150">
                        </a>
                        <span class="text">transportation</span>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/mylist.do">
                            <img src="assets/img/list.png" alt="사진" width="150" height="150">
                        </a>
                        <span class="text">mylist</span>
                    </li>
                </ul>
            </div>
        </div>
        <div id="carousel">
            <!-- 캐러셀 영역 구성 -->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- 현재 위치 표시 -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <!-- 내용 영역 -->
                <div class="carousel-inner">
                    <!-- 항목 (1) -->
                    <div class="item active">
                        <img src="assets/img/slide-1.jpg" class="carousel_img" alt="슬라이더(1)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>지금 당장<br />
                                    시원한 맥주가 당긴다면?</h1>
                                <div class="carousel_shop">
                                    <p>부엉이호프집</p>
                                    <h6>서울특별시 종로구 인사동로 12길
                                        <br />생맥주& 하몽 23,000원</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 항목 (2) -->
                    <div class="item">
                        <img src="assets/img/slide-2.jpg" class="carousel_img" alt="슬라이더(2)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>오늘은 왠지<br />
                                    색다른 음식이 먹고싶어!</h1>
                                <div class="carousel_shop">
                                    <p>프랑스가정식</p>
                                    <h6>서울특별시 종로구 낙원로 29길
                                        <br />라따뚜이 29,000원</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 항목 (3) -->
                    <div class="item">
                        <img src="assets/img/slide-3.jpg" class="carousel_img" alt="슬라이더(3)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>얼큰~한<br />
                                    국밥이 먹고싶은 사람?!</h1>
                                <div class="carousel_shop">
                                    <p>아바이순대국</p>
                                    <h6>서울특별시 강남구 테헤란로 12길
                                        <br />순대국 9,000원</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- // 내용영역 구성 -->
                <!-- 이동 버튼 -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span> </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span> </a>
            </div>
        </div>
        <!-- 캐러셀 영역 끝 -->
        <div id="footer">
            <div id="footer_content">
                    <div id="footer_img">
                        <a href="${pageContext.request.contextPath}/"><img src="assets/img/zigme_logo_rm.png" /></a>
                    </div>
                    <div id="footer_text">
                        <div class="footer_row">
                            <span class="glyphicon glyphicon-thumbs-up"> Name </span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            PROJECT PORTFOLIO Big Data Class 8
                        </div>
                        <div class="footer_row">
                            <span class="glyphicon glyphicon-user"> Developer </span>
                            &nbsp;
                            TEAM3
                        </div>
                        <div class="footer_row">
                            <span class="glyphicon glyphicon-map-marker"> Address </span>
                            &nbsp;
                            서울 서초구 서초대로 77길 55, 에이프로스퀘어 2층 EZEN IT
                        </div>
                        <br />
                        <address>copyright&copy; team_3 / All right reserved</address>
                    </div>
                </div>
        </div>
    </div>
    <!-- Javascript -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/script.js"></script>
    <script type="text/javascript">
    countdown('countdownC', 0, 0, 10, 10);
    // Countdown Loading Bar
    $config.loadingBars_width = 60;
    $config.loadingBars_height = 15;
    $config.loadingBars_border_color = 'orange';
    $config.loadingBars_color = 'orange';
    $config.loadingBars_background_color = 'lightblue';

    // Countdown Timer
    $config.timer_color = 'black';
    $config.timer_font_weight = 700;
    $config.timer_font = 'Verdana';
    $config.timer_font_size = 9;


    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
    </script>
</body>

</html>