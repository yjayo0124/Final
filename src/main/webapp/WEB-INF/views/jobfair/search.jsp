<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnGoMain").click(function() {
		$(location).attr("href", "/jobfair/main");
	});
	
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

.btn {
	background-color: #011627;
	color: #ffffff;
} 

thead {
	background-color: #343a40; 
	color: #ffffff;
}
</style>

<div class="wrap">
<div class="body">

<h2>검색 결과</h2>
<hr>

<div>
<table class="table table-hover">
<thead>
	<tr>
		<th style="width: 10%;">번호</th>
		<th style="width: 40%;">제목</th>
		<th style="width: 10%;">글쓴이</th>
		<th style="width: 20%;">등록일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${list }" var="i">
	<tr>
		<td>${i.jobfair_no }</td>
	
		<td><a href="/jobfair/adminview?jobfair_no=${i.jobfair_no}">${i.jobfair_name }</a></td>
	
		<td>관리자</td>
	
		<td><fmt:formatDate value='${i.jobfair_date }' pattern="yyyy-MM-dd" /></td>
	</tr>
	</c:forEach>
</tbody>
</table>
</div>
<br>
<br>

<div>
	<button id="btnGoMain" class="btn">메인페이지</button>
</div>

</div>
</div>
