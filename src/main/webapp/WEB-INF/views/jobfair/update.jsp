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
	
	$("#summernote").summernote({
		tabsize: 2,
		height: 370,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR'
	});

	$("#summernote").summernote('pasteHTML', string);
	
	$("#btnUpdate").click(function() {
		$("form").submit();
	});
	
	$("#btnDelete").click(function(update) {
		consolo.log(update.jobfair_no);
		$(location).attr("href","/jobfair/delete?jobfair_no=" + update.jobfair_no);
	});
	
	$("#btnCancel").click(function() {
		$(location).attr("href", "/jobfair/main");
	});
	
});

</script>


<div class="body">

<h4>수정 페이지</h4>
<hr>

<form action="/jobfair/update" method="post" enctype="multipart/form-data">
<input type="hidden" name="jobfair_no" value="${update.jobfair_no }" />

<table class="table  table-bordered table-striped table-hover table-condensed">
<thead>
</thead>

<tbody>
	<tr>
		<td>제목</td>
		<td><input type="text" name="jobfair_name" id="jobfair_name" value="${update.jobfair_name }"/></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>관리자</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${update.jobfair_date }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea id="summernote" name="jobfair_content">${update.jobfair_content }	</textarea>	</td>
	</tr>
	<tr>
		<td>시작일</td>
		<td><input type="date" name="jobfair_start" id="jobfair_start" value="${update.jobfair_start }" /></td>
	</tr>
	<tr>
		<td>종료일</td>
		<td><input type="date" name="jobfair_end" id="jobfair_end" value="${update.jobfair_end }" /></td>
	</tr>
	<tr>
		<td>장소</td>
		<td><input type="text" name="jobfair_loc" id="jobfair_loc" value="${update.jobfair_loc }" /></td>
	</tr>
	<tr>
		<td>신청기간</td>
		<td><input type="date" name="jobfair_limit" id="jobfair_limit" value="${update.jobfair_limit }" />
			~ <input type="date" name="jobfair_limit" id="jobfair_limit" value="${update.jobfair_limit }" /></td>
	</tr>
</tbody>
</table>

<div>
<label for="file">파일첨부</label>
<input type="file" name="file" id="file"/>
</div>
<br>
<br>

<div class="text-center">
<button id="btnUpdate" class="btn">수정</button>
<button id="btnDelete" class="btn">삭제</button>
<input id="btnCancel" type="reset" value="취소" class="btn"/>
</div>

</form>

</div>
