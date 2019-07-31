<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<!-- include summernote-ko-KR -->
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>

<script src="https://maps.google.com/maps/api/js?sensor=false"></script>


<style type="text/css">
#map {
	width: 400px;
	height: 300px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnCancel").click(function() {
		$(location).attr("href", "/jobfair/main");
	});
	
});

</script>


<script type="text/javascript">

$(document).ready(function(){
	$.ajax({
		url: '/jobfair/geocoder',
		method: 'POST',
		dataType: 'json',
		contentType: 'application/json',
		mimeType: 'application/json',
		success: function(retVal){
			console.log("성공");
			console.log(retVal.latitude + "/" + retVal.longitude);
			reloadMap(retVal.latitude, retVal.longitude);
		},
		error: function(retVal, status, error){
			console.log("실패");
			console.log("--retVal--");
			console.log(retVal);
			console.log("--status--");
			console.log(status);
			console.log("--error--");
			console.log(error);
		}
	});	
});

function initMap(){
	
	var latitude = retVal.latitude;
	console.log("lat: " + latitude);
	var longitude = retVal.longitude;
	console.log("lng: " + longitude);
	
	var loc =  {lat: latitude, lng: longitude};
	
	var map = new google.maps.Map(document.getElmenetById('map'), {
		zomm: 15,
		center: loc
	});
	
	var marker = new google.maps.Marker({
		position: loc,
		map: map
	});
	
	map.setCenter(loc);
	
}
</script>

<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD44of6Yf3YWfz6pMP6bti2bxFiuigEoZ0&callback=initMap">
</script>


<div class="body">

<h4>뷰 페이지</h4>
<hr>


<form action="/jobfair/adminview" method="post">
<input type="hidden" name="jobfair_no" value="${viewmap.jobfair_no }" />

<table class="table  table-bordered table-striped table-hover table-condensed">
<thead>
</thead>

<tbody>
	<tr>
		<td>제목</td>
		<td>${viewmap.jobfair_name }</td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>관리자</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${viewmap.jobfair_date }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<c:if test="${file ne null }">
				<img src="/upload/${file }" style="width: 70%; heigth: auto;">
			</c:if>
			${viewmap.jobfair_content }
		</td>
	</tr>
	<tr>
		<td>시작일</td>
		<td>${viewmap.jobfair_start }</td>
	</tr>
	<tr>
		<td>종료일</td>
		<td>${viewmap.jobfair_end }</td>
	</tr>
	<tr>
		<td>장소</td>
		<td>
			${viewmap.jobfair_loc }
			<br>
			<div id="map"></div>
		</td>
		
	</tr>
	<tr>
		<td>신청기간</td>
		<td>${viewmap.jobfair_limit }</td>
	</tr>
</tbody>
</table>

<div class="text-center">
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button id="btnGoUpdate" class="btn">수정하기</button>
</sec:authorize>
<input id="btnCancel" type="reset" value="확인" class="btn"/>
</div>

</form>

</div>
