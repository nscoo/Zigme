<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="assets/css/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="assets/css/container.css">
<link rel="stylesheet" type="text/css" href="assets/css/common.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!--css 폴더 링크가 작동하지않아서 페이지안에서 작성한 css -->
<style type="text/css">
#search_area {
	position: relative;
	width: 1200px;
	height: 700px;
	overflow: hidden;
	background-image: url(assets/img/restaurant.jpg);
	background-position: center center;
	background-size: cover;
}

#search_box {
	width: 500px;
	position: absolute;
	top: 25%;
	left: 350px;
	text-align: center;
}

#search_box>div {
	width: 500px;
}

#search_input {
	height: 50px;
	padding-bottom: 20px;
}

/* 검색 버튼    */
#search_input>span>button {
	background-color: #f89b00;
	border: 1px solid #f89b00;
	border-radius: 5px;
	height: 50px;
	margin-top: 8px;
}

/* 검색 박스 */
#search_input>input {
	position: relative;
	top: 8px;
	border-radius: 5px;
	height: 50px;
}

/* 선택 탭 (선택) */
#search_select>ul>li.active {
	border: 0px solid #f89b00;
}

#search_select>ul>li.active>a {
	background-color: #f89b00;
	border: 1px solid #f89b00;
	font-size: 20px;
	color: #000000;
}

/* 선택 탭  */
#search_select>ul>li:not(.active)>a {
	background-color: #ffffff;
	border: 3px solid #ffffff;
	border-radius: 0px;
	color: #000000;
}

/* 선택 탭 내용 */
#search_select>div>.active {
	border: 10px solid #f89b00;
	background-color: #ffffff;
}

#search_select>div>.active>ul>li>a {
	font-size: 13px;
	color: #a0a0a0;
	text-decoration: none;
}

#search_select>div>.active>ul>li>a:hover {
	color: #000000;
	text-decoration: none;
}

#search_select>div>div>ul>li {
	display: inline-block;
	width: 100px
}

#search_tag_div {
	position: relative;
	padding-left: 2px;
	height: 30px;
}

#search_tag_div>#search_tag_div_1 {
	display: inline-block;
	padding-top: 10px;
	width: auto;
}

#search_tag_div>#search_tag_div_2 {
	display: inline-block;
	padding-top: 10px;
	width: auto;
}

#search_tag_1 {
	padding-top:8px;
	padding-left:3px;
	width: 110px;
	height: 40px;
	text-align: left;
	vertical-align: middle;
	margin-right: 10px;
	background-color: skyblue;
	font-weight: normal;
	border-radius: 5px;
	font-size: 20px;
	position:relative;
	border-radius: 5px;
}


#search_tag_2 {
	padding-top:8px;
	padding-left:3px;
	width: 110px;
	height: 40px;
	text-align: left;
	vertical-align: middle;
	margin-right: 10px;
	background-color: skyblue;
	font-weight: normal;
	border-radius: 5px;
	font-size: 20px;
	position:relative;
	border-radius: 5px;
}

#tag_button_1, #tag_button_2 {
	vertical-align: middle;
	display: inline-block;
	background-color: #cccccc;
	border-radius: 5px;
	width: 20px;
	height: 25px;
	text-decoration: none;
	text-align: center;
	position:absolute;
	top:0px;
	right:0px;
}

#tag_button_2 {
	border-radius: 5px;
}

#tag_button_1>a, #tag_button_2>a {
	width:20px;
	height:20px;
	/* border: 10px solid #cccccc; */
	vertical-align: middle;
	text-decoration: none;
	font-size: 0.01em;
}

#tag_button_1>a:hover, #tag_button_2>a:hover {
	color: #000000;
	text-decoration: none;
}

/* radio 부분 */
#search_select>div>div>div>form {
	font-size: 15px;
	color: #a0a0a0;
}

#search_select>div>div>div>form>input:checked+label span {
	font-size: 15px;
	color: #000000;
}

#search_btn {
	width: 200px;
}


/*반응형 부분*/
@media ( max-width : 480px) {
	#search_area {
		position: relative;
		width: 100%;
		height: 0;
		padding-top: calc(600/ 300 * 100%);
		overflow: hidden;
		background-image: url("assets/img/restaurant.jpg");
		background-size: cover;
	}
	#search_box {
		position: absolute;
		top: 5%;
		left: 8%;
		text-align: center;
	}
	#search_box>div {
		width: 400px;
	}
}
</style>
</head>

