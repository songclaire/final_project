<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />

<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>사전수강신청<button type="button" class="star"><span class="sr-only">즐겨찾기</span></button></h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i>
			<strong>수강관리</strong> 
			<strong>사전수강신청</strong> 
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->
	<div class="white-box">
		<!-- 강의목록 -->
		<div class="cont-box-inner">
			<div class="tbl-wrap mb20">
				<div class="title">
					<h4>강의목록</h4>
				</div>
				<!-- 강의목록검색 -->
				<form id="searchUI" method="get">
					<table class="search-tbl noline-tbl center mt10 mb20">
						<caption>수강신청정보</caption>
						<colgroup>
							<col style="width: 8%;">
							<col style="width: 5%;">
							<col style="width: 10%;">
							<col style="width: 3%;">
							<col style="width: 10%;">
							<col style="width: 3%;">
							<col style="width: 12%;">
							<col style="width: 5%;">
							<col style="width: 22%;">
							<col style="width: 8%;">
						</colgroup>
						<tr class="pb20">
							<td></td>
							<th style="border-right: 1px solid #b2b2b2;">단과대학</th>
							<td>
								<select name="collId">
									<option value="">단과대학</option>
									<c:choose>
										<c:when test="${not empty collList}">
											<c:forEach items="${collList}" var="coll">
												<option value="${coll.collList.collId}">${coll.collList.collNm}</option>
											</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</td>
							<th style="border-right: 1px solid #b2b2b2;">학과</th>
							<td>
								<select name="majorId">
									<option value="">학과</option>
									<c:choose>
										<c:when test="${not empty majorList}">
											<c:forEach items="${majorList}" var="major">
												<option value="${major.majorId}" class="${major.collId}">${major.majorNm}</option>
											</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</td>
							<th style="border-right: 1px solid #b2b2b2;">학년</th>
							<td class="camYear">
								<div class="rc-wrap">
									<div class="rc-inner">
										<input type="checkbox" id="camyear1" name="camYears" value="1"/>
										<label for="camyear1">1</label>
									</div>
									<div class="rc-inner">
										<input type="checkbox" id="camyear2" name="camYears" value="2"/>
										<label for="camyear2">2</label>
									</div>
									<div class="rc-inner">
										<input type="checkbox" id="camyear3" name="camYears" value="3"/>
										<label for="camyear3">3</label>
									</div>
									<div class="rc-inner">
										<input type="checkbox" id="camyear4" name="camYears" value="4"/>
										<label for="camyear4">4</label>
									</div>
								</div>
							</td>
							<th style="border-right: 1px solid #b2b2b2;">이수구분</th>
							<td class="estaSub">
								<div class="rc-wrap">
									<c:choose>
										<c:when test="${not empty subjectList}">
											<c:forEach items="${subjectList}" var="subject" varStatus="i">
												<div class="rc-inner">
													<input type="checkbox" id="${subject.commId }" name="estaSubs" value="${subject.commId }">
													<label for="${subject.commId }">${subject.commDesc}</label>
												</div>
											</c:forEach>
										</c:when>
									</c:choose>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="table-scrollable table-scrollable__fixed-y mt20">
				<div class="table-responsive " style="max-height: 23vh;">
					<table class="tbl center  tbl-hover">
						<caption>강의목록 테이블</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 9%">
							<col style="width: 5%">
							<col style="width: auto%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 7%">
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr class="table-scrollable__fixed-y">
								<th scope="col">이수구분</th>
								<th scope="col">개설학과</th>
								<th scope="col">학년</th>
								<th scope="col">강의명</th>
								<th scope="col">담당교수</th>
								<th scope="col">학점</th>
								<th scope="col">수강인원</th>
								<th scope="col">-</th>
							</tr>
						</thead>
						<tbody class="center sugangList">
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<!-- 장바구니 -->
		<div class="cont-box-inner">
			<div class="title">
				<h4>장바구니</h4>
			</div>
			<div class="table-scrollable table-scrollable__fixed-y">
				<div class="table-responsive" style="max-height: 23vh;">
					<table class="tbl center tbl-hover">
						<caption>강의목록 테이블</caption>
						<colgroup>
							<col style="width: 7%">
							<col style="width: 9%">
							<col style="width: 5%">
							<col style="width: auto%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 7%">
							<col style="width: 10%">
						</colgroup>
						<thead>
							<tr class="table-scrollable__fixed-y">
								<th scope="col">이수구분</th>
								<th scope="col">개설학과</th>
								<th scope="col">학년</th>
								<th scope="col">강의명</th>
								<th scope="col">담당교수</th>
								<th scope="col">학점</th>
								<th scope="col">수강인원</th>
								<th scope="col">-</th>
							</tr>
						</thead>
						<tbody class="center sugangCartList">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
