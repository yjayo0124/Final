<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#btnSearch").click(function() {
			location.href="/admin?search="+$("#search").val();
		});
		
	})

</script>


<div style="margin-top:50px;">
<h2>회원관리</h2>
<hr>
<div style="width: 1050px; margin: 0 auto; margin-top: 30px;">
	<button onclick="location='/admin'">모든회원리스트</button>
	<button onclick="location='/adminCorList'">기업회원리스트</button>
<table class="table table-hover table-condensed" >
	<thead>
		<tr >
			<th style="width: 10%; text-align: center;">번호</th>	
			<th style="width: 20%;">ID</th>
			<th style="width: 15%;">이름</th>
			<th style="width: 20%">전화번호</th>
			<th style="width: 25%;">이메일</th>
			<th style="width: 10%;">회원구분</th>		
		</tr>
	</thead>
	<tbody>
<c:forEach items="${list }" var="i">
	<tr>
		<td style="text-align: center;">${i.member_no }</td>
		<td>${i.member_id }</td>
		<td>${i.member_name }</td>
		<td>${i.member_phone }</td>
		<td>${i.member_email }</td>
		<td>${i.member_auth }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
<c:import url="/WEB-INF/views/layout/adminPaging/paging.jsp"/>


<div class="form-inline text-center">

		<input class="form-control" type="text" id="search" name="search" placeholder="회원 이름 검색"/>
		<button id="btnSearch" class="btn">검색</button>
</div> 
