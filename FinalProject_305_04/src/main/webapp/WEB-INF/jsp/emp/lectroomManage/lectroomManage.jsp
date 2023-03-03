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
				</div>
				<!--tbl-->
			<div class="tbl-wrap">
				<table class="tbl center">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 6%">
						<col style="width: 25%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">순서</th>
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
	
	let makeTrTag = function(syllabus, index){
		let id = syllabus.syllaId;
		lectId = syllabus.lectureList.lectId;
		if(lectId == 0){
			return $("<tr>").append(
					$("<td>").html(syllabus.professorVO.rnum)
					,$("<td>").html(syllabus.majorList.majorNm)
					,$("<td>").html(syllabus.professorVO.userNm)
					,$("<td>").html(syllabus.syllaApprVO.aprvDate)
					,$("<td>").html('미완료')
					,$("<td>").html('<input type="button" class="btn success" value="강의실 배정" id="' +id+'" data-clr="green">')
			)
		} else{
			return $("<tr>").append(
					$("<td>").html(syllabus.professorVO.rnum)
					,$("<td>").html(syllabus.majorList.majorNm)
					,$("<td>").html(syllabus.professorVO.userNm)
					,$("<td>").html(syllabus.syllaApprVO.aprvDate)
					,$("<td>").html('배정완료')
					,$("<td>").html('<input type="button" class="btn orange" value="수정" id="' +id+'" data-clr="green"/> <input type="button" class="btn red" value="취소" id="' +id+'" data-clr="red"/>')
			)
		}
	}
	

	
	
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
	
	
	$(document).on('click', 'input[data-clr=red]', function(event){
		event.preventDefault();
		
		let btnId = $(this).attr('id');
		console.log(btnId + "취소버튼 클릭됨");
		let data = {"syllaId" : btnId};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/emp/lectroomManage/deleteLect",
			method : "post",
			contentType:"application/json;charset=UTF-8",
			data : JSON.stringify(data),
			dataType : "json",
			success : function(resp) {
				alert("삭제완료");
				location.href = "${pageContext.request.contextPath}/emp/lectroomManage";
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	
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
	
