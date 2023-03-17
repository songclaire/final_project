<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
	#preview {
	  width: 100px;
	  height: 125px;
	  object-fit: cover;
	}
</style>
<script>
/* 자동채우기 */
function f_autoFill(){
//    $("input:radio[name='consMeet']:radio[value='OFFLINE']").prop('checked', true); // 선택하기
//    $("input:radio[name='consCat']:radio[value='CONS5']").prop('checked', true); // 선택하기
//    $("#selProfs").val("3120001").prop('selected', true); // 선택하기
   
//    var x = new Date(2023, 2, 20, 14, 0, 0);
//     $(".userNm").datepicker("setDate", x);
//     $(".timepicker").timepicker("setTime", x);
//alert("pppp");

   $('input[name=userNm]').val("송지은"); 
   $('input[name=userNmEn]').val("Song Jieun"); 
   $('input[name=userRrn1]').val("123456"); 
   $('input[name=userRrn2]').val("1234567"); 
   $('input[name=userBir]').val("1992-11-02"); 
   $('input[name=userNtl]').val("SOUTH KOREA"); 
   $('input[name=userBir]').val("1992-11-02"); 
   $('input[name=userGender]').val("F"); 
   $('input[name=userPost]').val("15416"); 
   $('input[name=userAddr]').val("용두동 98-4"); 
   $('input[name=userDetailAddr]').val("정은빌 101동"); 
   $('input[name=userId]').val("20110205"); 
   $('input[name=userPass]').val("java"); 
   $('input[name=recordList\\[0\\]\\.camYear]').val("1");
   
   $('input[name=entDate]').val("2023-03-06"); 
   
   //학적상태
   const myRec = document.getElementById("recNm");
   const myButton = document.getElementById("autoBtn");
   myButton.addEventListener("click", () => {
	   // 첫번째 option 선택
	   myRec.selectedIndex = 0;
   });
   
//    //학사년도
   const selSeme = document.getElementById("selSeme");
   myButton.addEventListener("click", () => {
	   // 첫번째 option 선택
	   selSeme.value="2023";
   });
   
   $('input[name=recordList\\[0\\]\\.recUpdate]').val("2019-02-01"); 
   $('input[name=semeId]').val("2023").prop('selected', true); //학사년도
   $('input[name=userPhone]').val("01015947562"); 
   $('input[name=userEmail]').val("dajae@naver.com"); 
   $('input[name=userBank]').val("농협"); 
   $('input[name=userAcctHd]').val("송지은"); 
   $('input[name=userAcctNo]').val("154975-15-754012"); 
   
   
//    $("textarea[name='consCont']").html("교수님 안녕하세요. 컴퓨터공학과 민학생입니다. 다름이 아니라 오늘 OOO 강의를 결석했는데요.. 제가 교통사고가 났거든요.. 혹시 진단서 제출하면 공결처리 가능할까요?"); // 선택하기
}
</script>

<!-- 카카오 주소 API -->
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!-- 카카오 주소 API -->

<form:form modelAttribute="studentInfo" enctype="multipart/form-data" method="post">

