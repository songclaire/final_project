<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
						<td>${map.STD_ID}</td>
						<th scope="row">강의명</th>
						<td>${map.LECT_NM}</td>
					</tr>

					<tr>
						<th scope="row">학생명</th>
						<td>${map.USER_NM}</td>
						<th scope="row">중간기말구분</th>
						<td>${map.EXAM_TYPE}</td>
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
			<form:form id="testAnsSubmit" modelAttribute="testAns"
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

								<%-- ${testQue } --%>
								<li>
									<p>${testQue.testNum }.${testQue.testQue }</p> <%-- <input type="text" name="ansList[statL.index].testQueId" value="${testQue.testNum}" /> --%>
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
														<div class="rc-wrap">
															<div class="rc-inner">
																<input type="radio" id="${testPasg.testPasgId}"
																	name="testAnsList[${i.index}].testAnsw"
																	value="${testPasg.testPasgId}" data-orgin-ans="${testPasg.answState}"> <label
																	for="${testPasg.testPasgId}">${testPasg.testPasg}</label>
															</div>
														</div>
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
				
				
				<!--
				
					제출 클릭 => 
					 지문 비교 
					 점수 insert 
				
				  -->

				<div class="btn-wrap right">
					<!-- <button type="button" class="btn default">목록</button> -->
					<button type="submit" class="btn purple" id="btnSubmit">제출</button>
				</div>
		
		<security:csrfInput />
		</form:form>
		</div>
	</div>
	<!-- //  white-box -->


</div>




<script>




//값 보내기 
let orginAns = $("input[type=radio]").data("orginAns");
let data = {
		"orginAns" : orginAns
}


//학생 답
//let testAnsw = $("input[type=radio]").data("testAnsw"); 



//let resultArr = [];
$("input[type=radio]").on("change",function() {

	
	
	/*
	let testAllowId = $("input[name=testAllowId]").val();
	let stdAnw = $(this).data("orginAns");
	let inputVal = $(this).val();

	//정답인 값만 result에 넣기 
	/* let resultValues = $("#result").text();
	for (var i = 0; i < resultValues.length; i++) {
		resultArr.push(resultValues);
	}
	console.log("resultArr!!!1: " , resultArr);

	$.ajax({
		url: "${pageContext.request.contextPath}/student/test/testView?testAllowId=" + testAllowId,
		type: "POST",
		contentType:"application/json;charset=UTF-8",
		data: JSON.stringify(data),
		dataType:"json",
		success: function(resp) {
			console.log(resp);
			
			
			let answState;
			let studentAnswers;
			
			for (var i = 0; i < resp.testAllow.testAnsList.length; i++) {
				//console.log(resp.testAllow.testAnsList[i]);
				answState = resp.testAllow.testAnsList[i].answState; 
				studentAnswers = $("input:checked").data("orginAns");
				
				console.log("answState: studentAnswers => ", answState + " : " +  studentAnswers);
				
				
				if(answState == 'Y' && answState == studentAnswers)  {
					alert("sdf");
					$("#result").append(inputVal);
					//return true; 
				} 	
			}
			
			 //checked된 값이  ${testPasg.testPasgId} 와 같다면 Y
		 	/* if(answState == studentAnswers) {
				alert("sdf");
				//$("#result").append(studentAnswers);
			}   
			
			
			//console.log("pasgId: studentAnswers => ", pasgId + " : " +  studentAnswers);
			
			
			
		}, 
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return false; 
	
	
	*/
	
	
});

/* 
const dResult = document.querySelector("#result");

const yResult = [];
const munLength = 2;




$("input[type=radio]").on("click", function() {
	
	//console.log("누구:",event.target);
	 let ckbox = event.target;
	//console.log( ckbox.checked , ckbox.dataset.orginAns);
	if(ckbox.checked){
		//alert(ckbox.value);
		dResult.innerHTML += ckbox.value + "&nbsp;&nbsp;&nbsp;&nbsp;";
	} 

	
}); */









</script>
