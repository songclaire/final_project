<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
  
<security:authentication property="principal" var="usrVOWrapper" />
<security:authentication property="principal.realUser" var="authUser" />

     
<nav class="sb-sidenav accordion sb-sidenav-dark">

	<a class="navbar-brand" href="${pageContext.request.contextPath}/">
     	<span><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" /></span>
     </a>
   
	<!-- tablist  -->
	<div class="tab-wrap"  id="nav-tab" role="tablist">
		<a class="active" href="javascript:void(0);" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">공통메뉴</a>
		<a  class="nav-link" href="javascript:void(0);" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">즐겨찾기</a>
	</div>
	<!--  // tablist  -->

	<!--  tabContent -->
	<div class="sb-sidenav-common tab-content" id="nav-tabContent">

		<!-- 공통메뉴 -->
		<div class="tab-pane active show" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			 <a class="nav-link" href="${pageContext.request.contextPath}/style/cmpt.do">
	          	<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
				공통스타일
	         </a>
	         
	         <!-- 공통메뉴 조회 -->
<%-- 	         <tiles:putAttribute name="commMenuList" /> --%>
<%--       	     <c:forEach items="${commMenuList }" var="commMenu"> --%>
<%-- 				 <a class="nav-link" href="<c:url value='${commMenu.menuUrl }' />"> --%>
<!-- 		          	<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div> -->
<%-- 					${commMenu.menuNm } --%>
<!-- 		         </a> -->
<%-- 	         </c:forEach> --%>
	         
	         <!-- 공통메뉴 조회 -->
<%-- 	         <c:forEach items="${menuList }" var="menu"> --%>
<%-- 				 <a class="nav-link" href="<c:url value='${menu.menuUrl }' />"> --%>
<!-- 		          	<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div> -->
<%-- 					${menu.menuName } --%>
<!-- 		         </a> -->
<%-- 	         </c:forEach> --%>
	         
	         <a class="nav-link menu" href="<c:url value='/campus/notice' />">
	          	<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
				공지사항
	         </a>
	         <a class="nav-link menu" href="<c:url value='/campus/news' />">
	          	<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
				학교뉴스
	         </a>
	         <a class="nav-link menu" href="<c:url value='/campus/facility' />">
	          	<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
				시설대여
	         </a>
	         <a class="nav-link menu" href="<c:url value='/campus/jobSupport' />">
	          	<div class="sb-nav-link sb-nav-link-icon"><i class="bi bi-building-fill-exclamation"></i></div>
				취업지원센터
	         </a>
         </div>
         
         <!-- 즐겨찾기  -->
         <div class="tab-pane" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
