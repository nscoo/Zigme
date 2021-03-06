<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/container.css">
    <link rel="stylesheet" type="text/css" href="assets/css/common.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/mylist.css" />
    <title>당신의 직장메이트, ZIGME</title>
    <style type="text/css">
    #header_banner {
        position: relative;
        height: 420px;
        overflow: hidden;
        background-image: url(assets/img/meadow.jpg);
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
            <div id="header_banner">
            </div>
        </div>
        <!-- header 끝-->
        <!-- mylist 시작 -->
        <div id="mylist_area">
            <div id="list_box" role="tabpanel">
                <!--옵션 선택 부분 -->
                <div id="list_select">
                    <ul class="nav nav-tabs nav-justified">
                        <li class="active"><a href="#my_restaurant_list" data-toggle="tab" role="tab" class="tab-link-sub">My Restaurant List</a></li>
                        <li><a href="#my_hair_list" data-toggle="tab" role="tab" class="tab-link-sub">My Hair List</a></li>
                        <li><a href="#my_nail_list" data-toggle="tab" role="tab" class="tab-link-sub">My Nail List</a></li>
                    </ul>
                    <div role="tabpanel" class="tab-content tab-area">
                        <!-- tab1 -->
                        <div class="tab-pane search-tab-content active filter inner2--bottom" id="my_restaurant_list" style="overflow:auto; height:1400px; border: 1px solid #f89b00;">
                            <c:choose>
                          <%-- 조회 결과가 없는 경우 --%>
                             <c:when test="${output_r == null || fn:length(output_r)==0 }">
                               <h1 style="color:white;"><br/>하트를 눌러 나만의 찜리스트를 구성해보세요!</h1>
                             </c:when>
                          <%-- 조회 결과가 있는 경우 --%>
                             <c:otherwise>
                          <%-- 조회 결과에 대한 반복 처리 --%>
                                <c:forEach var="item" items="${output_r}" varStatus="status" >
                                <c:set var="name2" value="${fn:replace(item.name,'&','')}"/>
                                <c:set var="name2" value="${fn:replace(name2,' ','')}" />
                                
                                   <div class="list_item" id="${name2}">
                                         <div class="info_button">
                                             <a id="delete" class="${name2}" href="javascript:void(0)" onClick="deletelist3('${name2}','${item.name}')">X</a>
                                         </div>
                                         <div class="item_img">[p-y]
                                        	
                                             <image src="${item.photo_1}" width="280px" height="280px" referrerpolicy="no-referrer">
                                         </div>
                                         <div class="item_info">
                                             <div class="info_name">${item.name}</div>
                                             <div class="info_stars"><i class="fas fa-star" style="color:#ffd400; font-size:20px;"></i>
                                                 <font size="3px">&nbsp;${item.stars}</font>
                                             </div>
                                             <div class="info_common">
                                                 <div class="info_call"><img src="assets/img/call.png" width="13px" height="13px">&nbsp;전화번호 : ${item.call}</div>
                                                 <div class="info_add"><img src="assets/img/add.png" width="13px" height="13px">&nbsp;주소 : ${item.address}</div>
                                                 <div class="info_etc"><img src="assets/img/etc.png" width="13px" height="13px">&nbsp;${fn:substring(item.ps,0,30)}</div>
                                                 <div class="info_time"><img src="assets/img/time.png" width="13px" height="13px">&nbsp;${item.times}</div>
                                             </div>
                                          
                                             <div class="info_memo" > 
                                            
                                                 <form method="post" id="memoform"  method ="post">
                                                     <input type="text" id="memo${name2}" name="memo${name2}" value="${mymemolist_r[status.index].memo}"/>
                                                     <input type="button" value="메모 수정" onclick="savememo3('${mymemolist_r[status.index].mylistno}',document.getElementById('memo${name2}').value)" >
                                                 </form>
                                             </div>
                                             
                                         </div>
                                     </div>
                                
                                </c:forEach>
                             </c:otherwise>
                          </c:choose>
                            
                            
                        </div>
                        <!-- tab2 -->
                        <div class="tab-pane search-tab-content" id="my_hair_list" style="overflow:auto; height:1400px; border: 1px solid #f89b00;">
                            <c:choose>
                          <%-- 조회 결과가 없는 경우 --%>
                             <c:when test="${output_h == null || fn:length(output_h)==0 }">
                                <h1 style="color:white;"><br/>하트를 눌러 나만의 찜리스트를 구성해보세요!</h1>
                             </c:when>
                          <%-- 조회 결과가 있는 경우 --%>
                             <c:otherwise>
                          <%-- 조회 결과에 대한 반복 처리 --%>
                                <c:forEach var="item" items="${output_h}" varStatus="status" >
                                <c:set var="name2" value="${fn:replace(item.name,'&','')}"/>
                                <c:set var="name2" value="${fn:replace(name2,' ','')}" />
                                
                                   <div class="list_item" id="${name2}">
                                         <div class="info_button">
                                             <a id="delete" class="${name2}" href="javascript:void(0)" onClick="deletelist('${name2}','${item.name}')">X</a>
                                         </div>
                                         <div class="item_img">
                                        	
                                             <image src="${item.photos}" width="280px" height="280px">
                                         </div>
                                         <div class="item_info">
                                             <div class="info_name">${item.name}</div>
                                             <div class="info_stars"><i class="fas fa-star" style="color:#ffd400; font-size:20px;"></i>
                                                 <font size="3px">&nbsp;${item.stars}</font>
                                             </div>
                                             <div class="info_common">
                                                 <div class="info_call"><img src="assets/img/call.png" width="13px" height="13px">&nbsp;전화번호 : ${item.call}</div>
                                                 <div class="info_add"><img src="assets/img/add.png" width="13px" height="13px">&nbsp;주소 : ${item.address}</div>
                                                 <div class="info_etc"><img src="assets/img/etc.png" width="13px" height="13px">&nbsp;${fn:substring(item.ps,0,30)}</div>
                                                 <div class="info_time"><img src="assets/img/time.png" width="13px" height="13px">&nbsp;${item.times}</div>
                                             </div>
                                          
                                             <div class="info_memo" > 
                                            
                                                 <form method="post" id="memoform"  method ="post">
                                                     <input type="text" id="memo${name2}" name="memo${name2}" value="${mymemolist_h[status.index].memo}"/>
                                                     <input type="button" value="메모 수정" onclick="savememo('${mymemolist_h[status.index].mylistno}',document.getElementById('memo${name2}').value)" >
                                                 </form>
                                             </div>
                                             
                                         </div>
                                     </div>
                                
                                </c:forEach>
                             </c:otherwise>
                          </c:choose>
                            
                            
                        </div>
                        <!-- tab3 -->
                        <div class="tab-pane search-tab-content" id="my_nail_list" style="overflow:auto; height:1400px; border: 1px solid #0080ff;">
                            <c:choose>
                          <%-- 조회 결과가 없는 경우 --%>
                             <c:when test="${output_n == null || fn:length(output_n)==0 }">
                                <h1 style="color:white;"><br/>하트를 눌러 나만의 찜리스트를 구성해보세요!</h1>
                             </c:when>
                          <%-- 조회 결과가 있는 경우 --%>
                             <c:otherwise>
                          <%-- 조회 결과에 대한 반복 처리 --%>
                                <c:forEach var="item" items="${output_n}" varStatus="status" >
                                <c:set var="name2" value="${fn:replace(item.name,'&','')}"/>
                                <c:set var="name2" value="${fn:replace(name2,' ','')}" />
                                
                                   <div class="list_item" id="${name2}">
                                         <div class="info_button">
                                             <a id="delete" class="${name2}" href="javascript:void(0)" onClick="deletelist2('${name2}','${item.name}')">X</a>
                                         </div>
                                         <div class="item_img">
                                        	
                                             <image src="${item.photos}" width="280px" height="280px">
                                         </div>
                                         <div class="item_info">
                                             <div class="info_name">${item.name}</div>
                                             <div class="info_stars"><i class="fas fa-star" style="color:#ffd400; font-size:20px;"></i>
                                                 <font size="3px">&nbsp;${item.stars}</font>
                                             </div>
                                             <div class="info_common">
                                                 <div class="info_call"><img src="assets/img/call.png" width="13px" height="13px">&nbsp;전화번호 : ${item.call}</div>
                                                 <div class="info_add"><img src="assets/img/add.png" width="13px" height="13px">&nbsp;주소 : ${item.address}</div>
                                                 <div class="info_etc"><img src="assets/img/etc.png" width="13px" height="13px">&nbsp;${fn:substring(item.ps,0,30)}</div>
                                                 <div class="info_time"><img src="assets/img/time.png" width="13px" height="13px">&nbsp;${item.times}</div>
                                             </div>
                                          
                                             <div class="info_memo" > 
                                            
                                                 <form method="post" id="memoform"  method ="post">
                                                     <input type="text" id="memo${name2}" name="memo${name2}" value="${mymemolist_n[status.index].memo}"/>
                                                     <input type="button" value="메모 수정" onclick="savememo2('${mymemolist_n[status.index].mylistno}',document.getElementById('memo${name2}').value)" >
                                                 </form>
                                             </div>
                                             
                                         </div>
                                     </div>
                                
                                </c:forEach>
                             </c:otherwise>
                          </c:choose>                    </div>
                    <!-- tab content 끝 -->
                </div>
                <!-- list_select 끝 -->
            </div>
            <!-- list_box 끝 -->
        </div>
        <!-- list_area  -->
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
    <!-- container 끝-->
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
    //찜 취소
    function deletelist(name2,name){
    	       
  	  $.ajax({
		  type :"POST",
		  url : "cancel_basket",
		  dataType : "json",
		  data :{"name": name,
			  	  },
		  success:function(data){ //삭제 
			 
			  if(data == 1){ //삭제 성공
				  $(".list_item#"+name2).hide();
			  }else{
					alert('취소 실패 잠시후에 다시 시도하세요');
              }
		  },
		  
	  })
    }

    function deletelist2(name2,name){
	      
    	  $.ajax({
  		  type :"POST",
  		  url : "cancel_basket2",
  		  dataType : "json",
  		  data :{"name": name,
  			  	  },
  		  success:function(data){ //삭제 
  			 
  			  if(data == 1){ //삭제 성공
  				  $(".list_item#"+name2).hide();
  			  }else{
  					alert('취소 실패 잠시후에 다시 시도하세요');
                }
  		  },
  		  
  	  })
      }
    function deletelist3(name2,name){
	       
    	  $.ajax({
  		  type :"POST",
  		  url : "cancel_basket3",
  		  dataType : "json",
  		  data :{"name": name,
  			  	  },
  		  success:function(data){ //삭제 
  			 
  			  if(data == 1){ //삭제 성공
  				  $(".list_item#"+name2).hide();
  			  }else{
  					alert('취소 실패 잠시후에 다시 시도하세요');
                }
  		  },
  		  
  	  })
      }

    //메모 남기기
    function savememo(mylistno,memo){ //mylisthair니까 여기서 mylistno, memo를 가져오면 된다.
		$.ajax({
			type :"POST",
			url : "savememo",
			dataType : "json",
			data : {
				"mylistno" : mylistno,
				"memo" : memo
			},
			success:function(data){
				if(data==1){
					alert('수정 완료');
				}
			}
		})
    }
    function savememo2(mylistno,memo){ //mylisthair니까 여기서 mylistno, memo를 가져오면 된다.
		$.ajax({
			type :"POST",
			url : "savememo2",
			dataType : "json",
			data : {
				"mylistno" : mylistno,
				"memo" : memo
			},
		success:function(data){
			if(data==1){
				alert('수정 완료');
			}
		}
		})
    }
    function savememo3(mylistno,memo){ //mylisthair니까 여기서 mylistno, memo를 가져오면 된다.
		$.ajax({
			type :"POST",
			url : "savememo3",
			dataType : "json",
			data : {
				"mylistno" : mylistno,
				"memo" : memo
			},
		success:function(data){
			if(data==1){
				alert('수정 완료');
			}
		}
		})
    }
    
    </script>
</body>

</html>