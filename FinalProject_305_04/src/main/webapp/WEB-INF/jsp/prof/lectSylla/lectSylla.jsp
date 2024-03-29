<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	
	// 학사년도/학기 선택시 학과과목 셀렉트박스 변경
	$("#selSemeYear").on("change", function(){
		let selSemeYear = $(this).val();
		let profId = ${profId };
		
		let data = {"profId":profId,
				"semeId":selSemeYear};
		$.ajax({
			url:"${pageContext.request.contextPath}/prof/selectSubMajorList",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			success:function(result){
				$("#selSubMajor").html("");
				$("#selSubMajor").append("<option>" + "==과목==" + "</option>");
				$.each(result,function(index, subMajorVO){
					$("#selSubMajor").append("<option value='" + subMajorVO.subMajorId + "," + subMajorVO.credit + "," + subMajorVO.estaSub + "'>" + subMajorVO.subjectNm + "</option>");
				});
				
				// 과목 선택시 이수구분, 학점 값 자동입력
				$("#selSubMajor").on("change",function(){
					let selSubMajor = $(this).val();
// 					console.log("selSubMajor : ", selSubMajor);
					let esta = selSubMajor.substr(10, 13);
					let credit = selSubMajor.substr(8, 1);
					$('input[name=commDesc]').val(esta);
					$('input[name=lectHour]').val(credit);
					clickTime = $('input[name=lectHour]').val();
				});
				// 과목 선택시 이수구분, 학점 값 자동입력 끝
			}
		});
	});
	// 학사년도/학기 선택시 학과과목 셀렉트박스 변경 끝
	
	
	// 건물, 강의실 셀렉트박스 변경
	$("#selBuild").on("change", function(){
		let selBuild = $(this).val();
// 		console.log("selBuild : " + selBuild);
		let data = {"buildId":selBuild};
		
		//*** 나중에 시큐리티 사용 시 token처리 필요
		$.ajax({
			url:"${pageContext.request.contextPath}/prof/selectLectRoomList",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			success:function(result){

				$("#selLectRoom").html("");//초기화
				
				$.each(result,function(index,lectRoomVO){
					$("#selLectRoom").append("<option value='"+lectRoomVO.lectRoomId+"'>" + lectRoomVO.buildNum + "호" + "(" + lectRoomVO.numPpl + "명)" + "</option>");
				});
				
				
			}
		});
	});
	// 건물, 강의실 셀렉트박스 변경 끝
	
	
	// 컨트롤러로 데이터 전송
	$("#syllaForm").on("submit", function(event) {
		event.preventDefault();
		let url = "${pageContext.request.contextPath}/prof/insertSylla";
		let method = "post";
		let testt = $(this).serialize();
		console.log(testt);
		let queryString = $(this).serialize();
		

		var formValues = $("form[name='syllaForm']").serialize() ;
		console.log(formValues);
		
		$.ajax({
			url : url,
			type : method,
			data : formValues,
			dataType : "json",
			success : function(resp) {
				//alert("값 넘어옴 : " + JSON.stringify(resp));
				location.href="${pageContext.request.contextPath}/prof/lectSyllaView?profId=" + resp.profId;
			},
			error : function(error) {
				console.log(error);
				console.log("에러남");
			}
		});
	});
	// 컨트롤러로 데이터 전송 끝
	
	
	
	//시간표 script //
	let datas = [{period: "1",day : "MON", name:"운영체제"},
	    {period: "2",day : "MON", name:"운영체제"},
	    {period: "3",day : "MON", name:"운영체제"}
	    ]
	
	let clickTime;
	let selectStr;
	
	$(document).ready(function() {
	    tableClick();
//	     loadData(datas);
	});

	var tableClick = function(){
	    $('#table td').on("click",function(e){
	    	$("td.on").html('');
	    	$("td.on").removeClass("on");
	    	let selectedValues = [];
	    	tr = e.target.parentElement;
//	         let lects = $(this).parent().children('th').attr('name');
	        lectTimeId = $(this).attr("name");
	        lectTimeIds = lectTimeId.substring(0,3);
	        
	        for(let i=1; i < clickTime; i++){
	        	let nameNum = parseInt(lectTimeId.substring(3))+i;
        		let nextNum = lectTimeIds + nameNum;
 	            $(this).addClass("on");
 	          	$("[name="+ nextNum +"]").addClass("on");
	        }
	        
			
	        $("td.on").each(function() {
	          selectedValues.push($(this).attr("id"));
	          selectStr = selectedValues.join(" ");
	        });
	        console.log(selectedValues);
	        console.log(selectStr);
	        $('#hopeTime').val(selectStr);
// 	        $("td.on").html(lectName);
	    });
	}

	var loadData = function(datas){
	    console.log(datas);
	    for(var index in datas){
	        var data = datas[index];
	        var day = $('#'+data.period+"period td[name="+data.day+"]");
	        day.html(data.name);
	        day.off('click');
	    }
	}
