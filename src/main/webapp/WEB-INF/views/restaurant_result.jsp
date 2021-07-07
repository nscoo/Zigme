<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
    <link rel="stylesheet" type="text/css" href="assets/css/container.css">
    <!-- 이수진 css,부트스트랩 끝 -->
    <!-- body 부분 css 시작-->
    <link rel="stylesheet" type="text/css" href="assets/css/result_gallery.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/result.css">
    <!-- 인스타그램 하트스타일-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                        <button type="button" class="btn btn-success btn-xs" onclick="location.href='login.html'">Login</button>
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
                <div id="header_banner">
                    <div id="search_input" class="input-group">
                        <input type="text" class="form-control" placeholder="강동구 풍납동 회식">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fas fa-search"></i></button>
                        </span>
                    </div>
                </div>
            </div>
            <!-- header 끝-->
            <!-- 네일 검색결과 부분 시작-->
            <div class="container">
                <h1>Best5</h1>
                <br />
                <!-- 큰 통 박스 -->
                <div class="jumbotron">
                    <div class="jumbo_img">
                        <img src="assets/img/menu1.jpg" alt="best5 사진">
                    </div>
                    <div class="shop_title">
                        <a href="#" style="text-decoration: none;">
                            벌집삼겹살&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
                        </a>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/call.png" width="20px" height="20px">
                            전화번호 : 02-457-1234
                        </p>
                        <p>
                            <img src="assets/img/placeholder-filled-point.png" width="20px" height="20px">
                            주소 : 서울특별시 강동구 풍납동
                        </p>
                        <p>
                            <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                            주차가능, 발렛가능
                        </p>
                        <p>
                            <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                            운영시간: 10:00 ~ 22:00
                        </p>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            메뉴 <br />
                            벌집 삼겹살: 12,000원<br />
                            갈매기살: 9,000원<br />
                            감자 짜글이: 6,000원
                        </p>
                        <p>
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            추가정보?
                        </p>
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="jumbo_img">
                        <img src="assets/img/menu2.jpg" alt="best5 사진">
                    </div>
                    <div class="shop_title">
                        <a href="#" style="text-decoration: none;">
                            자매수산&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
                        </a>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/call.png" width="20px" height="20px">
                            전화번호 : 02-425-1256
                        </p>
                        <p>
                            <img src="assets/img/placeholder-filled-point.png" width="20px" height="20px">
                            주소 : 서울특별시 강동구 풍납동
                        </p>
                        <p>
                            <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                            주차공간협소
                        </p>
                        <p>
                            <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                            운영시간: 16:00 ~ 22:00
                        </p>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            메뉴 <br />
                            모듬회: 32,000원<br />
                            광어회: 27,000원<br />
                            물회비빔밥: 15,000원
                        </p>
                        <p>
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            추가정보?
                        </p>
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="jumbo_img">
                        <img src="assets/img/menu3.jpg" alt="best5 사진">
                    </div>
                    <div class="shop_title">
                        <a href="#" style="text-decoration: none;">
                            삼원가든&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
                        </a>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/call.png" width="20px" height="20px">
                            전화번호 : 02-327-1234
                        </p>
                        <p>
                            <img src="assets/img/placeholder-filled-point.png" width="20px" height="20px">
                            주소 : 서울특별시 강동구 풍납동
                        </p>
                        <p>
                            <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                            풍납 제2공영주차장 이용가능
                        </p>
                        <p>
                            <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                            운영시간: 11:00 ~ 21:00
                        </p>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            메뉴 <br />
                            한우 꽃등심(300g): 32,000원<br />
                            한우 치맛살(320g): 27,000원<br />
                            된장찌개: 9,000원
                        </p>
                        <p>
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            추가정보?
                        </p>
                    </div>
                </div>
                <div class="jumbotron">
                    <div class="jumbo_img">
                        <img src="assets/img/menu4.jpg" alt="best5 사진">
                    </div>
                    <div class="shop_title">
                        <a href="javascript:void(0);" style="text-decoration: none;" onClick="openPopup()">
                            당신은지금치킨이땡긴다&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
                        </a>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/call.png" width="20px" height="20px">
                            전화번호 : 02-457-1234
                        </p>
                        <p>
                            <img src="assets/img/placeholder-filled-point.png" width="20px" height="20px">
                            주소 : 서울특별시 강동구 풍납동
                        </p>
                        <p>
                            <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                            주차가능, 발렛가능
                        </p>
                        <p>
                            <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                            운영시간: 14:00 ~ 22:00
                        </p>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            메뉴 <br />
                            오리지널 치킨: 17,000원<br />
                            양념 치킨: 18,000원<br />
                            스노윙치즈 치킨: 18,000원
                        </p>
                        <p>
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            추가정보?
                        </p>
                    </div>
                </div>
                <div id="popupLayer">
                    <div id="popupContent">
                        <div id="popup_image_box">
                            <image src="assets/img/menu4.jpg" width="240px" height="240px" />
                            <image src="assets/img/chi.png" width="240px" height="240px" />
                            <image src="assets/img/chi1.jpg" width="240px" height="240px" />
                        </div>
                        <div id="popup_content_1">
                            <h3>당신은 지금 치킨이 땡긴다&nbsp;<span id=heart><i class="fa fa-heart-o" aria-hidden="true"></i> </span>
                            </h3>
                        </div>
                        <div id="popup_content_2">
                            <div id="info_left">
                                <div id="info_num"><img src="assets/img/call.png" width="20px" height="20px">&nbsp;전화번호 : 02-445-9598</div>
                                <div id="info_add"><img src="assets/img/add.png" width="20px" height="20px">&nbsp;주소 : 서울 강동구 진황도로 29길</div>
                                <div id="info_ps">
                                    <img src="assets/img/ps.png" width="25px" height="25px">&nbsp;PS : 주차 가능
                                </div>
                            </div>
                            <div id="info_right">
                                <div id="info_time"><img src="assets/img/time.png" width="20px" height="20px">&nbsp;영업시간 : 10:00-22:00</div>
                                <div id="info_etc"><img src="assets/img/etc.png" width="20px" height="20px">&nbsp;추가할 정보들 :</div>
                                <div id="info_etc"><img src="assets/img/etc.png" width="20px" height="20px">&nbsp;추가할 정보들 :</div>
                            </div>
                        </div>
                        <div id="popup_content_3">
                            <div id="menu" style="padding-top: 3px;">
                                <h4>메뉴</h4>
                                <p style="font-size: 15px">빠네 치킨, 피코 치킨, 크리스피 치킨, 허니갈릭 치킨</p>
                            </div>
                            <div id="price" style="padding-top: 3px;">
                                <h4>검색 키워드</h4>
                                <p style="font-size: 15px">커플, 신나는, 친구와의 모임, 수제맥주, 회식 장소, 숨겨진 맛집</p>
                            </div>
                        </div>
                        <div id="popup_content_4">
                            <div id="graph_left" style="font-size: 18px">
                                통계 결과
                                <img src="assets/img/graph1.png" width="280" height="220px">
                            </div>
                            <div id="graph_right" style="font-size: 18px">
                                나이대별 선호도
                                <img src="assets/img/graph2.png" width="280" height="220px">
                            </div>
                        </div>
                    </div>
                    <div class="b-close"></div>
                </div>
                <div class="jumbotron">
                    <div class="jumbo_img">
                        <img src="assets/img/menu5.jpg" alt="best5 사진">
                    </div>
                    <div class="shop_title">
                        <a href="#" style="text-decoration: none;">
                            세광양대창&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
                        </a>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/call.png" width="20px" height="20px">
                            전화번호 : 02-367-1784
                        </p>
                        <p>
                            <img src="assets/img/placeholder-filled-point.png" width="20px" height="20px">
                            주소 : 서울특별시 강동구 풍납동
                        </p>
                        <p>
                            <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                            주차불가능
                        </p>
                        <p>
                            <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                            운영시간: 13:00 ~ 23:00
                        </p>
                    </div>
                    <div class="jumbo_info">
                        <p>
                            <br />
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            메뉴 <br />
                            모듬곱창: 32,000원<br />
                            양대창: 19,000원<br />
                            곱창전골: 14,000원
                        </p>
                        <p>
                            <img src="assets/img/clipboard.png" width="20px" height="20px">
                            추가정보?
                        </p>
                    </div>
                </div>
                <br />
                <hr />
                <div id="normal_list">
                    <ul id="gallery">
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu1.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu2.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu3.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu4.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu5.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu6.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu7.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu8.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                    </ul>
                    <ul id="gallery">
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu1.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu2.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu3.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu4.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu5.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu6.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu7.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="thumb">
                                    <img src="assets/img/menu8.jpg" alt="이미지1" />
                                </span>
                                <span class="text">상호명이 들어가는자리</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- footer 시작 -->
                <div id="footer">
                    <div id="footer_content">
                        <div id="footer_img">
                            <a href="#"><img src="assets/img/zigme_logo_rm.png" /></a>
                        </div>
                        <div id="footer_text">
                            <div class="footer_row">
                                <span class="glyphicon glyphicon-thumbs-up"> Name </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                PROJECT PORTFOLIO Big Data Class 8
                            </div>
                            <div class="footer_row">
                                <span class="glyphicon glyphicon-user"> Manager </span>
                                &nbsp;
                                Younga Joo
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
            <!-- footer 끝-->
        </div>
        <!-- Javascript -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script type="text/javascript" src="assets/js/bpopup.js"></script>
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

        //사이드바 메뉴
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
        //상세팝업
        function openPopup() {
            $("#popupLayer").bPopup({
                    iframeAttr: 'frameborder=”auto”',
                    iframeAttr: 'frameborder=”0',
                    contentContainer: '.popupContent',

                    onOpen: function() {},

                    onClose: function() {}
                },
                function() {});
        }
        //찜하트 구현 js
        $(document).ready(function() {
            $("#heart").click(function() {
                if ($("#heart").hasClass("liked")) {
                    $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
                    $("#heart").removeClass("liked");
                } else {
                    $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
                    $("#heart").addClass("liked");
                }
            });
        });
        </script>
</body>

</html>