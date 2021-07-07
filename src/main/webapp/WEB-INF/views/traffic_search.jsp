<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
    <link rel="stylesheet" type="text/css" href="assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="assets/css/container.css">
    <link rel="stylesheet" type="text/css" href="assets/css/traffic.css">
    <!-- 아이콘을 위한 css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style type="text/css">
    ul {
        padding-left: 0;

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
                            <li><a href="main.html">퇴근길</a>
                                <ul>
                                    <li><a href="#" onclick="location.href='restaurant_search.html'">Restaurant</a></li>
                                    <li><a href="#" onclick="location.href='music_select1.html'">Music</a></li>
                                    <li><a href="#" onclick="location.href='nail_search.html'">Beauty</a></li>
                                    <li><a href="#">Nearby</a></li>
                                    <li><a href="#" onclick="location.href='traffic_search.html'">Transportation</a></li>
                                    <li><a href="#" onclick="location.href='mylist.html'">My List</a></li>
                                </ul>
                            </li>
                            <li><a href="#">실내</a>
                                <ul>
                                    <li><a href="#">영화추천</a></li>
                                    <li><a href="#">오늘의 쇼핑</a></li>
                                    <li><a href="#">이직메이트</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <br />
                                </ul>
                            </li>
                            <li><a href="#">실외</a>
                                <ul>
                                    <li><a href="#">걷기장소추천</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <li><a href="#">문화</a></li>
                                    <li><a href="#">체육</a></li>
                                    <li><a href="#">교통정보보기</a></li>
                                    <br />
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <span style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776;</span>
                </div>
                <div id="top_logo">
                    <a href="main.html">
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
                        <button type="button" class="btn btn-success btn-xs">Login</button>
                        <button type="button" class="btn btn-warning btn-xs">mypage</button>
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
                    <li><a href="music_select1.html" style="font-size: 20px;">Music</a></li>
                    <li><a href="restaurant_search.html" style="font-size: 20px;">Restaurant</a></li>
                    <li><a href="#" style="font-size: 20px;">Nearby</a></li>
                    <li><a href="traffic_search.html" style="font-size: 20px;">Transportation</a></li>
                    <li><a href="mylist.html" style="font-size: 20px;">MyList</a></li>
                </ul>
            </div>
            <div id="header_banner">
            </div>
        </div>
        <!-- header 끝-->
        <!-- traffic 시작-->
        <div id="traffic">
            <div class="traffic_content">
                <img src="assets/img/from.png">
                <div class="location"><button type="button" class="btn btn-warning" style="width: 200px; font-size: 20px;">출발지</button></div>
                <div class="button_traffic">
                    <input type="text" class="form-control" placeholder="어디에 계신가요?" style="width: 200px" id="input_traffic" />
                    <button class="btn btn-default" type="button"><i class="fas fa-search"></i></button>
                </div>
                <div class="toggle_traffic">
                    <ul class="navi1" style="padding-top: 20px">
                        <li><a href="#">즐겨찾는 출발지</a>
                            <ul>
                                <li><a href="#">집</a></li>
                                <li><a href="#">직장</a></li>
                                <li><a href="#">직접입력</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="traffic_content">
                <img src="assets/img/to.png">
                <div class="location"><button type="button" class="btn btn-warning" style="width: 200px; font-size: 20px;">도착지</button></div>
                <div class="button_traffic">
                    <input type="text" class="form-control" placeholder="어디에 계신가요?" style="width: 200px" id="input_traffic" />
                    <button class="btn btn-default" type="button"><i class="fas fa-search"></i></button>
                </div>
                <div class="toggle_traffic">
                    <ul class="navi1" style="padding-top: 20px">
                        <li><a href="#">즐겨찾는 출발지</a>
                            <ul>
                                <li><a href="#">집</a></li>
                                <li><a href="#">직장</a></li>
                                <li><a href="#">직접입력</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <span id="go_button"><button type="button" onclick="location.href = 'traffic_result.html'" class=" btn btn-danger" style="width: 150px; font-size: 30px;">GO</button></span>
        </div>
        <!-- traffic 끝-->
        <!-- footer 시작 -->
        <div id="footer">
            <div id="footer_content">
                <div id="footer_img">
                    <a href="#"><img src="assets/img/zigme_logo_rm.png" /></a>
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
        </div>ㄴ
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