<body>
	<!--bootstrap 반응형 사용을 위해 제일 상위 class를 container로 설정함 -->
	<div class="container">
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
								</ul></li>
							<li><a href="#">회사안</a>
								<ul>
									<li><a href="#">메뉴추천</a></li>
									<li><a href="#">업무 주기능</a></li>
									<li><a href="#">커뮤니티</a></li>
									<li><a href="#">5분 스트레칭</a></li>
								</ul></li>
							<li><a href="main.html">퇴근길</a>
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
		<div id="search_area">
			<img src="assets/img/restaurant.jpg" width="1200px">
			<div id="search_box" role="tabpanel">
				<!-- 검색 태그 부분 -->
				<!--검색창 부분 -->
				<div id="search_input" class="input-group">
					<!-- <input id="search_input_keyword" type="text" class="form-control" placeholder="키워드를 입력하세요     ex) 분위기 가성비"> -->
					<div id="search_tag_div" align="left">
						<div id="search_tag_div_1"></div>
						<div id="search_tag_div_2"></div>
					</div>
					<span class="input-group-btn">
						<button id="search_btn" class="btn btn-default" type="button">
							<font style="color:white; font-size:18px;"><i class="fas fa-search 2x"></i></font>
							<font style="color:white; font-size:18px;">&nbsp;&nbsp;&nbsp;검색하기</font>
						</button>
					</span>
				</div>
				<!--옵션 선택 부분 -->
				<div id="search_select">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a href="#loc" data-toggle="tab"
							role="tab" class="tab-link-sub">지역</a></li>
						<li><a href="#food" data-toggle="tab" role="tab"
							class="tab-link-sub">종류</a></li>
						<li><a href="#opt" data-toggle="tab" role="tab"
							class="tab-link-sub">옵션</a></li>
					</ul>
					<div role="tabpanel" class="tab-content tab-area">
						<div
							class="tab-pane search-tab-content active filter inner2--bottom"
							id="loc">
							<ul class="clearfix list-unstyled">
								<li class="checkbox"><a href="#">강동구</a></li>
								<li class="checkbox"><a href="#">강서구</a></li>
								<li class="checkbox"><a href="#">강남구</a></li>
								<li class="checkbox"><a href="#">강북구</a></li>
								<li class="checkbox"><a href="#">동대문구</a></li>
								<li class="checkbox"><a href="#">서대문구</a></li>
								<li class="checkbox"><a href="#">양천구</a></li>
								<li class="checkbox"><a href="#">구로구</a></li>
								<li class="checkbox"><a href="#">서초구</a></li>
								<li class="checkbox"><a href="#">동작구</a></li>
								<li class="checkbox"><a href="#">도봉구</a></li>
								<li class="checkbox"><a href="#">노원구</a></li>
								<li class="checkbox"><a href="#">중랑구</a></li>
								<li class="checkbox"><a href="#">송파구</a></li>
								<li class="checkbox"><a href="#">영등포구</a></li>
								<li class="checkbox"><a href="#">관악구</a></li>
								<li class="checkbox"><a href="#">금천구</a></li>
								<li class="checkbox"><a href="#">마포구</a></li>
								<li class="checkbox"><a href="#">중구</a></li>
								<li class="checkbox"><a href="#">은평구</a></li>
								<li class="checkbox"><a href="#">용산구</a></li>
								<li class="checkbox"><a href="#">광진구</a></li>
								<li class="checkbox"><a href="#">성동구</a></li>
								<li class="checkbox"><a href="#">상관없음</a></li>
							</ul>
						</div>
						<div class="tab-pane search-tab-content" id="food">
							<ul class="clearfix list-unstyled">
								<li class="checkbox"><a href="#">삼겹살</a></li>
								<li class="checkbox"><a href="#">소고기</a></li>
								<li class="checkbox"><a href="#">치킨</a></li>
								<li class="checkbox"><a href="#">오리고기</a></li>
								<li class="checkbox"><a href="#">회</a></li>
								<li class="checkbox"><a href="#">곱창</a></li>
								<li class="checkbox"><a href="#">양고기</a></li>
								<li class="checkbox"><a href="#">닭갈비</a></li>
								<li class="checkbox"><a href="#">족발보쌈</a></li>
								<li class="checkbox"><a href="#">감자탕</a></li>
								<li class="checkbox"><a href="#">찌개</a></li>
								<li class="checkbox"><a href="#">중식당</a></li>
								<li class="checkbox"><a href="#">뷔페</a></li>
								<li class="checkbox"><a href="#">호프집</a></li>
								<li class="checkbox"><a href="#">와인바</a></li>
								<li class="checkbox"><a href="#">레스토랑</a></li>
							</ul>
						</div>
						<div class="tab-pane search-tab-content" id="opt">
							<div>
								<h4>최소 리뷰수</h4>
								<form>
									<input type="radio" name="review_count" value="0"><label><span>&nbsp;상관없음&nbsp;
									</span></label> <input type="radio" name="review_count" value="1"><label><span>&nbsp;1&nbsp;
									</span></label> <input type="radio" name="review_count" value="5"><label><span>&nbsp;5&nbsp;
									</span></label> <input type="radio" name="review_count" value="10"><label><span>&nbsp;10&nbsp;
									</span></label> <input type="radio" name="review_count" value="20"><label><span>&nbsp;20&nbsp;
									</span></label> <input type="radio" name="review_count" value="30"><label><span>&nbsp;30&nbsp;
									</span></label> <input type="radio" name="review_count" value="50"><label><span>&nbsp;50&nbsp;
									</span></label>
								</form>
							</div>
							<div>
								<h4>최소 평점</h4>
								<form>
									<input type="radio" name="stars" value="0"><label><span>&nbsp;상관없음&nbsp;
									</span></label> <input type="radio" name="stars" value="2"><label><span>&nbsp;2.0&nbsp;
									</span></label> <input type="radio" name="stars" value="3"><label><span>&nbsp;3.0&nbsp;
									</span></label> <input type="radio" name="stars" value="4"><label><span>&nbsp;4.0&nbsp;
									</span></label> <input type="radio" name="stars" value="5"><label><span>&nbsp;5.0&nbsp;
									</span></label>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end search_box -->
		</div>
		<!-- end search_area -->
		<!-- footer 시작 -->
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
	<script type="text/javascript">
		$(function() {

			$("#search_select>div>div:nth-child(1)>ul>li")
					.click(
							function(e) {
								e.preventDefault();
								var tag = $(this).text();
								if ($("#search_tag_div_1>div").length < 1) {
									$("#search_tag_div_1")
											.append(
													"<div id='search_tag_1'>"
															+ "<span id='tag_1'>&nbsp;"
															+ tag
															+ "&nbsp;</span>"
															+ "<div id='tag_button_1'><a href='#'><font style='font-size:15px;'>X</font></div>"
															+ "</div>");
								} else {
									alert("하나의 지역만 입력이 가능합니다.")
								}
							});

			$("#search_select>div>div:nth-child(2)>ul>li")
					.click(
							function(e) {
								e.preventDefault();
								var tag = $(this).text();
								if ($("#search_tag_div_2>div").length < 1) {
									$("#search_tag_div_2")
											.append(
													"<div id='search_tag_2'>"
															+ "<span id='tag_2'>&nbsp;"
															+ tag
															+ "&nbsp;</span>"
															+ "<div id='tag_button_2'><a href='#'><font style='font-size:15px;'>X</font></div>"
															+ "</div>");
								} else {
									alert("하나의 종류만 입력이 가능합니다.")
								}
							});

			$("input[type=radio]").each(
					function() {
						var chk = $(this).is(":checked");
						var name = $(this).attr('name');
						if (chk == true)
							$("input[name='" + name + "']").data("previous",
									$(this).val());
					});

			$("input[type=radio]").click(
					function() {
						var pre = $(this).data("previous");
						var chk = $(this).is(":checked");
						var name = $(this).attr('name');
						if (chk == true && pre == $(this).val()) {
							$(this).prop('checked', false);
							$("input[name='" + name + "']")
									.data("previous", '');
						} else {
							if (chk == true)
								$("input[name='" + name + "']").data(
										"previous", $(this).val());
						}
					});

			$(document).on("click", "#tag_button_1", function(e) {
				e.preventDefault();
				alert("선택된 지역을 삭제합니다.")
				$("#search_tag_1").detach();
			});

			$(document).on("click", "#tag_button_2", function(e) {
				e.preventDefault();
				alert("선택한 종류를 삭제합니다.")
				$("#search_tag_2").detach();
			});

			$(document)
					.on(
							"click",
							"#search_btn",
							function(e) {
								e.preventDefault();

								if (document.getElementById('tag_1')) {
									var loc = document.getElementById('tag_1').textContent
											.trim();

									if (document.getElementById('tag_2')) {
										var subject = document
												.getElementById('tag_2').textContent
												.trim();

										if (document
												.querySelector("input[name='review_count']:checked")) {
											var review_count = document
													.querySelector("input[name='review_count']:checked").value;

											if (document
													.querySelector("input[name='stars']:checked")) {
												var stars = document
														.querySelector("input[name='stars']:checked").value;

												get_url = "${pageContext.request.contextPath}/restaurant_result.do?loc="
														+ loc
														+ "&subject="
														+ subject
														+ "&review_count="
														+ review_count
														+ "&stars=" + stars;
												location.href = get_url;
											} else {
												alert("지역 / 종류 / 옵션 은 필수 입력 사항입니다.");
											}
										} else {
											alert("지역 / 종류 / 옵션 은 필수 입력 사항입니다.");
										}
									} else {
										alert("지역 / 종류 / 옵션 은 필수 입력 사항입니다.");
									}
								} else {
									alert("지역 / 종류 / 옵션 은 필수 입력 사항입니다.");
								}
							});
		});

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
	
				console.log("퇴근 시간" + off_hour + ":" + off_minute);
				startBtn.innerHTML = "퇴근까지 ~ "
				countdown('countdownC', 0, sessionStorage.getItem('off_hour')
						- now_hour, sessionStorage.getItem('off_minute')
						- now_minute, 10);
			}
	
		});

		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
</body>

</html>