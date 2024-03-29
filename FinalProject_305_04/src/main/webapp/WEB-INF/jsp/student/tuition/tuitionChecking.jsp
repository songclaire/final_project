<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/itext.css" /> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font.css" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />


<div class="box-container" id="htmlStr">



<!-- 	<div class="c1"> -->
		<table class="tbl">
			<tbody>
				<c:set var="tuitionPay" value="${tuitionPayVO }" />
				<c:choose>
					<c:when test="${not empty tuitionPay }">
						<!-- 두번째 -->
						<tr>

							<th style="width: 40px;">학번</th>
							<td>${tuitionPay.stdId}</td>

							<th th style="width: 40px;">연도</th>
							<td>${tuitionPay.semesterVO.semeYear }년도
								${tuitionPay.semesterVO.seme } 학기</td>
						</tr>
						<!-- 세번째 -->
						<tr>
							<th colspan="2">구분</th>
							<td colspan="2">금액(원)</td>

						</tr>
						<!-- 네번째 -->
						<tr>
							<th colspan="2">입학금</th>
							<td colspan="2">0원</td>

						</tr>

						<!-- 다섯번째 -->
						<tr>
							<th colspan="2">수업료</th>
							<td colspan="2">
							<fmt:formatNumber 
							value="${tuitionPay.tuitionVO.tuitionAmount }" 
							pattern="#,###" />	원</td>
						</tr>

						<!-- 여섯번째 -->
						<tr>
							<th colspan="2">장학금액</th>
							
							<td colspan="2">
								<fmt:formatNumber 
							value="${tuitionPay.scholarshipVO.schsAmount }" 
							pattern="#,###" />	원</td>
						</tr>

						<!-- 일곱번째 -->
						<tr>
							<th colspan="2">실납부금액</th>
							<td colspan="2">
							<fmt:formatNumber 
							value="${tuitionPay.amountPay }" 
							pattern="#,###" />	원</td>
						</tr>
						<tr>
							<td>납부계좌</td>
							<td colspan="3">기업은행 036190-73-374426</td>
						</tr>
					</c:when>

					<c:otherwise>
						<td colspan="7">조건에 맞는 게시글이 없습니다.</td>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
<!-- 	</div> -->
<div style="white-space: pre-line;">
</div>
<div style="white-space: pre-line;">
</div>
<div style="white-space: pre-line;">
</div>
<div style="white-space: pre-line;">
</div>
<div> ------------------------------------------------절취선 ------------------------------------------------</div>

<div style="white-space: pre-line;">
</div>
<div style="white-space: pre-line;">
</div>
<div style="white-space: pre-line;">
</div>
<div style="white-space: pre-line;">
</div>
<!-- 	<div class="c1"> -->
		<table class="tbl">
			<tbody>
				<c:set var="tuitionPay" value="${tuitionPayVO }" />
				<c:choose>
					<c:when test="${not empty tuitionPay }">
						<!-- 두번째 -->
						<tr>

							<th style="width: 40px;">학번</th>
							<td>${tuitionPay.stdId}</td>

							<th th style="width: 40px;">연도</th>
							<td>${tuitionPay.semesterVO.semeYear }년도
								${tuitionPay.semesterVO.seme } 학기</td>
						</tr>
						<!-- 세번째 -->
						<tr>
							<th colspan="2">구분</th>
							<td colspan="2">금액(원)</td>

						</tr>
						<!-- 네번째 -->
						<tr>
							<th colspan="2">입학금</th>
							<td colspan="2">0원</td>

						</tr>

						<!-- 다섯번째 -->
						<tr>
							<th colspan="2">수업료</th>
							<td colspan="2">
							<fmt:formatNumber 
							value="${tuitionPay.tuitionVO.tuitionAmount }" 
							pattern="#,###" />	원</td>
						</tr>

						<!-- 여섯번째 -->
						<tr>
							<th colspan="2">장학금액</th>
							
							<td colspan="2">
								<fmt:formatNumber 
							value="${tuitionPay.scholarshipVO.schsAmount }" 
							pattern="#,###" />	원</td>
						</tr>

						<!-- 일곱번째 -->
						<tr>
							<th colspan="2">실납부금액</th>
							<td colspan="2">
							<fmt:formatNumber 
							value="${tuitionPay.amountPay }" 
							pattern="#,###" />	원</td>
						</tr>
						<tr>
							<td>납부계좌</td>
							<td colspan="3">기업은행 036190-73-374426</td>
						</tr>
					</c:when>

					<c:otherwise>
						<td colspan="7">조건에 맞는 게시글이 없습니다.</td>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
<!-- 	</div> -->
</div>

<script>
	let htmlStr = $("#htmlStr").html();
	let stdId = ${stdId};
	console.log(stdId);
	$(document).ready(function() {
		let data = {
			htmlStr : htmlStr
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/pdf/createPdf",
			method : "post",
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function(resp) {
				window.open("${pageContext.request.contextPath}/pdf/showPdf");
				location.href = '${pageContext.request.contextPath}/student/tuitionList?stdId=' + stdId;
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
</script>