<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">

</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnGoMain").click(function() {
		$(location).attr("href", "/jobfair/main");
	});
});
</script>


<div class="wrap">
<div class="body">

<h4>검색 결과</h4>
<hr>

<table class="table  table-bordered table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 15%;">글쓴이</th>
		<th style="width: 20%;">등록일</th>
	</tr>
</thead>

<tbody>
	<c:forEach items="${list }" var="i">
	<tr>
		<td>${i.jobfair_no }</td>
	
		<td><a href="/jobfair/adminview?jobfair_no=${i.jobfair_no}">${i.jobfair_name }</a></td>
	
		<td>관리자</td>
	
		<td>${i.jobfair_date }</td>
	</tr>
	</c:forEach>
</tbody>
</table>

<div>
	<button id="btnGoMain" class="btn">메인페이지</button>
</div>

</div>
</div>