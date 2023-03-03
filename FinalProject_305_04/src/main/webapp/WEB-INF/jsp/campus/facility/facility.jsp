<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />

<style>
	#jframe {
        width: 550px;
        height:400px;
        float: center;
        display : block;
        margin : auto;
    }
    
	.changeColor {
		background-color : #A9BCF5;
	}
</style>

<div class="cont">

	<!-- cont-title -->
	<div class="cont-title">
	
		<h2>시설대여<button type="button" class="star on"><span class="sr-only">즐겨찾기</span></button></h2>
		<!--cont-navi-->
		<div class="cont-navi">
			<span>home</span> <i class="bi bi-house-door-fill"></i>
			<strong>시설관리</strong> 
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
		<div class="cont-box-inner">
			<div class="tbl-half half">
				<div class="tbl-wrap mr20">
                    <div class="title">
                        <h4>시설종류</h4>
                        <div class="right-part">
                            <div class="btn-wrap">
                           </div>
                        </div>
                    </div>

                    <table class="tbl tbl-hover">
                        <caption></caption>
                        <colgroup>
                            <col style="width: 20%">
                            <col style="width: 20%">
                            <col style="width: 20%">
                            <col style="width: 20%">
                        </colgroup>
                        <thead id="listHead">
                        	<tr>
                        		<th colspan="4">시설 선택</th>
                        	</tr>
                            <tr>
                                <td>
									<div class="rc-wrap">
			                           <div class="rc-inner">
			                              <input type="radio" id="basket" name="sisul" value="basket" onclick="f_ck(this,'IA10001')"/>
			                              <label for="basket">농구장</label>
			                           </div>
			                        </div>
                                </td>
                                <td>
									<div class="rc-wrap">
			                           <div class="rc-inner">
			                              <input type="radio" id="tennis" name="sisul" value="tennis" onclick="f_ck(this,'IA10002')"/>
			                              <label for="tennis">테니스장</label>
			                           </div>
			                        </div>
                                </td>
                                <td>
									<div class="rc-wrap">
			                           <div class="rc-inner">
			                              <input type="radio" id="play" name="sisul" value="play" onclick="f_ck(this,'IA10003')"/>
			                              <label for="play">공연장</label>
			                           </div>
			                        </div>
                                </td>
                                <td>
									<div class="rc-wrap">
			                           <div class="rc-inner">
			                              <input type="radio" id="seminar" name="sisul" value="seminar" onclick="f_ck(this,'IA10004')"/>
			                              <label for="seminar">세미나실</label>
			                           </div>
			                        </div>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="height: 350px">
                            	<td colspan="4">
									<div id="jframe">