<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			학생정보관리
			<button type="button" class="star on">
				<span class="sr-only">즐겨찾기</span>
			</button>
		</h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i><strong>학생관리</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">



		<!-- cont-box-inner -->
		<div class="cont-box-inner">

			<div class="title">
				<h3>개인 정보</h3>
				<div class="title">
					<div class="box-btn">
						<button id="autoBtn" type="button" class="btn default" onclick="f_autoFill()">자동완성</button>
						<form:button type="submit" class="btn purple">등록</form:button>
					</div>
				</div>				
			</div>				


			<div class="photo-wrap">
				<!--  "photo-wrap"-->
				
			   <div class="photo uploadImg">
			      <div class="photo-inner">
			      	  <img id="preview" alt="프로필사진" onclick="popImage(this.src)">
			      </div>
				  <div class="filebox">
				   <label for="file1">파일찾기</label> 
				      <input type="file" id="file1" name="files" class="btn upload-hidden" style="background-color:gray">
				  </div>
			   </div>
				

				<div class="tbl-wrap">
					<table class="tbl">
						<caption></caption>
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 20%;">
							<col style="width: 10%;">
							<col style="width: 20%;">
							<col style="width: 10%;">
							<col style="width: 20%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">이름<em class="red-txt asterisk">*</em></th>
								<td><form:input path="userNm" name="userNm" type="text" cssClass="w100"  />
						        <form:errors path="userNm" element="span" cssClass="text-danger" /></td>
								<th scope="row">영문이름<em class="red-txt asterisk">*</em></th>
								<td><form:input path="userNmEn" type="text" cssClass="w100"  />
						        <form:errors path="userNmEn" element="span" cssClass="text-danger" /></td>
						        
								<th scope="row">주민번호</th>
								<td>
									<div class="flex">
										<form:input path="userRrn1" type="text" class="w50" />
										<span class="cal-dash"></span>
										<form:input path="userRrn2" type="text" class="w50" />
										<form:errors path="userRrn1" element="span" cssClass="text-danger" />
										<form:errors path="userRrn2" element="span" cssClass="text-danger" />
									</div>
								</td>
						        
							
							<tr>
								<th scope="row">생년월일</th>
								<td><form:input path="userBir" type="date" cssClass="w100"  />
						        <form:errors path="userBir" element="span" cssClass="text-danger" /></td>
								<th scope="row">국적</th>
								<td><form:input path="userNtl" type="text" cssClass="w100"  />
						        <form:errors path="userNtl" element="span" cssClass="text-danger" /></td>
								<th scope="row">성별</th>
								<td><form:input path="userGender" type="text" cssClass="w100"  />
						        <form:errors path="userGender" element="span" cssClass="text-danger" /></td>
								
							</tr>
							<tr>
								<th scope="row">우편번호</th>
								<td>
	                            <div class="search-wrap flex">
	                                <input id="sample6_postcode" name="userPost" type="text" value="" >
	                                <button type="button" class="btn btn-line x-small" onclick="openHomeSearch()"> <i class="bi bi-search"><span class="sr-only">검색</span></i></button>
							        <form:errors path="userPost" element="span" cssClass="text-danger" />
                                </div>
                                </td>
						        
								<th scope="row">주소</th>
								<td><form:input path="userAddr" type="text" id="sample6_address" cssClass="w100" name="addr2" />
						        <form:errors path="userAddr" element="span" cssClass="text-danger" /></td>
						        
								<th scope="row">상세주소</th>
								<td><form:input path="userDetailAddr" type="text" id="sample6_detailAddress" cssClass="w100" name="addr3" />
						        <form:errors path="userDetailAddr" element="span" cssClass="text-danger" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<!--  // cont-box-inner -->



		<!-- cont-box-inner -->
		<div class="cont-box-inner">
			<div class="title">
				<h3>학적 상세정보</h3>
