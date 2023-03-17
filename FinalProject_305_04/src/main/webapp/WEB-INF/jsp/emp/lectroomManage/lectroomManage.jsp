<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>

<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>강의실관리<button type="button" class="star on"><span class="sr-only">즐겨찾기</span></button></h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i>
			<strong>교무업무</strong> 
			<strong>강의실관리</strong> 
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
		<div class="cont-box-inner">
				
				<!--tbl-->
			<div class="tbl-wrap">
				<table class="tbl center tbl-schedule tbl-hover" id="lectRoomTb">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: auto%">
						<col style="width: 25%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 10%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순서</th>
							<th scope="col">강의명</th>
							<th scope="col">기안자 소속</th>
							<th scope="col">기안자</th>
							<th scope="col">신청일자</th>
							<th scope="col">배정여부</th>
							<th scope="col">배정</th>
						</tr>
					</thead>
					<tbody id="listBody">
						<tr>
							<c:set var="lectRoomManageList" value="${pagingVO.dataList }" />
						</tr>
					</tbody>
				</table>
			</div>
			<!--end tbl-->

			<!-- 페이지 네비게이션 -->
			<div id="pagingArea">
				<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/>
			</div>
			<!-- 페이지 네비게이션 끝 -->
		</div>	
	</div>
	<form:form id="searchForm" method="get" modelAttribute="simpleCondition">
	<form:hidden path="searchType" name="searchType"/>
	<form:hidden path="searchWord"/>
	<input type="hidden" name="page" />
</form:form>
</div>

<!-- 모달화면 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> 강의정보</h1>
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

<script>
	let listBody = $("#listBody");
	
	let pagingArea = $("#pagingArea").on('click', "a.paging", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(!page){return false;}
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});
	
	let id;
	let makeTrTag = function(syllabus, index){
		id = syllabus.syllaId;
		lectId = syllabus.lectureList.lectId;
		if(lectId == 0){
			return $("<tr>").append(
					$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.professorVO.rnum)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.lectureList.lectNm)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.majorList.majorNm)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.professorVO.userNm)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.syllaApprVO.aprvDate)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html('<button class="status no-status">미완료</button>')
					,$("<td>").html('<input type="button" class="btn success" value="강의실 배정" id="' +id+'" data-clr="green">')
			)
		} else{
			return $("<tr>").append(
					$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.professorVO.rnum)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.lectureList.lectNm)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.majorList.majorNm)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.professorVO.userNm)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html(syllabus.syllaApprVO.aprvDate)
					,$("<td id = "+ id +" class = 'sylla' data-bs-toggle='modal' data-bs-target='#exampleModal'>").html('<button class="status ok-status">배정완료</button>')
					,$("<td>").html('<input type="button" class="btn success" value="배정 완료" id="' +id+'" data-clr="green" disabled>')
			)
		}
	}
	
	$(document).ready(function(){
		  $('#lectRoomTb').on('click', 'td.sylla', function(){
		    let syllaId = $(this).attr('id');
// 		    $('td.sylla.on').removeClass('on');
// 		    $('td#' + syllaId).addClass('on');
		    
		    $.ajax({
				data : {"syllaId" : syllaId},
				dataType:"json",
				url:"${pageContext.request.contextPath}/emp/lectroomManage/detailLect",
				success : function(resp) {
// 					console.log(resp);
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
								<br>
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
								<br>
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
								</div>
								
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
						$('td[name="' + firDay + '"]').text('배정완료');
						$('td[name="' + secDay + '"]').addClass('on');
						$('td[name="' + secDay + '"]').text('배정완료');
						$('td[name="' + thrDay + '"]').addClass('on');
						$('td[name="' + thrDay + '"]').text('배정완료');
					}
					if(hopeTime.length == 5){
						let firDay = hopeTime.substr(0,2);
						let secDay = hopeTime.substr(3,2);
						$('td[name="' + firDay + '"]').addClass('on');
						$('td[name="' + firDay + '"]').text('배정완료');
						$('td[name="' + secDay + '"]').addClass('on');
						$('td[name="' + secDay + '"]').text('배정완료');
					}
					
				},
				error : function(jqXHR, status, error) { 
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		  });
		});

	
	
	let searchForm = $('#searchForm').on('submit', function(event){
		event.preventDefault();
		
		let url = this.action;
		let method = this.method;
		let queryString = $(this).serialize();
	
		//아작스 보내는 방식이 다양한데, 확장성 좋은 요걸 외움(파일 전송빼고 모든 곳에 사용가능)
		$.ajax({
			url : url,
			method : method,
			data :  queryString,
			dataType:"json",
			success : function(resp) {
				
				console.log(resp)
				
				listBody.empty();
				pagingArea.empty();
				searchForm[0].page.value="";
				
				let pagingVO = resp.pagingVO;
				let dataList = pagingVO.dataList;
				let trTags = [];
				if(dataList){
					$.each(dataList, function(index, syllabus){
						trTags.push(makeTrTag(syllabus, index));
					});
				}
				else {
					let tr = $("<tr>").html(
								$("<td>").attr("colspan", "5").html("조건에 맞는 게시글이 없습니다."));
					trTags.push(tr);
				}
				listBody.html(trTags);
				pagingArea.html(resp.pagingHTML)
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	}).submit();
	
	
	$(document).on('click', 'input[data-clr=green]', function(event) {
		event.preventDefault();
		
		let btnId = $(this).attr('id');
		console.log(btnId + "버튼 클릭됨");
		
		$.ajax({
			data : {syllaId : btnId},
			dataType:"json",
			success : function(resp) {
				location.href = "${pageContext.request.contextPath}/emp/lectroomManage/lectroomForm?syllaId=" + btnId;
			},
			error : function(jqXHR, status, error) { 
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
	});
</script>
	