<!-- 			<p class="center">즐겨찾기 메뉴가 없습니다.</p> -->
         </div>
	</div>
	<!-- // tabContent -->
	


	<!-- sidenav-menu -->
	<div class="sidenav-menu-wrap "  id="sidenavAccordion">
	    <div class="sb-sidenav-menu mScrollbar">
	      
	      
	      <c:choose>
	      	<c:when test="${authUser.userRole eq 'ROLE_STD' }">
	      
	       <!-- 학생  -->
	       <div class="nav">
				
	        	<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="true" aria-controls="collapseLayouts1">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	 수강관리
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse show" id="collapseLayouts1" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="javascript:void(0);">수강중인 강의</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">사전수강신청</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">수강신청</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">강의 공지사항</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">강의 자료실</a>
	                </nav>
	            </div>
	       
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>시험</a>
	          	
	          	<a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts2">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	학적
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts2" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="<c:url value='/student/record' />">학적 관리</a>
	                    <a class="nav-link collapsed" href="<c:url value='/student/graduation' />">졸업요건 충족 현황</a>
	                </nav>
	            </div>
	            
	            <a class="nav-link collapsed" href="<c:url value='/student/consult' />" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>상담</a>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="false" aria-controls="collapseLayouts3">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	성적/평가
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts3" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="javascript:void(0);">현재 학기 성적 조회</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">누적 성적 조회</a>
	                </nav>
	            </div>
	            
         	    <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="false" aria-controls="collapseLayouts4">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	증명서 발급
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts4" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed menu" href="<c:url value='/campus/certificate' />">증명서 발급</a>
	                    <a class="nav-link collapsed menu" href="<c:url value='/campus/certificateBox' />">증명서 보관함</a>
	                </nav>
	            </div>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts5" aria-expanded="false" aria-controls="collapseLayouts5">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="bi bi-mortarboard-fill"></i></div>
	               	등록/장학
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts5" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="javascript:void(0);">등록금 납부 내역</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">장학금 수혜 내역</a>
	                </nav>
	            </div>
	            

	        </div>
			<!--  // 학생일 경우 -->
	        </c:when>
	        
	        
	        <c:when test="${authUser.userRole eq 'ROLE_PRF' }">
			<!-- 교수  -->
	       <div class="nav">
	        
	       		<a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>나의 강의실</a>
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>시험</a>
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>과제</a>
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>성적</a>
	
	          	<a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts11" aria-expanded="false" aria-controls="collapseLayouts11">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	학생 관리
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts11" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="javascript:void(0);">학생 관리</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">학적 변경 관리</a>
	                </nav>
	            </div>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>강의계획서</a>
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>상담</a>
				
				<a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="false" aria-controls="collapseLayouts4">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	증명서 발급
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts4" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="<c:url value='/campus/certificate' />">증명서 발급</a>
	                    <a class="nav-link collapsed" href="<c:url value='/campus/certificateBox' />">증명서 보관함</a>
	                </nav>
	            </div>
	
	        </div>  
	        <!--  // 교수일 경우 -->
	        </c:when>
	        
	        
	        <c:when test="${authUser.userRole eq 'ROLE_EMP' }">
	        <!-- 교직원  -->
			<div class="nav">
			 
	        	<a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts111" aria-expanded="true" aria-controls="collapseLayouts111">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="bi bi-file-text-fill"></i></div>
	               	교무 업무
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts111" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="javascript:void(0);">학사 일정 관리</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">강의 관리</a>
	                    <a class="nav-link collapsed" href="<c:url value='/emp/lectroomManage' />">강의실 관리</a>
	                    <a class="nav-link collapsed" href="<c:url value='/student/graduationManage' />">졸업 요건 관리</a>
	                </nav>
	            </div>
	            
	          	<a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts222" aria-expanded="false" aria-controls="collapseLayouts222">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	학교 내 정보 관리
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts222" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="<c:url value='/emp/studentInfo' />">학생 정보 관리</a>
	                    <a class="nav-link collapsed" href="<c:url value='/emp/profInfo' />">교수진 정보 관리</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">교직원 정보 관리</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">학과 정보 관리</a>
	                </nav>
	            </div>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts333" aria-expanded="false" aria-controls="collapseLayouts333">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	게시판 관리
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts333" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="<c:url value='/campus/notice' />">공지사항</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">학사상담(Q&A)</a>
	                    <a class="nav-link collapsed" href="<c:url value='/campus/news' />">학교뉴스</a>
	                </nav>
	            </div>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>교내 시설물 관리</a>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" ><div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>증명서 발급 관리</a>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="false" aria-controls="collapseLayouts4">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-columns"></i></div>
	               	증명서 발급
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts4" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="<c:url value='/campus/certificate' />">증명서 발급</a>
	                    <a class="nav-link collapsed" href="<c:url value='/campus/certificateBox' />">증명서 보관함</a>
	                </nav>
	            </div>
	            
	            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseLayouts444" aria-expanded="false" aria-controls="collapseLayouts444">
	                <div class="sb-nav-link sb-nav-link-icon"><i class="bi bi-mortarboard-fill"></i></div>
	               	등록금/장학금 관리
	                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	            </a>
	            <div class="collapse" id="collapseLayouts444" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link collapsed" href="javascript:void(0);">등록금 관리</a>
	                    <a class="nav-link collapsed" href="javascript:void(0);">장학금 관리</a>
	                </nav>
	            </div>
	        </div>
	        <!-- 교직원  -->
	        </c:when>
	
			</c:choose>		        
	
		</div>
    </div>
    <!-- // sidenav-menu -->
    
    

