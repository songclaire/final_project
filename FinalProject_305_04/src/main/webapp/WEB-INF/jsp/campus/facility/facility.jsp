<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />

<script>
/* 자동채우기 */
function f_autoFill(){
   $('input[name=numUsers]').val("10");
   $('input[name=purUse]').val("시험 공부를 위해 시설을 대여하고 싶습니다.");
}
</script>



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

                    <table class="tbl tbl-hover center">
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
                                       <label for="seminar">스터디룸</label>
                                    </div>
                                 </div>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="height: 350px">
                               <td colspan="4">
                           <div id="jframe">
<!--                              <img src="https://via.placeholder.com/480x300.png?text=SiSul" id="rsajin" width="480" height="300" > -->
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
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr style="height:10px">
                        <th class=" " scope="row"  >09:00</th>
                        <td id="MON09" class="contents clsMON"></td>
                        <td id="TUE09" class="contents clsTUE"></td>
                        <td id="WED09" class="contents clsWED"></td>
                        <td id="THU09" class="contents clsTHU"></td>
                        <td id="FRI09" class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >10:00</th>
                        <td id="MON10"  class="contents clsMON"></td>
                        <td id="TUE10"  class="contents clsTUE"></td>
                        <td id="WED10"  class="contents clsWED"></td>
                        <td id="THU10"  class="contents clsTHU"></td>
                        <td id="FRI10"  class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >11:00</th>
                        <td id="MON11" class="contents clsMON"></td>
                        <td id="TUE11" class="contents clsTUE"></td>
                        <td id="WED11" class="contents clsWED"></td>
                        <td id="THU11" class="contents clsTHU"></td>
                        <td id="FRI11" class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >12:00</th>
                        <td id="MON12" class="contents clsMON"></td>
                        <td id="TUE12" class="contents clsTUE"></td>
                        <td id="WED12" class="contents clsWED"></td>
                        <td id="THU12" class="contents clsTHU"></td>
                        <td id="FRI12" class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >13:00</th>
                        <td id="MON13" class="contents clsMON"></td>
                        <td id="TUE13" class="contents clsTUE"></td>
                        <td id="WED13" class="contents clsWED"></td>
                        <td id="THU13" class="contents clsTHU"></td>
                        <td id="FRI13" class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >14:00</th>
                        <td id="MON14" class="contents clsMON"></td>
                        <td id="TUE14" class="contents clsTUE"></td>
                        <td id="WED14" class="contents clsWED"></td>
                        <td id="THU14" class="contents clsTHU"></td>
                        <td id="FRI14" class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >15:00</th>
                        <td id="MON15" class="contents clsMON"></td>
                        <td id="TUE15" class="contents clsTUE"></td>
                        <td id="WED15" class="contents clsWED"></td>
                        <td id="THU15" class="contents clsTHU"></td>
                        <td id="FRI15" class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >16:00</th>
                        <td id="MON16" class="contents clsMON"></td>
                        <td id="TUE16" class="contents clsTUE"></td>
                        <td id="WED16" class="contents clsWED"></td>
                        <td id="THU16" class="contents clsTHU"></td>
                        <td id="FRI16" class="contents clsFRI"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row"  >17:00</th>
                        <td id="MON17" class="contents clsMON"></td>
                        <td id="TUE17" class="contents clsTUE"></td>
                        <td id="WED17" class="contents clsWED"></td>
                        <td id="THU17" class="contents clsTHU"></td>
                        <td id="FRI17" class="contents clsFRI"></td>
                     </tr>
<!--                      <tr> -->
<!--                         <th class=" " scope="row"  >18:00</th> -->
<!--                         <td id="MON18" class="contents clsMON"></td> -->
<!--                         <td id="TUE18" class="contents clsTUE"></td> -->
<!--                         <td id="WED18" class="contents clsWED"></td> -->
<!--                         <td id="THU18" class="contents clsTHU"></td> -->
<!--                         <td id="FRI18" class="contents clsFRI"></td> -->
<!--                      </tr> -->
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
                        <td align="center" id="userId" name="userId"> ${authUser.userId } </td>
                        <th class=" " scope="row">이용인원</th>
                        <td >
                           <input type="number" id="numUsers" name="numUsers" value="1" class="w100" />
                           <input type="hidden" id="reservDate" name="reservDate">
                        </td>
                     </tr>
                     <tr>
                        <th class=" " scope="row">사용시간</th>
                        <td colspan="3" align="center" name="availTimeid" id="availTimeid"></td>
                     </tr>
                     <tr>
                        <th class=" " scope="row">이용목적</th>
                        <td colspan="3" style="height:100px">
                           <input type="text" id="purUse" name="purUse" class="w100" style="height:80px" placeholder="20자 이내로 입력해주세요">
                        </td>
                     </tr>
                  </tbody>
               </table>
               <div class="title right">
                   <button id="autoBtn" type="button" class="btn default" onclick="f_autoFill()">자동완성</button>
	               <input type="button" id="regiBtn" value="신청하기" class="btn purple" />
               </div>
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
                //"loc":"실외-별관 앞, 실내-체육관","numUsers":"10","location":null}
