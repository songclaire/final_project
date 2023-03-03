<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

${usrVO }
<hr>
${certHistoryList }
<hr>
${fn:length(certHistoryList) }

<c:set var="histList" value="${certHistoryList }" />

<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>증명서 보관함<button type="button" class="star"><span class="sr-only">즐겨찾기</span></button></h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i>
			<strong>path1</strong> 
			<strong>path2</strong> 
			<strong>path3</strong>
			<strong>path4</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
		
		
			<!-- cont-box-inner -->
		<div class="cont-box-inner">

			<div class="title">
				<h3>기본 정보</h3>
			</div>

			<div class="tbl-wrap">
				<table class="tbl">
					<caption></caption>
					<colgroup>
						<col style="width: 150px;">
						<col style="width: auto;">
						<col style="width: 150px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">성명</th>
							<td>${usrVO.userNm }</td>
							<th scope="row">학번/사번</th>
							<td>${usrVO.userId }</td>
<!-- 							<th scope="row">사용자구분</th> -->
<%-- 							<td>${usrVO.userRole }</td> --%>
						</tr>
						<tr>
							<th scope="row">소속</th>
							<td></td>
							<th scope="row">상태</th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!--// cont-box-inner -->
		
		
		<!-- tob-box -->
		<div class="tob-box">
			<strong class="tit">증명서 발급 안내 </strong>
			<p><strong class="red-txt">발급 30일 이내</strong>의 증명서만 출력 가능합니다.</p>
		</div>
		<!-- // tob-box -->
		
		
		
		<!-- cont-box-inner -->
		<div class="cont-box-inner">
			<div class="title">
				<h3>증명서 발급 내역</h3>
				<span class="total"><em id="cnt">${fn:length(certHistoryList) }</em>건</span>
			</div>
			<!--tbl-->
			<div class="tbl-wrap">
				<table class="tbl center">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 10%" />
						<col style="width: 15%" />
						<col style="width: 15%" />
						<col style="width: 15%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">증명서</th>
							<th scope="col">발급일시</th>
							<th scope="col">출력가능일시</th>
							<th scope="col">결제수수료</th>
							<th scope="col">출력</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty histList }">
								<c:forEach items="${histList }" var="hist" varStatus="status">
									<tr>
										<td>${hist.rnum }</td>
										<td>${hist.certVO.certNm }</td>
										<td>${hist.certDate }</td>
										<td id="due${status.index }">${hist.certDueDate }</td>
										<td>${hist.certVO.certCharge }</td>
										<td>
											<button id="btn${status.index }" type="button" class="btn btn-s purple">출력</button>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6">발급 내역이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</tbody>

				</table>
			</div>
			<!--end tbl-->
		
		
		
		</div>
	</div>
</div>

<script>
let cnt = $('#cnt').html();
// console.log(cnt);

// 현재일시 선언
let today = new Date();
console.log(today);

// 출력가능일시와 현재일시를 비교
for(let i=0; i<cnt; i++) {
	// 출력가능일시 > 현재 : 출력가능
	if(new Date($('#due'+i).text()) > today) {
		$('#btn'+i).attr('disabled', false);
	// 출력가능일시 <= 현재 : 출력불가능
	} else {
		$('#btn'+i).attr('class', 'btn btn-s disable');
	}
}


</script>
