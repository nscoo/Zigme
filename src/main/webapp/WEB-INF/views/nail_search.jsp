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
    <style type="text/css">
    #head_banner {
    position: relative;
    height: 420px;
    overflow: hidden;
    background-image: url(assets/img/flowers.jpg);
    background-size: cover;

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
                            <li><a href="#">퇴근길</a>
                               <ul>
                                    <li><a href="${pageContext.request.contextPath}/restaurant_search.do">Restaurant</a></li>
                                    <li><a href="${pageContext.request.contextPath}/music_select1.do">Music</a></li>
                                    <li><a href="${pageContext.request.contextPath}/nail_search.do">Beauty</a></li>
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
                            <li role="presentation"><a role="menuitem" href="${pageContext.request.contextPath}/nail_search.do">미용실</a></li>
                        </ul>
                    </li>
                   <li><a href="${pageContext.request.contextPath}/music_select1.do" style="font-size: 20px;">Music</a></li>
                   <li><a href="${pageContext.request.contextPath}/restaurant_search.do" style="font-size: 20px;">Restaurant</a></li>
                   <li><a href="${pageContext.request.contextPath}/nearby.do" style="font-size: 20px;">Nearby</a></li>
                   <li><a href="${pageContext.request.contextPath}/traffic_search.do" style="font-size: 20px;">Transportation</a></li>
                   <li><a href="${pageContext.request.contextPath}/mylist.do" style="font-size: 20px;">MyList</a></li>        
                </ul>
            </div>
            <!-- 네일 검색결과 부분 시작-->
            <div id="head_banner">
                <div id="search_input" class="input-group">
                    <input type="text" class="form-control" placeholder="검색어를 입력하세요">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="location.href='${pageContext.request.contextPath}/nail_result.do'"><i class="fas fa-search"></i></button>
                    </span>
                </div>
            </div>
        </div>
        <!-- header 끝-->
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
                        <img src="assets/img/nail2.jpg" class="carousel_img" alt="슬라이더(1)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>올 시즌 베스트<br />
                                    컬러만 가득 담아볼래요?</h1>
                                <div class="carousel_shop">
                                    <p>Nail.A la Mode</p>
                                    <h6>서울특별시 종로구 인사동로 12길
                                        <br />기본 젤컬러 30,000원</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 항목 (2) -->
                    <div class="item">
                        <img src="assets/img/nail1.jpg" class="carousel_img" alt="슬라이더(2)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>세상의 모든<br />
                                    네일 디자인을 만나보세요!</h1>
                                <div class="carousel_shop">
                                    <p>츄잉네일</p>
                                    <h6>서울특별시 종로구 낙원로 29길
                                        <br />프렌치네일 개당 15,000원</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 항목 (3) -->
                    <div class="item">
                        <img src="assets/img/nail8.jpg" class="carousel_img" alt="슬라이더(3)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>손상 걱정없는<br />
                                    젤드릴 케어는 여기서!</h1>
                                <div class="carousel_shop">
                                    <p>류자매네일</p>
                                    <h6>서울특별시 강남구 테헤란로 12길
                                        <br />이벤트네일 90,000원</h6>
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
    </script>
</body>

</html>