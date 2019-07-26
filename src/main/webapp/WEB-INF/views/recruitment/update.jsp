<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>


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
$(document).ready(function(){
	$("#summernote").summernote({
		tabsize: 2,
		height: 370,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR'
	});
	
	$("#btnUpdate").click(function(){
		$("form").submit();
	});
	
	
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
})
		
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

<input type="hidden" name="recruit_no" value="${recruit.recruit_no }" />

<div>
<label>●기업명 </label>
<input type="text" name="recruit_name" id="recruit_name" value=${cor.cor_name }>
</div>


&nbsp;
<div>
<label>●공고 제목</label>
<input type="text" name="recruit_title" id="recruit_title" placeholder="내용을 입력해 주세요">
</div>
&nbsp;&nbsp;&nbsp;
<div>
<label>●지원 자격</label>
</div>
&nbsp;
<div>
<label>경력</label>
<input type="text" name="recruit_career" id="recruit_career" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>학력</label>
<input type="text" name="recruit_educareer" id="recruit_educareer" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>우대 자격증</label>
<input type="text" name="recruit_certificate" id="recruit_certificate" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>우대 전공</label>
<input type="text" name="recruit_major" id="recruit_major" placeholder="내용을 입력해 주세요">
</div>
&nbsp;&nbsp;&nbsp;
<div>
<label>●근무 조건</label>
</div>
&nbsp;
<div>
<label>근무지역</label>
<select name="recruit_loc">
     <option value="서울">서울</option>
      <option value="부산">부산</option>
      <option value="대구">대구</option>
      <option value="인천">인천</option>
      <option value="광주">광주</option>
      <option value="대전">대전</option>
      <option value="울산">울산</option>
      <option value="세종">세종</option>
      <option value="경기">경기</option>
      <option value="강원">강원</option>
      <option value="충북">충북</option>
      <option value="전북">전북</option>
      <option value="전남">전남</option>
      <option value="경남">경남</option>
      <option value="제주">제주</option>
</select>
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
<input type="number" name="recruit_sal" >원
</div>
&nbsp;&nbsp;
<div>
<label>직급</label>
<input type="text" name="recruit_position" placeholder="내용을 입력해 주세요">
</div>
&nbsp;
<div>
<label>상세요강 이미지파일</label>
<input type="file" name="file" id="file"/>
</div>
&nbsp;
<div>
<label>추가할 상세요강 글</label>
<textarea  id="summernote" name="recruit_content"></textarea>
</div>
&nbsp;&nbsp;&nbsp;
<div class="text-center">
<button type="button" id="btnUpdate" class="btn btn-success">공고 수정</button>
<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>

</form>
</div>
