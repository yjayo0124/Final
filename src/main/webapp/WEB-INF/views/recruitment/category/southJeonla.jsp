<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<style type="text/css">

button {
	float:right;
	margin-left : 100px;
	padding: 20px;
}
col-md-2 {
	width: 100px;
	padding: 20px;
	margin-botton: 20px;
	float :left;
}
table, th {
	text-align: center;
}
#pagingBox {
	position: relative;
	margin-top: 20px;
}

.content {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
	width: 900px;
	padding: 20px;
	margin-botton:20px;
	float: left;
}
</style>


<div class="col-md-2">
<!-- side menu-->
<div class="side">
      <i class="glyphicon glyphicon-map-marker"></i>
      <span>지역선택</span>
    </div>
  
    <ul class="list-group">
      <li class="list-group-item"><a href="/recruitment/main">전국</a></li>
      <li class="list-group-item"><a href="/recruitment/category/seoul">서울</a></li>
      <li class="list-group-item"><a href="/recruitment/category/busan">부산</a></li>
      <li class="list-group-item"><a href="/recruitment/category/daegu">대구</a></li>
      <li class="list-group-item"><a href="/recruitment/category/incheon">인천</a></li>
      <li class="list-group-item"><a href="/recruitment/category/gwangju">광주</a></li>
      <li class="list-group-item"><a href="/recruitment/category/daejeon">대전</a></li>
      <li class="list-group-item"><a href="/recruitment/category/ulsan">울산</a></li>
      <li class="list-group-item"><a href="/recruitment/category/sejong">세종</a></li>
      <li class="list-group-item"><a href="/recruitment/category/gyeonggi">경기</a></li>
      <li class="list-group-item"><a href="/recruitment/category/gangwon">강원</a></li>
      <li class="list-group-item"><a href="/recruitment/category/northChungcheong">충북</a></li>
      <li class="list-group-item"><a href="/recruitment/category/northJeonla">전북</a></li>
      <li class="list-group-item"><a href="/recruitment/category/southJeonla">전남</a></li>
      <li class="list-group-item"><a href="/recruitment/category/southgyeongsang">경남</a></li>
      <li class="list-group-item"><a href="/recruitment/category/jeju">제주</a></li>
    </ul>
</div>

<div class="content">

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width:10%;">공고번호</th>
		<th style="width:20%;">기업명</th>
		<th style="width:60%;">채용공고명</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${List }" var="i">
<c:if test="${i.recruit_loc eq '전남'}">
<tr>
	<td>${i.recruit_no }</td>
	<td>${i.recruit_name }</td>
	<td><a href="/recruitment/view?recruit_no=${i.recruit_no}">${i.recruit_title }</a></td>
</tr>
</c:if>
</c:forEach>
</tbody>

</table>

<sec:authorize access="hasRole('ROLE_COR')">
<button onclick="location.href='/recruitment/write'" class="btn btn-default btn-sm">공고등록하기</button>
</sec:authorize>
</div>
