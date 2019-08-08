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
	 + '<label>담당자:  </label><br> <label>사이트(출처):  </label><br><br></div>';
	
	$("#summernote").summernote('pasteHTML', string);
	
});

</script>


<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

.body {
	margin: 40px 10px;
	padding: 0;
	font-family: 'Nanum Gothic', 'Spoqa Han Sans', 'Jeju Gothic', sans-serif;
	font-size: 14px;
}

#btnRegister, #btnCancel {
	background-color: #011627;
	color: #ffffff;
}

h4 {
	text-align: left;
	border: 1px solid;
	border-color: #2C3E50;
	color: #2C3E50;
	padding: 15px;
}

.table > tbody > tr > td {
	vertical-align: middle;
}

#jobfair_limit {
	width: 483px;
}
</style>

<div align="center">

<div class="body">

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value='${now }' pattern="yyyy-MM-dd" var="nowDate"/>

<h4>등록 페이지</h4>
<br>

<form action="/jobfair/register" method="post" enctype="multipart/form-data">

<input type="hidden" name="member_no" id="member_no" value="${member.member_no }" />
<table class="table table-condensed">
<thead>
</thead>

<tbody>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">제목</td>
		<td><input type="text" name="jobfair_name" id="jobfair_name" class="form-control"  /></td>
	</tr>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">글쓴이</td>
		<td>${member_id }/${member.member_no }</td>
	</tr>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">등록일</td>
		<td><c:out value="${nowDate }" /></td>
	</tr>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">내용</td>
		<td><textarea id="summernote" name="jobfair_content"></textarea></td>
	</tr>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">시작일</td>
		<td><input type="date" name="jobfair_start" id="jobfair_start" class="form-control" /></td>
	</tr>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">종료일</td>
		<td><input type="date" name="jobfair_end" id="jobfair_end" class="form-control" /></td>
	</tr>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">장소</td>
		<td><input type="text" name="jobfair_loc" id="jobfair_loc" class="form-control" /></td>
	</tr>
	<tr>
		<td style="border-right: 0.1px solid; border-right-color: lightgrey; width: 10%;">신청기간</td>
		<td>
			<div class="form-inline">
			<input type="date" name="jobfair_limit" id="jobfair_limit" class="form-control" />&nbsp;
			 ~  &nbsp;<input type="date" name="jobfair_limit" id="jobfair_limit" class="form-control" />
			</div>
		</td>
	</tr>
</tbody>
</table>

<div class="form-group" style="text-align: left;">
	<label for="file">파일첨부</label>
	<input type="file" name="file" id="file" />
</div>
<br>
<br>

<div class="text-center">
	<button id="btnRegister" class="btn">등록</button>
	<input id="btnCancel" type="reset" value="취소" class="btn"/>
</div>

</form>

</div>

</div>

