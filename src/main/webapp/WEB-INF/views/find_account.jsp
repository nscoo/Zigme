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
<!--  아이디 비밀번호 찾기 ajax -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){				
				location.href = "/";						    
			})
		
			$("#id-submit").on("click", function(){
				if($("#name").val()==""){
					alert("이름을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#tel").val()==""){
					alert("휴대전화 번호를 입력하세요");
					$("#tel").focus();
					return false;
				}
				if($("#birthdate").val()==""){
					alert("생년월일을 입력하세요");
					return false;
				}
				$.ajax({
					url : "findIdAction",
					type : "POST",
					dataType : "json",
					data : $("#find_id").serializeArray(),
					
					success: function(data){
							console.log(data);
							alert('당신의 아이디는' + data.userid +' 입니다');
					},
					error :function(data){
						alert('잘못된정보입니다.');
					}

				})
			});		
		})
	</script>
  	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){				
				location.href = "/";						    
			})
		
			$("#pwd-submit").on("click", function(){
				if($("#pw_name").val()==""){
					alert("이름을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#userid").val()==""){
					alert("아이디를 입력하세요");
					$("#pw_tel").focus();
					return false;
				}
				if($("#pw_tel").val()==""){
					alert("핸드폰 번호를 입력하세요");
					return false;
				}
				$.ajax({
					url : "findPwAction",
					type : "POST",
					dataType : "json",
					data : $("#find_pw").serializeArray(),
					
					success: function(data){
						if(data==0){
							alert('비밀번호 초기화에 실패했습니다 다시 입력해주세요')
							return false;
						}
						alert('비밀번호를 0000으로 초기화했습니다 로그인 후 비밀번호를 변경하세요.');
						location.replace('http://localhost:8080/simpleproject/main.do')
					},
					error: function(data){
						alert('잘못된 정보입니다');
					}
				})
			});		
		})
	</script>
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
                        <li><a href="#food" data-toggle="tab" role="tab" class="tab-link-sub">비밀번호 초기화</a></li>
                    </ul>
                    <div role="tabpanel" class="tab-content tab-area">
                        <div class="tab-pane search-tab-content active filter inner2--bottom" id="loc">
                            <!--id 찾기-->
                            <div id="btn_box">
                                <form method="post" action ="${pageContext.request.contextPath}/findIdAction.do" id="find_id">
                                    <div class="form-group">
                                        <label for="inputName">이름</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="이름입력">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMobile">전화번호</label>
                                        <input type="tel" class="form-control" id="tel" name="tel" placeholder="휴대폰번호를 입력해 주세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMobile">생년 월일</label>
                                        <input type="date" class="form-control" id="birthdate" name="birthdate" placeholder="생년월일입력">
                                    </div>
                                </form>
                                  <div id="regist_button">
                                    <button type="button" id="id-submit" class="btn btn-primary">
                                        아이디 찾기<i class="fa fa-check spaceLeft"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane search-tab-content" id="food">
                            <div id="btn_box">
                                <form method="post" action ="${pageContext.request.contextPath}/findPwAction.do" id="find_pw">
                                    <div class="form-group">
                                        <label for="inputName">이름</label>
                                        <input type="text" class="form-control" id="pw_name" name ="name" placeholder="이름입력">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputID">아이디</label>
                                        <input type="text" class="form-control" id="pw_userid" name="userid" placeholder="ID입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMobile">휴대폰 번호</label>
                                        <input type="tel" class="form-control" id="pw_tel" name="tel" placeholder="휴대폰번호를 입력해 주세요">
                                    </div>
                                </form>
                                     <div id="regist_button">
                                        <button type="submit" id="pwd-submit" class="btn btn-primary">
                                            비밀번호 초기화<i class="fa fa-check spaceLeft"></i>
                                        </button>
                                    </div>
                            </div>
                        </div>
                    </div>
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
        </div>
            <!-- footer 끝-->
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
</body>

</html>