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
    <link rel="stylesheet" type="text/css" href="assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="assets/css/container.css">
</head>
<!-- 내용이 적어서 css 파일 별도로 안만듬-->
<style type="text/css">
#search_select>ul>li.active {
    border: 0px solid rgb(224, 224, 224);
}

#search_select>ul>li.active>a {
    background-color: rgb(224, 224, 224);
    border: 1px solid rgb(224, 224, 224);
    font-size: 20px;
    color: #000000;
}

#search_select>ul>li:not(.active)>a {
    background-color: #423d47;
    border: 3px solid rgb(224, 224, 224);
    border-radius: 0px;
    color: #ffffff;
}

/* 선택 탭 내용 */
#search_select>div>.active {
    border: 10px solid lightgray;
    background-color: lightgray;
    height: 320px;
}

#find_box {
    width: 600px;
    height: 500px;
    margin: 0 auto;
}

.form-control {
    width: 150px;
}

.btn-primary {
    margin-top: 15px;
    margin-left: 230px;
}

.form-group {
    margin: 15px auto;
    padding-left: 110px;

}

.form-control {
    width: 350px;
}

/*반응형*/
@media(max-width: 480px) {
    #find_box {
        width: 420px;
        height: 500px;
        margin: 0 auto;
    }

    .form-group {
        margin: 15px auto;
        padding-left: 30px;
    }

    .btn-primary {
        margin-top: 15px;
        margin-left: 160px;

    }
}
</style>

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
                            <li><a href="${pageContext.request.contextPath}/.do">퇴근길</a>
                                <ul>
                                    <li><a href="#" onclick="location.href='${pageContext.request.contextPath}/restaurant_search.do'">Restaurant</a></li>
                                    <li><a href="#" onclick="location.href='${pageContext.request.contextPath}/music_select1.do'">Music</a></li>
                                    <li><a href="#" onclick="location.href='${pageContext.request.contextPath}/nail_search.do'">Beauty</a></li>
                                    <li><a href="#">Nearby</a></li>
                                    <li><a href="#" onclick="location.href='${pageContext.request.contextPath}/traffic_search.do'">Transportation</a></li>
                                    <li><a href="#" onclick="location.href='${pageContext.request.contextPath}/mylist.do'">My List</a></li>
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
                    <a href="#">
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
                <ul class="nav nav-tabs nav-justified" id="find_options">
                    <li class="dropdown">
                        <a id="dropdownMenu1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" style="font-size: 20px;">Beauty<b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation"><a role="menuitem" href="#">네일샵</a></li>
                            <li role="presentation"><a role="menuitem" href="#">미용실</a></li>
                        </ul>
                    </li>
                    <li><a href='${pageContext.request.contextPath}/music_select1.do' style="font-size: 20px;">Music</a></li>
                    <li><a href='${pageContext.request.contextPath}/restaurant_search.do' style="font-size: 20px;">Restaurant</a></li>
                    <li><a href='${pageContext.request.contextPath}/nearby.do' style="font-size: 20px;">Nearby</a></li>
                    <li><a href='${pageContext.request.contextPath}/traffic_search.do' style="font-size: 20px;">Transportation</a></li>
                    <li><a href='${pageContext.request.contextPath}/mylist.do' style="font-size: 20px;">MyList</a></li>
                </ul>
            </div>
            <!-- header 끝-->
            <!--옵션 선택 부분 -->
            <div id=find_box>
                <div id="search_select">
                    <ul class="nav nav-tabs nav-justified">
                        <li class="active"><a href="#loc" data-toggle="tab" role="tab" class="tab-link-sub">아이디 찾기</a></li>
                        <li><a href="#food" data-toggle="tab" role="tab" class="tab-link-sub">비밀번호 찾기</a></li>
                    </ul>
                    <div role="tabpanel" class="tab-content tab-area">
                        <div class="tab-pane search-tab-content active filter inner2--bottom" id="loc">
                            <!--id 찾기-->
                            <div id="btn_box">
                                <form role="form">
                                    <div class="form-group">
                                        <label for="inputName">이름</label>
                                        <input type="text" class="form-control" id="inputName" placeholder="이름입력">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMobile">전화번호</label>
                                        <input type="tel" class="form-control" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMobile">생년 월일</label>
                                        <input type="date" class="form-control" id="inputBirth" placeholder="생년월일입력">
                                    </div>
                                    <div id="regist_button">
                                        <button type="submit" id="id-submit" class="btn btn-primary">
                                            아이디 찾기<i class="fa fa-check spaceLeft"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane search-tab-content" id="food">
                            <div id="btn_box">
                                <form role="form">
                                    <div class="form-group">
                                        <label for="inputName">이름</label>
                                        <input type="text" class="form-control" id="inputName" placeholder="이름입력">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputID">아이디</label>
                                        <input type="text" class="form-control" id="inputID" placeholder="ID입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMobile">휴대폰 번호</label>
                                        <input type="tel" class="form-control" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요">
                                    </div>
                                    <div id="regist_button">
                                        <button type="submit" id="pwd-submit" class="btn btn-primary">
                                            비밀번호 찾기<i class="fa fa-check spaceLeft"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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