<!-- 									  <img src="https://via.placeholder.com/480x300.png?text=SiSul" id="rsajin" width="480" height="300" > -->
									  <img src="${pageContext.request.contextPath}/resources/images/facility/map.jpg" id="rsajin" width="550" height="400" >
									</div>                            		
                            	</td>
                            </tr>
							<tr>
								<th colspan="4">시설 정보</th>
							</tr>
							<tr class="table-scrollable__fixed-y">
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<th class=" " scope="row">수용인원</th>
								<td id="people"></td>
								<th class=" " scope="row">사용가능시간</th>
								<td id="time"></td>
							</tr>
							<tr>
								<th class=" " scope="row">위치</th>
								<td colspan="3" id="location"></td>
							</tr>
                        </tbody>
                        
                    </table>
                </div>
				<div class="tbl-wrap ml10">
                    <div class="title">
                        <h4>대여신청</h4>
                        <div class="right-part">
                        </div>
                    </div>



                   	<table class="tbl" id="faciTable">
						<thead class="">
							<tr class="table-scrollable__fixed-y">
								<th colspan="6">시간 선택</th>
							</tr>
							<tr class="table-scrollable__fixed-y">
								<th>요일</th>
								<th>MON</th>
								<th>TUE</th>
								<th>WED</th>
								<th>THU</th>
								<th>FRI</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height:10px">
								<th class=" " scope="row" style="font-size:10pt; padding:0" >09:00</th>
								<td id="MON0900" class="contents clsMON"></td>
								<td id="TUE0900" class="contents clsTUE"></td>
								<td id="WED0900" class="contents clsWED"></td>
								<td id="THU0900" class="contents clsTHU"></td>
								<td id="FRI0900" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >10:00</th>
								<td id="MON1000"  class="contents clsMON"></td>
								<td id="TUE1000"  class="contents clsTUE"></td>
								<td id="WED1000"  class="contents clsWED"></td>
								<td id="THU1000"  class="contents clsTHU"></td>
								<td id="FRI1000"  class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >11:00</th>
								<td id="MON1100" class="contents clsMON"></td>
								<td id="TUE1100" class="contents clsTUE"></td>
								<td id="WED1100" class="contents clsWED"></td>
								<td id="THU1100" class="contents clsTHU"></td>
								<td id="FRI1100" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >12:00</th>
								<td id="MON1200" class="contents clsMON"></td>
								<td id="TUE1200" class="contents clsTUE"></td>
								<td id="WED1200" class="contents clsWED"></td>
								<td id="THU1200" class="contents clsTHU"></td>
								<td id="FRI1200" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >13:00</th>
								<td id="MON1300" class="contents clsMON"></td>
								<td id="TUE1300" class="contents clsTUE"></td>
								<td id="WED1300" class="contents clsWED"></td>
								<td id="THU1300" class="contents clsTHU"></td>
								<td id="FRI1300" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >14:00</th>
								<td id="MON1400" class="contents clsMON"></td>
								<td id="TUE1400" class="contents clsTUE"></td>
								<td id="WED1400" class="contents clsWED"></td>
								<td id="THU1400" class="contents clsTHU"></td>
								<td id="FRI1400" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >15:00</th>
								<td id="MON1500" class="contents clsMON"></td>
								<td id="TUE1500" class="contents clsTUE"></td>
								<td id="WED1500" class="contents clsWED"></td>
								<td id="THU1500" class="contents clsTHU"></td>
								<td id="FRI1500" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >16:00</th>
								<td id="MON1600" class="contents clsMON"></td>
								<td id="TUE1600" class="contents clsTUE"></td>
								<td id="WED1600" class="contents clsWED"></td>
								<td id="THU1600" class="contents clsTHU"></td>
								<td id="FRI1600" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >17:00</th>
								<td id="MON1700" class="contents clsMON"></td>
								<td id="TUE1700" class="contents clsTUE"></td>
								<td id="WED1700" class="contents clsWED"></td>
								<td id="THU1700" class="contents clsTHU"></td>
								<td id="FRI1700" class="contents clsFRI"></td>
							</tr>
							<tr>
								<th class=" " scope="row" style="font-size:10pt; padding:0" >18:00</th>
								<td id="MON1800" class="contents clsMON"></td>
								<td id="TUE1800" class="contents clsTUE"></td>
								<td id="WED1800" class="contents clsWED"></td>
								<td id="THU1800" class="contents clsTHU"></td>
								<td id="FRI1800" class="contents clsFRI"></td>
							</tr>
						</tbody>
					</table>
					<br/>
                   	<table class="tbl">
						<thead class="">
							<tr>
								<th colspan="4">사용자 정보 입력</th>
							</tr>
							<tr class="table-scrollable__fixed-y">
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class=" " scope="row">아이디</th>
								<td align="center" id="userId"> ${authUser.userId } </td>
								<th class=" " scope="row">이용인원</th>
								<td >
									<input type="text" id="numPpl" name="numPpl" class="w100">
								</td>
							</tr>
							<tr>
								<th class=" " scope="row">사용시간</th>
								<td colspan="3" align="center" id="useDate"></td>
							</tr>
							<tr>
								<th class=" " scope="row">이용목적</th>
								<td colspan="3" style="height:100px">
									<input type="text" id="usePur" name="purUse" class="w100" style="height:80px" placeholder="20자 이내로 입력해주세요">
								</td>
							</tr>
						</tbody>
					</table>
					<input type="button" id="regiBtn" value="신청하기" class="btn purple" style="float:right; margin-top:10px;"/>
					<div class="col-lg-12" id="ex1_Result1" ></div> 
                </div>
			</div>
		</div>		
	
	
	</div>