<!-- 				<span class="total"><em>1</em>건</span> -->
			</div>
			<!--tbl-->
			<div class="tbl-wrap">
				<table class="tbl center">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 20%;">
						<col style="width: 10%;">
						<col style="width: 20%;">
						<col style="width: 10%;">
						<col style="width: 20%;">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">학번<em class="red-txt asterisk">*</em></th>
							<td><form:input path="userId" type="text" cssClass="w100"  />
					        <form:errors path="userId" element="span" cssClass="text-danger" /></td>
					        <th scope="row">비밀번호<em class="red-txt asterisk">*</em></th>
							<td><form:input path="userPass" type="password" cssClass="w100"  />	
							<form:errors path="userPass" element="span" cssClass="text-danger" /></td>
					        <th scope="row">학년<em class="red-txt asterisk">*</em></th>
							<td><form:input path="recordList[0].camYear" type="text" cssClass="w100"  />	
							<form:errors path="recordList[0].camYear" element="span" cssClass="text-danger" /></td>
						</tr>
						<tr>
							<th scope="row" class="w100">단과대학<em class="red-txt asterisk">*</em></th>
							<c:set var="collList" value="${collVO }" />
							<td>
							<select id="selColl" class="w100">
								<option value>단과대학</option>
							<c:choose>
								<c:when test="${not empty collList }">
									<c:forEach items="${collList }" var="callName">
									<option value="${callName.collId }">${callName.collNm }</option>
									</c:forEach>
								</c:when>
							</c:choose>
							</select>
							</td>
							
							<th scope="row">학과<em class="red-txt asterisk">*</em></th>
							<td>
								<select id="selMajor" name="majorId" class="w100">
									<option value>학과</option>
								</select>
							</td>
							
							<th scope="row">학과교수<em class="red-txt asterisk">*</em></th>
							<td>
								<select id="selPro" name="profId" class="w100">
									<option value>담당교수</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">입학일<em class="red-txt asterisk">*</em></th>
							<td><form:input path="entDate" type="date" cssClass="w100" />
					        <form:errors path="entDate" element="span" cssClass="text-danger" /></td>
					        
							<th scope="row">학적상태<em class="red-txt asterisk">*</em></th>
							<td>
								<select id="recNm" name="recordList[0].recNm" class="w100">
									<option>선택</option>
									<option value="ENT">입학</option>
									<option value="ENT">편입</option>
									<option value="GRD">졸업</option>
									<option value="CHG">전과</option>
									<option value="CMP">수료</option>
									<option value="LEA">휴학</option>
									<option value="NXT">진급</option>
									<option value="PRE">재학</option>
									<option value="RET">복학</option>
									<option value="DRP">자퇴</option>
								</select>
							</td>
					        
<%-- 							<td><form:input path="recordList[0].recNm" type="text" cssClass="form-control"  /> --%>
							<th scope="row">최종변동일자<em class="red-txt asterisk">*</em></th>
							<td><form:input path="recordList[0].recUpdate" type="date" cssClass="w100"  />
					        <form:errors path="recordList[0].recUpdate" element="span" cssClass="text-danger" /></td>
						</tr>
						<tr>
							<th scope="row">학사년도<em class="red-txt asterisk">*</em></th>
							
							<c:set var="semeList" value="${semesterVO }" />
							<td>
							<select id="selSeme" name="semeId" class="w100">
								<option value>학사년도</option>
							<c:choose>
								<c:when test="${not empty semeList }">
									<c:forEach items="${semeList }" var="semeName">
									<option value="${semeName.semeId }">${semeName.semeYear } / ${semeName.seme }학기</option>
									</c:forEach>
								</c:when>
							</c:choose>
							</select>
							</td>
							<th scope="row">연락처</th>
							<td><form:input path="userPhone" type="text" cssClass="w100"  />
					        <form:errors path="userPhone" element="span" cssClass="text-danger" /></td>
							<th scope="row">이메일<em class="red-txt asterisk">*</em></th>
							<td><form:input path="userEmail" type="text" cssClass="w100"/>
					        <form:errors path="userEmail" element="span" cssClass="text-danger"/></td>
						</tr>
						<tr>
							<th scope="row">은행</th>
							<td><form:input path="userBank" type="text" cssClass="w100"  />
							<form:errors path="userBank" element="span" cssClass="text-danger" /></td>
							<th scope="row">예금주</th>
							<td><form:input path="userAcctHd" type="text" cssClass="w100"  />
					        <form:errors path="userAcctHd" element="span" cssClass="text-danger" /></td>
							<th scope="row">계좌번호</th>
							<td><form:input path="userAcctNo" type="text" cssClass="w100"  />
					        <form:errors path="userAcctNo" element="span" cssClass="text-danger" /></td>
						</tr>
						
					</tbody>

				</table>
			</div>
			<!--end tbl-->

		</div>
	</div>
<!--   // "전체-wrap"-->
</div>
</form:form>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>