//시간표 script 끝 //

});


function f_autoFill(){
// 	$('#selSemeYear').val('DA10013').prop('selected',true);
// 	$('#selSubMajor').val('DC10002,3,전공필수').prop('selected',true);
	$('#lectNm').val('C언어 프로그래밍 기초');
	$('#lectCom').val('C언어 프로그래밍 기초 강의');
	$('#textbook').val('개념 쏙쏙 C프로그래밍');
	$('#hopeMax').val('25');
	$('#midTest').val('30');
	$('#finTest').val('30');
	$('#assign').val('20');
	$('#attend').val('20');
	$('#note').val('기초강의로 신입생만 수강바랍니다.');
	$('#week1').val('OT');
	$('#week2').val('C언어 소개');
	$('#week3').val('표준입출력 함수와 산술연산자');
	$('#week4').val('연산자의 종류와 실습');
	$('#week5').val('제어문의 종류와 실습');
	$('#week6').val('포인터 기초 강의');
	$('#week7').val('포인터 심화 강의');
	$('#week8').val('중간평가');
	$('#week9').val('매크로와 함수');
	$('#week10').val('구조체, 공용체, 열거형');
	$('#week11').val('구조체의 응용 (구조체를 이용한 자료구조)');
	$('#week12').val('공용체의 응용');
	$('#week13').val('열거형의 응용');
	$('#week14').val('파일함수와 입출력');
	$('#week15').val('C언어 기초강의 총정리');
	$('#week16').val('기말평가');
}
	
</script>

