<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	// 학사년도/학기 선택으로 조회내용 변경
	$("#selSeme").on('change', function(){
		let seme = $(this).val();
		console.log(seme);
		let data = JSON.stringify(seme);

	});
	// 학사년도/학기 선택으로 조회내용 변경끝
	
	// 신규 강의계획서 등록버튼
	$('#newSyllaBtn').on('click', function(){
		$.ajax({
			method : "get",
			success : function(resp) {
				location.href="${pageContext.request.contextPath}/prof/lectSylla?profId=3120001";
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	})
	
	// 신규 강의계획서 등록버튼 끝
	
});
</script>
<div class="cont">
	<!-- cont-title -->
	<div class="cont-title">
		<h2>	강의 계획서 관리<button type="button" class="star"><span class="sr-only">즐겨찾기</span></button></h2>
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
		<div class="cont-box-inner">
			<div class="title">
				<h3>강의 계획서 조회</h3>
				<div class="box-btn">
				<c:set var="semeList" value="${semesterVO }" />
				<select id="selSeme">
					<option>==학사년도/학기==</option>
					<c:choose>
					<c:when test="${not empty semeList }">
					<c:forEach items="${semeList }" var="semYear">
						<option value="${semYear.semeId }">${semYear.semeYear }년도 / ${semYear.seme }학기</option>
					</c:forEach>
					</c:when>
					</c:choose>
				</select>
					<button type="button" id="newSyllaBtn" class="btn purple">신규 강의계획서 등록</button>
				</div>
			</div>

			<div class="tbl-wrap">
				<table class="tbl center">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 10%">
						<col style="width: 5%">
						<col style="width: 10%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
						<col style="width: 20%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">학사연도</th>
							<th scope="col">학기</th>
							<th scope="col">대상학년</th>
							<th scope="col">강의명</th>
							<th scope="col">희망수강인원</th>
							<th scope="col">이수구분</th>
							<th scope="col">학점</th>
							<th scope="col">강의시간</th>
							<th scope="col">건물</th>
							<th scope="col">강의실</th>
							<th scope="col">대면여부</th>
							<th scope="col">승인상태</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="syllaList" value="${syllabusVO }" />
						
						<c:choose>
							<c:when test="${not empty syllaList }">
							<c:forEach items="${syllaList }" var="sylla">
							<tr>
								<td>${sylla.semesterVO.semeYear }</td>
								<td>${sylla.semesterVO.seme }</td>
								<td>${sylla.camYear }</td>
								<td>${sylla.lectNm }</td>
								<td>${sylla.hopeMax }</td>
								<td>${sylla.subMajorVO.estaSub }</td>
								<td>${sylla.subMajorVO.credit }</td>
								<td>${sylla.hopeTime }</td>
								<td>${sylla.buildingVO.buildId }</td>
								<td>${sylla.buildingVO.buildNum }</td>
								<td>${sylla.syllaMeet }</td>
								<td>${sylla.syllaApprVO.aprvState }</td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="12">등록된 계획서가 없습니다.</td>
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
