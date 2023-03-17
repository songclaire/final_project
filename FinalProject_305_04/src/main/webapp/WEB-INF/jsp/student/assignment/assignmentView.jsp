<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




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
							<th scope="row">내용</th>
							<td>
								<div class="tbl-cont">
								${assignmentVO.assignmentSubmitVO.assignSubCont }
								</div>
							</td>
						</tr>
						<!-- <tr>
							<th scope="row">첨부파일</th>
							<td>
								
							</td>
							
						</tr> -->
						<!-- <tr>
							<th scope="row">점수</th>
							<td>
								
							</td>
							
						</tr> -->
						<!--과제기한 지났을 경우 점수 컬럼만 나오고 목록 버튼만 나오게 하기   -->
					</tbody>
				</table>
				
				
				<div class="title">
					<div class="box-btn">
						<a href="${pageContext.request.contextPath }/student/assignment?lectId=${assignmentVO.lectId }" class="btn default">목록</a>
						<!-- 현재년도 -->
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<fmt:formatDate var="sysYear" value="${now}" pattern="yyyy-MM-dd" />
						<c:choose>
							<c:when test="${sysYear lt assignmentVO.assignDdate}"> <!-- 제출기간 만료전  -->
								<form id="delForm" action="${pageContext.request.contextPath }/student/assignment/assignmentView?asgnId=${assignmentVO.asgnId }&lectId=${assignmentVO.lectId }" method="post">
									<input type="hidden" name="_method" value="delete" />
									<button type="button" class="btn red"  onclick="f_movedelete()">삭제</button>
								</form>
								<a href="${pageContext.request.contextPath}/student/assignment/assignmentEdit?asgnId=${param.asgnId}&lectId=${assignmentVO.lectId }" class="btn purple">수정</a>			
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>	
	</div>
</div>


<script>
//삭제
function f_movedelete() {
	if(confirm("정말로 삭제하시겠습니까?")) {
		document.getElementById("delForm").submit();
	}
}
</script>


