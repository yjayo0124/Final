<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<script type="text/javascript">

	$(document).ready(function(){
		
		$("#btnSearch").click(function() {
			location.href="/resume/list?search="+$("#search").val();
		});
		
	})

</script>

<style type="text/css">


.lst{
	
	display: inline-block;
}

.name{
	font-weight: bold;
	color: #333333;
}

.gender{
	color: #888888;
	line-height: 23px;
	font-size: 15px;
}

.resumeName{
	text-align: center;
}


.summary{

	text-align: left;
}

.summary-container{
	margin-left: 70px;
}

.title{
	font-weight: bold;
	font-size:19px;
	color: #000;
	
}

.resumeName-container, .summary-container, .date-container{

	padding-top: 21px;
	padding-bottom: 25px;
}


.thead{

background-color: #343a40;
color: white;
	
}


#btnSearch{
	background-color: #343a40;
	color: white;
}

.thead tr{
	height: 30px;
}


dd{
	margin-right: 17px;
	font-size: 15px;
}
</style>

<div style="margin-top:50px;">
<h2 onclick="location.href='/resume/list'">관심 지정한 이력서</h2>
<hr>
<form></form>
<table class="table table-hover table-condensed" >
	<thead class="thead"> 
		<tr >
			<th style="width: 10%; text-align: center;">성명</th>	
			<th style="width: 70%; text-align: center;">이력서 요약</th>
			<th style="width: 20%; text-align: center;">업데이트 날짜</th>	
		</tr>
	</thead>
	<tbody>
<c:forEach items="${list }" var="i">
	<tr>
		<td class="resumeName">
			<div class="resumeName-container">
			<div style="float: left; padding: 5px;"><img src="/resources/images/star.png" height="20px" /></div>
			<div class="name"><span>${i.RESUME_NAME }</span></div>
			<div class="gender"><span>(${i.RESUME_GENDER })</span></div>
			</div>
		</td>

		<td class="summary" onclick="location.href='/resume/view?resume_no=${i.RESUME_NO }'">
			<div class="summary-container">
			<div class="title"><span>${i.RESUME_TITLE }</span></div>
			<div class="want">
				<dl class="lst">
					<dd><span>${i.SALARY } 만원</span></dd>
				</dl>
				<dl class="lst" style="color: #3333"><dd>|</dd></dl>
				<dl class="lst">
					<dd><span>${i.DESIRED_WORK_PLACE }</span></dd>
				</dl>
				<dl class="lst" style="color: #3333"><dd>|</dd></dl>
				<dl class="lst">
					<dd><span>${i.FORMS_EMPLOYMENT }</span></dd>
				</dl>
			</div>
			</div>
		</td>
		<td style="text-align: center; color: #999;">
			<div class="date-container">
			<fmt:formatDate value="${i.RESUME_WRITENDATE }" pattern="MM-dd" />
			</div>
		</td>
	</tr>
</c:forEach>
</tbody>
</table>


</div>

 