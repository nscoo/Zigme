<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	// GET 파라미터 수신
	String ans1 = request.getParameter("ans1");
	String ans2 = request.getParameter("ans2");
	String ans3 = request.getParameter("ans3");
	String ans4 = request.getParameter("ans4");

%>

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
    <!-- favicon -->
<link rel="icon" type="image/png" sizes="192x192" href="assets/img/favicon192.png"> 
<link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon32.png"> 
<link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon16.png">s
    <!-- 반응형 폰트 작업 -->
    <style type="text/css">
    
    #visualize {
         margin-top: -17px;
     }
     
     
    @media screen and (max-width: 480px) {
        .video-text {
            font-size: 16px;
        }

        .speech-bubble {
            font-size: 19px;
        }

        .balloon_1 {
            font-size: 18px;
        }
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
                    <button id="start" type="button" class="btn btn-default btn-xs">퇴근까지</button>
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
            <!-- header 끝-->
            <!-- music_result 시작 -->
                <div id="container_music">
                <div id="container_banner">
                </div>
                <div id="carousel_video">
                    <!-- 캐러셀 영역 구성 -->
                    <div id="carousel-example-generic" class="carousel slide" data-interval="false">
                        <!-- 현재 위치 표시 -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        </ol>
                        <!-- 내용 영역 -->
                        <div class="carousel-inner">
                            <!-- 항목 (1) -->
                            <c:choose>
                            <c:when test="${searchYoutubeList !=null && searchYoutubeList.items.size()>0}">
                            	<c:forEach var="item" items="${searchYoutubeList.items}" varStatus="status" >
                                  	<c:if test="${status.count eq 1 }">
                                  		<div class="item active" id="video_item">
                              			<iframe id="video-size" class="carousel_video_img" src="https://www.youtube.com/embed/${item.id.videoId}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
                        	   			<div class="container">
                                    		<div class="carousel-caption">
                                           		<p class="video-text">
                                           		${item.snippet.title}

                                           		</p>
                                    		</div>
                                		</div>
                             		</div>
                                  	</c:if>
                                  	<c:if test="${status.count ne 1 }">
                                  		<div class="item" id="video_item">
                              			<iframe id="video-size" class="carousel_video_img" src="https://www.youtube.com/embed/${item.id.videoId}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
                        	   			<div class="container">
                                    		<div class="carousel-caption">
                                           		<p class="video-text">
                                             		${item.snippet.title}
                                            		
                                           		</p>
                                    		</div>
                                		</div>
                             		</div>
                                  	</c:if>
                                  	
                                 
                                 
                             	</c:forEach>
                            </c:when>
                          	</c:choose>
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
                	<c:set var="happy" value="${output.happy}" />
                	<c:set var="joy" value="${output.joy}" />
                	<c:set var="mad" value="${output.mad}" />
                	<c:set var="blue" value="${output.blue}" />
                	<c:set var="comfy" value="${output.comfy}" />
                	
                	
                	<c:if test="${ans3=='행복한'}">
                		<c:set var="percent" value="${(happy/(happy+joy+mad+blue+comfy))*100}" />
                		<fmt:formatNumber var="percent" value="${percent}" pattern=".#"/>
                		 <h3 id="visualize">오늘&nbsp;<font style="font-size: 25px; color: orange; font-style: bold;">${percent}%</font>의 사람들이<br/>
                		 	너처럼 따뜻하고 <font style="font-size: 25px; color: #FB9DA7; font-style: bold;">행복한</font><br/>하루를 보내고 있다냥~<br/><br/>
                		 	행복을 느낄 줄 아는 당신,<br/>정말 멋있다냥~
                		 </h3>
                	</c:if>
                	<c:if test="${ans3=='즐거운'}">
                		<c:set var="percent" value="${(joy/(happy+joy+mad+blue+comfy))*100}" />
                		<fmt:formatNumber var="percent" value="${percent}" pattern=".#"/>
                		 <h3 id="visualize">오늘&nbsp;<font style="font-size: 25px; color: orange; font-style: bold;">${percent}%</font>의 사람들이<br/>
                		 	너처럼 왕창 <font style="font-size: 25px; color: orange; font-style: bold;">즐거운</font><br/>하루를 보내고 있다냥~<br/><br/>
                		 	긍정적인 기운이 가득한<br/>이노래 어떠냥~
                		 </h3>
                	</c:if>
                	<c:if test="${ans3=='화가나는'}">
                		<c:set var="percent" value="${(happy/(happy+joy+mad+blue+comfy))*100}" />
                		<fmt:formatNumber var="percent" value="${percent}" pattern=".#"/>
                		 <h3 id="visualize">오늘&nbsp;<font style="font-size: 25px; color: orange; font-style: bold;">${percent}%</font>의 사람들이<br/>
                		 	너처럼 <font style="font-size: 25px; color: #8EB695; font-style: bold;">속상한</font> <br/>하루를 보내고 있다냥...<br/><br/>
                		 	잠시 눈을 감고 이 노래를<br/>들어보는건 어떠냥...
                		 </h3>
                	</c:if>
                	<c:if test="${ans3=='우울한'}">
                		<c:set var="percent" value="${(happy/(happy+joy+mad+blue+comfy))*100}" />
                		<fmt:formatNumber var="percent" value="${percent}" pattern=".#"/>
                		 <h3 id="visualize">오늘&nbsp;<font style="font-size: 25px; color: orange; font-style: bold;">${percent}%</font>의 사람들이<br/>
                		 	너처럼 조금은 <font style="font-size: 25px; color: #6ECEDA; font-style: bold;">슬픈</font><br/>하루를 보내고 있다냥...<br/><br/>
                		 	이 또한 지나갈거다냥...<br/>이 노래가 널 토닥여줄거랴옹..
                		 </h3>
                	</c:if>
                	<c:if test="${ans3=='편안한'}">
                		<c:set var="percent" value="${(happy/(happy+joy+mad+blue+comfy))*100}" />
                		<fmt:formatNumber var="percent" value="${percent}" pattern=".#"/>
                		 <h3 id="visualize">오늘&nbsp;<font style="font-size: 25px; color: orange; font-style: bold;">${percent}%</font>의 사람들이<br/>
                		 	너처럼 <font style="font-size: 25px; color: #FCCCD4; font-style: bold;">평화로운</font> 하루를<br/>보내고 있다냥~<br/><br/>
                		 	안정된 기분을 따뜻하게 <br/>만들어주는 이 노래 어떠냥~
                		 </h3>
                	</c:if>
                   
                </div>
                <div id="music_cat">
                    <img src="assets/img/cat.png" width="340px" height="385px" />
                </div>
                <div class="balloon_1">
                    <a href="${pageContext.request.contextPath}/music_select1.do" style="color:white; text-decoration: none;">다시 한번 해볼거냥?</a>
                </div>
                <!-- music_result 끝 -->
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
                <!-- footer 끝-->
            </div>
            </div>
            <!-- Javascript -->
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/script.js"></script>
            <script type="text/javascript">
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


            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
            </script>
            <!-- youtube -->
            <script type="text/javascript"> 
            
            </script>
</body>

</html>