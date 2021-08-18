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
    <link rel="stylesheet" type="text/css" href="assets/css/result.css">
    <!-- 인스타그램 하트스타일-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    

#head_banner {
    position: relative;
    height: 420px;
    overflow: hidden;
    background-image: url(assets/img/flowers2.jpg);
    background-size: cover;

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
    
   .jumbo_img>img{
   		display: block;
   }
    
.info_stars {
    text-align: left;
    position: relative;
    display: inline-block;
    left: 20px;
}
    
    #search_input {

    width: 750px;
    padding-top: 100px;
    padding-left: 420px;
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

#header_banner {
    position: relative;
    height: 420px;
    overflow: hidden;
    background-image: url(../img/restaurant.jpg);
    background-size: cover;

}

#popupLayer {
    display: none;
    border: 5px solid #cccccc;
    margin: 0;
    padding: 5px;
    background-color: #ffffff;
    font-family: BMHANNAPro;
    z-index: 5;
}

#popupLayer .b-close {
    position: absolute;
    top: 10px;
    right: 15px;
    color: #f37a20;
    font-weight: bold;
    cursor: hand;
}

#popupLayer .popupContent {
    margin: 0;
    padding: 0;
    text-align: center;
    border: 0;
}

#popupLayer .popupContent {
    width: 720px;
    height: 1000px;
    border: 0px;
    padding: 0px;
    margin: 0;
    z-index: 10;
}

#popupContent>#popup_content_1 {
    text-align: center;

    height: 50px;
    border-bottom: 4px solid #cccccc;
}

#popupContent>#popup_content_2 {
    height: 220px;
    border-bottom: 4px solid #cccccc;
    padding-left: 10px;
    padding-top: 15px;
    vertical-align: top;
    text-align: center;
    font-size: 25px;

}

#popupContent>#popup_content_2>div>div {
    font-size: 25px;
    height: 50px;
}

#popupContent>#popup_content_2>div>div>.glyphicon {
    font-size: 25px;

}

#popupContent>#popup_content_3 {
    height: 160px;
    font-size: 13px;
    border-bottom: 4px solid #cccccc;
    padding-left: 30px;
    text-align: center;


}

#popupContent>#popup_content_4 {
vertical-align: top;
    height: 300px;
    padding-left: 62px;
    padding-top: 30px;
    font-size: 20px;

}

#popupContent>#popup_content_4>#graph_left {
	vertical-align: top;
    width: 300px;
    
    display: inline-block;
}

