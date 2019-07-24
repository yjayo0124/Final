<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	$("#btnFile").click(function() {
		
	});
	
	$("#btnRegister").click(function() {
		$("form").submit();
	});
	
	$("#btnCancel").click(function() {
		$(location).attr("href", "/jobfair/main");
	});
	
		
	$("#summernote").summernote({
		tabsize: 2,
		height: 370,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR'
	});

	var string = 
	'<div><label>일시:  </label><br> <label>장소:  </label><br>'
	 + '<label>참가 대상:  </label><br> <label>행사 구성:  </label><br>'
	 + '<label>개인 신청 기간:  </label><br> <label>기업 신청 기간:  </label><br>'
	 + '<label>담당자:  </label><br> <label>사이트(출처):  </label><br></div>';
	
	$("#summernote").summernote('pasteHTML', string);
});



</script>


<div class="body">

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value='${now }' pattern="yyyyMMdd" var="nowDate"/>

<form action="/jobfair/register" method="post" enctype="multipart/form-data">

<table class="table  table-bordered table-striped table-hover table-condensed">
<thead>
</thead>

<tbody>
	<tr>
		<td>제목</td>
		<td><input type="text" name="jobfair_name" id="jobfair_name" /></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>${member_id }/${member.member_no }</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td><c:out value="${nowDate }" /></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea id="summernote" name="jobfair_content"></textarea></td>
	</tr>
	<tr>
		<td>시작일</td>
		<td><input type="date" name="jobfair_start" id="jobfair_start" /></td>
	</tr>
	<tr>
		<td>종료일</td>
		<td><input type="date" name="jobfair_end" id="jobfair_end" /></td>
	</tr>
	<tr>
		<td>장소</td>
		<td><input type="text" name="jobfair_loc" id="jobfair_loc" /></td>
	</tr>
	<tr>
		<td>신청기간</td>
		<td><input type="date" name="jobfair_limit" id="jobfair_limit" />
			~ <input type="date" name="jobfair_limit" id="jobfair_limit" /></td>
		<td><input type="hidden" name="member_no" id="member_no" value="${member.member_no }" /></td>
	</tr>
	
		
	
</tbody>
</table>

<div>
<button id="btnFile">파일첨부</button>
</div>
<br>
<br>

<div class="text-center">
<button id="btnRegister">등록</button>
<button id="btnCancel">취소</button>
</div>

</form>

</div>
