<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!-- summer note korean language pack -->
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#summernote').summernote({
		height: 300,          // 기본 높이값
	    minHeight: null,      // 최소 높이값(null은 제한 없음)
	    maxHeight: null,      // 최대 높이값(null은 제한 없음)
	    focus: true,          // 페이지가 열릴때 포커스를 지정함
	    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
	});
	
	//작성버튼 동작
	$("#btnWrite").click(function() {
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>

<style type="text/css">
.container {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
#content{
	width:98%;
}
</style>
<div class="container">
<h3>채용공고등록</h3>

<form action="/recruitment/write" method="post" enctype="multipart/form-data">
<div>
<label>●기업명</label>
<input type="text" name="recruit_name" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>●공고 제목</label>
<input type="text" name="recruit_title" placeholder="내용을 입력해 주세요">
</div>
&nbsp;&nbsp;&nbsp;
<div>
<label>●지원 자격</label>
</div>
&nbsp;
<div>
<label>경력</label>
<input type="text" name="recruit_career" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>학력</label>
<input type="text" name="recruit_educareer" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>우대 자격증</label>
<input type="text" name="recruit_certificate" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>우대 전공</label>
<input type="text" name="recruit_major" placeholder="내용을 입력해 주세요">
</div>
&nbsp;&nbsp;&nbsp;
<div>
<label>●근무 조건</label>
</div>
&nbsp;
<div>
<label>고용형태</label>
<select name="recruit_type">
     <option value="정규직">정규직</option>
      <option value="계약직">계약직</option>
      <option value="파견직">파견직</option>
</select>
</div>
&nbsp;
<div>
<label>급여</label>
<input type="text" name="recruit_sal" placeholder="내용을 입력해 주세요">원
</div>
&nbsp;
<div>
<label>요일및 시간</label>
<input type="checkbox" name="recruit_time" value="mon">월
<input type="checkbox" name="recruit_time" value="tue">화
<input type="checkbox" name="recruit_time" value="weds">수
<input type="checkbox" name="recruit_time" value="tur">목
<input type="checkbox" name="recruit_time" value="fri">금
<input type="checkbox" name="recruit_time" value="sat">토
<input type="checkbox" name="recruit_time" value="sun">일
<select name="recruit_time">
	<option value="0900">09:00</option>
	<option value="1000">10:00</option>
	<option value="1100">11:00</option>
	<option value="1200">12:00</option>
	<option value="1300">13:00</option>
	<option value="1400">14:00</option>
	<option value="1500">15:00</option>
	<option value="1600">16:00</option>
	<option value="1700">17:00</option>
	<option value="1800">18:00</option>
	<option value="etc">기타</option>
</select> 부터
<select name="recruit_time">
	<option value="0900">09:00</option>
	<option value="1000">10:00</option>
	<option value="1100">11:00</option>
	<option value="1200">12:00</option>
	<option value="1300">13:00</option>
	<option value="1400">14:00</option>
	<option value="1500">15:00</option>
	<option value="1600">16:00</option>
	<option value="1700">17:00</option>
	<option value="1800">18:00</option>
	<option value="etc">기타</option>
</select> 까지
</div>
&nbsp;
<div>
<label>직급</label>
<input type="text" name="recruit_position" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>상세요강 이미지파일</label>
<input type="file" name="file" id="file"/>
<label>상세요강 글</label>
<textarea name="content" id="summernote"></textarea>
</div>
</form>
&nbsp;&nbsp;&nbsp;

<div class="form-group">
<button type="button" id="btnWrite" class="btn btn-success">공고 등록</button>
<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>
</div>