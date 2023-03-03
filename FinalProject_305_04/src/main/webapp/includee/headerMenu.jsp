<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>


<nav class="sb-topnav navbar navbar-expand">
	<security:authentication property="principal" var="usrVOWrapper" />
	<security:authentication property="principal.realUser" var="authUser" />
	<!-- Navbar Search-->
	<div class="header-left">
		<div class="search-wrap">
			<input class="form-control search-input" type="text"
				placeholder="메뉴를 입력해주세요" aria-label="Search for..."
				aria-describedby="btnNavbarSearch" 
				id="word" onkeyup="search(this)"
				/>
			<button class="btn" id="btnNavbarSearch" type="button">
				<i class="fas fa-search"></i>
			</button>
			<ul id="searchList"></ul>
		</div>
		<!-- util  -->
		<div class="util">
				<div class="login-session">
					<span id="sessionTimer">60:00</span> <a href="#" onclik="f_reset()">로그인 연장</a>
				</div>

				<!--알람 있을 경우 -->
				<button type="button" id="bell" class="item icon bell no_anime"
					title="알림">
					<span class="num"></span>
				</button>
				<!-- //알람 있을 경우-->
				<!-- 알람 없을 경우 -->
				<!-- <button type="button" id="bell" class="item icon bell" title="알림"><span class="sr-only">알림</span></button> -->
				<!--  //알람 없을 경우 -->

				<div class="dropdown">
					<span class="profile"><img src="" alt=""></span> <a
						class="dropdown-toggle" id="navbarDropdown" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <strong
						class="person-name">${authUser.userNm }</strong> <span class="person-info">
							<c:choose>
								<c:when test="${not empty authUser.majorVO.majorNm }">
									${authUser.majorVO.majorNm } | ${authUser.userId } </span>
								</c:when>
								<c:when test="${not empty authUser.deptVO.deptNm }">
									${authUser.deptVO.deptNm } | ${authUser.userId } </span>
								</c:when>
								<c:otherwise>
									소속이 없습니다.
								</c:otherwise>
							</c:choose>
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#!">마이페이지 </a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/login/logout">Logout</a></li>
					</ul>
				</div>
		</div>
		<!-- // util  -->
</nav>
<script>
function f_startTimer(duration, display){
	let timer = duration, minutes, seconds;
	let interval = setInterval(function(){
		minutes = parseInt(timer / 60, 10)
		seconds = parseInt(timer % 60, 10);
	
		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;
		
		display.textContent = minutes + ":" + seconds;
		
		if(--timer < 0){
			timer = duration;
		}
		if(timer === 0){
			clearInterval(interval);
			display.textContent = "세션이 만료되었습니다.";
		}
	}, 1000);
}

window.onload = function(){
	
	/* session 1시간 */
	let minutes = 60;
	let fiveMinutes = (60 * minutes) -1,
		display = document.querySelector("#sessionTimer");
	f_startTimer(fiveMinutes, display);
}


//메뉴 검색 function
function search(target) {
	let keyword = target.value;
// 	console.log(keyword);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/search", 
		data : {"keyword" : keyword}, 
		method : "get",
		dataType : "json",
		success : function(resp) {
// 			console.log(resp);
// 			console.log(resp.searchMenuList.length);
			$('#searchList').empty();
			let checkWord = $('#word').val();
			if(checkWord.length > 0 && resp.searchMenuList.length > 0) {
				for(let i = 0; i < resp.searchMenuList.length; i++) {
					// console.log(resp.searchMenuList[i].menuNm);
					$('#searchList').append(
						'<li><a href="'
						+ resp.searchMenuList[i].menuUrl
						+ '">'
						+ resp.searchMenuList[i].menuNm
						+ '</a></li>'
					);

// 				$.each(resp.searhMenuList, function() {
// 					$('#searchList').append(
// 						$('<li>').attr({'class':'searhList', 'value':resp.searchMenuList.menuNm})
// 						"<li class='searchList' value'"
// 						+ resp.searchMenuList[i].menuNm
// 						+ ">"
// 					);
				// };
}
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
}

</script>
