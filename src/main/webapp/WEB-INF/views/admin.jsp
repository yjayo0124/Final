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


<style type="text/css">

.withdrawBtn{

	border: none;
	background-color:#011627; 
	color: white;
	height: 34px;
	width: 54px;
	border-radius: 4px;
}

#btnSearch{
	
	border: none;
	background-color: #011627;
	color: white;
	height: 34px;
	width: 54px;
}

.idvList{

	border : 1px solid #011627;
	background-color: #011627;
	color: white;
	
}


.corList{

	border :1px solid #011627;
	background-color: white;
	color: #011627;
}

</style>

<div style="margin-top:50px;">
<a href="/admin" style="color: black"><h2>회원관리</h2></a>
<hr>
<div style="width: 1050px; margin: 0 auto; margin-top: 30px;">
	<button class="idvList" onclick="location='/admin'">모든회원리스트</button>
	<button class="corList" onclick="location='/adminCorList'">기업회원리스트</button>
<form action="/admin/idvDelete" method="POST">
<table class="table table-hover table-condensed" >
	<thead>
		<tr >
			<th style="width: 10%; text-align: center;">번호</th>	
			<th style="width: 15%;">ID</th>
			<th style="width: 15%;">이름</th>
			<th style="width: 20%">전화번호</th>
			<th style="width: 25%;">이메일</th>
			<th style="width: 7.5%;">회원구분</th>		
			<th style="width: 7.5%; text-align: center;">비활성화</th>	
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
		<td style="text-align: center;">
			
		  	<div class="checkbox">
    		<label><input type="checkbox" name="checked" value="${i.member_no }"></label>
 			 </div>
 			 
		</td>
	</tr>
</c:forEach>
</tbody>
</table>

	<div style="text-align: right;"><button class="withdrawBtn" type="submit">탈퇴</button></div>
</form>
</div>
</div>
<c:import url="/WEB-INF/views/layout/adminPaging/paging.jsp"/>


<div class="form-inline text-center">

		<input class="form-control" type="text" id="search" name="search" placeholder="회원 이름 검색"/>
		<button id="btnSearch" class="btn">검색</button>
</div> 
