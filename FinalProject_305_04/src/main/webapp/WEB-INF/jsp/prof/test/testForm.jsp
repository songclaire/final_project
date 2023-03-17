<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />


<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
		<h2>
			시험
			<button type="button" class="star">
				<span class="sr-only">즐겨찾기</span>
			</button>
		</h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i> <strong>시험</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->


	<!-- white-box -->
	<div class="white-box">
	
	
		<div class="tob-box">
				<strong class="tit">시험 제출자 안내사항 </strong>	
				<ul>
					<li><p>1) 반드시 기간을 먼저 설정한 후, 퀴즈를 등록하는 것을 권장합니다.</p>
						<p>- 시험기간 미설정시, 등록 직후 바로 시험에 응시 가능합니다.</p>
						<p>- <span class="red-txt">기간을 설정하지 않고 문제를 등록하여 문제 유출이 되는 경우가 종종 발생합니다.</span></p>
					</li>
					<li>
						<p>2) 시험은 한 문항당 4지선다방식으로 등록할 수 있습니다.</p>
						<p>- 정답란에는 1~4까지의 숫자만 입력이 가능합니다.</p>
					</li>
					<li>
						<p>3) 시험 생성 시 문제 개수는 최대 10문제로 설정할 수 있습니다.</p>
						<p>- 하단의 +버튼과 문제의 -버튼을 통해 문항 수를 제어할 수 있습니다.</p>
					</li>
					<li>
						<p>4) 문제 배점 및 자동 평가에 대한 안내</p>
						<p> - 문제 갯수에따라 배점이 달라지며, 수강생이 제출을 완료하면 자동채점됩니다. 총점은 백분율로 계산하여 보여집니다.</p> 
					</li>
				</ul>
		</div>
	
	


		<button type="button" class="btn default mb10" onclick="f_autoFill2222()">테스트 자동완성</button>
		<button type="button" class="btn default mb10" onclick="f_autoFill()">자동완성</button>
		<form id="frm" action="${pageContext.request.contextPath }/prof/test/testForm?profId=${testVO.profId }" method="post">
			<input type="hidden" name="examId" value="${testVO.examId }" />
			<input type="hidden" name="queType" value="객관식" />
			<input type="hidden" name="testAnsw"  id="answer" /> <!-- 정답모아서 한꺼번에 testVO mun에 넘기기  -->
		
		<!-- 학번, 학생명, 강의코드, 강의명, 중간기말구분 -->
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
						<th scope="row">강의명</th>
						<td colspan="3">
							<c:set var="lectrueList" value="${lectureVO}" />
							<select id="selectLecture" name="lectId">
								<option>===전체===</option>
								
								<c:choose>
									<c:when test="${not empty lectrueList}">
										<c:forEach items="${lectrueList }" var="lecture">
											<option value="${lecture.lectId }">${lecture.lectNm }</option>
										</c:forEach>
									</c:when>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">시험제목</th>
						<td><input type="text" name="testNm" class="w100" /></td>
						<th scope="row">시험일</th>
						<td><input type="date" name="testDate" class="w100" /></td>
					</tr>
					<tr>
						<th scope="row">시험시작시간</th>
						<td><input type="time" name="testStime" class="w100" /></td>
						<th scope="row">시험종료시간</th>
						<td><input type="time" name="testEtime" class="w100" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="cont-box-inner">
			<ul class="question-wrap" id="test">
				<li id="area1">
				
					<!--  rc-wrap-->
					<!-- <div class="btn-toggle">
						<button type="button" name="queType" value="객관식" class="typeBtn objBtn on">객관식</button>
						<button type="button" name="queType" class="typeBtn sbjBtn">주관식</button>
					</div> -->
					<!--   // rc-wrap-->
				
					<div class="question">
						<span class="num"><input type="number" class="inputNum" name="queList[0].testNum" value="1" /></span> 
						<input type="text" name="queList[0].testQue" value="" class="testQue  w100 txtQuestion" placeholder="문제를 입력해주세요" />
						<button onclick="f_remove(this)" class="btn primary btnMinus">X</button>
					</div>
					<div class="psgn-container">
						<ul class='psgn'>
							<li class="items">
								 <input type="radio" id="mun1" name="mun1" value="1" />
								 <label for="mun1">
								 	<input type="text" name="testPasg" class="w100 txtPasg testPasg0" id="testPasg">
								 </label>
								 
						 	</li>
						 	<li class="items">
								 <input type="radio" id="mun2" name="mun1" value="2" />
								 <label for="mun2">
								 	<input type="text" name="testPasg" class="w100 txtPasg testPasg1" id="testPasg"  >
								 </label>
						 	</li>
						 	<li class="items">
								 <input type="radio" id="mun3" name="mun1" value="3" />
								 <label for="mun3">
								 	<input type="text" name="testPasg" class="w100 txtPasg testPasg3" id="testPasg"  >
								 </label>
						 	</li>
						 	<li class="items">
								 <input type="radio" id="mun4" name="mun1" value="4" />
								 <label for="mun4">
								 	<input type="text" name="testPasg" class="w100 txtPasg testPasg4" id="testPasg"  >
								 </label>
						 	</li>
						 </ul>
					</div>
	
				</li>
			</ul>
			<button type="button" onclick="f_add(this)" id="btnPlus" class="btn purple btnPlus">문제추가+</button>
			
			<div class="title">
				<div class="box-btn">
					<a href="" class="btn default">목록</a>
					<a href="" class="btn red">취소</a>
					<button type="submit" id="btnSubmit" class="btn purple">등록</button>
				</div>
			</div>
		</div>
		<security:csrfInput />
		</form>

