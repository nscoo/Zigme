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
    <link rel="stylesheet" type="text/css" href="assets/css/nail_search.css">
    <!-- 이수진 css,부트스트랩 끝 -->
    <!-- body 부분 css 시작-->
    <link rel="stylesheet" type="text/css" href="assets/css/result_gallery.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>

<body>
    <!--bootstrap 반응형 사용을 위해 제일 상위 class를 container로 설정함 -->
    <div class="container">
        <!-- header 시작 -->
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
                                    <br/>
                                </ul>
                            </li>
                            <li><a href="#">회사안</a>
                                <ul>
                                    <li><a href="#">메뉴추천</a></li>
                                    <li><a href="#">업무 주기능</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <li><a href="#">5분 스트레칭</a></li>
                                    <br/>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/main.do">퇴근길</a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/restaurant_search.do">Restaurant</a></li>
                                    <li><a href="${pageContext.request.contextPath}/music_select1.do">Music</a></li>
                                    <li><a href="${pageContext.request.contextPath}/nail_search.do">Beauty</a></li>
                                    <li><a href="${pageContext.request.contextPath}/nearby.do" >Nearby</a></li>
                                    <li><a href="${pageContext.request.contextPath}/traffic_search.do">Transportation</a></li>
                                    <li><a href="${pageContext.request.contextPath}/mylist.do">My List</a></li>
                                </ul>
                            </li>
                            <li><a href="#">실내</a>
                                <ul>
                                    <li><a href="#">영화추천</a></li>
                                    <li><a href="#">오늘의 쇼핑</a></li>
                                    <li><a href="#">이직메이트</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <br/>
                                </ul>
                            </li>
                            <li><a href="#">실외</a>
                                <ul>
                                    <li><a href="#">걷기장소추천</a></li>
                                    <li><a href="#">커뮤니티</a></li>
                                    <li><a href="#">문화</a></li>
                                    <li><a href="#">체육</a></li>
                                    <li><a href="#">교통정보보기</a></li>
                                    <br/>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <span style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776;</span>
                </div>
                <div id="top_logo">
                    <a href="${pageContext.request.contextPath}/main.do">
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
                            <li role="presentation"><a role="menuitem" href="${pageContext.request.contextPath}/nail_search.do">네일샵</a></li>
                            <li role="presentation"><a role="menuitem" href="${pageContext.request.contextPath}/hair_search.do">미용실</a></li>
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
                <div id="search_input" class="input-group">
                    <input type="text" class="form-control" placeholder="강남구 서초동 네일샵">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fas fa-search"></i></button>
                    </span>
                </div>
            </div>
            <!-- header 끝-->
            <!-- 네일 검색결과 부분 시작-->
            <h1>Best5</h1>
            <br />
            <!-- 큰 통 박스 -->
            <div class="jumbotron">
                <div class="jumbo_img">
                    <img src="assets/img/nail1.jpg" alt="best5 사진">
                </div>
                <div class="shop_title">
                    <a href="#" style="text-decoration: none;">
                        Nail A.LaMode&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
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
                        주소 : 서울특별시 강남구 서초동
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
                        기본 컬러젤: 40,000원<br />
                        이달의 이벤트: 60,000원<br />
                        프렌치 네일: 개당 10,000원
                    </p>
                    <p>
                        <img src="assets/img/clipboard.png" width="20px" height="20px">
                        추가정보?
                    </p>
                </div>
            </div>
            <div class="jumbotron">
                <div class="jumbo_img">
                    <img src="assets/img/nail2.jpg" alt="best5 사진">
                </div>
                <div class="shop_title">
                    <a href="#" style="text-decoration: none;">
                        살롱드네일&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
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
                        주소 : 서울특별시 강남구 서초동
                    </p>
                    <p>
                        <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                        주차불가, 동반시술가능
                    </p>
                    <p>
                        <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                        운영시간: 12:00 ~ 20:00
                    </p>
                </div>
                <div class="jumbo_info">
                    <p>
                        <br />
                        <img src="assets/img/clipboard.png" width="20px" height="20px">
                        메뉴 <br />
                        기본 컬러젤: 30,000원<br />
                        이달의 이벤트: 70,000원<br />
                        프렌치 네일: 개당 15,000원
                    </p>
                    <p>
                        <img src="assets/img/clipboard.png" width="20px" height="20px">
                        추가정보?
                    </p>
                </div>
            </div>
            <div class="jumbotron">
                <div class="jumbo_img">
                    <img src="assets/img/nail3.jpg" alt="best5 사진">
                </div>
                <div class="shop_title">
                    <a href="#" style="text-decoration: none;">
                        츄잉네일&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
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
                        주소 : 서울특별시 강남구 서초동
                    </p>
                    <p>
                        <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                        동반시술불가, 주차가능
                    </p>
                    <p>
                        <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                        운영시간: 13:00 ~ 21:00
                    </p>
                </div>
                <div class="jumbo_info">
                    <p>
                        <br />
                        <img src="assets/img/clipboard.png" width="20px" height="20px">
                        메뉴 <br />
                        기본 컬러젤: 30,000원<br />
                        이달의 이벤트: 55,000원<br />
                        프렌치 네일: 개당 9,000원
                    </p>
                    <p>
                        <img src="assets/img/clipboard.png" width="20px" height="20px">
                        추가정보?
                    </p>
                </div>
            </div>
            <div class="jumbotron">
                <div class="jumbo_img">
                    <img src="assets/img/nail4.jpg" alt="best5 사진">
                </div>
                <div class="shop_title">
                    <a href="#" style="text-decoration: none;">
                        상철이네일샵&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
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
                        주소 : 서울특별시 강남구 서초동
                    </p>
                    <p>
                        <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                        동반시술시 예약필수
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
                        기본 컬러젤: 50,000원<br />
                        이달의 이벤트: 80,000원<br />
                        프렌치 네일: 개당 12,000원
                    </p>
                    <p>
                        <img src="assets/img/clipboard.png" width="20px" height="20px">
                        추가정보?
                    </p>
                </div>
            </div>
            <div class="jumbotron">
                <div class="jumbo_img">
                    <img src="assets/img/nail5.jpg" alt="best5 사진">
                </div>
                <div class="shop_title">
                    <a href="#" style="text-decoration: none;">
                        Noir. Nail&nbsp;<a href="www.instagram.com"><img src="assets/img/instagram.png" width="30px" height="30px"></a>
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
                        주소 : 서울특별시 강남구 서초동
                    </p>
                    <p>
                        <img src="assets/img/parked-car.png" alt="주차가능?" width="30px" height="30px">
                        주차가능, 발렛가능
                    </p>
                    <p>
                        <img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                        운영시간: 12:00 ~ 20:00
                    </p>
                </div>
                <div class="jumbo_info">
                    <p>
                        <br />
                        <img src="assets/img/clipboard.png" width="20px" height="20px">
                        메뉴 <br />
                        기본 컬러젤: 40,000원<br />
                        이달의 이벤트: 60,000원<br />
                        프렌치 네일: 개당 10,000원
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
                                <img src="assets/img/nail1.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail2.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail3.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail4.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail5.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail6.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail7.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail8.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                </ul>
                <ul id="gallery">
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail1.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail2.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail3.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail4.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail5.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail6.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail7.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="thumb">
                                <img src="assets/img/nail8.jpg" alt="이미지1" />
                            </span>
                            <span class="text">상호명이 들어가는자리</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- footer 시작 -->
            <%@ include file="footer.jsp" %>
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

        function w3_open() {
            document.getElementById("mySidebar").style.display = "block";
        }

        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
        }
        </script>
</body>

</html>