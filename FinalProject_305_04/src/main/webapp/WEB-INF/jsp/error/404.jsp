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
	<div class="main-cont-wrap">
		<div class="error">
			<div class="error-wrap">
				<span class="tit errorType">
						<span class="bigbold">
						!
					<span class="bold">
						404
					</span>
					<span class="small">
						<a href="<c:url value='${pageContext.request.contextPath}/login'/>">home</a><br>
					</span>
					<span class="small">
						<a href="javascript:history.back();">back</a><br>
					</span>
				</span>
			</div>
		</div>
	</div>
	<div class="top-line">
		<div class="left">
			<div class="inner-bot">
				<div class="date-wrap">
<!-- 					<span class="date"><span class="time">죄송합니다. 현재 찾을 수 없는 페이지를 요청하셨습니다.</span></span> -->
<!-- 					<p class="detail-date">페이지의 주소가 잘못 입력되었거나, 주소가 변경 또는 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p> -->
				</div>
			</div>
		</div>
	</div>
</div>

<div>
</div>