</div>
</div>



<script>
	// 초기 객관식 지문 세팅 
	typeBtnClick();
	$(()=>{
		$(".objBtn").trigger("click");
	}) 

	
	//+버튼 클릭시 문제 번호 1씩 자동증가 
	$("#btnPlus").on("click", function(){
		$(".inputNum").each(function(index, item){
			$(this).attr('value',index+1);
		});	
	}); 
	
	//객관식 주관식 버튼 클릭 
	//객관식 
	function psgn_obj(thisObj) {
		let cnt = 0;
		//alert("체크")
		//console.log("objObj", thisObj);
		$(thisObj).parent().parent().children(".psgn-container").html("<ul class='psgn'>");

		//$(".psgn-container").html("<ul class='psgn'>");
	 	for (var i = 0; i < 4; i++) {
			liTags = `<li class="items">
						 <input type="radio" id="mun\${i+1}" name="mun1">
						 <label for="mun\${i+1}"> 
						 	<input type="text" name="testPasg" class="w100 txtPasg testPasgAdd\${i+1}" id="testPasg\${i}"  >
						 </label>
					 </li> `
			//$(".psgn").append(liTags);
			$(thisObj).parent().parent().children(".psgn-container").children(".psgn").append(liTags);
		}
	}
	//주관식
	function psgn_sbj(thisObj) {
		//console.log("subObj", thisObj);
		
		liTags = `<div class="textarea-wrap"><textarea class="w100"></textarea></div>`
		//$(".psgn-container").html(liTags);
		$(thisObj).parent().parent().children(".psgn-container").html(liTags);
	}
	//psgn_obj();	
	
	//객관식 주관식 클릭이벤트 
	function typeBtnClick() {
		$(".typeBtn").on("click", function(){

			if(!$(this).hasClass("on")) {
				$(this).addClass("on");
				$(this).siblings().removeClass("on");
			}

			let objBtn = $(".objBtn");
			let sbjBtn = $(".sbjBtn");
			let liTags;
			//지문 객관식일경우
			if(objBtn.hasClass('on')) {
				psgn_obj($(this));
			} 
			//지문 주관식일경우
			if(sbjBtn.hasClass("on")) {
				psgn_sbj($(this));
			}
		});
	}
	//typeBtnClick();

	// + , - 문제 개수 추가 삭제 
	const smTest = document.querySelector("#test");
	const smArea = document.querySelector("#area1");
	const psgnContainer = document.querySelector(".psgn-container");
	let nameCnt = 2;
	let idCnt = 2;
	
	
	
	
	
	function f_remove(p_this){// 안보이게 할 건지, 진짜로 지울건지
		//console.log("확인",p_this.parentNode.parentNode);
		smTest.removeChild(p_this.parentNode.parentNode); //remove 보다는 removeChild가 좋음(가독성도 좋음, 구조가 보이니까)
		//smTest.removeChild(p_this.parentElement); //remove 보다는 removeChild가 좋음(가독성도 좋음, 구조가 보이니까)
	}
	
	//문제 및 지문 추가
	function f_add(p_this) {
		
		let another = smArea.cloneNode(true); //자식까지 전체 복사
		//console.log("inputRadios", inputRadios);
		//console.log("inputLabels", inputLabels);
		
		another.id = "area" + nameCnt;
		
		let inputRadios = another.querySelectorAll("input[type=radio]"); 
		let inputLabels = another.querySelectorAll("label");
		let inputTxt = another.querySelectorAll("input[type=text]");
		
		for (let i = 0;i < inputRadios.length; i++) {
			inputTxt[i].value = '';
			
			inputRadios[i].name = "mun" + nameCnt;
			inputRadios[i].id = "mun" + nameCnt + (i + 1);
			//another.children[i].children[i].name = "mun" + nameCnt;
			inputLabels[i].setAttribute("for", "mun" + nameCnt + (i + 1));
			//console.log(inputLabels[i].getAttribute("for"));	
		}
		
	
		
		smTest.appendChild(another); //문서에 추가
		nameCnt++;
		
		//객관식 주관식 클릭이벤트
		typeBtnClick();
		
		//문제 name값 정리
		$(".txtQuestion").each(function(index,item){
			$(this).attr("name","queList["+index+"].testQue");
		});
		
		//보기 name값 정리
		// 0 1 2 3 => 0
		// 4 5 6 7 => 1
		// 8 9 10 11 => 2
		$(".txtPasg").each(function(index,item){
			//몫 구하기
			let i = parseInt(index / 4);
			//나머지 구하기
			let j = index % 4;
			
			$(this).attr("name","queList["+i+"].pasgList["+j+"].testPasg");
		});
		
		
		//input radio 답지 체크 
		let data = [];
		 $(".items").each(function(index, item){
				$("input[name='mun"+ index +"']").change(function(e){
					//지문 중 정답만 골라서 넣기 
// 					let answers = $(this).attr('id');
					let answers = $(this).val();
					data.push(answers);
					console.log(JSON.stringify(data));
					
					//지문중 정답 저장 
					$("input[name=testAnsw]").attr("value",data);
					let valueAnswer = $('#answer').val().split(' ');
					//$("input[type=radio]:checked").siblings("label").find("input[name=testAnsw]").attr("value", "Y");
				});
				
				
		}); 
	}

	
	
	
	
	// 	$("#area"+i).filter("item")
	//등록버튼 클릭시 
	$("#btnSubmit").on("click", function() {
		let testVO = {};
	    testVO.queList = []; //문제 
	    
		//문제  + 번호 
		$(".inputNum").each(function(index, item){
			console.log($(this).attr("id", "num"+index));
			
			let inputQue = $(this).parent().siblings().eq(0);
			console.log(inputQue.attr("id","que"+index));
			
		    let queNum = $(item).val(); //문제번호
		    let testQue = $("#que"+index).val(); //문제
		    let tq = {
		    	"testNum":queNum,	
		    };
			console.log("==QN",queNum);
			console.log("==QQ",testQue);
		    
		    tq["testQue"]=testQue;
		    testVO.queList.push(tq);
		    
		    //지문
		    testVO.queList[index].pasgList = []; 
		    let pasg = {
		    	"queType" : queType
		    }
		    pasg[queType]=queType;
		    testVO.queList.pasgList.push(pasg);
		    console.log(testVO.queList.pasgList);
		});	
	    

	  	
		$(".items").each(function(idx, item){
			console.log(item);
			//console.log($(".psgn").attr("id", "psgn"+idx));
			//console.log($(item).find("input[name=testPasg]").val());
			let testPasg = $("#testPasg"+idx).val(); //지문 (11)
// 			let tp = {
// 					"testPasg" : testPasg
// 			};
			
			tp["testPasg"] = testPasg; //지문 (11)
			testVO.queList[idx].pasgList.push(tp);
			console.log(testVO);
			
		});
		//console.log(testVO);
		
	    testVO["testNm"]=$("input[name=testNm]").val();//시험 제목 
	    testVO["testRdate"]=$("input[name=testDate]").val();//시험일
	    testVO["testStime"]=$("input[name=testStime]").val();// 시험 시작시간
	    testVO["testEtime"]=$("input[name=testEtime]").val();// 시험 종료시간 
	    testVO["lectNm"]=$("#selectLecture option:selected").val();	//강의명
	    testVO["queType"]=$(".typeBtn.on").text(); //고사구분
	    testVO["testAnsw"]=$("input[name=testAnsw]").val();
	    
	    
	    
	   
	    
		//*******
	    $("#frm").submit();

		return false; 
	});

	
	
	
	
	
	/* 자동채우기 */
	function f_autoFill(){
		$("#selectLecture").val("DI10016").prop('selected', true); // 선택하기
		$("input[name='testNm']").val("컴퓨터 공학 중간고사"); // 선택하기
		$("input[type='date']").val("2023-03-03"); // 선택하기
		$("input[type='time']").val("오후 02:00"); // 선택하기
		$("input[name='testStime']").val("14:00"); // 선택하기
		$("input[name='testEtime']").val("15:00"); // 선택하기
		//$(".datepicker").datepicker("setDate", x);
		

		// 문제 1번
		$("input[name='queList[" + 0 + "].testQue']").val("하나의 완전한 컴퓨터 시스템을 구성하는 4가지 요소와 거리가 먼 것은?");
		// 지문 1~4
		$("input[name='queList[" + 0 + "].pasgList[" + 0 + "].testPasg']").val("사용자"); 
		$("input[name='queList[" + 0 + "].pasgList[" + 1 + "].testPasg']").val("인터넷");   /////////// 답
		$("input[name='queList[" + 0 + "].pasgList[" + 2 + "].testPasg']").val("소프트웨어"); 
		$("input[name='queList[" + 0 + "].pasgList[" + 3 + "].testPasg']").val("데이터");
		// 답 선택하기
		 $("input:radio[id='mun2']:radio[value='2']").prop('checked', true);
		//=======================================================================================================
		// 문제 2번
		$("input[name='queList[" + 1 + "].testQue']").val("네트워크 장비 중 라우터(router) 구현을 위한 TCP/IP 프로토콜 계층으로 가장 옳은 것은?");
		// 지문 1~4
		$("input[name='queList[" + 1 + "].pasgList[" + 0 + "].testPasg']").val("네트워크 접속계층"); 
		$("input[name='queList[" + 1 + "].pasgList[" + 1 + "].testPasg']").val("인터넷계층");  /////////// 답
		$("input[name='queList[" + 1 + "].pasgList[" + 2 + "].testPasg']").val("전송계층"); 
		$("input[name='queList[" + 1 + "].pasgList[" + 3 + "].testPasg']").val("응용계층"); 
		// 답 선택하기
		 $("input:radio[id='mun22']:radio[value='2']").prop('checked', true);
		//=======================================================================================================
		// 문제 3번
		$("input[name='queList[" + 2 + "].testQue']").val("ISO 25010 표준에서 요구하는 주요 품질 특성으로 가장 옳지 않은 것은?");
		// 지문 1~4
		$("input[name='queList[" + 2 + "].pasgList[" + 0 + "].testPasg']").val("기능 적합성"); 
		$("input[name='queList[" + 2 + "].pasgList[" + 1 + "].testPasg']").val("신뢰성"); 
		$("input[name='queList[" + 2 + "].pasgList[" + 2 + "].testPasg']").val("내구성"); /////////// 답
		$("input[name='queList[" + 2 + "].pasgList[" + 3 + "].testPasg']").val("성능 효율성"); 
		// 답 선택하기
		 $("input:radio[id='mun33']:radio[value='3']").prop('checked', true);
		//=======================================================================================================
		// 문제 4번
		$("input[name='queList[" + 3 + "].testQue']").val("프로그램에서 사용하는 변수의 종류에 따라 할당되는 메모리 공간에 대한 것으로 가장 옳지 않게 짝지어진 것은?");
		// 지문 1~4
		$("input[name='queList[" + 3 + "].pasgList[" + 0 + "].testPasg']").val("[변수]전역변수      --- [메모리공간]데이터영역"); 
		$("input[name='queList[" + 3 + "].pasgList[" + 1 + "].testPasg']").val("[변수]지역변수      --- [메모리공간]스택영역"); 
		$("input[name='queList[" + 3 + "].pasgList[" + 2 + "].testPasg']").val("[변수]동적변수      --- [메모리공간]힙영역"); 
		$("input[name='queList[" + 3 + "].pasgList[" + 3 + "].testPasg']").val("[변수]함수형식인자 --- [메모리공간]데이터영역");  /////////// 답
		// 답 선택하기
		 $("input:radio[id='mun44']:radio[value='4']").prop('checked', true);
		//=======================================================================================================
		// 문제 5번
		$("input[name='queList[" + 4 + "].testQue']").val("프로그래밍 언어에 대한 설명으로 가장 옳지 않은 것은?");
		// 지문 1~4
		$("input[name='queList[" + 4 + "].pasgList[" + 0 + "].testPasg']").val("Objective-C, Java, C#은 객체 지향 언어이다."); 
		$("input[name='queList[" + 4 + "].pasgList[" + 1 + "].testPasg']").val("Python은 정적 타이핑을 지원하는 컴파일러 방식의 언어이다.");  /////////// 답
		$("input[name='queList[" + 4 + "].pasgList[" + 2 + "].testPasg']").val("ASP, JSP, PHP는 서버 측에서 실행하는 스크립트 언어이다."); 
		$("input[name='queList[" + 4 + "].pasgList[" + 3 + "].testPasg']").val("XML은 전자문서를 표현하는 확장 가능한 마크업 언어이다."); 
		// 답 선택하기
		 $("input:radio[id='mun52']:radio[value='2']").prop('checked', true);
	   $("#answer").val("2,2,3,4,2");
	}


	/* 테스트 자동채우기 */
	function f_autoFill2222(){
		$("#selectLecture").val("DI10004").prop('selected', true); // 선택하기
		$("input[name='testNm']").val("정보와 보안 기말고사"); // 선택하기
		$("input[type='date']").val("2023-03-03"); // 선택하기
		$("input[type='time']").val("오후 02:00"); // 선택하기
		$("input[name='testStime']").val("14:00"); // 선택하기
		$("input[name='testEtime']").val("15:00"); // 선택하기
		//$(".datepicker").datepicker("setDate", x);
		

		// 문제 1번
		$("input[name='queList[" + 0 + "].testQue']").val("UI의 설계 지침으로 틀린 것은?");
		// 지문 1~4
		$("input[name='queList[" + 0 + "].pasgList[" + 0 + "].testPasg']").val("이해하기 편하고 쉽게 사용할 수 있는 환경을 제공해야한다."); 
		$("input[name='queList[" + 0 + "].pasgList[" + 1 + "].testPasg']").val("치명적인 오류에 대한 부정적인 사항은 사용자가 인지할 수 없도록 한다. ");   /////////// 답
		$("input[name='queList[" + 0 + "].pasgList[" + 2 + "].testPasg']").val("주요 기능을 메인 화면에 노출하여 조작이 쉽도록 하여야 한다."); 
		$("input[name='queList[" + 0 + "].pasgList[" + 3 + "].testPasg']").val("사용자의 직무, 연령, 성별 등 다양한 계층을 수용하여야한다.");
		// 답 선택하기
		 $("input:radio[id='mun2']:radio[value='2']").prop('checked', true);
		//=======================================================================================================
		// 문제 2번
		$("input[name='queList[" + 1 + "].testQue']").val(" 메시지 지향 미들웨어(Message-Oriented Middleware, MOM)에 대한 설명으로 틀린 것은?");
		// 지문 1~4
		$("input[name='queList[" + 1 + "].pasgList[" + 0 + "].testPasg']").val("독립적인 애플리케이션을 하나의 통합된 시스템으로 묶기 위한 역할을 한다. "); 
		$("input[name='queList[" + 1 + "].pasgList[" + 1 + "].testPasg']").val("느리고 안정적인 응답보다는 즉각적인 응답이 필요한 온라인 업무에 적합하다.");  /////////// 답
		$("input[name='queList[" + 1 + "].pasgList[" + 2 + "].testPasg']").val("송신측과 수신측의 연결 시 메시지 큐를 활용하는 방법이 있다."); 
		$("input[name='queList[" + 1 + "].pasgList[" + 3 + "].testPasg']").val("상이한 애플리케이션 간 통신을 비동기 방식으로 지원한다"); 
		// 답 선택하기
		 $("input:radio[id='mun22']:radio[value='2']").prop('checked', true);
		//=======================================================================================================
		// 문제 3번
		$("input[name='queList[" + 2 + "].testQue']").val("유스케이스(Use Case)의 구성 요소 간의 관계에 포함되지 않는 것은?");
		// 지문 1~4
		$("input[name='queList[" + 2 + "].pasgList[" + 0 + "].testPasg']").val("연관"); 
		$("input[name='queList[" + 2 + "].pasgList[" + 1 + "].testPasg']").val("확장"); 
		$("input[name='queList[" + 2 + "].pasgList[" + 2 + "].testPasg']").val("구체화"); /////////// 답
		$("input[name='queList[" + 2 + "].pasgList[" + 3 + "].testPasg']").val("일반화"); 
		// 답 선택하기
		 $("input:radio[id='mun33']:radio[value='3']").prop('checked', true);
		//=======================================================================================================
		// 문제 4번
		$("input[name='queList[" + 3 + "].testQue']").val(" UI와 관련된 기본 개념 중 하나로, 시스템의 상태와 사용자의 지시에 대한 효과를 보여주어 사용자가 명령에 대한 진행 상황과 표시된 내용을 해석할 수 있도록 도와주는 것은?");
		// 지문 1~4
		$("input[name='queList[" + 3 + "].pasgList[" + 0 + "].testPasg']").val("Hash"); 
		$("input[name='queList[" + 3 + "].pasgList[" + 1 + "].testPasg']").val("Module"); 
		$("input[name='queList[" + 3 + "].pasgList[" + 2 + "].testPasg']").val("Posture"); 
		$("input[name='queList[" + 3 + "].pasgList[" + 3 + "].testPasg']").val("Feedback");  /////////// 답
		// 답 선택하기
		 $("input:radio[id='mun44']:radio[value='4']").prop('checked', true);
		//=======================================================================================================
		// 문제 5번
		$("input[name='queList[" + 4 + "].testQue']").val("소프트웨어의 개발과정에서 소프트웨어의 변경사항을 관리하기 위해 개발된 일련의 활동을 뜻하는 것은?");
		// 지문 1~4
		$("input[name='queList[" + 4 + "].pasgList[" + 0 + "].testPasg']").val("복호화"); 
		$("input[name='queList[" + 4 + "].pasgList[" + 1 + "].testPasg']").val("형상관리");  /////////// 답
		$("input[name='queList[" + 4 + "].pasgList[" + 2 + "].testPasg']").val("저작권"); 
		$("input[name='queList[" + 4 + "].pasgList[" + 3 + "].testPasg']").val("크랙"); 
		// 답 선택하기
		 $("input:radio[id='mun52']:radio[value='2']").prop('checked', true);
	   $("#answer").val("2,2,3,4,2");
	}
	
	

	
 
	

</script>