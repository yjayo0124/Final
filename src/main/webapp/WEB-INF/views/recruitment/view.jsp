<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<script type="text/javascript">
$(document).ready(function() {
	//홈페이지지원 버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "#");
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

<div class="wrap">

<div class="container">

<h1>채용정보</h1><hr>
*기업명<br>
*채용공고명<br><hr>

*지원자격<br>
경력<br>
학력<br>
우대자격증<br>
우대 전공<br><br>

*근무자격<br>
고용형태<br>
급여<br>
요일 및 시간<br>
직급<br><br>

*기업형태<br>
대표자명<br>
회사주소<br>
</div>

<div class="text-center">
	<button id="btnSubmit" class="btn btn-primary">홈페이지지원</button>
	<button id="btnScrab" class="btn btn-primary">스크랩</button>
</div>

<h3>상세요강</h3><hr>

</div>