</div>


<script>
//----------------대여신청 테이블 셀마다 날짜 세팅 시작-------------------

//----------------대여신청 테이블 셀마다 날짜 세팅 끝-------------------

	const rSajin = document.querySelector("#rsajin");
	function f_ck(p_this, faciId){
	    if(p_this.checked){
	        rSajin.src = "${pageContext.request.contextPath}/resources/images/facility/" + p_this.value + ".jpg";
	    }
	    
	    //json데이터
	    let data = {"faciId":faciId};
	    console.log("data : " + JSON.stringify(data));
	    
	    //아작났어유..피씨다타써
	    $.ajax({
	    	url:"${pageContext.request.contextPath}/campus/facilityInfo",
	    	contentType:"application/json;charset:utf-8",
	    	data:JSON.stringify(data),
	    	type:"post",
	    	dataType:"json",
	    	success:function(rslt){
	    		//시설 정보 rslt : {"rnum":0,"faciId":"IA10001","faciNm":"농구장",
	    			//"loc":"실외-별관 앞, 실내-체육관","numPpl":"10","location":null}
	    		console.log("시설 정보 rslt : " + JSON.stringify(rslt));
	    		
	    		$("#people").html(rslt.numPpl);
	    		$("#time").html("09:00~18:00");
	    		$("#location").html(rslt.loc);
	    		
	    		
	    		
	    		//시설물 대여하기 표
	    	    $.ajax({
	    	    	url:"${pageContext.request.contextPath}/campus/selectFaciTableList",
	    	    	contentType:"application/json;charset:utf-8",
	    	    	data:JSON.stringify(data),
	    	    	type:"post",
	    	    	dataType:"json",
	    	    	success:function(result){
	    	    		console.log("result : " + JSON.stringify(result));
	    	    		//result : List<Map<String,Object>> data
	    	    		//map : Map<String,Object>
	    	    		
	    	    		//초기화
	    	    		$(".contents").html("");
	    	    		
	    	    		//each는 8회 반복
	    	    		$.each(result,function(index, map){
	    	    			console.log("MON : " + map.MON);
	    	    			console.log("TUE : " + map.TUE);
	    	    			console.log("WED : " + map.WED);
	    	    			console.log("THU : " + map.THU);
	    	    			console.log("FRI : " + map.FRI);
	    	    			
	    	    			if(map.MON!=""){
	    	    				let str = String(map.MON);
	    	    				let strArr = str.split("|");
	    	    				$("#MON"+map.ST_TIME).html(strArr[2]);
	    	    				console.log("map.ST_TIME!!! : " + map.ST_TIME);
	    	    			}
	    	    			if(map.TUE!=""){
	    	    				let str = String(map.TUE);
	    	    				let strArr = str.split("|");
	    	    				$("#TUE"+map.ST_TIME).html(strArr[2]);
	    	    				console.log("map.ST_TIME : " + map.ST_TIME);
	    	    			}
	    	    			if(map.WED!=""){
	    	    				let str = String(map.WED);
	    	    				let strArr = str.split("|");
	    	    				$("#WED"+map.ST_TIME).html(strArr[2]);
	    	    				console.log("map.ST_TIME : " + map.ST_TIME);
	    	    			}
	    	    			if(map.THU!=""){
	    	    				let str = String(map.THU);
	    	    				let strArr = str.split("|");
	    	    				$("#THU"+map.ST_TIME).html(strArr[2]);
	    	    				console.log("map.ST_TIME : " + map.ST_TIME);
	    	    			}
	    	    			if(map.FRI!=""){
	    	    				let str = String(map.FRI);
	    	    				let strArr = str.split("|");
	    	    				$("#FRI"+map.ST_TIME).html(strArr[2]);
	    	    				console.log("map.ST_TIME : " + map.ST_TIME);
	    	    			}
	    	    			
	    	    		});
	    	    	}
	    	    });
	    	},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
	    });
	    
	    
	};
	
	
	
	
	
