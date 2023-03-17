<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

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
			<strong>성적</strong> <strong>누적성적 조회</strong>
		</div>
		<!--end cont-navi-->
	</div>
	<!-- end cont-title -->

	<div class="white-box">
			
		<div class="cont-box-inner">
			<div class="tbl-half">
				<div class="tbl-wrap">
                    <div class="title">
                        <h4>누적성적</h4>
                    </div>

                    <table class="tbl center">
                        <caption></caption>
                        <colgroup>
                            <col style="width: 10%">
                            <col style="width: 7%">
                            <col style="width: 10%">
                            <col style="width: 20%">
                            <col style="width: 7%">
                            <col style="width: 7%">
                            <col style="width: 7%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">년도/학기</th>
                                <th scope="col">학년</th>
                                <th scope="col">이수구분</th>
                                <th scope="col">강의명</th>
                                <th scope="col">학점</th>
                                <th scope="col">등급</th>
                                <th scope="col">평점</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
   							<c:set var="stdScoreList" value="${stdScoreList}" />
							<c:choose>
								<c:when test="${not empty stdScoreList }">
									<c:forEach items="${stdScoreList }" var="scores" >
										<tr>
											<td>${scores.semeYear } / ${scores.seme }</td>
											<td>${scores.camYear }</td>
											<td>${scores.estaSub }</td>
											<td>${scores.lectNm }</td>
											<td class='${scores.semeId }'>${scores.credit }</td>
											<td>
												<c:if test="${scores.critFinalScore eq '4.5'}">
													A+
												</c:if>
												<c:if test="${scores.critFinalScore eq '4'}">
													A
												</c:if>
												<c:if test="${scores.critFinalScore eq '3.5'}">
													B+
												</c:if>
												<c:if test="${scores.critFinalScore eq '3'}">
													B
												</c:if>
												<c:if test="${scores.critFinalScore eq '2.5'}">
													C+
												</c:if>
												<c:if test="${scores.critFinalScore eq '2'}">
													C
												</c:if>
												<c:if test="${scores.critFinalScore eq '1.5'}">
													D+
												</c:if>
												<c:if test="${scores.critFinalScore eq '1'}">
													D
												</c:if>
												<c:if test="${scores.critFinalScore eq '0.5'}">
													F
												</c:if>
											</td>
											<td id="${scores.semeId }">${scores.critFinalScore }</td>
											
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="7">조회할 성적이 없습니다.</td>
								</c:otherwise>
							</c:choose>
                            </tr>
                        </tbody>
                    </table>
                </div>
				<div class="tbl-wrap">
                    <div class="title">
                        <h4>학기성적</h4>
                    </div>

                    <table class="tbl center">
                        <colgroup>
                            <col style="width: 20%">
                            <col style="width: 20%">
                            <col style="width: 20%">
                            <col style="width: 20%">
                        </colgroup>
                        <thead>
                            <tr>	
                                <th scope="col">년도/학기</th>
                                <th scope="col">신청학점</th>
                                <th scope="col">취득학점</th>
                                <th scope="col">최종평점</th>
                            </tr>
                        </thead>
                        <tbody id='scoreList'>
                        </tbody>
                    </table>
                </div>
			</div>
			
			<div style="width: 1560px; height: 760px;">
			<!--차트가	 그려질 부분-->
			<canvas id="myChart"></canvas>
			</div>
			
		</div>
		
	</div>
</div>

<script>