//              console.log("시설 정보 rslt : " + JSON.stringify(rslt));
             
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
                    console.log("result===================== : " , result);
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
                          
                          tdColor(strArr,$("#MON"+map.ST_TIME.substring(0,2)),"#A9BCF5","black");
                          
                       }
                       if(map.TUE!=""){
                          let str = String(map.TUE);
                          let strArr = str.split("|");

                          tdColor(strArr,$("#TUE"+map.ST_TIME.substring(0,2)),"#A9BCF5","black");
                          
                       }
                       if(map.WED!=""){
                          let str = String(map.WED);
                          let strArr = str.split("|");
  
                          tdColor(strArr,$("#WED"+map.ST_TIME.substring(0,2)),"#A9BCF5","black");
                          
                       }
                       if(map.THU!=""){
                          let str = String(map.THU);
                          let strArr = str.split("|");
                          
                          tdColor(strArr,$("#THU"+map.ST_TIME.substring(0,2)),"#A9BCF5","black");
                       }
                       if(map.FRI!=""){
                          let str = String(map.FRI);
                          let strArr = str.split("|");
                          tdColor(strArr,$("#FRI"+map.ST_TIME.substring(0,2)),"#A9BCF5","black");
//                          $("#FRI"+map.ST_TIME.substring(0,2)).html(strArr[2]);
//                           console.log("map.ST_TIME : " + map.ST_TIME);
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
   
   
   let tdColor = (p_arrVal, p_td, bcolor,fcolor)=>{
	   p_td.html("").css("backgroundColor","white").css("color","black");
	   if(p_arrVal[2]){
		   p_td.html("예약").css("backgroundColor",bcolor).css("color",fcolor).css("text-align","center");
	   }
   }
   
   
   
   
//---------------------------------------------------------------------------------------


var timeList = [];
//전역변수(날짜를 누적시켜줌)
let publicNalja = "";
//시설
let publicFaciId = "";

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
//          value.push(nowYear+formatDate(weekEndDate));
            
            return value;
      }

   console.log("이번주 월요일 : " + fn_getThisWeek(1));
   console.log("이번주 화요일 : " + fn_getThisWeek(2));
   console.log("이번주 수요일 : " + fn_getThisWeek(3));
   console.log("이번주 목요일 : " + fn_getThisWeek(4));
   console.log("이번주 금요일 : " + fn_getThisWeek(5));
   
   
   
   //시간표 클릭해서 아래 표에 값 가져오기
   $("#faciTable td").click(function(){
      //id 값: $(this).prev().attr("id")
      var timeId = $(this).attr("id");
//       console.log("timeId " + timeId);
      //클릭한 값 '사용시간' 칸에 출력하기
      timeList.push("  "+timeId);
//       console.log("timeList " + timeList);
      
      //<td colspan="3" align="center" name="availTimeid" id="availTimeid">TUE12  TUE14  TUE12  TUE12  TUE12</td>
      $("#availTimeid").html(timeList);
      $("#availTimeid").data("date",timeId);
      
      
      let id = $(this).attr("id");
      //yoil : id값 'MON0900' 형태에서 앞의 영어 세개 자르기
      let yoil = id.substring(0,3);
      
      let naljja;
      
//       console.log("yoil : " + yoil);
      
      if(yoil=="MON"){
         naljja = fn_getThisWeek(1); //월요일 날짜
      }else if(yoil=="TUE"){
         naljja = fn_getThisWeek(2);
      }else if(yoil=="WED"){
         naljja = fn_getThisWeek(3);
      }else if(yoil=="THU"){
         naljja = fn_getThisWeek(4);
      }else if(yoil=="FRI"){
         naljja = fn_getThisWeek(5);
      }
      
      publicNalja = publicNalja + naljja + " ";
      console.log("publicNalja : " + publicNalja);
   });
   //색 변하기
   changeColor();
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
      
      let userId = `${authUser.userId }`;
      let numUsers = $("#numUsers").val(); //numUsers
      let availTimeid = $("#availTimeid").data("date"); //availTimeId
      let purUse = $("#purUse").val();
      
      //아이디값 들고오기
      let faciId = "" //시설 선택할 때 아이디값 가져오기
      let facility = $("#listHead").find("input:checked").attr("id");
      //facility : basket
      console.log("facility : " + facility);
      
      if(facility==""){
    	  alert("시설을 선택해주세요");
    	  //프로그램 중지
    	  return;
      }
      
      if (facility == "basket") {
         faciId = "IA10001";
      } else if (facility == "tennis") {
         faciId = "IA10002"
      } else if (facility == "play") {
         faciId = "IA10003"
      } else if (facility == "seminar") {
         faciId = "IA10004"
      }
      
      //전역변수에 저장
      publicFaciId = faciId;
      
      //reservDate 구하기 위해서 가져온 값
      let dates = $("#availTimeid").html();
      if(dates==""){
    	  alert("시간을 선택해주세요");
    	//프로그램 중지
    	  return;
      }
      let dateArr = dates.split("  ");
      let id = dateArr[1];
      
      //yoil : id값 'MON0900' 형태에서 앞의 영어 세개 자르기
      let yoil = id.substring(0,3);
      let naljja;
      
      if(yoil=="MON"){
         naljja = fn_getThisWeek1(1); //월요일 날짜
//          console.log("naljja : " + naljja);
      }else if(yoil=="TUE"){
         naljja = fn_getThisWeek1(2);
//          console.log("naljja : " + naljja);
      }else if(yoil=="WED"){
         naljja = fn_getThisWeek1(3);
//          console.log(" : " + naljja);
      }else if(yoil=="THU"){
         naljja = fn_getThisWeek1(4);
//          console.log("naljja : " + naljja);
      }else if(yoil=="FRI"){
         naljja = fn_getThisWeek1(5);
//          console.log("naljja : " + naljja);
      }
      
      let reservDate = naljja[0]; // naljja
      
      
      console.log("userId: ", userId);
      console.log("numUsers: ", numUsers);
      console.log("availTimeid: ", availTimeid);
      console.log("purUse: ", purUse);
      console.log("faciId: ", faciId);
      console.log("reservDate: ", reservDate);
      
      
      
      let data = {"userId":userId,"numUsers":numUsers,"availTimeid":$("#availTimeid").text(),"purUse":purUse,"faciId":faciId,"reservDate":publicNalja};
      
      //data : {"userId":"22222222","numUsers":"1","availTimeid":"TUE14"
    	  //,"purUse":"sdfadfdsaf","faciId":"","reservDate":"20230228"}
      console.log("data : " + JSON.stringify(data));
      
      $.ajax({
         url : "${pageContext.request.contextPath}/campus/insertFacilityRes",
         contentType:"application/json;charset:utf-8",
         data : JSON.stringify(data),
         type:"post",
         dataType : "json",
         success : function(resp) {
            console.log("resp" + resp);
            alert("등록이 완료되었습니다.");
            
            $("#numUsers").html("");
            $("#availTimeid").html("");
            $("#purUse").html("");
            $("#faciId").html("");
            $("#reservDate").html("");
            
            //누적 날짜는 초기화
            publicNalja = "";
            
            $("#availTimeid").html();
            
//             <input type="radio" id="basket" name="sisul" value="basket" onclick="f_ck(this,'IA10001')">
            if(publicFaciId=="IA10001"){
				f_ck(document.getElementById("basket"),'IA10001');
            }else if(publicFaciId=="IA10002"){
            	f_ck(document.getElementById("tennis"),'IA10002');
            }else if(publicFaciId=="IA10003"){
            	f_ck(document.getElementById("play"),'IA10003');
            }else if(publicFaciId=="IA10004"){
            	f_ck(document.getElementById("seminar"),'IA10004');
            }else{
            	f_ck(document.getElementById("basket"),'IA10001');
            }
            
         },
         error : function(jqXHR, status, error) {
            console.log(jqXHR);
            console.log(status);
            console.log(error);

         }
      });
   });
});


//시설 등록할 때 사용하는 함수
function fn_getThisWeek1(addDate){
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
            
            return value;
}


</script>






























