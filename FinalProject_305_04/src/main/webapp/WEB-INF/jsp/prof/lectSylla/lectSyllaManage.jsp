<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script>

$(function(){
	
	
	// 신규 강의계획서 등록버튼
// 	$('#newSyllaBtn').on('click', function(){
// 		$.ajax({
// 			method : "get",
// 			success : function(resp) {
// 				location.href="${pageContext.request.contextPath}/prof/lectSylla?profId=3120001";
// 			},
// 			error : function(jqXHR, status, error) {
// 				console.log(jqXHR);
// 				console.log(status);
// 				console.log(error);
// 			}
// 		});
// 	})
	// 신규 강의계획서 등록버튼 끝
	
	
	// 상세조회 버튼 클릭시 상세조회 모달
	$('.btn').on('click', function(event){
		event.preventDefault();
		
		let btnId = $(this).attr('id');
		let data = {"syllaId":btnId}
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/prof/detailSylla",
			method : "post",
			contentType:"application/json;charset=UTF-8",
			data : JSON.stringify(data),
			dataType : "json",
			success : function(resp) {
// 				alert("값 넘어옴 : " + JSON.stringify(resp));
// 				console.log("resp 나오나" + JSON.stringify(resp));
				$('.modal-body').html(
					`
						<div class="cont">
							<div class="white-box">
								
								<div class="cont-box-inner">
									<div class="title">
										<h3>강의 기본사항</h3>
									</div>
							
								<!--tbl-->
								<div class="tbl-wrap">
									<div class="tbl-wrap">
										<table class="tbl center">
											<caption></caption>
											<colgroup>
												<col style="width: 150px;">
												<col style="width: auto;">
												<col style="width: 150px;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">학사년도/학기</th>
													<td colspan="3">
														\${resp.syllabus.semesterVO.semeYear }년도 / \${resp.syllabus.semesterVO.seme }학기 
													</td>
												</tr>
												<tr>
													<th scope="row">과목 구분</th>
													<td>
														\${resp.syllabus.subMajorVO.subjectNm}
													</td>
													
													<th scope="row">이수구분</th>
													<td>
														이수구분
													</td>
												</tr>
												<tr>
													<th scope="row">대상학년</th>
													<td>
														\${resp.syllabus.camYear }학년
													</td>
													
													<th scope="row">학점</th>
													<td>
														\${resp.syllabus.lectHour}학점
													</td>
												</tr>
												<tr>
													<th scope="row">강의명</th>
													<td>
														\${resp.syllabus.lectNm}
													</td>
													<th scope="row">대면여부</th>
													<td>
														\${resp.syllabus.syllaMeet }
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--end tbl-->
								    
								
								<div class="cont-box-inner">
									<div class="title"><h3>세부사항</h3></div>
									<!--tbl-->
									<div class="tbl-wrap">
										<div class="tbl-wrap">
											<table class="tbl center">
												<caption></caption>
												<colgroup>
													<col style="width: 150px;">
													<col style="width: auto;">
													<col style="width: 150px;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row" colspan="2">수업개요</th>
														<td colspan="4">\${resp.syllabus.lectCom }</td>
													</tr>
													<tr>
														<th scope="row" colspan="2">교재</th>
														<td colspan="4">\${resp.syllabus.textbook }</td>
													</tr>
													<tr>
														<th scope="row" colspan="2">최대정원</th>
														<td colspan="4">\${resp.syllabus.hopeMax }명</td>
								
													</tr>
													<tr>
														<th scope="row" colspan="2">평가방법(%)</th>
														<td align="center">중간고사<br> \${resp.syllabus.scoreCritList[0].scoreCritRatio} %</td>
														<td align="center">기말고사<br> \${resp.syllabus.scoreCritList[1].scoreCritRatio}%</td>
														<td align="center">과제<br> \${resp.syllabus.scoreCritList[2].scoreCritRatio}%</td>
														<td align="center">출결<br> \${resp.syllabus.scoreCritList[3].scoreCritRatio}%</td>
													</tr>
													<tr>
														<th colspan="2">비고</th>
														<td colspan="4">\${resp.syllabus.note }</td>
													</tr>
												</tbody>
											</table>
											<div class="scorePer"></div>
										</div>
									</div>
									<!--end tbl-->
								</div>
								
								
								<div class="cont-box-inner">
									<div class="title"><h3>강의 계획</h3></div>
									<div class="tbl-wrap">
										<table class="tbl tbl-rowGrid center">
											<caption></caption>
											<colgroup>
												<col style="width: 280px">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">1주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
																\${resp.syllabus.lectWeekList[0].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">2주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[1].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">3주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[2].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">4주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[3].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">5주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[4].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">6주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[5].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">7주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[6].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">8주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[7].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">9주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[8].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">10주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[9].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">11주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[10].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">12주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[11].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">13주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[12].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">14주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[13].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">15주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[14].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">16주차</th>
													<td>
														<div class="display-tbl">
															<div class="display-tblCell">
															\${resp.syllabus.lectWeekList[15].lectWeekly}
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										
										<br>
										<div class="title"><h3>시간표</h3></div>
											<table class="tbl tbl-rowGrid center">
												<th>
												\${resp.syllabus.buildingVO.buildId}  \${resp.syllabus.lectRoomVO.buildNum}호 <br>
												</th>
											</table>
										    <table class="tbl center tbl-schedule" id="table" style="border: 1px solid black;">
									        <thead>
									          <tr>
									            <th scope="col"></th>
									            <th scope="col">월</th>
									            <th scope="col">화</th>
									            <th scope="col">수</th>
									            <th scope="col">목</th>
									            <th scope="col">금</th>
									          </tr>
									        </thead>
									        <tbody>
									          <tr id="1period">
									            <th scope="row" name="1">1교시</th>
									            <td name="월1"></td>
									            <td name="화1"></td>
									            <td name="수1"></td>
									            <td name="목1"></td>
									            <td name="금1"></td>
									          </tr>
									          <tr id="2period">
									            <th scope="row" name="2">2교시</th>
									            <td name="월2" ></td>
									            <td name="화2"></td>
									            <td name="수2"></td>
									            <td name="목2"></td>
									            <td name="금2"></td>
									          </tr>
									          <tr id="3period">
									            <th scope="row" name="3">3교시</th>
									            <td name="월3" ></td>
									            <td name="화3"></td>
									            <td name="수3"></td>
									            <td name="목3"></td>
									            <td name="금3"></td>
									          </tr>
									          <tr id="4period">
									            <th scope="row" name="4">4교시</th>
									            <td name="월4" ></td>
									            <td name="화4"></td>
									            <td name="수4"></td>
									            <td name="목4"></td>
									            <td name="금4"></td>
									          </tr>
									            <tr id="5period">
									            <th scope="row" name="5">5교시</th>
									            <td name="월5" ></td>
									            <td name="화5"></td>
									            <td name="수5"></td>
									            <td name="목5"></td>
									            <td name="금5"></td>
									          </tr>
									          <tr id="6period">
									            <th scope="row" name="6">6교시</th>
									            <td name="월6"></td>
									            <td name="화6"></td>
									            <td name="수6"></td>
									            <td name="목6"></td>
									            <td name="금6"></td>
									          </tr>
									          <tr id="7period">
									            <th scope="row" name="7">7교시</th>
									            <td name="월7" ></td>
									            <td name="화7"></td>
									            <td name="수7"></td>
									            <td name="목7"></td>
									            <td name="금7"></td>
									          </tr>
									          <tr id="8period">
									            <th scope="row" name="8">8교시</th>
									            <td name="월8" ></td>
									            <td name="화8"></td>
									            <td name="수8"></td>
									            <td name="목8"></td>
									            <td name="금8"></td>
									          </tr>
									          <tr id="9period">
									            <th scope="row" name="9">9교시</th>
									            <td name="월9" ></td>
									            <td name="화9"></td>
									            <td name="수9"></td>
									            <td name="목9"></td>
									            <td name="금9"></td>
									          </tr>
									        </tbody>
									     </table>
									</div>
								</div>
								
								<br>
								<div class="title"><h3>답변</h3></div>
								
								<div class="tbl-wrap">
								<table class="tbl tbl-rowGrid">
									<caption></caption>
									<colgroup>
										<col style="width: 280px">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">승인/반려 사유</th>
											<td>
												<div class="display-tbl">
													<div class="display-tblCell">
														<textarea id="answerTA"></textarea>
														<input type="hidden" id="tempId" value="\${resp.syllabus.syllaId}" />
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
								<div class="title mt10">
									<div class="box-btn center">
										<button type="button" id="btnAccept" class="btn success">승인</button>
										<button type="button" id="btnReject" class="btn red">반려</button>
									</div>
								</div>
							</div>
						</div>

				`
				);
				
				let hopeTime = resp.syllabus.hopeTime;
				let lectNm = resp.syllabus.lectNm;
				if(hopeTime.length == 8){
					let firDay = hopeTime.substr(0,2);
					let secDay = hopeTime.substr(3,2);
					let thrDay = hopeTime.substr(6,7);
					$('td[name="' + firDay + '"]').addClass('on');
					$('td[name="' + firDay + '"]').text('희망시간');
					$('td[name="' + secDay + '"]').addClass('on');
					$('td[name="' + secDay + '"]').text('희망시간');
					$('td[name="' + thrDay + '"]').addClass('on');
					$('td[name="' + thrDay + '"]').text('희망시간');
				}
				if(hopeTime.length == 5){
					let firDay = hopeTime.substr(0,2);
					let secDay = hopeTime.substr(3,2);
					$('td[name="' + firDay + '"]').addClass('on');
					$('td[name="' + firDay + '"]').text('희망시간');
					$('td[name="' + secDay + '"]').addClass('on');
					$('td[name="' + secDay + '"]').text('희망시간');
				}
				
				
				// 승인 버튼 클릭시 데이터 전송 
				$('#btnAccept').on('click', function(event){
					event.preventDefault();
					let rejectReason = $('#answerTA').val();
					let syllaId = $('#tempId').val();
					
					const date = new Date();
					const year = date.getFullYear();
					const month = ('0' + (date.getMonth() + 1)).slice(-2);
					const day = ('0' + date.getDate()).slice(-2);
					const dateStr = year + '-' + month + '-' + day;
					let aprvDate = dateStr;
					
					// 승인완료 : 3, 반려 : 4
					let data = {
					  "syllabusVO": [{ "syllaId": syllaId }],
					  "rejectReason": rejectReason,
					  "aprvDate": aprvDate,
					  "aprvState": "3"
					};
					
					console.log("data 값은? ", data);
					
					$.ajax({
						url : "${pageContext.request.contextPath}/prof/approvalSylla",
						method : "post",
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify(data),
						dataType : "json",
						success : function(resp) {
							alert("결재가 완료되었습니다.");
							console.log(resp.message);
							$('#exampleModal').modal('hide');
							$('#'+btnId).prop("disabled",true);
							$('#'+btnId).text("결재완료");
							$('#td'+btnId).html("<button class='status ok-status'>승인</button>");
						},
						error : function(jqXHR, status, error) { 
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
					
				});
				// 승인 버튼 클릭시 데이터 전송 끝
				
				
				// 반려 버튼 클릭시 데이터 전송
				$('#btnReject').on('click', function(event){
					event.preventDefault();
					let rejectReason = $('#answerTA').val();
					let syllaId = $('#tempId').val();
					
					const date = new Date();
					const year = date.getFullYear();
					const month = ('0' + (date.getMonth() + 1)).slice(-2);
					const day = ('0' + date.getDate()).slice(-2);
					const dateStr = year + '-' + month + '-' + day;
					let aprvDate = dateStr;
					
					// 승인완료 : 3, 반려 : 4
					let data = {
					  "syllabusVO": [{ "syllaId": syllaId }],
					  "rejectReason": rejectReason,
					  "aprvDate": aprvDate,
					  "aprvState": "4"
					};
					
					console.log("data 값은? ", data);
					
					$.ajax({
						url : "${pageContext.request.contextPath}/prof/approvalSylla",
						method : "post",
						contentType:"application/json;charset=UTF-8",
						data : JSON.stringify(data),
						dataType : "json",
						success : function(resp) {
							alert("결재가 완료되었습니다.");
							console.log(resp.message);
							$('#exampleModal').modal('hide');
							$('#'+btnId).prop("disabled",true);
							$('#'+btnId).text("결재완료");
							$('#td'+btnId).html("<button class='status no-status'>반려</button>");
							
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
					
				});
				// 반려 버튼 클릭시 데이터 전송 끝
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	// 상세조회 버튼 클릭시 상세조회 모달 끝
	
	
});
</script>


<div class="cont">
	<!-- cont-title -->
	<div class="cont-title">
		<h2>	강의 계획서 결재<button type="button" class="star"><span class="sr-only">즐겨찾기</span></button></h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i>
			<strong>강의 계획서 결재</strong> 
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
		<div class="cont-box-inner">
			<div class="title">
			</div>
			<div class="table-scrollable">
			<div class="table-responsive">
				<table class="tbl center tbl-hover">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 15%">
						<col style="width: 7%">
						<col style="width: 30%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 5%">
						<col style="width: 20%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 20%">
					</colgroup>
					<thead>
						<tr class="table-scrollable__fixed-y">
							<th scope="col">년도/학기</th>
							<th scope="col">학년</th>
							<th scope="col">강의명</th>
							<th scope="col">수강인원(명)</th>
							<th scope="col">이수구분</th>
							<th scope="col">학점</th>
							<th scope="col">희망시간</th>
							<th scope="col">강의실</th>
							<th scope="col">대면여부</th>
							<th scope="col">상태</th>
							<th scope="col">결재</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="syllaList" value="${syllabusVO }" />
						<c:choose>
							<c:when test="${not empty syllaList }">
							<c:forEach items="${syllaList }" var="sylla" varStatus="status">
							<tr>
								<td>${sylla.semesterVO.semeYear }/${sylla.semesterVO.seme }</td>
								<td>${sylla.camYear }</td>
								<td>${sylla.lectNm }</td>
								<td>${sylla.hopeMax }</td>
								<td>${sylla.subMajorVO.estaSub }</td>
								<td>${sylla.subMajorVO.credit }</td>
								<td>${sylla.hopeTime }</td>
								<td>${sylla.buildingVO.buildId } ${sylla.lectRoomVO.buildNum }호</td>
								<td>${sylla.syllaMeet }</td>
								<c:choose>
									<c:when test="${sylla.syllaApprVO.aprvState eq '반려'}">
										<td id="td${sylla.syllaId }"><button class="status no-status">반려</button></td>
									</c:when>
									<c:when test="${sylla.syllaApprVO.aprvState eq '승인완료'}">
										<td id="td${sylla.syllaId }"><button class="status ok-status">승인</button></td>
									</c:when>
									<c:when test="${sylla.syllaApprVO.aprvState eq '승인대기'}">
										<td id="td${sylla.syllaId }"><button class="status wait-status">대기</button></td>
									</c:when>
								</c:choose>
								
								<td><button type="button" class="btn btn-s purple" id="${sylla.syllaId}" data-bs-toggle="modal" data-bs-target="#exampleModal" >결재하기</button></td>
							
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="10">등록된 계획서가 없습니다.</td>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			</div>
		</div>
		
		<!-- 모달화면 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel"> 상세조회</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
					
		      </div>
		      <div class="modal-footer">
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 모달화면 끝  -->
		
	</div>
</div>

<script>
	let syllaVOBtn="";
</script>

<c:forEach items="${syllaLists}" var="syllaApps">
	 
	 <script>
	 //  자바와 자바스크립트 실행순서에 주의
	  syllaVOBtn = "${syllaApps.syllabusVO[0].syllaId}";
	  $("#"+syllaVOBtn).prop("disabled",true);
	  $("#"+syllaVOBtn).text("결재완료");
	 </script>
	 
</c:forEach>
