$(document).ready(function() {
	let seme1701 = 0;
	let credit1701 = 0;
	const tds10001 = document.querySelectorAll("#DA10001");
	for (let i = 0; i < tds10001.length; i++) {
		seme1701 += parseFloat(tds10001[i].textContent);
	}
	seme1701 = seme1701 / tds10001.length;
	$('.DA10001').each(function(){
		credit1701 += parseInt($(this).text());
	})
	
	let seme1702 = 0;
	let credit1702 = 0;
	const tds10002 = document.querySelectorAll("#DA10002");
	for (let i = 0; i < tds10002.length; i++) {
		seme1702 += parseFloat(tds10002[i].textContent);
	}
	seme1702 = seme1702 / tds10002.length;
	$('.DA10002').each(function(){
		credit1702 += parseInt($(this).text());
	})
	
	let seme1801 = 0;
	let credit1801 = 0;
	const tds10003 = document.querySelectorAll("#DA10003");
	for (let i = 0; i < tds10003.length; i++) {
		seme1801 += parseFloat(tds10003[i].textContent);
	}
	seme1801 = seme1801 / tds10003.length;
	$('.DA10003').each(function(){
		credit1801 += parseInt($(this).text());
	})
	
	let seme1802 = 0;
	let credit1802 = 0;
	const tds10004 = document.querySelectorAll("#DA10004");
	for (let i = 0; i < tds10004.length; i++) {
		seme1802 += parseFloat(tds10004[i].textContent);
	}
	seme1802 = seme1802 / tds10004.length;
	$('.DA10004').each(function(){
		credit1802 += parseInt($(this).text());
	})
	
	let seme1901 = 0;
	let credit1901 = 0;
	const tds10005 = document.querySelectorAll("#DA10005");
	for (let i = 0; i < tds10005.length; i++) {
		seme1901 += parseFloat(tds10005[i].textContent);
	}
	seme1901 = seme1901 / tds10005.length;
	$('.DA10005').each(function(){
		credit1901 += parseInt($(this).text());
	})
	
	let seme1902 = 0;
	let credit1902 = 0;
	
	const tds10006 = document.querySelectorAll("#DA10006");
	for (let i = 0; i < tds10006.length; i++) {
		seme1902 += parseFloat(tds10006[i].textContent);
	}
	seme1902 = seme1902 / tds10006.length;
	
	$('.DA10006').each(function(){
		credit1902 += parseInt($(this).text());
	})
	
	let seme2001 = 0;
	let credit2001 = 0;
	
	const tds10007 = document.querySelectorAll("#DA10007");
	for (let i = 0; i < tds10007.length; i++) {
		seme2001 += parseFloat(tds10007[i].textContent);
	}
	seme2001 = seme2001 / tds10007.length;
	
	$('.DA10007').each(function(){
		credit2001 += parseInt($(this).text());
	})
	
	
	let seme2002 = 0;
	let credit2002 = 0;
	
	const tds10008 = document.querySelectorAll("#DA10008");
	for (let i = 0; i < tds10008.length; i++) {
		seme2002 += parseFloat(tds10008[i].textContent);
	}
	seme2002 = seme2002 / tds10008.length;
	
	$('.DA10008').each(function(){
		credit2002 += parseInt($(this).text());
	})
	
	
	let seme2101 = 0;
	let credit2101 = 0;
	
	const tds10009 = document.querySelectorAll("#DA10009");
	for (let i = 0; i < tds10009.length; i++) {
		seme2101 += parseFloat(tds10009[i].textContent);
	}
	seme2101 = seme2101 / tds10009.length;
	
	$('.DA10009').each(function(){
		credit2101 += parseInt($(this).text());
	})
	
	let seme2102 = 0;
	let credit2102 = 0;
	
	const tds10010 = document.querySelectorAll("#DA10010");
	for (let i = 0; i < tds10010.length; i++) {
		seme2102 += parseFloat(tds10010[i].textContent);
	}
	seme2102 = seme2102 / tds10010.length;
	
	$('.DA10010').each(function(){
		credit2102 += parseInt($(this).text());
	})
	
	let seme2201 = 0;
	let credit2201 = 0;
	
	const tds10011 = document.querySelectorAll("#DA10011");
	for (let i = 0; i < tds10011.length; i++) {
		seme2201 += parseFloat(tds10011[i].textContent);
	}
	seme2201 = seme2201 / tds10011.length;
	
	$('.DA10011').each(function(){
		credit2201 += parseInt($(this).text());
	})
	
	let seme2202 = 0;
	let credit2202 = 0;
	
	const tds10012 = document.querySelectorAll("#DA10012");
	for (let i = 0; i < tds10012.length; i++) {
		seme2202 += parseFloat(tds10012[i].textContent);
	}
	seme2202 = seme2202 / tds10012.length;
	
	$('.DA10012').each(function(){
		credit2202 += parseInt($(this).text());
	})
	
	
	let seme2301 = 0;
	let credit2301 = 0;
	
	const tds10013 = document.querySelectorAll("#DA10013");
	for (let i = 0; i < tds10013.length; i++) {
  		seme2301 += parseFloat(tds10013[i].textContent);
	}
	seme2301 = seme2301 / tds10013.length;

	$('.DA10013').each(function(){
		credit2301 += parseInt($(this).text());
	})
	
	
	let seme2302 = 0;
	let credit2302 = 0;
	$('#DA10014').each(function() {
		seme2302 += parseInt($(this).text());
	});
	
// 	const tds10014 = document.querySelectorAll("#DA10014");
// 	for (let i = 0; i < tds10014.length; i++) {
// 		seme2302 += parseFloat(tds10014[i].textContent);
// 	}
// 	seme2302 = seme2302 / tds10014.length;
	$('.DA10014').each(function(){
		credit2302 += parseInt($(this).text());
	})

	
	if(seme1701 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2017 / 1</td>
			<td>`+ credit1701 +`</td>
			<td>`+ credit1701 +`</td>
			<td>`+ seme1701 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme1702 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2017 / 2</td>
			<td>`+ credit1702 +`</td>
			<td>`+ credit1702 +`</td>
			<td>`+ seme1702 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme1801 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2018 / 1</td>
			<td>`+ credit1801 +`</td>
			<td>`+ credit1801 +`</td>
			<td>`+ seme1801 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme1802 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2018</td>
			<td>2</td>
			<td>`+ credit1802 +`</td>
			<td>`+ credit1802 +`</td>
			<td>`+ seme1802 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme1901 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2019 / 1</td>
			<td>`+ credit1901 +`</td>
			<td>`+ credit1901 +`</td>
			<td>`+ seme1901 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme1902 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2019 / 2</td>
			<td>`+ credit1902 +`</td>
			<td>`+ credit1902 +`</td>
			<td>`+ seme1902 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2001 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2020 / 1</td>
			<td>`+ credit2001 +`</td>
			<td>`+ credit2001 +`</td>
			<td>`+ seme2001 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2002 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2020 / 2</td>
			<td>`+ credit2002 +`</td>
			<td>`+ credit2002 +`</td>
			<td>`+ seme2002 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2101 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2021 / 1</td>
			<td>`+ credit2101 +`</td>
			<td>`+ credit2101 +`</td>
			<td>`+ seme2101 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2102 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2021 / 2</td>
			<td>`+ credit2102 +`</td>
			<td>`+ credit2102 +`</td>
			<td>`+ seme2102 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2201 != 0){
		$('#scoreList').append(
		`
		<tr>
			<td>2022 / 1</td>
			<td>`+ credit2201 +`</td>
			<td>`+ credit2201 +`</td>
			<td>`+ seme2201 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2202 != 0){
		$('#scoreList').append(
		`
		<tr>
			<td>2022 / 2</td>
			<td>`+ credit2202 +`</td>
			<td>`+ credit2202 +`</td>
			<td>`+ seme2202 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2301 != 0){
		$('#scoreList').append(
		`
		<tr>
			<td>2023 / 1</td>
			<td>`+ credit2301 +`</td>
			<td>`+ credit2301 +`</td>
			<td>`+ seme2301 +`</td>
		</tr>		
		`
		);
	}
	
	if(seme2302 != 0){
		$('#scoreList').html(
		`
		<tr>
			<td>2023 / 2</td>
			<td>`+ credit2302 +`</td>
			<td>`+ credit2302 +`</td>
			<td>`+ seme2302 +`</td>
		</tr>		
		`
		);
	}
	
	
	  var context = document
      	.getElementById('myChart')
      	.getContext('2d');
	  
	  let data = [];
	  let label = [];
	  
	  if (!isNaN(seme1701)) {
		  data.push(seme1701);
		  label.push('2017/1');
		}

		if (!isNaN(seme1702)) {
		  data.push(seme1702);
		  label.push('2017/2');
		}

		if (!isNaN(seme1801)) {
		  data.push(seme1801);
		  label.push('2018/1');
		}

		if (!isNaN(seme1802)) {
		  data.push(seme1802);
		  label.push('2018/2');
		}

		if (!isNaN(seme1901)) {
		  data.push(seme1901);
		  label.push('2019/1');
		}

		if (!isNaN(seme1902)) {
		  data.push(seme1902);
		  label.push('2019/2');
		}

		if (!isNaN(seme2001)) {
		  data.push(seme2001);
		  label.push('2020/1');
		}

		if (!isNaN(seme2002)) {
		  data.push(seme2002);
		  label.push('2020/2');
		}

		if (!isNaN(seme2101)) {
		  data.push(seme2101);
		  label.push('2021/1');
		}

		if (!isNaN(seme2102)) {
		  data.push(seme2102);
		  label.push('2021/2');
		}

		if (!isNaN(seme2201)) {
		  data.push(seme2201);
		  label.push('2022/1');
		}

		if (!isNaN(seme2202)) {
		  data.push(seme2202);
		  label.push('2022/2');
		}

		if (!isNaN(seme2301)) {
		  data.push(seme2301);
		  label.push('2023/1');
		}

		if (seme2302 !== 0) {
		  data.push(seme2302);
		  label.push('2023/2');
		}
	  
	  
// 	 console.log(data);
	  
	  
	  var myChart = new Chart(context, {
	      type: 'line', // 차트의 형태
	      data: { // 차트에 들어갈 데이터
	          labels: label,
	          datasets: [
	              { //데이터
	                  label: '평점', //차트 제목
	                  fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                  data: data,
	                  backgroundColor: [
	                      //색상
	                      'rgba(255, 99, 132, 0.2)'
	                  ],
	                  borderColor: [
	                      //경계선 색상
	                      'rgba(255, 99, 132, 1)'
	                  ],
	                  borderWidth: 1 //경계선 굵기
	              }
	          ]
	      },
	      options: {
	          scales: {
	              yAxes: [
	                  {
	                      ticks: {
	                          beginAtZero: true
	                      }
	                  }
	              ]
	          }
	      }
	  });
	
});
	
	
</script>