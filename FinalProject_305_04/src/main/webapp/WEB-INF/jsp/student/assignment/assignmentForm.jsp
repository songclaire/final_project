<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>  
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js" ></script>


<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>과제 제출<button type="button" class="star"><span class="sr-only">즐겨찾기</span></button></h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i> <strong>수강관리</strong>
			<strong>수강중인 강의</strong> <strong>과제</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
	
			<div class="tob-box">
				과제 제출 시 <span class="red-txt">마감일 이내에</span> 수정이 가능합니다. <br>
				<span class="red-txt">마감일 이후에는 제출 또는 수정 할 수 없으므로</span> 기한을 잘 확인하여 불이익 없도록 주의하시길 바랍니다. 
			</div>
			
			<form method="post" action="${pageContext.request.contextPath }/student/assignment/assignmentForm">
				<input name="asgnId" value="${assignmentVO.asgnId}" type="hidden"  /> 
				<input name="curlectId" value="${assignmentVO.currLectVOList[0].curlectId}" type="hidden"  />
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
								<td class="title pur-txt center" colspan="2"><h3>${assignmentVO.assignNm }</h3></td>
							</tr>
							<tr>
								<th scope="row">과제내용</th>
								<td>${assignmentVO.assignCont }</td>
							</tr>
							<tr>
								<th scope="row">등록일</th>
								<td>${assignmentVO.assignRdate }</td>
							</tr>
							<tr>
								<th scope="row">과제 마감일</th>
								<td>${assignmentVO.assignDdate }</td>
							</tr> 
							<tr>
								<th scope="row">과제 제출 내용</th>
								<td>
									<textarea id="assignCont"  name="assignSubCont" value="${assignmentVO.assignmentSubmitVO.assignSubCont }" type="text" ></textarea>
								</td>
							</tr>
							<!-- <tr>
								<th scope="row">첨부파일</th>
								<td>
									<input type="file" name="files" multiple="multiple" value="" />
								</td>
							</tr> -->
						</tbody>
					</table>
					<div class="title">
						<div class="box-btn">
							<a href="${pageContext.request.contextPath }/student/assignment?lectId=${assignmentVO.lectId }" class="btn default">목록</a>
							<button type="submit" class="btn purple">등록</button>			
						</div>
					</div>
				</div> 
				<security:csrfInput/>
			</form>
	
			
			
	</div>
</div>



<script>
//에디터 
CKEDITOR.replace('assignCont', {
	filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?command=QuickUpload&type=Files&responseType=json'
}); 




/* 자동채우기 */
function f_autoFill(){
	
	//컴퓨터 보안 관련 최근 연구 동향 보고서 제출
	$("input[name='assignNm']").val("정보 보안 관련 최근 연구 동향 보고서 제출"); // 제목
	var dateForm = $("#dateFrom");
	var endDate = "2023-03-25";
	$('#dateFrom').attr('value',endDate);
// 	CKEDITOR.replace('assignCont', "정보 보안 관련 최근 연구 동향을 조사하고 2~3 페이지 내외로 보고서를 작성해서 제출하시오.");
// 	$("textarea[name='assignCont']").html("정보 보안 관련 최근 연구 동향을 조사하고 2~3 페이지 내외로 보고서를 작성해서 제출하시오."); // 선택하기
}
</script>