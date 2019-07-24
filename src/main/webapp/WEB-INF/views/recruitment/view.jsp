<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<script type="text/javascript">
$(document).ready(function() {
	//홈페이지지원 버튼 동작
	$("#btnCor").click(function() {
		$(location).attr("href", "#");
	});
	
	$("#btnUpdate").click(function(){
		$(location).attr("href","/recruitment/update?recruit_no="+${viewRecruit.getRecruit_no() });
	});
	
	
	$("#btnDelete").click(function(){
		$(location).attr("href","/recruitment/delete?recruit_no="+${viewRecruit.getRecruit_no() });
	});
	
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
<td> 기업명</td><td colspan="2">${viewRecruit.recruit_name }</td>
</tr>

<tr>
<td>채용공고명</td><td colspan="3">${viewRecruit.recruit_title }</td>
</tr>

<tr>
<td colspan="2">지원자격</td><td></td><td>기업 형태</td><td></td>
</tr>

<tr>
<td>경력</td><td >${viewRecruit.recruit_career }</td><td></td>
</tr>

<tr>
<td>학력</td><td >${viewRecruit.recruit_educareer }</td>
<td>대표자명</td><td>#</td>
</tr>

<tr>
<td>우대자격증</td><td>${viewRecruit.recruit_certificate }</td><td></td>
</tr>

<tr>
<td>우대전공</td><td>${viewRecruit.recruit_major }</td>
<td>회사 주소</td><td>#</td>
</tr>

<tr>
<td colspan="2" text ="bold">근무자격</td><td colspan="3"></td>
</tr>

<tr>
<td>고용형태</td><td >${viewRecruit.recruit_type }</td><td colspan="3"></td>
</tr>

<tr>
<td>급여</td><td>${viewRecruit.recruit_sal }</td><td colspan="3"></td>
</tr>

<tr>
<td>직급</td><td>${viewRecruit.recruit_position }</td><td colspan="3"></td>
</tr>

</table>
<div class="text-center">
	<button id="btnCor" class="btn btn-primary">기업정보</button>
	<button id="btnScrab" class="btn btn-primary">스크랩</button>
</div>

<h2>상세요강</h2><hr>
<div>
<!-- <img src="/webapp/upload"> -->

${viewRecruit.recruit_content }
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