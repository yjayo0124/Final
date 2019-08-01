<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<script type="text/javascript">
$(document).ready(function() {
	

	$.ajax({
		type : 'GET',
		url : '/mypage/scrabCheck',
		data : {
			"recruit_no" : ${viewRecruit.recruit_no}
		},
		dataType: 'json',
		success : function(data){
			console.log(data);
		
			if(data) {//true ==> 스크랩 가능 하게 만들어야함 
				
				$('#btnScrab').show();
				$('#btnCancelScrab').hide();
						
			}else{
				$('#btnScrab').hide();
				$('#btnCancelScrab').show();
				
			}
		}
	
	});
	
	
	$("#btnCor").click(function() {
// 		$(location).attr("href", "/cor/info?cor_no="+${corlist.COR_NO }+"&cor_type="+${corlist.COR_TYPE });
	});
	
	$("#btnUpdate").click(function(){
		$(location).attr("href","/recruitment/update?recruit_no="+${viewRecruit.getRecruit_no() });
	});
	
	
	$("#btnDelete").click(function(){
		$(location).attr("href","/recruitment/delete?recruit_no="+${viewRecruit.getRecruit_no() });
	});
	
	
	//스크랩 하기
	$("#btnScrab").click(function(){
	 	$.ajax({
			type : 'POST',
			url : '/mypage/scrabInsert',
			data : {
				"recruit_no" : ${viewRecruit.recruit_no }
			},
			dataType: 'json',
			success : function(data){
				
				$('#btnScrab').hide();
				$('#btnCancelScrab').show();	
				
				$('#scrabResult').html('스크랩 성공♬ <a href="/mypage/scrab/">마이페이지</a>에서 모아볼 수 있어요.').fadeToggle(3000);
			}
		}) 		
		
	})
	
	//스크랩 취소
	$("#btnCancelScrab").click(function(){
	 	$.ajax({
			type : 'POST',
			url : '/mypage/scrabCancel',
			data : {
				"recruit_no" : ${viewRecruit.recruit_no }
			},
			dataType: 'json',
			success : function(data){
				
				$('#btnScrab').show();
				$('#btnCancelScrab').hide();
				
				$('#scrabResult').html('스크랩 취소 성공♬').fadeToggle(3000);
				
			}
		}) 		
		
	})
	
	
	
});



</script>

<style type="text/css">
table {
	border:1px solid #ccc;
}

th{
	text-align: center;
	border:1px solid #ccc;
	background:#ccf;
}

button {
	background:#ccf;
}

.container {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
</style>


<div class="container" >

<h2>채용정보</h2><hr>


<table class="table table-bordered" >

<tr>
<td> 공고번호</td><td>${viewRecruit.recruit_no }</td>
<td></td><td></td>
</tr>

<tr>
<td>채용공고명</td><td colspan="2">${viewRecruit.recruit_title }</td>
</tr>

<tr>
<td colspan="2">지원자격</td><td colspan="2"></td>
</tr>

<tr>
<td>경력</td><td >${viewRecruit.recruit_career }</td><td></td>
</tr>

<tr>
<td>학력</td><td >${viewRecruit.recruit_educareer }</td>
<td colspan="2"></td>
</tr>

<tr>
<td>우대자격증</td><td>${viewRecruit.recruit_certificate }</td><td></td><td></td>
</tr>

<tr>
<td>우대전공</td><td>${viewRecruit.recruit_major }</td>
<td colspan="2"></td>
</tr>

<tr>
<td colspan="2" text ="bold">근무자격</td>
<td>기업 형태</td><td></td>
</tr>
<tr>
<td>근무지역</td><td >${viewRecruit.recruit_loc }</td><td colspan="2"></td>
</tr>
<tr>
<td>고용형태</td><td >${viewRecruit.recruit_type }</td>
<td> 기업명</td><td colspan="2">${viewRecruit.recruit_name }</td>
</tr>

<tr>
<td>급여</td><td>${viewRecruit.recruit_sal }</td><td colspan="2"></td>
</tr>

<tr>
<td>직급</td><td>${viewRecruit.recruit_position }</td>
<td>회사 주소</td><td>${cor}</td>
</tr>

</table>
<div style="padding-left: 41%">
	<a href="/cor/info?cor_no=${corno }&cor_type=${cortype }">
	<button id="btnCor" class="btn btn-default">기업정보 상세보기</button> </a>	

	<sec:authorize access="hasRole('ROLE_IDV')">
	<button id="btnScrab" class="btn btn-default" onclick=""><img src="/resources/images/like_empty.png" height="20px"></button>
	<button id="btnCancelScrab" class="btn btn-default" onclick=""><img src="/resources/images/like.png" height="20px"></button>
	<span id="scrabResult"></span>
	</sec:authorize>
</div>

<h2>상세요강</h2><hr>
<div>
${viewRecruit.recruit_content }
<c:if test="${file ne null }">
<img src="/upload/${file}" style="width: 100%; height: auto;">
</c:if>
</div>

<div class="text-right">
	<a href="/recruitment/main"><button class="btn btn-default">목록</button></a>

<sec:authentication property="details" var="member"/>
	
	<sec:authorize access="isAuthenticated()">
		<c:if test="${member.member_no eq viewRecruit.member_no }" >
			<button id="btnUpdate" >수정</button>
			<button id="btnDelete" class="btn btn-danger">삭제</button>
		</c:if>
	</sec:authorize>


</div>

</div>