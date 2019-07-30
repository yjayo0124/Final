<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnCancel").click(function() {
		$(location).attr("href", "/jobfair/main");
	});
	
});

</script>


<div class="body">

<h4>뷰 페이지</h4>
<hr>

<form action="/jobfair/adminview" method="post">
<input type="hidden" name="jobfair_no" value="${viewmap.jobfair_no }" />

<table class="table  table-bordered table-striped table-hover table-condensed">
<thead>
</thead>

<tbody>
	<tr>
		<td>제목</td>
		<td>${viewmap.jobfair_name }</td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>관리자</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${viewmap.jobfair_date }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<c:if test="${file ne null }">
				<img src="/upload/${file }" style="width: 100%; heigth: auto;">
			</c:if>
			${viewmap.jobfair_content }
		</td>
	</tr>
	<tr>
		<td>시작일</td>
		<td>${viewmap.jobfair_start }</td>
	</tr>
	<tr>
		<td>종료일</td>
		<td>${viewmap.jobfair_end }</td>
	</tr>
	<tr>
		<td>장소</td>
		<td>${viewmap.jobfair_loc }</td>
		<!-- 지도 api 사용 -->
	</tr>
	<tr>
		<td>신청기간</td>
		<td>${viewmap.jobfair_limit }</td>
	</tr>
</tbody>
</table>

<div class="text-center">
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button id="btnGoUpdate" class="btn">수정하기</button>
</sec:authorize>
<input id="btnCancel" type="reset" value="확인" class="btn"/>
</div>

</form>

</div>