</nav>

<script>


// $.ajax({
// 	url : "${pageContext.request.contextPath}/",
// 	method : "get",
// 	dataType : "json",
// 	success : function(resp) {
// 		console.log("찍어봐요", resp);
// // 		console.log(resp.commMenuList[0].menuNm);
// // 		console.log(resp.commMenuList[0].menuUrl);

// 		let commMenuList = resp.commMenuList;
// 		let commMenuTag = '';
		
// 		$.each(commMenuList, function(idx){
// // 			console.log(commMenuList[idx]);
// // 			commMenuTag += '<a class="nav-link" href="${pageContext.request.contextPath}' + commMenuList[idx].menuUrl + '"/>'
// // 							+ '<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>'
// // 							+ commMenuList[idx].menuNm + '</a>';
// 			commMenuTag += '<a class="nav-link"/>'
// 							+ '<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>'
// 							+ commMenuList[idx].menuNm + '</a>';
// 		});
		
// 		$('#nav-home').append(commMenuTag);
		
// // 		let userMenuList = resp.userMenuList;
// // 		let userMenuTag = '';
		
// // 		$.each(userMenuList, function(idx){
// // 			userMenuTag += '<a class="nav-link" href="${pageContext.request.contextPath}' + userMenuList[idx].menuUrl + '"/>'
// // 			+ '<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>'
// // 			+ userMenuList[idx].menuNm + '</a>'
// // 		});
		
// // 		$('#sidenavAccordion .nav').append(userMenuTag);
		
// 	},
// 	error : function(jqXHR, status, error) {
// 		console.log(jqXHR);
// 		console.log(status);
// 		console.log(error);
// 	}
// });


// $('.nav-link').on('click', function(){
	
// 	alert('체크');
	
// 	$.ajax({
// 		url : "<c:url value='url' />",
// 		method : "get",
// 		dataType : "html",
// 		success : function(resp) {
// 			$('#layoutSidenav_content').children().remove();
// 			$('#layoutSidenav_content').html(resp);
			
			
// 		},
// 		error : function(jqXHR, status, error) {
// 			console.log(jqXHR);
// 			console.log(status);
// 			console.log(error);
// 		}
// 	});
	
// });



// // 메뉴 클릭했을 때 content 부분만 변경
// $('.menu').on('click', function(){
// 	let url = $(this).data('url');
// 	console.log(url);
	
// 	$.ajax({
// 		url : url,
// 		method : "get",
// 		dataType : "html",
// 		success : function(resp) {
// 			console.log(resp);
// 			$('.container-fluid').children().remove();
// 			$('.container-fluid').html(resp);
// 		},
// 		error : function(jqXHR, status, error) {
// 			console.log(jqXHR);
// 			console.log(status);
// 			console.log(error);
// 		}
// 	});
// });


$('#nav-profile-tab').on('click', function(){

	$.ajax({
		url : "${pageContext.request.contextPath}/bookmark",
		method : "get",
		data : {},
		dataType : "json",
		success : function(resp) {
			console.log(resp);
			console.log(resp.bookmarkVO.bmenuList);
			console.log(Object.keys(resp).length);
			
			$('#nav-profile').empty();
			
			if(!resp || Object.keys(resp).length==0) {
				$('#nav-tabContent').append(
					'<p class="center">즐겨찾기 메뉴가 없습니다.</p>'	
				);
			} else if(resp.bookmarkVO.bmenuList!=null && resp.bookmarkVO.bmenuList.length > 0) {
				
				let bmenuList = resp.bookmarkVO.bmenuList;
				console.log(bmenuList);
				
				let cnt = bmenuList.length;
				for(let i=0; i<cnt; i++) {
					$('#nav-profile').append(
						'<a class="nav-link menu" href="' + bmenuList[i].menuVO.menuUrl 
							+ '">'
         			+ '<div class="sb-nav-link sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>'
							+ bmenuList[i].menuVO.menuNm
        			+ '</a>'
					);
				}
			} 
			
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});

});






</script>