<script>

	// 단과, 학과 셀렉트박스 변경
	$("#selColl").on("change", function(){
		let selColl = $(this).val(); //선택값을 selColl에 저장한다.
		console.log(selColl);
		let data = {"collId":selColl}; //json방식으로 하기 위해 이걸 적어줌.
		
		//*** 시큐리티 사용 시 token처리 필요
		$.ajax({
			url:"${pageContext.request.contextPath}/emp/selectMajorList",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify(data), //마샬링, 직렬화
			dataType:"json",
			type:"post",
			success:function(result){
				$("#selMajor").html("");//초기화
				$("#selMajor").append("<option value>" + "학과선택" + "</option>");
				$.each(result,function(index, majorVO){
// 					console.log("lectRoomId : " + lectRoomVO.lectRoomId + ", roomNum : " + lectRoomVO.roomNum);
					console.log("majorVO: " + majorVO);
					$("#selMajor").append("<option value='"+majorVO.majorId+"'>" + majorVO.majorNm + "</option>");
				});
			}
		});
	});
	// 단과, 학과 셀렉트박스 변경 끝

	
	
	// 학과, 교수 셀렉트박스 변경
	$("#selMajor").on("change", function(){
		let selMajor = $(this).val(); //선택값을 selColl에 저장한다.
		console.log(selMajor);
		let data = {"majorId":selMajor}; //json방식으로 하기 위해 이걸 적어줌.
		
		//*** 시큐리티 사용 시 token처리 필요
		$.ajax({
			url:"${pageContext.request.contextPath}/emp/selectProfList",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify(data), //마샬링, 직렬화
			dataType:"json",
			type:"post",
			success:function(result){
				//result : [{"rnum":0,"profId":3120001,"laboId":"CB10001","majorId":"EE10023"
					//,"entDate":"20200105","levDate":null,"pos":"학과장","usrList":null,"recordList":null}]
				console.log("result : " + JSON.stringify(result));
				$("#selPro").html("");//초기화
				$.each(result,function(index, professorVO){
					$("#selPro").append("<option value='"+professorVO.profId+"'>" + professorVO.userNm + "</option>");
				});
			}
		});
	});
	// 학과, 교수 셀렉트박스 변경 끝

	
	
	
	
	
	
// 다음 우편번호 검색
function openHomeSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=userPost]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=userAddr]').val(data.address);
			$('[name=userDetailAddr]').val(data.buildingName);
		}
	}).open();
}
	
	
	
	
//--------------------------------------------------------------------------------------	
//파일첨부
	
$(document).ready(function(){
    //파일첨부 이벤트
    $('.filebox .upload-hidden').on('change', function(){           
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
            if(!validFileType(filename)){
                alert("허용하지 않는 확장자 파일입니다.");
                return false;
            }else{
                if(!validFileSize($(this)[0].files[0])){
                    alert("파일 사이즈가 10MB를 초과합니다.");
                    return false;
                }else{
                    if(!validFileNameSize(filename)){
                        alert("파일명이 30자를 초과합니다.");
                        return false;
                    }
                }
            }
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        $(this).prev().val(filename); //input upload-name 에 파일명 설정해주기

        readImage($(this)[0]); //미리보기
    });
});

function validFileType(filename) {
    const fileTypes = ["png", "jpg", "jpeg"];
   return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase()) >= 0;
}

function validFileSize(file){
    if(file.size > 10000000){ //10MB
        return false;
    }else{
        return true;
    }
}

function validFileNameSize(filename){
    if(filename.length > 100){ //30자
        return false;
    }else{
        return true;
    }
}

//이미지 띄우기
function readImage(input) {
    if(input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e){
            const previewImage = document.getElementById("preview");
            previewImage.src = e.target.result;
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0]);
    }
}

//이미지 원본 팝업 띄우기
function popImage(url) {
    var img = new Image();
    img.src = url;
    var img_width = img.width;
    var win_width = img.width + 25;
    var img_height = img.height;
    var win = img.height + 30;
    var popup = window.open('', '_blank', 'width=' + img_width + ', height=' + img_height + ', menubars=no, scrollbars=auto');
    popup.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
}
</script>
	