let searchColl = $("[name=collId]");
let searchMajor = $("[name=majorId]");
let okSugang = $(".ok-sugang");
let noSugang = $(".no-sugang");
let sugangList = $(".sugangList");
let sugangCartList = $(".sugangCartList");
let stdId = ${authUser.userId}

/* 단과, 학과 선택 */
searchColl.on("change", function(){
	let collId = $(this).val();
	searchMajor.find("option:gt(0)").hide();
	searchMajor.find("option." + collId).show();
	searchColl.find("option:eq()").hide();
	searchMajor.find("option:eq()").hide();
	searchColl.val(collId);
});

/* 검색 */
// let searchform = $("#searchForm").on("submit", function(){
// }).submit();

/* 강의 목록 list tag */
let makeSugangListTag = function(lect, index){
	
	return $("<tr>").append(
		$("<td>").html(lect.estaSub)
		, $("<td>").html(lect.majorVO.majorNm)
		, $("<td>").html(lect.camYear)
		, $("<td>").html(lect.lectNm).addClass("left pl10")
		, $("<td>").html(lect.profVO.userNm)
		, $("<td>").html(lect.credit)
		, $("<td>").html("0/"+lect.numClass)
		, $("<td>").append(
			$("<button>").addClass("status ok-sugang").html("담기")
			.attr({
				"data-lect-id":lect.lectId
				, "data-std-id":stdId
				}))
	);
}

let makeCartListTag = function(lect, index){
	
	let stdId = ${authUser.userId}
	
	return $("<tr>").append(
		$("<td>").html(lect.estaSub)
		, $("<td>").html(lect.majorVO.majorNm)
		, $("<td>").html(lect.camYear)
		, $("<td>").html(lect.lectNm).addClass("left pl10")
		, $("<td>").html(lect.profVO.userNm)
		, $("<td>").html(lect.credit)
		, $("<td>").html("0/"+lect.numClass)
		, $("<td>").append(
			$("<button>").addClass("status no-sugang").html("삭제")
			.attr({
				"data-lect-id":lect.lectId
				, "data-std-id":stdId
				}))
	);
}

