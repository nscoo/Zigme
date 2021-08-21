<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");

float s_lat = Float.parseFloat(request.getParameter("s_lat"));
float s_lng = Float.parseFloat(request.getParameter("s_lng"));
float e_lat = Float.parseFloat(request.getParameter("e_lat"));
float e_lng = Float.parseFloat(request.getParameter("e_lng"));

%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" />
<!-- countdown bar css -->
<link rel="stylesheet" href="assets/css/stylesheet.css" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="assets/css/common.css">
<link rel="stylesheet" type="text/css" href="assets/css/container.css">
<link rel="stylesheet" type="text/css" href="assets/css/traffic.css">
<link rel="stylesheet" type="text/css" href="assets/css/result.css">
<!-- 아이콘을 위한 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- 인스타그램 하트스타일-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
ul {
	padding-left: 0;
}

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

#map {
	height: 100%;
}

#floating-panel {
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: "Roboto", "sans-serif";
	line-height: 30px;
	padding-left: 10px;
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
								</ul></li>
							<li><a href="#">회사안</a>
								<ul>
									<li><a href="#">메뉴추천</a></li>
									<li><a href="#">업무 주기능</a></li>
									<li><a href="#">커뮤니티</a></li>
									<li><a href="#">5분 스트레칭</a></li>
									<br />
								</ul></li>
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
                        </ul></li>
					<li><a
						href="${pageContext.request.contextPath}/music_select1.do"
						style="font-size: 20px;">Music</a></li>
					<li><a
						href="${pageContext.request.contextPath}/restaurant_search.do"
						style="font-size: 20px;">Restaurant</a></li>
					<li><a href="${pageContext.request.contextPath}/nearby.do"
						style="font-size: 20px;">Nearby</a></li>
					<li><a
						href="${pageContext.request.contextPath}/traffic_search.do"
						style="font-size: 20px;">Transportation</a></li>
					<li><a href="${pageContext.request.contextPath}/mylist.do"
						style="font-size: 20px;">MyList</a></li>
				</ul>
			</div>
		</div>
		<!-- header 끝-->







		<!-- traffic 시작-->
		<div id="traffic_result">






			<a href="javascript:void(0);"
				style="text-decoration: none; float: right;" onClick="saveRoute()">경로저장하기<span id ="heart" class="${name2}"><i class="fa fa-heart-o" aria-hidden="true" onclick="heart('${name2}','${name}')" ></i> </span>
			</a>
		



			<div id="floating-panel">
				<b>Travel Mode :  </b>
				<select id="mode">
					<option value="TRANSIT">대중교통</option>
					<option value="DRIVING">자동차</option>
					<option value="WALKING">도보</option>
					<option value="BICYCLING">자전거</option>
				</select>
			</div>

			<div id="map"
				style="width: 100%; height: 100%; background-color: #CCCCCC; height: 700px;"></div>
		</div>
		
		
		
		<!-- traffic 끝-->






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
	<!-- Javascript -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/script.js"></script>
	<script type="text/javascript" src="assets/js/bpopup.js"></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
	<script type="text/javascript">
	function initMap() {
		  const directionsRenderer = new google.maps.DirectionsRenderer();
		  const directionsService = new google.maps.DirectionsService();
		  const map = new google.maps.Map(document.getElementById("map"), {
		    zoom: 14,
		    center: { lat: <%=s_lat%>, lng: <%=s_lng%> },
		    
		    
		  });
		  directionsRenderer.setMap(map);
		  calculateAndDisplayRoute(directionsService, directionsRenderer);
		  document.getElementById("mode").addEventListener("change", () => {
		    calculateAndDisplayRoute(directionsService, directionsRenderer);
		  });
		}

		function calculateAndDisplayRoute(directionsService, directionsRenderer) {
		  const selectedMode = document.getElementById("mode").value;
		  directionsService
		    .route({
		    	
		    	
		      origin: { lat: <%=s_lat%>, lng: <%=s_lng%>  },
		      destination: { lat: <%=e_lat%>, lng: <%=e_lng%> },


		      travelMode: google.maps.TravelMode[selectedMode],
		    })
		    .then((response) => {
		      directionsRenderer.setDirections(response);
		    })
		    .catch((e) => window.alert("대한민국은 대중교통 검색 결과만 제공합니다."));
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0mRgl-STDQIH6sNl2fvE2YshQhzYmRS0&callback=initMap">
		
	</script>
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
		//상세팝업
		function openPopup() {
			$("#popupLayer").bPopup({
				iframeAttr : 'frameborder=”auto”',
				iframeAttr : 'frameborder=”0',
				contentContainer : '.popupContent',

				onOpen : function() {
				},

				onClose : function() {
				}
			}, function() {
			});
		}
		
		
		//하트 찜하기
		function heart(){
          
        	  //찜  취소
	         if($("#heart").hasClass("liked")){
	        	  $.ajax({
	        		  type :"POST",
	        		  url : "cancel_tbasket",
	        		  dataType : "json",
	        		  data :{"s_lat": <%=s_lat%>,
	        			  	 "s_lng": <%=s_lng%>,
	        			  	 "e_lat": <%=e_lat%>,
	        			  	 "e_lng": <%=e_lng%>
	        		  		},
	        		  success:function(data){
	        			  if(data == 0){
	        				  alert('삭제 실패 다시 시도해주세요');
	        				  return false;
	        			  }else{
	                      $("#heart."+name).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
	                      $("#heart."+name).removeClass("liked");
	                      }
	        		  },
	        		  
	        	  })
            }else{ //찜하기
          	  $.ajax({
        		  type : "POST",
        		  url : "add_tbasket",
        		  dataType : "json",
        		  data : {"s_lat": <%=s_lat%>,
	     			  	  "s_lng": <%=s_lng%>,
	    			  	  "e_lat": <%=e_lat%>,
	    			  	  "e_lng": <%=e_lng%>
	    		  		 },
       	  		 success:function(data){
       	  			 	if(data==3){
       	  			 		alert('로그인 후 이용해주세요 로그인 페이지로 이동합니다');
       	  			 		location.replace("main.do");
       	  			 		return false;
       	  			 	}else if(data ==-1){
       	  			 		alert('저장 실패 다시 시도해주세요');
       	  			 		return false;
       	  			 	}
       	  			 	else{
       	  	              $("#heart."+name).html('<i class="fa fa-heart" aria-hidden="true"></i>');
       	              	  $("#heart."+name).addClass("liked");
       	  			 	}

        		  },
        		
        	  })
            }


          
        }
	</script>
</body>

</html>