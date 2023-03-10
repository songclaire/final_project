<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js" ></script>


<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			과제
			<button type="button" class="star">
				<span class="sr-only">즐겨찾기</span>
			</button>
		</h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i> <strong>path1</strong>
			<strong>path2</strong> <strong>path3</strong> <strong>path4</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">

		<div class="tob-box">
			<strong class="tit">과제 안내 사항 </strong>
			<p>1. 반드시 기간을 먼저 설정한 후, 과제를 등록해주세요.</p>
			<p>2. 총점 부여는 10~100점까지 등록 가능합니다.</p>
			<p>3. 제출현황의 보기버튼을 클릭하여 과제별 학생 제출목록을 통해 제출여부를 확인할 수 있습니다.</p>
		</div> 



		
		<form id="editForm" action="${pageContext.request.contextPath}/prof/assignment/editAssignment" method="post" >
			<input type="hidden" name="asgnId" value="${assignmentVO.asgnId }" />	
			<input type="hidden" name="lectId" value="${assignmentVO.lectId }" />
			
			<div class="tbl-wrap">
				<table class="tbl">
					<caption></caption>
					<colgroup>
						<col style="width: 150px;">
						<col style="width: auto;">
						
					</colgroup>
					<tbody>
						
						<tr>
							<th scope="row">과제명</th>
							<td>
								<input  class="w100" type="text" name="assignNm" value="${assignmentVO.assignNm }" />
							</td>
						</tr>
						<tr>
							<th scope="row">작성일</th>
							<td>
								<input  class="w100" type="text" name="assignRdate" value="${assignmentVO.assignRdate }" />
							</td>
						</tr>
						<tr>
							<th scope="row">과제마감일</th>
							<td>
								<!-- 달력  -->
							  	<div class=" calendar-wrap">
                                     <label class="calendar" for="dateFrom" title="from"><i class="icon  bi bi-calendar-check"></i><span class="sr-only">날짜선택(시작)</span></label>
                                     <input type="text" id="dateFrom" class="datepicker w15" name="assignDdate" autocomplete="off" onchange="f_calendar()" value="${assignmentVO.assignDdate }" />
                                 </div>
                                <!-- // 달력  -->
							</td>
						</tr>
						<tr>
							<th scope="row">과제내용</th>
							<td>
								<textarea  id="assignCont"  class="tbl-cont w100" name="assignCont">${assignmentVO.assignCont }</textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td>
								
							</td>
						</tr> 
					</tbody>
				</table>
				<div class="title">
					<div class="box-btn">
						<a href="${pageContext.request.contextPath}/prof/assignment?lectId=${assignmentVO.lectId }" class="btn default">목록</a>
						<a href="${pageContext.request.contextPath}/prof/assignment/viewAssignment?lectId=${assignmentVO.lectId }&asgnId=${assignmentVO.asgnId}" class="btn red">취소</a>
						<button type="button" class="btn purple" onclick="f_edit()">수정</button> 
					</div>
				</div>
			</div>
		</form>	
			


	</div>
</div>


<script>

function f_edit() {
	if(confirm("정말로 수정하시겠습니까?")) {
		document.getElementById("editForm").submit();
	}
}


//에디터 
CKEDITOR.replace('assignCont', {
	filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?command=QuickUpload&type=Files&responseType=json'
}); 

</script>