//---------------------------------------------------------------------------------------

//시간표 클릭해서 값 가져오기
var timeList = [];
$(()=>{
	//이번주 월요일 구하기
	 function fn_getThisWeek(addDate){
	   var value = [];
	   
	   var formatDate = function(date){
	    var myMonth = date.getMonth()+1; 
	       var myWeekDay = date.getDate();
	       
	       var addZero = function(num){
	        if (num < 10){
	         num = "0"+num;
	        }
	        return num;
	       }
	       var md = addZero(myMonth)+addZero(myWeekDay);
	       
	       return md;
	   }
	   
	         var now = new Date(); 
	         var nowDayOfWeek = now.getDay(); 
	         var nowDay = now.getDate(); 
	         var nowMonth = now.getMonth(); 
	         var nowYear = now.getYear(); 
	         nowYear += (nowYear < 2000) ? 1900 : 0; 
	         var weekStartDate = new Date(nowYear, nowMonth, (nowDay - nowDayOfWeek + addDate)); 
	         var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
	         value.push(nowYear+formatDate(weekStartDate));
//	          value.push(nowYear+formatDate(weekEndDate));
	         
	         return value;
	   }

	console.log("이번주 월요일 : " + fn_getThisWeek(1));
	console.log("이번주 화요일 : " + fn_getThisWeek(2));
	console.log("이번주 수요일 : " + fn_getThisWeek(3));
	console.log("이번주 목요일 : " + fn_getThisWeek(4));
	console.log("이번주 금요일 : " + fn_getThisWeek(5));
	
	$("#faciTable td").click(function(){
		//id 값: $(this).prev().attr("id")
		var timeId = $(this).attr("id");
		timeList.push("  "+timeId);
		$("#useDate").html(timeList);
		
		let id = $(this).attr("id");
		let yoil = id.substring(0,3);
		let naljja;
		
		console.log("yoil : " + yoil);
		
		if(yoil=="MON"){
			naljja = fn_getThisWeek(1);
			console.log("naljja : " + naljja);
		}else if(yoil=="TUE"){
			naljja = fn_getThisWeek(2);
			console.log("naljja : " + naljja);
		}else if(yoil=="WED"){
			naljja = fn_getThisWeek(3);
			console.log(" : " + naljja);
		}else if(yoil=="THU"){
			naljja = fn_getThisWeek(4);
			console.log("naljja : " + naljja);
		}else if(yoil=="FRI"){
			naljja = fn_getThisWeek(5);
			console.log("naljja : " + naljja);
		}
	});
	//색 변하기
	changeColor();
	clickTd();
	clickTr();
});



function changeColor(){
	$("#faciTable td").mouseover(function(){
		$(this).addClass('changeColor');
	}).mouseout(function(){
		$(this).removeClass('changeColor');
	}).click(function(){
		$(this).css('background-color','#A9BCF5');
	});
}





//------------------------------------------------------------------------------------

//시설대여 등록하기
$(function(){
	$("#regiBtn").on("click", function(){
		
		let userId = $("#userId").val();
		let numPpl = $("#numPpl").val();
		let useDate = $("#useDate").val();
		let usePur = $("#usePur").val();
		
		console.log("userId : " + userId);
		console.log("numPpl : " + numPpl);
		console.log("useDate : " + useDate);
		console.log("usePur : " + usePur);
		
		
	});
	
	
});




</script>































