<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />


<div class="cont">


	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			시험
			<button type="button" class="star">
				<span class="sr-only">즐겨찾기</span>
			</button>
		</h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i> <strong>시험</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->


	<!-- white-box -->
	<div class="white-box">
		<!-- 학번, 학생명, 강의코드, 강의명, 중간기말구분 -->
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

					<%-- ${test } --%>
					<tr>
						<td class="title pur-txt center" colspan="4"><h3>
								${test.testNm }</h3></td>
					</tr>
					<tr>
						<th scope="row">시험시작시간</th>
						<td>${test.testStime }</td>
						<th scope="row">시험종료시간</th>
						<td>${test.testEtime }</td>
					</tr>
					<tr>
						<th scope="row">학번</th>
						<td>${authUser.userId}</td>
						<th scope="row">강의명</th>
						<td>${map.LECT_NM}</td>
					</tr>

					<tr>
						<th scope="row">학생명</th>
						<td>${map.USER_NM}</td>
						<th scope="row">중간기말구분</th>
						<td>${map.EXAM_TYPE}</td>
					</tr>
					<tr>
						<th scope="row">점수</th>
						<td colspan="3"><input id="result" name="TEST_SCORE" style="border: 0;"></td>
					</tr>

				</tbody>
			</table>
		</div>



		<!-- 
		test : TestVO
		test.queList : List<TestQueVO> queList
		testQue : TestQueVO
		testQue.pasgList : List<TestPasgVO> pasgList
		testPasg : TestPasgVO
		 -->

		<div class="cont-box-inner">
			<form id="testAnsSubmit"
				action="${pageContext.request.contextPath }/student/test/testAns"
				method="post">



				<ul class="listGroup-wrap">
					<!-- 시험문제   -->
					<c:choose>
						<c:when test="${not empty test.queList }">
							<input type="hidden" name="testAllowId"
								value="${test.testAllow.testAllowId }" />
							<input type="hidden" name="curlectId"
								value="${test.testAllow.curlectId }" />
							<input type="hidden" name="testId"
								value="${test.testAllow.testId }" />
							<input type="hidden" name="stdId" value="${stdId}" />
							<input type="hidden" name="semeId" value="${semeId}" />

							<c:forEach var="testQue" items="${test.queList }" varStatus="i">
								<input type="hidden" name="testAnsList[${i.index}].testAllowId" value="${test.testAllow.testAllowId }" />
								<input type="hidden" name="testAnsList[${i.index}].testQueId"value="${testQue.testQueId }" /> 

								<li>
									<p>${testQue.testNum }. ${testQue.testQue }</p> <%-- <input type="text" name="ansList[statL.index].testQueId" value="${testQue.testNum}" /> --%>
									<!-- 1~10번  --> 
									<c:choose>
										<c:when test="${not empty testQue.pasgList }">

											<!-- testPasg : 지문번호아이디(testPasgId) -->
											<c:forEach var="testPasg" items="${testQue.pasgList}">
											
												<%-- ${i.index} --%>
												<%-- console.log(${ testPasg.testPasgId }); --%>
												<!-- 주관식 객관식 구분   -->
												<c:choose>
													<c:when test="${testPasg.queType == '객관식'}">
													
													
													
<%-- 														<c:choose> --%>
<%-- 														<c:when test="${testPasg.answState == 'N' }"> --%>
<!-- 																<div class="rc-wrap"> -->
<!-- 																	<div class="rc-inner"> -->
<%-- 																		<input type="radio" id="checkbox${testPasg.testPasgId}" --%>
<%-- 																			name="testAnsList[${i.index}].testAnsw" --%>
<%-- 																			value="${testPasg.testPasgId}" readonly disabled> <label --%>
<%-- 																			for="checkbox${testPasg.testPasgId}">${testPasg.testPasg}</label> --%>
<!-- 																	</div> -->
<!-- 																</div> -->
<%-- 															</c:when> --%>
<%-- 															<c:otherwise> --%>
													<div class="rc-wrap">
														<div class="rc-inner">
															<input type="radio" id="${testPasg.testPasgId}"
																name="testAnsList[${i.index}].testAnsw" readonly
																value="${testPasg.testPasgId}" 
																	<c:if test="${testPasg.testPasgId==testPasg.testAnsw}">checked</c:if> 
																> <label
																for="checkbox${testPasg.testPasgId}"  
																	<c:if test="${testPasg.answState=='Y'}">class="red-txt"</c:if>																
																>${testPasg.testPasg}</label>
														</div>
													</div>
<%-- 															</c:otherwise> --%>
<%-- 														</c:choose> --%>
	
													</c:when>
													<c:otherwise>
														<label for="textarea${testPasg.testPasgId}"
															class="sr-only"></label>
														<textarea id="textarea${testPasg.testPasgId}"
															name="testAnsList[${i.index}].testAnsw"></textarea>
													</c:otherwise>
												</c:choose>
												
												
												
												
												
												
												
												
											</c:forEach>
										</c:when>
										<c:otherwise>
					              			문제 없음
					          			 </c:otherwise>
									</c:choose>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
	              		문제 없음
	           </c:otherwise>
					</c:choose>
				</ul>
				
			<%-- 	<c:set var="testAnsList" value="${test.testAllow.testAnsList }" />
				<c:set var="testAnsListLength" value="${fn:length(test.testAllow.testAnsList)}" />
				<c:forEach items="${testAnsList }" var="list">
					<c:if test="${fn:contains(testAnsList, 'Y'}" >
					</c:if>
				</c:forEach> --%>
					
			
				
				<div class="btn-wrap right">
					<a href="${pageContext.request.contextPath}/student/test?stdId=${stdId }&semeId=${semeId }" class="btn default">목록</a>
				</div>
		
		<security:csrfInput />
		</form>
		</div>
	</div>
	<!-- //  white-box -->


</div>





<script>
/* let q = ${fn:length(test.testAllow.testAnsList)}
let qnum = q.length;
console.log("===", q)

let ycheck = 0;
$.each() */


let totalMus = ${totalMuns.totalMus}
let studentAns = ${totalMuns.studentAns }

result = Math.round((studentAns / totalMus) * 100)
console.log("result", result);
$("#result").css("color","#5122ac");
$("#result").css("font-weight","bold");
$("#result").css("font-size","23px");

if(result == 0) {
	$("#result").val("0점");
}else {
	$("#result").val(result + "점");

}







</script>
