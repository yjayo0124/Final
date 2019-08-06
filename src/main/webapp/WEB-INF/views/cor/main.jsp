<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<style type="text/css">

thead>tr{
	font-size: 18px;
}

</style>

<div class="container" style="width: 600px;">
<div style="margin-top:100px; display: block; ">

<h3><u>${cor.cor_name }</u>의 <br>인사담당자님 안녕하세요?</h3>
	<hr>
	<div class="info" style="width: 500px; height: 100px; margin: 0 auto;">
	<a class="btn btn-default btn-lg btn-block center" href="/recruitment/write" role="button">공고 등록 하러가기</a>
	<a class="btn btn-default btn-lg btn-block center" href="/resume/list" role="button">인재 검색</a>
	<a class="btn btn-default btn-lg btn-block center" href="/cor/resumeScrab" role="button">스크랩한 인재</a>
	<a class="btn btn-default btn-lg btn-block center" href="/cor/memCheck" role="button">기업 정보 수정</a>
	</div>
	 

<div class="list" style="margin-top: 140px;">
<h4><u>${cor.cor_name }</u>에서 지금까지 올린 공고</h4>

<div style="border: 1px solid #ccc; height: 300px; overflow: auto;">
<table class="table table-hover table-condensed" style="width: 90%; margin: 0 auto;" >
	<thead>
		<tr >
			<th style="width: 15%; text-align: center;">공고번호</th>	
			<th style="width: 65%; text-align: center;">공고 제목</th>
			<th style="width: 20%; text-align: center;">채용타입</th>	
		</tr>
	</thead>
	<tbody>
<c:forEach items="${list }" var="i">
	<tr onclick="location.href='/recruitment/view?recruit_no=${i.recruit_no }'">
		<td style="text-align: center;">${i.recruit_no }</td>
		<td style="text-align: center;">${i.recruit_title }</td>
		<td>${i.recruit_type }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>

</div>

<div style="margin-top: 60px;">
<a href="https://mail.google.com/mail/u/0/?view=cm&fs=1&tf=1&source=mailto&to=yjyao0124@gmail.com" target="_blank"><h4>기업리뷰 관련 문의 하러가기</h4></a>
</div>
</div>


</div>