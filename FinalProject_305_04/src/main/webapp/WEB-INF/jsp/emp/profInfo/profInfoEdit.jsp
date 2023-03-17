<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	#preview {
	  width: 100px;
	  height: 125px;
	  object-fit: cover;
	}
</style>

<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor/ckeditor.js"></script>
<form:form id="updateForm" modelAttribute="profInfo" enctype="multipart/form-data" method="post">
<form:hidden path="profId"/>
<form:hidden path="userId"/>
<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			교수정보관리
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
				<div class="box-btn">
					<form:button type="submit" class="btn btn-success purple">저장</form:button>
				</div>
			</div>


			<!--  "photo-wrap"-->
			<div class="photo-wrap">
			   <div class="photo">
					<div class="photo uploadImg">
<!-- 						기본 사진 -->
<!-- 						<div class="photo-inner"> -->
<!-- 					      	<img id="preview" alt="프로필사진" onclick="popImage(this.src)"> -->
<!-- 					    </div> -->
						<div class="photo-inner">
							<!-- studentInfo.attaFileList : List<AttaFileVO> attaFileList -->
							<c:forEach var="attaFileVO" items="${profInfo.attaFileList}" varStatus="stat">	
								<img src="${pageContext.request.contextPath}${attaFileVO.attaPath}/${attaFileVO.attaFilenm}" id="preview" alt="프로필사진" name="files" onclick="popImage(this.src)">
							</c:forEach>
						</div>
					    
					    
						<div class="filebox">
							 <label for="file1">파일찾기</label> 
						     <input type="file" id="file1" name="files" class="btn upload-hidden" style="background-color:gray">
						</div>
					</div>			   
				</div>

				<div class="tbl-wrap">
					<table class="tbl">
						<caption></caption>
						<colgroup>
							<col style="width: 20%;">
							<col style="width: 20%;">
							<col style="width: 20%;">
							<col style="width: 20%;">
							<col style="width: 20%;">
							<col style="width: 20%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">이름<em class="red-txt asterisk">*</em></th>
								<td>
									<form:input path="userNm" type="text" cssClass="form-control" />
									<form:errors path="userNm" element="span" cssClass="text-danger" />
								</td>
								<th scope="row">영문이름<em class="red-txt asterisk">*</em></th>
								<td>
									<form:input path="userNmEn" type="text" cssClass="form-control" />
									<form:errors path="userNmEn" element="span" cssClass="text-danger" />
								</td>
								
								<th scope="row">주민번호</th>
								<td>
									<div class="flex">
										<form:input path="userRrn1" type="text" cssClass="form-control" class="w10" />
										<span class="cal-dash"></span>
										<form:input path="userRrn2" type="text" cssClass="form-control"  class="w10" />
										<form:errors path="userRrn1" element="span" cssClass="text-danger" />
										<form:errors path="userRrn2" element="span" cssClass="text-danger" />
									</div>
								</td>

							</tr>
							<tr>

								<th scope="row">생년월일</th>
								<td>
									<form:input path="userBir" type="date" cssClass="form-control" />
									<form:errors path="userBir" element="span" cssClass="text-danger" />
								</td>
								<th scope="row">국적</th>
								<td>
									<form:input path="userNtl" type="text" cssClass="form-control" />
									<form:errors path="userNtl" element="span" cssClass="text-danger" />
								</td>
								<th scope="row">성별</th>
								<td>
									<form:input path="userGender" type="text" cssClass="form-control" />
									<form:errors path="userGender" element="span" cssClass="text-danger" />
								</td>

							</tr>
							<tr>
								<th scope="row">우편번호</th>
								<td>
									<form:input path="userPost" type="text" cssClass="form-control" />
									<form:errors path="userPost" element="span" cssClass="text-danger" />
								</td>
								<th scope="row">주소</th>
								<td>
									<form:input path="userAddr" type="text" cssClass="form-control" />
									<form:errors path="userAddr" element="span" cssClass="text-danger" />
								</td>
								<th scope="row">상세주소</th>
								<td>
									<form:input path="userDetailAddr" type="text" cssClass="form-control" />
									<form:errors path="userDetailAddr" element="span" cssClass="text-danger" />
								</td>
								
							</tr>

						</tbody>
					</table>
				</div>
			</div>
			<!--   // "photo-wrap"-->

		</div>
		<!--  // cont-box-inner -->





		<!-- cont-box-inner -->
		<div class="cont-box-inner">
			<div class="title">
				<h3>학적 정보</h3>
