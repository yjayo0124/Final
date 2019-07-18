<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
table, th {
	text-align: center;
}
#pagingBox {
	position: relative;
}

.content {
	border-left: 1px solid #eee;
	border-right: 1px solid #eee;
}
</style>


<div class="col-md-2">
<!-- side menu-->
<div class="side">
      <i class="glyphicon glyphicon-map-marker"></i>
      <span>지역선택</span>
    </div>
  
    <ul class="list-group">
      <li class="list-group-item"><a href="#">전국</a></li>
      <li class="list-group-item"><a href="#">서울</a></li>
      <li class="list-group-item"><a href="#">부산</a></li>
      <li class="list-group-item"><a href="#">대구</a></li>
      <li class="list-group-item"><a href="#">인천</a></li>
      <li class="list-group-item"><a href="#">광주</a></li>
      <li class="list-group-item"><a href="#">대전</a></li>
      <li class="list-group-item"><a href="#">울산</a></li>
      <li class="list-group-item"><a href="#">세종</a></li>
      <li class="list-group-item"><a href="#">경기</a></li>
      <li class="list-group-item"><a href="#">강원</a></li>
      <li class="list-group-item"><a href="#">충북</a></li>
      <li class="list-group-item"><a href="#">전북</a></li>
      <li class="list-group-item"><a href="#">전남</a></li>
      <li class="list-group-item"><a href="#">경남</a></li>
      <li class="list-group-item"><a href="#">제주</a></li>
    </ul>
</div>

<div class="content">
<div id="btnBox">
<button onclick="location.href='/recruitment/write'">공고등록하기</button>
</div>
<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width:20%;">기업명</th>
		<th style="width:60%;">채용공고명</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${recruitList }" var="i">
<tr>
	<td><a href="#">${i.recruit_name }</a></td>
	<td><a href="/recruitment/view?recruit_no=${i.recruit_no }">${i.recruit_title }</a></td>
</tr>
</c:forEach>
</tbody>

</table>

</div>

<div id="pagingBox">
<c:import url="/WEB-INF/views/recruitment/paging.jsp"/>
</div>


