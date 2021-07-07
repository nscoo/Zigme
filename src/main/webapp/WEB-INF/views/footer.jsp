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
</head>

<body>
    <!--bootstrap 반응형 사용을 위해 제일 상위 class를 container로 설정함 -->


            <!-- footer 시작 -->
            <div id="footer" style="margin-top: 50px;">
                <div id="footer_content">
                    <div id="footer_img">
                        <a href="${pageContext.request.contextPath}/main.do"><img src="assets/img/zigme_logo_rm.png" /></a>
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