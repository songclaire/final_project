<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="cont">
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />

	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			장학금 수여
			<button type="button" class="star">
				<span class="sr-only">즐겨찾기</span>
			</button>
		</h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i> <strong>등록금/장학금 관리</strong>
			<strong>장학금 관리</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
		<div class="cont-box-inner">

			<div class="tob-box">
				<strong class="tit">장학금 수여 기준 </strong>

				<p>
					수석 장학금 : 성적 기준(직전 학기) 학과별 및 학년별 석차 1등에게 장학금 2,000,000원을 지급<br>
					우수 장학금 : 성적 기준(직전 학기) 학과별 및 학년별 석차 2등에게 장학금 1,500,000원을 지급<br>
					격려 장학금 : 성적 기준(직전 학기) 학과별 및 학년별 석차 3등에게 장학금 1,000,000원을 지급<br>
				</p>
			</div>
			<div class="cont-box-inner">

				<div class="title">
					<p class="highlight-txt">
						총<em class="red-txt"> ${pagingVO.totalRecord } </em>명의 장학생이 있습니다
					</p>

					<div class="right-part">
						<div class="search-form title">
							<div class="input-group">
								<button type="button" id="sendBtn" class="btn purple">수여하기</button>
							</div>
						</div>
					</div>

					<!-- 		scroll bar	 -->
					<div class="table-scrollable">
						<div class="table-responsive">
							<table class="tbl center">
								<colgroup>
									<col style="width: 5%">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 5%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 5%">
									<col style="width: 20%">
								</colgroup>

								<thead>
									<tr class="table-scrollable__fixed-y">
										<th scope="col"><input type="checkbox" id="cbx_chkAll" />
											<label for="cbx_chkAll"> <span class="sr-only"></span></th>
										<th scope="col">학과</th>
										<th scope="col">학번</th>
										<th scope="col">학년</th>
										<th scope="col">이름</th>
										<th scope="col">학점</th>
										<th scope="col">석차</th>
										<th scope="col">장학금명</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<c:set var="scholarshipManage" value="${pagingVO.dataList }" />
										<c:choose>
											<c:when test="${not empty scholarshipManage }">
												<c:forEach items="${scholarshipManage }" var="schManage"
													varStatus="i">
													<tr class="chkGray">
														<td>
															<!-- 체크박스 --> <input type="checkbox"
															id="checkbox5${i.index}" name="radio-group${i.index}"
															data-stu-id="${schManage.stdId}" class="cbox"> <label
															for="checkbox5${i.index}"> <span class="sr-only"></span>
														</label>
														</td>
														<td>${schManage.majorVO.majorNm}</td>
														<td>${schManage.stdId}</td>
														<td>${schManage.camYear }</td>
														<td>${schManage.userNm }</td>
														<td>${schManage.finAvg }</td>
														<td>${schManage.rslt}</td>
														<td>${schManage.schsNm}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td colspan="8">조건에 맞는 게시글이 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$("#cbx_chkAll").on("click",function() {
		
		$(".cbox").prop('checked',function(){
	        return !$(this).prop('checked');
	    });
	});
});

$(function() {
	$("input[name=radio-group]").click(function() {
		var total = $("input[name=radio-group]").length;
		var checked = $("input[name=radio-group]:checked").length;

		if(total != checked) {
			$("#cbx_chkAll").prop("checked", false);
		} else{
			$("#cbx_chkAll").prop("checked", true); 
		}
	});
});


$("#sendBtn").on("click",function(){
	
	let url = this.action;
	let method = this.method;
	let queryString = $(this).serialize();
	
// 	let checkSend = $("#checkSend{i.index}");
	
	$.ajax({
		url : url,
		method : method,
		dataType : "text",
		success : function(resp) {
			alert("수여하였습니다.");	
			$(".cbox").prop('checked',function(){
		        return !$(this).prop('checked');
			});
			$("#cbx_chkAll").prop('checked',function(){
		        return !$(this).prop('checked');
			});
			$(".chkGray").css("color","#A4A4A4");
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});

});


</script>