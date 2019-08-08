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

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnCancel").click(function() {
		$(location).attr("href", "/jobfair/main");
	});

	$("#btnGoUpdate").click(function() {
		$(location).attr("href", "/jobfair/update?jobfair_no=${viewmap.jobfair_no }");
	});
	
	$("#btnDelete").click(function() {
		$(location).attr("href","/jobfair/delete?jobfair_no=${viewmap.jobfair_no }");
	});

});

</script>


<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

.body {
	width: 1000px;
	font-family: 'Nanum Gothic', 'Spoqa Han Sans', 'Jeju Gothic', sans-serif;
	font-size: 14px;
}

#map { 
 	width: 500px; 
 	height: 350px;
} 
 
.btn {
	background-color: #011627;
	color: #ffffff;
}

h4 {
	text-align: left;
	border: 1px solid;
	border-color: #2C3E50;
	color: #2C3E50;
	padding: 15px;
}

.table > tbody > tr > td {
	vertical-align: middle;
}
</style>

<div align="center">

<div class="body">

<h4>&nbsp;${viewmap.jobfair_name }</h4>
<br>

<input type="hidden" name="jobfair_no" value="${viewmap.jobfair_no }" />

<table class="table">
<thead>
</thead>

<tbody>
	<tr>
		<td style="width: 10%;">등록일</td>
		<td><fmt:formatDate value='${viewmap.jobfair_date }' pattern="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<td style="width: 10%;">글쓴이</td>
		<td>관리자</td>
	</tr>
	<tr>
		<td style="width: 10%;">내용</td>
		<td>
			<c:if test="${file ne null }">
				<img src="/upload/${file }" style="width: 70%; heigth: auto;">
			</c:if>
			${viewmap.jobfair_content }
		</td>
	</tr>
	<tr>
		<td style="width: 10%;">시작일</td>
		<td>${viewmap.jobfair_start }</td>
	</tr>
	<tr>
		<td style="width: 10%;">종료일</td>
		<td>${viewmap.jobfair_end }</td>
	</tr>
	<tr>
		<td style="width: 10%;">장소</td>
		<td>
			${viewmap.jobfair_loc }
			<br><br>
			<div id="map"></div>
			<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
			<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=adf60f4bed100f285f60937e1dcf14a2&libraries=services,clusterer,drawing"></script>

			<script type="text/javascript">
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.498010, 127.027621), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${viewmap.jobfair_loc }', function(result, status) {
				console.log('${viewmap.jobfair_loc }');

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${viewmap.jobfair_loc }</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			
			</script>
		</td>
	</tr>
	<tr>
		<td style="width: 10%;">신청기간</td>
		<td>${viewmap.jobfair_limit }</td>
	</tr>
</tbody>
</table>

<div class="text-center">
<sec:authorize access="hasRole('ROLE_ADMIN')">

	<button id="btnGoUpdate" class="btn">수정</button>

	<button id="btnDelete" class="btn">삭제</button>
</sec:authorize>

	<input id="btnCancel" type="reset" value="확인" class="btn"/>
</div>

</div>

</div>
