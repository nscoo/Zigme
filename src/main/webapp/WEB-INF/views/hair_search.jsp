<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    background-image: url(assets/img/flowers2.jpg);
    background-size: cover;

}

	/* 사이드바 */
	.sidebar_content {position:fixed;top:0;right:-300px;width:300px;height:100%;background:#999;transition:all .35s;z-index:5;}
	.sidebar_content > ul {margin:20px;}
	.sidebar_content > ul > li {border-bottom:1px solid #ccc;list-style:none;}
	.sidebar_content > ul > li > a {display:inline-block;width:auto;color:#fff;padding:10px;margin:10px;background:#f5f5f5;}
	.sidebar_content label[for*='sidebar'] {position:absolute;top:0;left:0;width:100%;height:100%;z-index:-1;}
	
	/* 사이드바 외 배경영역 */
	.background {position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.8);transition:all .35s;opacity:0;visibility:hidden;z-index:1;}

	/* input 체크 */
	input#sidebar:checked ~ header label {background-position:-24px 0;}
	input#sidebar:checked ~ .sidebar_content {right:0;}
	input#sidebar:checked ~ .background  {opacity:1;visibility:visible;}
	
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
            
            <!-- 네일 검색결과 부분 시작-->
            <div id="head_banner">
			<!-- 검색 input을 form 태그로 바꾸어서 파라미터 전달을 가능하게 만듬 -->
                <form method="get" action="${pageContext.request.contextPath}/hair_result.do" } id="search_input"class="input-group">
                	<input type="search" name="keyword" class="form-control" placeholder="주소나 상호명을 입력하세요" />
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="fas fa-search"></i></button>
                    </span>        	
                </form>
                    

            </div>
            
            <input type="checkbox" id="sidebar" style="display: none;" >
			<!-- 헤더 네비게이션 -->
			
			<header>
				<label for="sidebar" class="menu" style="margin-top:20px; float: right; transform:translateY(-50%);width:24px;height:24px;background:url('assets/img/menu.png') 0 0 no-repeat;cursor:pointer;"></label>
			</header>
		
			
			<!-- 사이드바 -->
			<div class="sidebar_content">
				<ul>
					<li><a>메뉴1</a></li>
					<li><a>메뉴2</a></li>
					<li><a>메뉴3</a></li>
					<li><a>메뉴4</a></li>
					<li><a>메뉴5</a></li>
					<li><a>메뉴6</a></li>
				</ul>
				<label for="sidebar"></label>
			</div>
			<!-- 사이드바 외 영역 -->
			<label for="sidebar" class="background"></label>

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
                        <img src="assets/img/hair3.jpg" class="carousel_img" alt="슬라이더(1)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>올 시즌 베스트<br />
                                    애쉬핑크는 어떠신가요?!</h1>
                                <div class="carousel_shop">
                                    <p>주노헤어 종각점</p>
                                    <h6>서울특별시 종로구 인사동로 12길
                                        <br />기본 커트 30,000원</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 항목 (2) -->
                    <div class="item">
                        <img src="assets/img/hair2.jpg" class="carousel_img" alt="슬라이더(2)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>세상의 모든<br />
                                    단발 디자인을 만나보세요!</h1>
                                <div class="carousel_shop">
                                    <p>리안헤어 낙원점</p>
                                    <h6>서울특별시 종로구 낙원로 29길
                                        <br />스타일링 15,000원</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 항목 (3) -->
                    <div class="item">
                        <img src="assets/img/hair1.jpg" class="carousel_img" alt="슬라이더(3)">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>손상 걱정없는<br />
                                    염색은 류자매헤어에서!</h1>
                                <div class="carousel_shop">
                                    <p>류자매헤어</p>
                                    <h6>서울특별시 강남구 테헤란로 12길
                                        <br />이벤트 염색 90,000원</h6>
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