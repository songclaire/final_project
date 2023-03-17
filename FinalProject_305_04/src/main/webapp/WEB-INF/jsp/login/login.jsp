<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<script>
		alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
	</script>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">		
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>

<security:csrfInput/>
<div id="wrap">
	<div class="gr-bg"></div>
	<div class="top-line">
		<div class="left">
			<div class="inner-top">
				<h1 class="logo">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="대재대학교"></h1>
			</div>
			<div class="inner-bot">
				<div class="weather">
					<span class="b-temp" id="weatherT1H">24</span>
					<div class="detail-temp">
						<i class="bi bi-brightness-high"></i><span id="weatherSKY">맑음</span>, <!--<span id="weatherRN1"></span>mm / --><span id="weatherREH">10</span>%
						<div style="margin-top: 3px;font-size: 12px;">데이터출처 : 기상청</div>
					</div>
				</div>
				<div class="date-wrap">
					<span class="date"><span id="timeAMPM"></span> <span class="time" id="timeHM"></span></span>
					<p class="detail-date" id="dateYMD"></p>
				</div>
			</div>
		</div>
	</div>
	<div class="main-cont-wrap">
		<div class="right">
			<button class="p-login"><i><img src="images/m_login_icon.svg" alt=""></i>Login</button>
			<div class="login-wrap">
				<span class="tit"><span class="bold">Login</span></span>
				<div class="login-type">
					<a href="javascript:void(0);" onclick="f_stdLogin(this)"><span>학생</span></a>
					<a href="javascript:void(0);" onclick="f_profLogin(this)"><span>교수</span></a>
					<a href="javascript:void(0);" onclick="f_empLogin(this)"><span>교직원</span></a>
				</div>
				<form method="post" action="<c:url value='/' />" id="loginForm">
					<fieldset>
						<legend>로그인</legend>
						<div class="input-wrap">
							<label><input type="text" name="userId" id="id" class="inputtxt" placeholder="ID" value=""></label>
							<label><input type="password" name="userPass" id="pass" class="inputtxt" placeholder="password" value=""></label>
							<button type="submit" class="btn-login" id="loginBtn">
							<i class="bi bi-check2"></i>
							</button>
						</div>
<!-- 						<a href="javascript:void(0);" class="find-pass">아이디 or 패스워드 찾기</a> -->
					</fieldset>
				</form>
			</div>
		</div>
		<div class="app-list">
			<div class="list">
				<a href="javascript:void(0);" target="_blank" class="app-box">
					<span class="app-icon icon13"><img src="${pageContext.request.contextPath}/resources/images/login/app_icon13.svg" alt="도서관"></span>
					도서관
				</a>
				<a href="http://hnu.kr/kor/about/about_07_2.html" target="_blank" class="app-box">
						<span class="app-icon icon11"><img src="${pageContext.request.contextPath}/resources/images/login/app_icon11.svg" alt="교내전화번호"></span>
						교내전화번호
				</a>
				<a href="http://job.hannam.ac.kr/main/" target="_blank" class="app-box">
						<span class="app-icon icon14"><img src="${pageContext.request.contextPath}/resources/images/login/app_icon14.svg" alt="취업"></span>
						취업
				</a>
				<a href="https://www.instagram.com/hannam_university/?hl=ko" target="_blank" class="app-box">
						<span class="app-icon icon06"><img src="${pageContext.request.contextPath}/resources/images/login/app_icon04.svg" alt="instagram"></span>
						instagram
				</a>
				<a href="http://hnu.kr/kor/guide/guide_06_1.html" target="_blank" class="app-box">
						<span class="app-icon icon03"><img src="${pageContext.request.contextPath}/resources/images/login/app_icon03.svg" alt="증명서발급"></span>
						증명서발급
				</a>
				<a href="http://www.hannam.ac.kr/data/building.html" target="_blank" class="app-box">
						<span class="app-icon icon07"><img src="${pageContext.request.contextPath}/resources/images/login/app_icon05.svg" alt="캠퍼스맵"></span>
						캠퍼스맵
				</a>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="inner">
			<div class="bot-list">
				<a href="javascript:void(0);" target="_blank"><i><img src="${pageContext.request.contextPath}/resources/images/login/bot_icon01.svg" alt="개인정보처리방침 아이콘"></i>개인정보처리방침</a>
			</div>
			<div class="bot-list">
				<a href="javascript:void(0);" target="_blank"><i><img src="${pageContext.request.contextPath}/resources/images/login/bot_icon04.svg" alt=""></i>입학안내홈페이지</a>
			</div>
			<div class="bot-list">
				<a href="javascript:void(0);" target="_blank"><i><img src="${pageContext.request.contextPath}/resources/images/login/bot_icon04.svg" alt=""></i>동아리안내</a>
			</div>
			<div class="bot-list">
				<a href="javascript:void(0);" target="_blank"><i><img src="${pageContext.request.contextPath}/resources/images/login/bot_icon04.svg" alt=""></i>오시는길안내</a>
			</div>
		</div>
		<button class="btn-msg"><img src="${pageContext.request.contextPath}/resources/images/login/icon_msg.svg" alt=""></button>
	</footer>
</div>




<script>

/* 날짜  가져오기 */

function f_nowTime(){
	let now = new Date();
	
	let week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	let year = now.getFullYear();
	let month = now.getMonth()+1;
	let day = now.getDate();
	let yymmdd = year + "년 " + month + "월 " + day + "일 " + week[now.getDay()];
	
	Date.prototype.amPm = function(){
		let h = this.getHours() < 12 ? "AM" : "PM";
		return h;
	}
	
	let amPm = now.amPm();
	let hours = ('0' + now.getHours()).slice(-2);
	let minutes = ('0' + now.getMinutes()).slice(-2);
	let seconds = ('0' + now.getSeconds()).slice(-2);
	
	$("#dateYMD").html(yymmdd);
	$("#timeAMPM").html(amPm);
	$("#timeHM").html(hours + ":" + minutes + ":" + seconds);
}


window.onload = function(){
	f_nowTime();
	let inerval = setInterval(function(){
		f_nowTime();
	}, 1000);
}




/////////////////////////////////////// 학 생 로 그 인 /////////////////////////////////////////////
var dataInfo = {"id":"20211401", "pass":"java"};

function f_toggleClass(p_this) {
	console.log("f_toggleClass", p_this);
	$(".login-type").find("a").removeClass("on");
	p_this.classList.add("on");
}

function f_stdLogin(p_this){
	console.log("학생 - 민학생 로그인");
	console.log("p_this" , p_this);
	$("#id").val("20211401");
	$("#pass").val("java");
	f_toggleClass(p_this);
}

/////////////////////////////////////// 교 수 로 그 인 /////////////////////////////////////////////
function f_profLogin(p_this){
	console.log("교수 - 서은호 로그인");
	$("#id").val("3120001");
	$("#pass").val("java");
	f_toggleClass(p_this);
}

/////////////////////////////////////// 교 직 원 로 그 인 /////////////////////////////////////////////
function f_empLogin(p_this){
	console.log("교직원 - 김선민 로그인");
	$("#id").val("1010001");
	$("#pass").val("java");
	f_toggleClass(p_this);
}
</script>

<%-- <c:import url="/includee/postScript.jsp" /> --%>