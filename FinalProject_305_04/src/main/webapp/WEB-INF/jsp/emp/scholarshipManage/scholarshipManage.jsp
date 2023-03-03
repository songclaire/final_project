<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			장학금 수여(교직원)
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
						총<em class="red-txt"> 고치세요 </em>명의 장학생이 있습니다
					</p>

					<div class="right-part">
						<div class="search-form">
							<select>
								<option>전체</option>
								<option>학과</option>
								<option>학년</option>
							</select>
							<div class="input-group">
								<label for="searchTxt" class="sr-only">검색어를 입력하세요</label> <input
									type="text"
									class="form-control text input with dropdown button"
									id="searchTxt" name="searchTxt" value=""
									placeholder="검색어를 입력하세요.">
								<button class="btn btn-search primary" type="button">검색</button>
								<button type="button" class="btn default">전체선택</button>
								<button type="button" class="btn purple">수여하기</button>
							</div>
						</div>
					</div>


					<!-- 		scroll bar	 -->
					<div class="table-scrollable">
						<div class="table-responsive">
							<table class="tbl">
								<colgroup>
									<col style="width: 5%">
									<col style="width: 5%">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 5%">
									<col style="width: 10%">
									<col style="width: 10%">
									<col style="width: 5%">
									<col style="width: 20%">
								</colgroup>

								<thead class="">
									<tr class="table-scrollable__fixed-y">
										<th scope="col">선택</th>
										<th scope="col">No</th>
										<th scope="col">단과대학</th>
										<th scope="col">학과</th>
										<th scope="col">학번</th>
										<th scope="col">학년</th>
										<th scope="col">이름</th>
										<th scope="col">학점</th>
										<th scope="col">석차</th>
										<th scope="col">장학금액(원)</th>
									</tr>
								</thead>

								<!-- !!!!	안에 컬럼명 바꾸셈 바꾸쎔 바꾸쎔 바꾸셈 일단 틀만 만든거임  !!!! -->
								<tbody>
									<tr>
										<c:set var="scholarshipManage" value="${pagingVO.dataList }" />
										<c:choose>
											<c:when test="${not empty scholarshipManage }">
												<c:forEach items="${scholarshipManage }" var="scholarshipManage">
													<tr>
														<td>
															<!-- 체크박스 -->
															<div class="rc-wrap">
																<input type="checkbox" id="checkbox5" name="radio-group">
																<label for="checkbox5"><span class="sr-only">선택</span></label>
															</div>
														</td>
														<td>${scholarshipManage.rnum }</td>
														<td>학사연도 불러오기</td>
														<td>학기 불러오기</td>
														<td><a href="#">${scholarshipManage.schsNm }</a></td>
														<td>${scholarshipManage.schsAmount }</td>
														<td>최종성적 불러오기</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td colspan="10">조건에 맞는 게시글이 없습니다.</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- !!!!	바꿨니???????  !!!! -->

				</div>
			</div>
		</div>
	</div>
</div>