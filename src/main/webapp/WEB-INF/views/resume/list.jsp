<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="margin-top:50px;">
<h2>구직자가 올린 이력서</h2>
<hr>
<form></form>
<table class="table table-hover table-condensed" >
	<thead>
		<tr >
			<th style="width: 10%; text-align: center;">이름</th>	
			<th style="width: 70%; text-align: center;">이력서 요약</th>
			<th style="width: 20%; text-align: center;">업데이트 일자</th>	
		</tr>
	</thead>
	<tbody>
<c:forEach items="${list }" var="i">
	<tr>
		<td style="text-align: center;">${i.member_no }</td>
		<td style="text-align: center;">${i.member_no }</td>
		<td style="text-align: center;">${i.member_no }</td>
	</tr>
</c:forEach>
</tbody>
</table>
<%-- <c:import url="/WEB-INF/views/layout/adminPaging/paging.jsp"/> --%>
</div>