<!-- 				<span class="total"><em>1</em>건</span> -->
			</div>
			<!--tbl-->
			<div class="tbl-wrap">
				<table class="tbl center">
					<caption>description about table</caption>
					<colgroup>
						<col style="width: 20%" />
						<col style="width: 20%" />
						<col style="width: 20%" />
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">교번<em class="red-txt asterisk">*</em></th>
							<td>${profInfo.profId }</td>			
							<th scope="row">비밀번호<em class="red-txt asterisk">*</em></th>
							<td>
								<form:input path="userPass" type="text" cssClass="form-control" />
								<form:errors path="userPass" element="span" cssClass="text-danger" />
							</td>			
							
							<th scope="row">건물<em class="red-txt asterisk">*</em></th>
							<c:set var="commList" value="${commVO }" />
							<td>
							<select id="selComm" name="commList.commDesc" class="w100">
								<option value>건물</option>
							<c:choose>
								<c:when test="${not empty commList }">
									<c:forEach items="${commList }" var="commName">
									<option value="${commName.commId }" >${commName.commDesc }</option>
									</c:forEach>
								</c:when>
							</c:choose>
							</select>
							</td>
							
							
							
							
							
						</tr>
						<tr>
							<th scope="row">단과대학<em class="red-txt asterisk">*</em></th>
							<c:set var="collList" value="${collVO }" />
							<td>
							<select id="selColl" name="collVO.collNm" class="w100">
								<option value>단과대학</option>
							<c:choose>
								<c:when test="${not empty collList }">
									<c:forEach items="${collList }" var="callName">
									<option value="${callName.collId }" >${callName.collNm }</option>
									</c:forEach>
								</c:when>
							</c:choose>
							</select>
							</td>
							<th scope="row">학과<em class="red-txt asterisk">*</em></th>
							<td>
								<select id="selMajor" name="majorId" class="w100">
									<option value="${profInfo.majorList.majorId }" selected>${profInfo.majorList.majorNm}</option>
								</select>
							</td>
							<th scope="row">연구실<em class="red-txt asterisk">*</em></th>
							<td>
								<select id="selLabo" name="laboId" class="w100">
									<option value="${profInfo.laboList.laboId }" selected>${profInfo.laboList.buildNum}</option>
								</select>
							</td>


						</tr>
						<tr>
							<th scope="row">연구실 전화</th>
							<td>
								<form:input path="laboList.laboTel" type="text" cssClass="form-control" />
								<form:errors path="laboList.laboTel" element="span" cssClass="text-danger" />
							</td>							
							<th scope="row">연락처</th>
							<td>
								<form:input path="userPhone" type="text" cssClass="form-control" />
								<form:errors path="userPhone" element="span" cssClass="text-danger" />
							</td>					
							
							
							<th scope="row">직책</th>
							<c:set var="posList" value="${commVOPos }" />
							<td>
							<select id="selPos" name="pos" class="w100">
								<option value>직책</option>
							<c:choose>
								<c:when test="${not empty posList }">
									<c:forEach items="${posList }" var="posName">
									<option value="${posName.commId }" selected>${posName.commDesc }</option>
									</c:forEach>
								</c:when>
							</c:choose>
							</select>
							</td>						
									
						</tr>
						<tr>					
							<th scope="row">입사일<em class="red-txt asterisk">*</em></th>
							<td>
								<form:input path="entDate" type="date" cssClass="form-control" />
								<form:errors path="entDate" element="span" cssClass="text-danger" />
							</td>	
							<th scope="row">퇴사일</th>
							<td>
								<form:input path="levDate" type="date" cssClass="form-control" />
								<form:errors path="levDate" element="span" cssClass="text-danger" />
							</td>			
							<th scope="row">이메일<em class="red-txt asterisk">*</em></th>
							<td>
								<form:input path="userEmail" type="text" cssClass="form-control" />
								<form:errors path="userEmail" element="span" cssClass="text-danger" />
							</td>	
						</tr>			
						<tr>
							<th scope="row">은행</th>
							<td>
								<form:input path="userBank" type="text" cssClass="form-control" />
								<form:errors path="userBank" element="span" cssClass="text-danger" />
							</td>
							<th scope="row">예금주</th>
							<td>
								<form:input path="userAcctHd" type="text" cssClass="form-control" />
								<form:errors path="userAcctHd" element="span" cssClass="text-danger" />
							</td>
							<th scope="row">계좌번호</th>
							<td>
								<form:input path="userAcctNo" type="text" cssClass="form-control" />
								<form:errors path="userAcctNo" element="span" cssClass="text-danger" />
							</td>	
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

	//다음 우편번호 검색
	function openHomeSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=userPost]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=userAddr]').val(data.address);
				$('[name=userDetailAddr]').val(data.buildingName);
			}
		}).open();
	}


	// 단과, 학과 셀렉트박스 변경
	$("#selColl").on("change", function(){
		let selColl = $(this).val(); //선택값을 selColl에 저장한다.
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
				$.each(result,function(index, majorList){
					console.log(majorList.majorNm)
					let option = $("<option>").attr({value:majorList.majorId}).html(majorList.majorNm)
								.prop("selected","${profInfo.majorId}"==majorList.majorId);
					$("#selMajor").append(option);
				});
			}
		});
	}).val("${profInfo.collList.collId}");
	// 단과, 학과 셀렉트박스 변경 끝
	
	
	// 건물 연구실 셀렉트박스 변경
	$("#selComm").on("change", function(){
		let selComm = $(this).val(); //선택값을 selComm에 저장한다.
		let data = {"commId":selComm}; //json방식으로 하기 위해 이걸 적어줌.
		
		//selComm:CA10001
		console.log("selComm:" + selComm);
		//{"commId":"CA10001"}
		console.log("data : " + JSON.stringify(data));
		
		//*** 시큐리티 사용 시 token처리 필요
		$.ajax({
			url:"${pageContext.request.contextPath}/emp/selectBuildingNumList",
			contentType:"application/json;charset=UTF-8",
			data:JSON.stringify(data), //마샬링, 직렬화
			dataType:"json",
			type:"post",
			success:function(result){
				console.log("result : " + JSON.stringify(result));
				$("#selLabo").html("");//초기화
				$("#selLabo").append("<option value>" + "호실선택" + "</option>");
				$.each(result,function(index, laboList){
					console.log(laboList.buildNum);
					let option = $("<option>").attr({value:laboList.laboId}).html(laboList.buildNum)
								.prop("selected","${profInfo.laboList.laboId}"==laboList.laboId);
					$("#selLabo").append(option);
				});
			}
		});
	}).val("${profInfo.commList.commId}");
	// 건물 연구실 셀렉트박스 변경
	
	

	//form:form의 아이디
	let updateForm = $("#updateForm");
	
	
	
	
	
	//---------------------------------------------------------------------------------------------------------

	//첨부파일

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