#popupContent>#popup_content_4>#graph_right {
vertical-align: top;
    width: 300px;
    
    display: inline-block;
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
            <div id="head_banner" style="position: relative; height: 420px; overflow: hidden; background-image: url(assets/img/flowers.jpg); background-size: cover;" >
            <!-- 검색 input을 form 태그로 바꾸어서 파라미터 전달을 가능하게 만듬 -->
                <form method="get" action="${pageContext.request.contextPath}/nail_result.do" } id="search_input" class="input-group">
                	<input type="search" name="keyword" class="form-control" placeholder="검색어를 입력하세요" value="${keyword}" /> <!-- 검색어에 대한 상태유지 처리 -->
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="fas fa-search"></i></button>
                    </span>        	
                </form>
            </div>
          </div>
            <!-- header 끝-->
            <!-- 네일 검색결과 부분 시작-->
            <h1>Best5</h1>
            <br />
            
            <c:choose>
           		<%-- 조회 결과가 없는 경우 --%>
           		<c:when test="${output == null || fn:length(output)==0 }">
           			<h1>조회 결과가 없습니다.</h1>
           		</c:when>
           		<%-- 조회 결과가 있는 경우 --%>
           		<c:otherwise>
           			<%-- 조회 결과에 대한 반복 처리 --%>
           			<c:forEach var="item" items="${output}" varStatus="status" >
					<c:set var="name" value="${item.name}"/>           			
           			<c:set var="address" value="${item.address}"/>
           			<c:set var="call" value="${item.call}"/>
           			<c:set var="ps" value="${item.ps}"/>
           			<c:set var="times" value="${item.times}"/>
           			<c:set var="menu" value="${item.menu}"/>
           			<c:set var="photos" value="${item.photos}"/>
           			
           			<c:set var="name2" value="${fn:replace(item.name,'&','')}"/>
           			<c:set var="name2" value="${fn:replace(name2,' ','')}" />
           			<c:if test="${status.count<6 }">
           			<div class="jumbotron">
                		<div class="jumbo_img">
                    		<img src= "${photos}" alt="best5 사진">
                    		
                		</div>
                		<div class="shop_title">
                    		<a href="javascript:void(0);" style="text-decoration: none;" onClick="openPopup('${name2}')">
                        		${name}&nbsp;<div class="info_stars"><i class="fas fa-star" style="color:#ffd400; font-size:28px;"></i>
                                        <font style="font-size:20px;">&nbsp;${item.stars}</font></div></a><div style="font-size: 20px; color: gray;">&nbsp;리뷰수:&nbsp;${item.review_count}개</div>
                    		</a>
                		</div>
                		<div class="jumbo_info">
                			<p>
                				<br />
                        		<img src="assets/img/clock.png" alt="시간" width="25px" height="25px">
                        		${times}
                    		</p>
                    		<p>
                        		
                        		<img src="assets/img/call.png" width="20px" height="20px">
                        		${call}
                    		</p>
                    		<p>
                        		<img src="assets/img/placeholder-filled-point.png" width="20px" height="20px">
                        		${address}
                    		</p>
                    		
                    		<p>
                        		
                        		<img src="assets/img/clipboard.png" width="20px" height="20px">
                        		${fn:substring(menu,0,fn:indexOf(menu, "~")+1)}
         
                        		
                    		</p>
                		</div>
            		</div>
            		<div id="popupLayer" class="${name2}">
                    <div id="popupContent">
                        <div id="popup_image_box">
                            <image src="${photos}" width="240px" height="240px" />
                            <image src="${photos}" width="240px" height="240px" />
                            <image src="${photos}" width="240px" height="240px" />
                           
                        </div>
                        <div id="popup_content_1">
                            <h2>${name}&nbsp;<span id=heart><i class="fa fa-heart-o" aria-hidden="true"></i></span>
                            </h2>
                        </div>
                        <div id="popup_content_2">
                           		
                           		<div class="info_stars" style="font-size: 20px; margin-left: -30px;"><i class="fas fa-star" style="color:#ffd400; font-size:28px;"></i><font style="font-size: 20px;" id="star" class="${name2}">${item.stars}</font></div>
                                <div id="info_num" style="font-size: 20px;">카카오 네일샵 리뷰수:&nbsp;<font id="review" class="${name2}" style="font-size: 25px; color: #ff7f00;">${item.review_count}</font>개</div>
                                <br/>   
                                
                                <div id="info_time" style="font-size: 20px;"><img src="assets/img/time.png" width="20px" height="20px">&nbsp;${times}</div>     
                                <div id="info_num" style="font-size: 20px;">&nbsp;${call}</div>
                                <div id="info_add" style="font-size: 20px;"><img src="assets/img/add.png" width="20px" height="20px">&nbsp;${address}</div>
                                

                        </div>
                        
                        <div id="popup_content_3">
                        	<br/>
                       
                        	<div id="info_ps" style="font-size: 20px;"><img src="assets/img/ps.png" width="25px" height="25px">&nbsp;${fn:substring(ps,0,35)}<br/>${fn:substring(ps,35,70)}<br/>${fn:substring(ps,70,150)}</div><br/>
                         	<div id="info_etc" style="font-size: 20px;"><img src="assets/img/etc.png" width="20px" height="20px">&nbsp;${fn:substring(menu,0,45)}<br/>${fn:substring(menu,45,90)}<br/>${fn:substring(menu,90,150)}</div>
                        </div>
                        
                        <div id="popup_content_4">
                        <div id="graph_left">
                        <button onclick="statistics('${name2}')" class="btn btn-warning">직메의 점수 보기</button>
                        	<br/><br/>
                            <div style="width: 300px;">
                            	<canvas id="myChart" class="${name2}"></canvas>
                            </div>
                         </div>
                        
                        <div id="graph_right">
                        	<font id="visualize" class="${name2}" style="font-size: 20px; color:#404040; text-align: center;"></font>
                        </div>
                        
                        </div>
                    </div>
                    <div class="b-close"></div>
                </div>
            		
   					</c:if>
           			</c:forEach>
           			
           		</c:otherwise>
           	</c:choose>
           	<br />
            <hr />
            <div id="normal_list">
                <ul id="gallery">
            <c:choose>
           		<%-- 조회 결과가 없는 경우 --%>
           		<c:when test="${output == null || fn:length(output)==0 }">
           			<h1>조회 결과가 없습니다.</h1>
           		</c:when>
           		<%-- 조회 결과가 있는 경우 --%>
           		<c:otherwise>
           			<%-- 조회 결과에 대한 반복 처리 --%>
           			<c:forEach var="item" items="${output}" varStatus="status" >
           			<c:if test="${status.count>5}">
					<c:set var="name" value="${item.name}"/>           			
           			<c:set var="address" value="${item.address}"/>
           			<c:set var="call" value="${item.call}"/>
           			<c:set var="ps" value="${item.ps}"/>
           			<c:set var="times" value="${item.times}"/>
           			<c:set var="menu" value="${item.menu}"/>
           			<c:set var="photos" value="${item.photos}"/>
           			<c:set var="name2" value="${fn:replace(item.name,'&','')}"/>
           			<c:set var="name2" value="${fn:replace(name2,' ','')}" />
           		
           			
                    		<li>
                        		<a href="javascript:void(0);" style="text-decoration: none;" 
                        		onClick="openPopup('${name2}')">
                            		<span class="thumb">
                                		<img src="${photos}" alt="이미지1" width="270px" height="150px"/>
                            		</span>
                            		<span class="text" style="font-size: 15px;">${name}<div class="info_stars"><i class="fas fa-star" style="color:#ffd400; font-size:15px;"></i>
                                        <font style="font-size:15px;">&nbsp;${item.stars}</font></div></span>
                        		</a>
                    		</li>
                    		
                    <div id="popupLayer" class="${name2}">
                    <div id="popupContent">
                        <div id="popup_image_box">
                            <image src="${photos}" width="240px" height="240px" />
                            <image src="${photos}" width="240px" height="240px" />
                            <image src="${photos}" width="240px" height="240px" />
                           
                        </div>
                        <div id="popup_content_1">
                            <h2>${name}&nbsp;<span id=heart><i class="fa fa-heart-o" aria-hidden="true"></i></span>
                            </h2>
                        </div>
                        <div id="popup_content_2">
                           		
                           		<div class="info_stars" style="font-size: 20px; margin-left: -30px;"><i class="fas fa-star" style="color:#ffd400; font-size:28px;"></i><font style="font-size: 20px;" id="star" class="${name2}">${item.stars}</font></div>
                                <div id="info_num" style="font-size: 20px;">카카오 네일샵 리뷰수:&nbsp;<font id="review" class="${name2}" style="font-size: 25px; color: #ff7f00;">${item.review_count}</font>개</div>
                                <br/>   
                                
                                <div id="info_time" style="font-size: 20px;"><img src="assets/img/time.png" width="20px" height="20px">&nbsp;${times}</div>     
                                <div id="info_num" style="font-size: 20px;">&nbsp;${call}</div>
                                <div id="info_add" style="font-size: 20px;"><img src="assets/img/add.png" width="20px" height="20px">&nbsp;${address}</div>
                                

                        </div>
                        
                        <div id="popup_content_3">
                        	<br/>
                       
                        	<div id="info_ps" style="font-size: 20px;"><img src="assets/img/ps.png" width="25px" height="25px">&nbsp;${fn:substring(ps,0,35)}<br/>${fn:substring(ps,35,70)}<br/>${fn:substring(ps,70,150)}</div><br/>
                         	<div id="info_etc" style="font-size: 20px;"><img src="assets/img/etc.png" width="20px" height="20px">&nbsp;${fn:substring(menu,0,45)}<br/>${fn:substring(menu,45,90)}<br/>${fn:substring(menu,90,150)}</div>
                        </div>
                        
                        <div id="popup_content_4">
                        <div id="graph_left">
                        <button onclick="statistics('${name2}')" class="btn btn-warning">직메의 점수 보기</button>
                        	<br/><br/>
                            <div style="width: 300px;">
                            	<canvas id="myChart" class="${name2}"></canvas>
                            </div>
                         </div>
                        
                        <div id="graph_right">
                        	<font id="visualize" class="${name2}" style="font-size: 20px; color:#404040; text-align: center;"></font>
                        </div>
                        
                        </div>
                    </div>
                    <div class="b-close"></div>
                </div>
                    	
      				</c:if>
           			</c:forEach>
           	</c:otherwise>
           </c:choose>
           	</ul>
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
        <script type="text/javascript" src="assets/js/bpopup.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                              
                              <script type="text/javascript">
                              function statistics(name){
                              var ctx = $("#myChart."+name)[0].getContext('2d');
                              var star = $("#star."+name)[0].innerHTML;
                              var review = ($("#review."+name)[0].innerHTML)/10;
                              var score = (((star*0.3)+(review*0.7))/32.2)*100;
                              
                              var myChart = new Chart(ctx, {
                                  
                                  data: {
                                      labels: ['별점', '리뷰수(십)'],
                                      datasets: [{
                                    	  type: 'bar',
                                          label: name+'데이터',
                                          data: [star,review],
                                          backgroundColor:['rgba(255, 159, 64, 0.2)',
                                              'rgba(255, 205, 86, 0.2)'],
                                          borderColor: ['rgb(255, 159, 64)',
                                              'rgb(255, 205, 86)'],
                                      borderWidth: 1}, {
                                    	  type:'line',
                                    	  label: '전체 데이터 평균치',
                                    	  data: [4.1,3.3],

                                      }]
                                  },
                                  options: {
                                      scales: {
                                          y: {
                                              beginAtZero: true
                                          }
                                      }
                                  }
                              });
                              
                              if(star>=4.1 && review>=3.3){
                            	 
                            	  
                            	  if(score>=70){
                            		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                            		  +Math.abs((star-4.1).toFixed(1))+"</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                            		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;유명한 네일샵이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";
                            		  
                            	  } else if(score<70 && score>=30){
                            		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                            		  +Math.abs((star-4.1).toFixed(1))+"</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                            		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;좋은 네일샵인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
                            	  } else if(score<30){
                            		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                            		  +Math.abs((star-4.1).toFixed(1))+"</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                            		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
                            	  }
                            	  
                              } else if (star>=4.1 && review<3.3) {
                            	  
                            	  if(score>=70){
                            		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                            		  +Math.abs((star-4.1).toFixed(1))+"</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                            		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;유명한 네일샵이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";
                            		  
                            	  } else if(score<70 && score>=30){
                            		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                            		  +Math.abs((star-4.1).toFixed(1))+"</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                            		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;좋은 네일샵인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
                            	  } else if(score<30){
                            		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                            		  +Math.abs((star-4.1).toFixed(1))+"</font> 높고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                            		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
                            	  }
								
							} else if (star<4.1 && review>=3.3) {
                          	  
                          	  if(score>=70){
                          		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                          		  +Math.abs((star-4.1).toFixed(1))+"</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                          		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;유명한 네일샵이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";
                          		  
                          	  } else if(score<70 && score>=30){
                          		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                          		  +Math.abs((star-4.1).toFixed(1))+"</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                          		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;좋은 네일샵인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
                          	  } else if(score<30){
                          		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                          		  +Math.abs((star-4.1).toFixed(1))+"</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 많습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                          		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
                          	  	} 
                              
                              
                            
                              } else if (star<4.1 && review<3.3) {
                              	  
                              	  if(score>=70){
                              		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                              		  +Math.abs((star-4.1).toFixed(1))+"</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                              		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;유명한 네일샵이네요!<br/>&nbsp;&nbsp;강력 추천합니다!";
                              		  
                              	  } else if(score<70 && score>=50){
                              		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                              		  +Math.abs((star-4.1).toFixed(1))+"</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                              		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;좋은 네일샵인 것 같아요!<br/>&nbsp;&nbsp;추천합니다!";
                              	  } else if(score<30){
                              		  $("#visualize."+name)[0].innerHTML="<br/>&nbsp;&nbsp;<font style='color: #6f4314; font-size:22px;'>"+name+"</font>은(는)<br/>&nbsp;&nbsp;평균 별점보다 <font style='color: #ffa71a; font-size:22px;'>"
                              		  +Math.abs((star-4.1).toFixed(1))+"</font> 낮고,<br/>&nbsp;&nbsp;평균 리뷰수보다 <font style='color: #3b7862; font-size:22px;'>"+((Math.abs((review-3.3).toFixed(1)))*10)+"</font>개 적습니다.<br/>&nbsp;&nbsp;직메의 점수는 <font style='color: #e96363; font-size:22px;'>"
                              		  +score.toFixed(2)+"</font>점입니다.<br/>&nbsp;&nbsp;데이터가 많이 없네요!<br/>&nbsp;&nbsp;도전해보실래요? 숨은 진주일수도요!";
                              	  }
                              } 
                              
                              }
                              
                              
                             

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

        function w3_open() {
            document.getElementById("mySidebar").style.display = "block";
        }

        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
        }
        //상세 팝업
        function openPopup(name) {
            $("#popupLayer."+name).bPopup({
                    iframeAttr: 'frameborder=”auto”',
                    iframeAttr: 'frameborder=”0',
                    contentContainer: '.popupContent',

                    onOpen: function() {},

                    onClose: function() {}
                },
                function() {});
        }
        //찜하트 구현 js
        $(document).ready(function() {
            $("#heart").click(function() {
                if ($("#heart").hasClass("liked")) {
                    $("#heart").html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
                    $("#heart").removeClass("liked");
                } else {
                    $("#heart").html('<i class="fa fa-heart" aria-hidden="true"></i>');
                    $("#heart").addClass("liked");
                }
            });
        });
        </script>
</body>

</html>