/* 페이지 로딩 */
$(document).ready(function(){
	
	let data = {
		"stdId":stdId
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/student/priorSugang",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json;charset=UTF-8;",
		success : function(resp) {
			
			sugangList.empty();
			sugangCartList.empty();
			
			let cartList = resp.cartList
			let lectureList = resp.lectureList
			
			let sugangTrTags = [];
			let cartTrTags = [];
			
			if(lectureList){
				$.each(lectureList, function(idx, single){
					sugangTrTags.push(makeSugangListTag(single, idx));
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "9").html("조회된 강의가 없습니다."));
				sugangTrTags.push(tr);
			}
			
			if(cartList){
				$.each(cartList, function(idx, single){
					cartTrTags.push(makeCartListTag(single, idx));
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "9").html("장바구니에 담긴 강의가 없습니다."));
				cartTrTags.push(tr);
			}
			
			sugangList.html(sugangTrTags);
			sugangCartList.html(cartTrTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
});

/* 검색된 강의 List 불러오는 ajax */
$("#searchUI").on("change", function(event){
	event.preventDefault();
	
	let url = this.action;
	let method = this.method;
	let data = $(this).serialize();

	$.ajax({
		url : "${pageContext.request.contextPath}/student/priorSugang/search",
		method : "get",
		data : data,
		dataType : "json",
		success : function(resp) {
			
			sugangList.empty();
			let respData = resp;
			let trTags = [];
			
			if(respData){
				$.each(respData, function(idx, single){
					trTags.push(makeSugangListTag(single, idx));
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "9").html("조회된 강의가 없습니다."));
				trTags.push(tr);
			}
			
			sugangList.html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return false;
})

/* 수강신청 담기 버튼 클릭 */
$(document).on("click", ".ok-sugang", function(){
	console.log("클릭 =============== ");
	let me = $(this);
	me.removeClass("ok-sugang");
	me.addClass("no-sugang").html("삭제");
	
	let lectId = me.data("lectId");
	let stdId = me.data("stdId");
	let data = {
		"lectId":lectId
		, "stdId":stdId
	}
	console.log("data ================> ", data);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/student/priorSugang/add",
		method : "post",
		data : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json;charset=UTF-8;",
		success : function(resp) {
			
			sugangList.empty();
			sugangCartList.empty();
			
			let cartList = resp.cartList
			let lectureList = resp.lectureList
			
			let sugangTrTags = [];
			let cartTrTags = [];
			
			if(lectureList){
				$.each(lectureList, function(idx, single){
					sugangTrTags.push(makeSugangListTag(single, idx));
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "9").html("조회된 강의가 없습니다."));
				sugangTrTags.push(tr);
			}
			
			if(cartList){
				$.each(cartList, function(idx, single){
					cartTrTags.push(makeCartListTag(single, idx));
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "9").html("장바구니에 담긴 강의가 없습니다."));
				cartTrTags.push(tr);
			}
			
			sugangList.html(sugangTrTags);
			sugangCartList.html(cartTrTags);
			
			
			
// 			sugangCartList.empty();
// 			let respData = resp;
// 			let trTags = [];
			
// 			if(resp){
// 				if(respData){
// 					$.each(respData, function(idx, single){
// 						trTags.push(makeCartListTag(single, idx));
// 					});
// 				} else {
// 					let tr = $("<tr>").html(
// 						$("<td>").attr("colspan", "9").html("게시글이 없습니다."));
// 					trTags.push(tr);
// 				}
// 				sugangCartList.html(trTags);
// 			} else {
// 				alert("요청이 많아 장바구니에 담기지 않았습니다. 다시 장바구니에 담아주세요.")
// 			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

/* 수강신청 취소 버튼 클릭 */
$(document).on("click", ".no-sugang", function(){
	
	let me = $(this);
	
	let lectId = me.data("lectId");
	let stdId = me.data("stdId");
	let data = {
		"lectId":lectId
		, "stdId":stdId
	}
	console.log("data ================> ", data);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/student/priorSugang",
		method : "delete",
		data : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json;charset=UTF-8;",
		success : function(resp) {
			/* 
			1. DB에서 삭제는 되는데 ajax 넘어오면서 error남
			2. click할 때 list 조회되는 걸로 했더니 장바구니에 담긴 데이터 / 강의 목록 데이터 조회가 안됨
			일단 이 두개???
			*/
			
			sugangList.empty();
			sugangCartList.empty();
			
			let cartList = resp.cartList
			let lectureList = resp.lectureList
			
			let sugangTrTags = [];
			let cartTrTags = [];
			
			if(lectureList){
				$.each(lectureList, function(idx, single){
					sugangTrTags.push(makeSugangListTag(single, idx));
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "9").html("조회된 강의가 없습니다."));
				sugangTrTags.push(tr);
			}
			
			if(cartList){
				$.each(cartList, function(idx, single){
					cartTrTags.push(makeCartListTag(single, idx));
				});
			} else {
				let tr = $("<tr>").html(
					$("<td>").attr("colspan", "9").html("장바구니에 담긴 강의가 없습니다."));
				cartTrTags.push(tr);
			}
			
			sugangList.html(sugangTrTags);
			sugangCartList.html(cartTrTags);
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});
</script>