<div class="cont">
	<!-- cont-title -->
	<div class="cont-title">
		<h2>강의 계획서 등록<button type="button" class="star"><span class="sr-only">즐겨찾기</span></button></h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i>
			<strong>강의계획서</strong> 
			<strong>강의계획서 등록</strong> 
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->
	
	
	<div class="white-box">
		
		
		<form id="syllaForm" name="syllaForm">
		<div class="cont-box-inner">
			<div class="title">
				<h3>강의 기본사항</h3>
				<div class="box-btn">
					<input type="button" class="btn default" value="자동입력" onclick="f_autoFill()" />
					<input type="submit" class="btn purple" value="제출" />
				</div>
			</div>
	
		<!--tbl-->
		<div class="tbl-wrap">
			<div class="tbl-wrap">
				<table class="tbl">
					<caption></caption>
					<colgroup>
						<col style="width: 150px;">
						<col style="width: auto;">
						<col style="width: 150px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">학사년도/학기</th>
							<c:set var="semeList" value="${semesterVO }" />
							<td colspan="3">
								<select id="selSemeYear" name="semesterVO.semeId">
									<option>==학사년도/학기==</option>
									<c:choose>
									<c:when test="${not empty semeList }">
									<c:forEach items="${semeList }" var="semYear">
										<option value="${semYear.semeId }">${semYear.semeYear }년도 / ${semYear.seme }학기</option>
									</c:forEach>
									</c:when>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">과목 목록</th>
							<td>
								<select id="selSubMajor" name="subMajorVO.subMajorId">
									<option>==과목==</option>
									<c:set var="subMajorList" value="${subMajorVO }" />
									<c:choose>
									<c:when test="${not empty subMajorList }">
									<c:forEach items="${subMajorList }" var="subMajor">
										<option value="${subMajor.majorId }">${subMajor.subjectNm }</option>
									</c:forEach>
									</c:when>
									</c:choose>
								</select>
							</td>
							
							<th scope="row">이수구분</th>
							<td>
								<input type="text" name="commDesc" value="" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<th scope="row">대상학년</th>
							<td>
								<select id="selCamYear" name="camYear">
									<option value="1">1학년</option>
									<option value="2">2학년</option>
									<option value="3">3학년</option>
									<option value="4">4학년</option>
								</select>
							</td>
							
							<th scope="row">학점</th>
							<td>
								<input type="text" name="lectHour" value="" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<th scope="row">강의명</th>
							<td><input type="text" id="lectNm" name="lectNm" class="w50"></td>
							<th scope="row">대면여부</th>
							<td>
								<select id="selCredit" name="syllaMeet">
									<option value="ONLINE">대면</option>
									<option value="OFFLINE">비대면</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!--end tbl-->
		
		
		
		<div class="cont-box-inner">
			<div class="title"><h3>세부사항 작성</h3></div>
			
			<!--tbl-->
			<div class="tbl-wrap">
				<div class="tbl-wrap">
					<table class="tbl">
						<caption></caption>
						<colgroup>
							<col style="width: 150px;">
							<col style="width: auto;">
							<col style="width: 150px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" colspan="2">수업개요</th>
								<td colspan="4"><input type="text" id="lectCom" name="lectCom" class="w100"></td>
							</tr>
							<tr>
								<th scope="row" colspan="2">교재</th>
								<td colspan="4"><input type="text" id="textbook" name="textbook" class="w100"></td>
							</tr>
							<tr>
								<th scope="row" colspan="2">최대정원</th>
								<td colspan="4"><input type="text" id="hopeMax" name="hopeMax" class="w50">명</td>
		
							</tr>
							<tr>
								<th scope="row" colspan="2">평가방법(%)</th>
								<td align="center">중간고사<br> <input type="hidden" name="scoreCritList[0].scoreCritNm"  value="중간고사" /> <input type="text" id="midTest" name="scoreCritList[0].scoreCritRatio" class="w50">%</td>
								<td align="center">기말고사<br> <input type="hidden" name="scoreCritList[1].scoreCritNm" value="기말고사" /> <input type="text" id="finTest" name="scoreCritList[1].scoreCritRatio" class="w50">%</td>
								<td align="center">과제<br> <input type="hidden" name="scoreCritList[2].scoreCritNm" value="과제" /> <input type="text" id="assign" name="scoreCritList[2].scoreCritRatio" class="w50">%</td>
								<td align="center">출결<br> <input type="hidden" name="scoreCritList[3].scoreCritNm" value="출결" /> <input type="text" id="attend" name="scoreCritList[3].scoreCritRatio" class="w50">%</td>
							</tr>
							<tr>
								<th colspan="2">비고</th>
								<td colspan="4"><input type="text" id="note" name="note" class="w100"></td>
							</tr>
						</tbody>
					</table>
					<div class="scorePer"></div>
				</div>
			</div>
			<!--end tbl-->
		</div>
		
		
		
		<div class="cont-box-inner">
			<div class="tbl-half half64">
				<div class="tbl-wrap">
					<div class="title"><h3>강의 계획</h3></div>
					<table class="tbl tbl-rowGrid">
						<caption></caption>
						<colgroup>
							<col style="width: 280px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">1주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[0].lectWeek" value="1"/>
											<input type="text" id="week1" name="lectWeekList[0].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">2주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[1].lectWeek" value="2"/>
											<input type="text" id="week2" name="lectWeekList[1].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">3주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[2].lectWeek" value="3"/>
											<input type="text" id="week3" name="lectWeekList[2].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">4주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[3].lectWeek" value="4"/>
											<input type="text" id="week4" name="lectWeekList[3].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">5주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[4].lectWeek" value="5"/>
											<input type="text" id="week5" name="lectWeekList[4].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">6주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[5].lectWeek" value="6"/>
											<input type="text" id="week6" name="lectWeekList[5].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">7주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[6].lectWeek" value="7"/>
											<input type="text" id="week7" name="lectWeekList[6].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">8주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[7].lectWeek" value="8"/>
											<input type="text" id="week8" name="lectWeekList[7].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">9주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[8].lectWeek" value="9"/>
											<input type="text" id="week9" name="lectWeekList[8].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">10주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[9].lectWeek" value="10"/>
											<input type="text" id="week10" name="lectWeekList[9].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">11주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[10].lectWeek" value="11"/>
											<input type="text" id="week11" name="lectWeekList[10].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">12주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[11].lectWeek" value="12"/>
											<input type="text" id="week12" name="lectWeekList[11].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">13주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[12].lectWeek" value="13"/>
											<input type="text" id="week13" name="lectWeekList[12].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">14주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[13].lectWeek" value="14"/>
											<input type="text" id="week14" name="lectWeekList[13].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">15주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[14].lectWeek" value="15"/>
											<input type="text" id="week15" name="lectWeekList[14].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">16주차</th>
								<td>
									<div class="display-tbl">
										<div class="display-tblCell">
											<input type="hidden" name="lectWeekList[15].lectWeek" value="16"/>
											<input type="text" id="week16" name="lectWeekList[15].lectWeekly" class="w100">
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="tbl-wrap">
					<div class="title titInfo-wrap">
						<h3>시간표</h3>
						<c:set var="buildList" value="${buildingVO }" />
						<div class="titInfo">
							<select id="selBuild" name="buildingVO.buildId">
								<option>==건물==</option>
							<c:choose>
								<c:when test="${not empty buildList }">
								<c:forEach items="${buildList }" var="build">
									<option value="${build.buildId }">${build.commDesc }</option>
								</c:forEach>
								</c:when>
								<c:otherwise>
									<option value>과목없음</option>
								</c:otherwise>
							</c:choose>
							</select>
							
						
							<select id="selLectRoom" name="lectRoomVO.lectRoomId">
								<option>==강의실==</option>
							</select>
						</div>
					</div>
		    <table class="tbl tbl-schedule" id="table" style="border: 1px solid black;">
	        <thead>
	          <tr>
	            <th scope="col"></th>
	            <th scope="col">월</th>
	            <th scope="col">화</th>
	            <th scope="col">수</th>
	            <th scope="col">목</th>
	            <th scope="col">금</th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr id="1period">
	            <th scope="row" name="1">1교시</th>
	            <td name="MON1" id="월1"></td>
	            <td name="TUE1" id="화1"></td>
	            <td name="WED1" id="수1"></td>
	            <td name="THU1" id="목1"></td>
	            <td name="FRI1" id="금1"></td>
	          </tr>
	          <tr id="2period">
	            <th scope="row" name="2">2교시</th>
	            <td name="MON2" id="월2"></td>
	            <td name="TUE2" id="화2"></td>
	            <td name="WED2" id="수2"></td>
	            <td name="THU2" id="목2"></td>
	            <td name="FRI2" id="금2"></td>
	          </tr>
	          <tr id="3period">
	            <th scope="row" name="3">3교시</th>
	            <td name="MON3" id="월3"></td>
	            <td name="TUE3" id="화3"></td>
	            <td name="WED3" id="수3"></td>
	            <td name="THU3" id="목3"></td>
	            <td name="FRI3" id="금3"></td>
	          </tr>
	          <tr id="4period">
	            <th scope="row" name="4">4교시</th>
	            <td name="MON4" id="월4"></td>
	            <td name="TUE4" id="화4"></td>
	            <td name="WED4" id="수4"></td>
	            <td name="THU4" id="목4"></td>
	            <td name="FRI4" id="금4"></td>
	          </tr>
	            <tr id="5period">
	            <th scope="row" name="5">5교시</th>
	            <td name="MON5" id="월5"></td>
	            <td name="TUE5" id="화5"></td>
	            <td name="WED5" id="수5"></td>
	            <td name="THU5" id="목5"></td>
	            <td name="FRI5" id="금5"></td>
	          </tr>
	          <tr id="6period">
	            <th scope="row" name="6">6교시</th>
	            <td name="MON6" id="월6"></td>
	            <td name="TUE6" id="화6"></td>
	            <td name="WED6" id="수6"></td>
	            <td name="THU6" id="목6"></td>
	            <td name="FRI6" id="금6"></td>
	          </tr>
	          <tr id="7period">
	            <th scope="row" name="7">7교시</th>
	            <td name="MON7" id="월7"></td>
	            <td name="TUE7" id="화7"></td>
	            <td name="WED7" id="수7"></td>
	            <td name="THU7" id="목7"></td>
	            <td name="FRI7" id="금7"></td>
	          </tr>
	          <tr id="8period">
	            <th scope="row" name="8">8교시</th>
	            <td name="MON8" id="월8"></td>
	            <td name="TUE8" id="화8"></td>
	            <td name="WED8" id="수8"></td>
	            <td name="THU8" id="목8"></td>
	            <td name="FRI8" id="금8"></td>
	          </tr>
	          <tr id="9period">
	            <th scope="row" name="9">9교시</th>
	            <td name="MON9" id="월9"></td>
	            <td name="TUE9" id="화9"></td>
	            <td name="WED9" id="수9"></td>
	            <td name="THU9" id="목9"></td>
	            <td name="FRI9" id="금9"></td>
	          </tr>
	        </tbody>
	     </table>
	     </div>
				
			</div>
		</div>	
		

	</div>
		

		<input type="hidden" id='hopeTime' name="hopeTime"/>
		<input type="hidden" id='profId' name="professorVO.profId" value="${profId }" />
	</form>
	</div>
</div>