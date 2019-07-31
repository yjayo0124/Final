<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
var tagvalue = '${tag }';

$(document).ready(function() {
 	$("#summernote").summernote({
		tabsize: 2,
		height: 370,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: 'ko-KR'
	}); 

	$('#tag1').click(function() {
		$('#tag1').css({
			color: "#4B89DC"
		});
		$('#tag2').css({
			color: "black"
		});
		$('#tag3').css({
			color: "black"
		});
		
		$('input[name=selectTag]').attr('value','강추');
	});
	
	$('#tag2').click(function() {
		$('#tag2').css({
			color: "#4B89DC"
		});
		$('#tag1').css({
			color: "black"
		});
		$('#tag3').css({
			color: "black"
		});
		
		$('input[name=selectTag]').attr('value','비추');
	});
	
	$('#tag3').click(function() {
		$('#tag3').css({
			color: "#4B89DC"
		});
		$('#tag1').css({
			color: "black"
		});
		$('#tag2').css({
			color: "black"
		});
		
		$('input[name=selectTag]').attr('value','취업고민');
	});
	
	$('#updateBtn').click(function() {
		$("form").submit();
	});
	
});
</script>
<style type="text/css">
h1 {
	font-size: 50px;
	font-weight: bold;
	margin: 0;
}

#title {
	margin-bottom: 7px;
	border: 3px solid #dddddd;
	padding: 5px;
	width: 100%;
	border-radius: 8px;
	height: 50px;
}

#content {
	margin: 3px;
	margin-bottom: 7px;
	border: 3px solid #dddddd;
	padding: 5px;
	width: 100%;
	border-radius: 8px;
	height: 500px;
}

#titlename, #contentname {
	font-weight: bold;
	font-size: 20px;
}

#tagcomment {
	font-weight: bold;
	font-size: 12px;
}

#updateBtn {
	float: right;
	height: 33px;
	background-color: #0080ff;
	border: 2px solid #0080ff;
	color: white;
	border-radius: 8px;
	margin-right: 2px;
}

.review-hr {
	border: solid 2px #e9e9e9;
	background-color: #e9e9e9;
	width: 100%;
	align: center;
}

.tag {
	font-size: 17px;
	font-weight: bold;
	cursor: pointer;
}
</style>

<body>
<sec:authentication property="details" var="member"/>   
    <sec:authorize access="isAuthenticated()">
		<c:set var="mem" value="${member.member_no }"/>
</sec:authorize>

<br>
<h1>기업리뷰</h1>
<br>
<hr class="review-hr">
<br>
<c:forEach items="${reviewlist }" var="i">
	<div id="tag">
		<label class="tag" id="tag1">강추</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="tag" id="tag2">비추</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="tag" id="tag3">취업고민</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label id="tagcomment">* 변경할 태그를 선택해 주세요</label>
	</div>
	<br>
	
	<form action="/review/update" method="post">
		<label id="titlename">제목</label><br>
		<input type="text" id="title" name="title" value="${i.review_title }"/><br><br>
		
		<label id="contentname">본문</label><br>
		<textarea id="summernote" name="content">${i.review_content }</textarea>
		
		<input type="hidden" id="selectTag" name="selectTag" value="${i.review_tag }"/> <!-- tag 선택시 저장되는 곳 -->
		<input type="hidden" id="reviewno"  name="reviewno" value="${i.review_no }"/>
		<button type="submit" id="updateBtn">수정</button>
	</form>
</c:forEach>

</body>
</html>