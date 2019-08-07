<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">



<style type="text/css">

thead>tr{
	font-size: 18px;
}


p{
 font-size: 12px;
}


.badge{
	margin-top: 5px;
	height: 22px;
}
</style>

<div class="container" style="width: 600px;">
<div style="margin-top:100px; display: block; ">

<h2><u>${cor.cor_name }</u>의 <br>인사담당자님 안녕하세요?</h2>
	<hr>

<div class="list-group">
  <a href="/recruitment/write" class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h3 class="mb-1">공고 등록하러 가기</h3>
    </div>
    <p class="mb-1">구인을 위한 공고를 등록을 시작하세요!</p>
  </a>
  <a href="/resume/list" class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h3 class="mb-1">인재 둘러 보기</h3>
    </div>
    <p class="mb-1">KHOB 이용자들이 직접 올린 구직 이력서를 확인하세요.</p>
  </a>
  <a href="/cor/resumeScrab" class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h3 class="mb-1">스크랩한 인재 목록</h3>
      <span class="badge badge-primary badge-pill d-flex align-items-center">${count }</span>
    </div>
    <p class="mb-1">회원님이 스크랩한 이력서 모아보기</p>
  </a>
  <a href="/cor/memCheck" class="list-group-item list-group-item-action">
    <div class="d-flex w-100 justify-content-between">
      <h3 class="mb-1">기업 정보 수정</h3>
    </div>
    <p class="mb-1">기업 정보 수정 및 비밀번호 수정하러 가기</p>
  </a>
</div>


<div class="list" style="margin-top: 140px;">
<h3><u>${cor.cor_name }</u>에서 지금까지 올린 공고</h3>

<div style="border: 1px solid #ccc; height: 300px; overflow: auto;">
<table class="table table-hover table-condensed" style="width: 90%; margin: 0 auto;" >
	<thead>
		<tr style="font-size: 16px;" >
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