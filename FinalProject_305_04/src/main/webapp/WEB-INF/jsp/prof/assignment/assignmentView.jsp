<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>


<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			과제 등록
			<button type="button" class="star">
				<span class="sr-only">즐겨찾기</span>
			</button>
		</h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i> <strong>나의 강의실</strong>
			<strong>과제</strong>
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

	
		
		<div class="tbl-wrap">
				<table class="tbl">
					<caption></caption>
					<colgroup>
						<col style="width: 150px;">
						<col style="width: auto;">
						
					</colgroup>
					<tbody>
						
						<tr>
							<td class="title pur-txt center" colspan="2"><h3>	${assignmentVO.assignNm }</h3></td>
						</tr>
						
						<tr>
							<th scope="row">작성일</th>
							<td>
								${assignmentVO.assignRdate }
							</td>
						</tr>
						<tr>
							<th scope="row">과제마감일</th>
							<td>
								${assignmentVO.assignDdate }
							</td>
						</tr>
						<tr>
							<th scope="row">과제내용</th>
							<td >
								<div class="tbl-cont">
								${assignmentVO.assignCont }
								</div>
							</td>
						</tr>
						<!-- <tr>
							<th scope="row">첨부파일</th>
							<td>
								
							</td>
						</tr>  -->
					</tbody>
				</table>
				<div class="title">
					<div class="box-btn">
						<a href="${pageContext.request.contextPath}/prof/assignment?lectId=${assignmentVO.lectId }" class="btn default">목록</a>
						<form id="delForm" action="${pageContext.request.contextPath}/prof/assignment/viewAssignment?asgnId=${assignmentVO.asgnId}&lectId=${assignmentVO.lectId}" method="post">
							<input type="hidden" name="_method" value="delete" />
							<button type="button" onclick="f_delete()" class="btn red">삭제</button>
						</form>
						<a href="${pageContext.request.contextPath}/prof/assignment/editAssignment?asgnId=${assignmentVO.asgnId}"  class="btn purple">수정</a> 
					</div>
				</div>
			</div>


	</div>
</div>

<script>
function f_delete() {
	if(confirm("정말로 삭제하시겠습니까?")) {
		document.getElementById("delForm").submit();
	}
}
</script>

