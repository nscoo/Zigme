<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!-- 이수진 css,부트스트랩 시작-->
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
    <!-- countdown bar css -->
    <link rel="stylesheet" href="assets/css/stylesheet.css" />
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="assets/css/music_result.css">
    <!-- 이수진 css,부트스트랩 끝 -->
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
                                </ul>
                            </li>
                            <li><a href="#">회사안</a>
                                <ul>
                                    <li><a href="#">메뉴추천</a></li>
                                    <li><a href="#">업무 주기능</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <li><a href="#">5분 스트레칭</a></li>
                                </ul>
                            </li>
                            <li><a href="main.html">퇴근길</a>
                               <ul>
                                    <li><a href="${pageContext.request.contextPath}/restaurant_search.do">Restaurant</a></li>
                                    <li><a href="${pageContext.request.contextPath}/music_select1.do">Music</a></li>
                                    <li><a href="${pageContext.request.contextPath}/nail_search.do">Beauty</a></li>
                                    <li><a href="#">Nearby</a></li>
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
                       <button type="button" class="btn btn-success btn-xs" onclick="location.href='${pageContext.request.contextPath}/login.do'">Login</button>
                       <button type="button" class="btn btn-warning btn-xs" onclick="location.href='${pageContext.request.contextPath}/edit.do'">mypage</button>
                    </div>
                </div>
            </div>
            <div id="header_nav">
                <ul class="nav nav-tabs nav-justified">
                    <li class="dropdown">
                        <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" style="font-size: 20px;">Beauty<b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" href="nail_search.html">네일샵</a></li>
                            <li role="presentation"><a role="menuitem" href="nail_search.html">미용실</a></li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/music_select1.do" style="font-size: 20px;">Music</a></li>
                    <li><a href="${pageContext.request.contextPath}/restaurant_search.do" style="font-size: 20px;">Restaurant</a></li>
                    <li><a href="#" style="font-size: 20px;">Nearby</a></li>
                    <li><a href="${pageContext.request.contextPath}/traffic_search.do" style="font-size: 20px;">Transportation</a></li>
                    <li><a href="${pageContext.request.contextPath}/mylist.do" style="font-size: 20px;">MyList</a></li>
                </ul>
            </div>
            <!-- header 끝-->
            <!-- music_result 시작 -->
            <div id="container_music">
                <div id="container_banner">
                </div>
                <div id="carousel_video">
                    <!-- 캐러셀 영역 구성 -->
                    <div id="carousel-example-generic" class="carousel slide">
                        <!-- 현재 위치 표시 -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <!-- 내용 영역 -->
                        <div class="carousel-inner">
                            <!-- 항목 (1) -->
                            <div class="item active" id="video_item">
                                <img src="assets/img/get-off1.png" id="video-size" class="carousel_video_img" alt="슬라이더(1)">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <p class="video-text">
                                            퇴근길,
                                            <br />
                                            우연히 들은 노래에
                                            <br />
                                            하루가 근사해져버렸다.
                                            <br />
                                            <small>2021.04.07</small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 항목 (2) -->
                            <div class="item" id="video_item">
                                <img src="assets/img/get-off2.PNG" id="video-size" class="carousel_video_img" alt="슬라이더(2)">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <p class="video-text">
                                            지친날,
                                            <br />
                                            우연히 들은 노래에
                                            <br />
                                            하루가 근사해져버렸다.
                                            <br />
                                            <small>2021.04.07</small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 항목 (3) -->
                            <div class="item" id="video_item">
                                <img src="assets/img/get-off3.PNG" id="video-size" class="carousel_video_img" alt="슬라이더(3)">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <p class="video-text">
                                            어느날,
                                            <br />
                                            우연히 들은 노래에
                                            <br />
                                            하루가 근사해져버렸다.
                                            <br />
                                            <small>2021.04.07</small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- // 내용영역 구성 -->
                        <!-- 이동 버튼 -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev" id="icon-left"></span> </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next" id="icon-right"></span> </a>
                    </div>
                </div>
                <!-- 캐러셀 영역 끝 -->
                <!-- 고양이 이미지 + 말풍선 -->
                <div class="speech-bubble">
                    오늘 <strong style="color:orange;">24%</strong>의 사람들이
                    <br />
                    너와 같이 우울한 하루를 보냈대
                    <br />
                    내가 골라준 노래 듣고 힘내라냥
                    <br />
                    토닥토닥. 수고했다냥~
                </div>
                <div id="music_cat">
                    <img src="assets/img/cat.png" width="340px" height="385px" />
                </div>
                <div class="balloon_1">
                    <a href="music_select1.html" style="color:white; text-decoration: none;">다시 한번 해볼거냥?</a>
                </div>
                <!-- music_result 끝 -->
                <!-- footer 시작 -->
                <div id="footer">
                    <div id="footer_content">
                        <div id="footer_img">
                            <a href="${pageContext.request.contextPath}"><img src="assets/img/zigme_logo_rm.png" /></a>
                        </div>
                        <div id="footer_text">
                            <div id="text_left">
                                <span class="glyphicon glyphicon-thumbs-up"> Name </span>
                            </div>
                            <div id="text_right">
                                PROJECT PORTFOLIO Big Data Class 8
                            </div>
                            <br />
                            <div id="text_left">
                                <span class="glyphicon glyphicon-user"> Manager </span>
                            </div>
                            <div id="text_right">
                                Younga Joo
                            </div>
                            <br />
                            <div id="text_left">
                                <span class="glyphicon glyphicon-map-marker"> Address </span>
                            </div>
                            <div id="text_right">
                                서울 서초구 서초대로 77길 55, 에이프로스퀘어 2층 EZEN IT
                            </div>
                            <br />
                            <br />
                            <address>copyright&copy;team_3 / All right reserved</address>
                        </div>
                    </div>
                </div>
                <!-- footer 끝-->
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