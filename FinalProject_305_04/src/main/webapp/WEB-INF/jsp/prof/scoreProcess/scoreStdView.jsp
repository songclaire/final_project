<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>

<div class="cont">
	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			성적
			<button type="button" class="star on">
				<span class="sr-only">즐겨찾기</span>
			</button>
		</h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i> 
			<strong>path1</strong> <strong>path2</strong> <strong>path3</strong> <strong>path4</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
		<div class="cont-box-inner">
			<div class="title">
				<h3>수강생 목록</h3>
			</div>
			<!--tbl-->
			<div class="tbl-wrap">
				<table class="tbl center">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 5%">
						<col style="width: 10%">
						<col style="width: 10%">
						<col style="width: 5%">
						<col style="width: 10%">
						<col style="width: 20%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">단과대학</th>
							<th scope="col">학과</th>
							<th scope="col">학년</th>
							<th scope="col">학번</th>
							<th scope="col">이름</th>
						</tr>
					</thead>
					<tbody id="listBody">
						<tr>
							<c:set var="profStdList" value="${pagingVO.dataList }" />
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
	
	
	let makeTrTag = function(lecture, index){
		
		let aTag = $("<a>")
	    .attr("href", "${pageContext.request.contextPath}/prof/scoreProc/" + lecture.lectId)
	    .text(lecture.lectId);
		
 		return $("<tr>").append(
				$("<td id='" + lecture.stdId + "' class='std'>").html(lecture.rnum)
				,$("<td id='" + lecture.stdId + "' class='std'>").html(lecture.collVO.collNm)
				,$("<td id='" + lecture.stdId + "' class='std'>").html(lecture.majorVO.majorNm)
				,$("<td id='" + lecture.stdId + "' class='std'>").html(lecture.camYear)
				,$("<td id='" + lecture.stdId + "' class='std'>").html(lecture.stdId)
				,$("<td id='" + lecture.stdId + "' class='std'>").html(lecture.userNm)
		)
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
				let dataList = pagingVO.dataList[0].myStudentList;
				
				let trTags = [];
				if(dataList){
					$.each(dataList, function(index, lecture){
						trTags.push(makeTrTag(lecture, index));
					});
				}
				else {
					let tr = $("<tr>").html(
								$("<td>").attr("colspan", "7").html("현재 수강생이 없습니다."));
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
	
	
	$('td.std').on('click', function() {
		  console.log("클릭됨")
		});
	
	
</script>