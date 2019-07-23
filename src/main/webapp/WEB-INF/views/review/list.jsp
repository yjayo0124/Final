<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js">
</script>
<script src="http://code.jquery.com/jquery-1.7.js"	type="text/javascript"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
var tagvalue = '${tag }';

$(document).ready(function() {
	$('input[name=selectTag]').attr('value','전체');
	
	// 검색 자동완성 기능
	$('#keyword').autocomplete({
		source:function(request,response){
			$.ajax({
				url: "/review/autocomplete",
				type:"post",
				dataType:"json",
				data:{ keyword : $('#keyword').val()},
				success: function(data){
					response(
						$.map(data, function(item) {
							return {
								value : item.data
							}
						})
						)
				},
				error : function(data) {
					alert("에러가 발생하였습니다.")
				}
			});
		}
	});
	
	if(tagvalue == '전체') {
		$('#tag1').css({
			color: "#4B89DC"
		});
		$('#tag2').css({
			color: "black"
		});
		$('#tag3').css({
			color: "black"
		});
		$('#tag4').css({
			color: "black"
		});
	}

	if(tagvalue == '강추') {
		$('#tag2').css({
			color: "#4B89DC"
		});
		$('#tag1').css({
			color: "black"
		});
		$('#tag3').css({
			color: "black"
		});
		$('#tag4').css({
			color: "black"
		});
	}

	if(tagvalue == '비추') {
		$('#tag3').css({
			color: "#4B89DC"
		});
		$('#tag1').css({
			color: "black"
		});
		$('#tag2').css({
			color: "black"
		});
		$('#tag4').css({
			color: "black"
		});
	}

	if(tagvalue == '취업고민') {
		$('#tag4').css({
			color: "#4B89DC"
		});
		$('#tag1').css({
			color: "black"
		});
		$('#tag2').css({
			color: "black"
		});
		$('#tag3').css({
			color: "black"
		});
	}
});

function writePop(){
	window.open("http://localhost:8088/review/writePop", "글쓰기", "width=1000, height=650");
}

</script>

<style type="text/css">

h1 {
	font-size: 50px;
	font-weight: bold;
	margin: 0;
}

.ui-menu-item, .ui-autocomplete, .ui-menu, .ui-widget, .ui-widget-content, .ui-corner-all {
	width: 300px;
	font-size: 12px;
}

a {
	color: black;
}

table {
	width: 100%;
	border-top: 3px solid #444444;
	border-bottom: 3px solid #444444;
	border-left: 0px solid white;
	border-right: 0px solid white;
	border-collapse: collapse;
	margin: auto;
}

th {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
	background-color: #e9e9e9;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
}


.review-hr {
	border: solid 2px #e9e9e9;
	background-color: #e9e9e9;
}

.search {
	float: right;
}

.tag {
	font-size: 17px;
	font-weight: bold;
}

#tag1 {
	color: #4B89DC;
}

#keyword {
	width: 300px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
}

#pagingBox {
	position: relative;
}

#reviewBtn {
	float:right;
}
</style>

</head>
<body>

<c:set var="pagingTag" value="전체"/>

<br>
<h1>기업리뷰</h1>
<br>
<hr class="review-hr">
<div class="search">
	<h5>*태그와 게시글을 검색해 주세요</h5>
	<form action="/review/list?tag=${tag }" method="post">
		<input type="text" name="keyword" id="keyword"/>
		<input type="submit" id="searchBtn" value="검색">
	</form>
	<button id="reviewBtn" onclick="writePop()">글쓰기</button>
</div>
<br><br>
<div id="tag">
	<a href="/review/list?tag=전체" id="tag1"><label class="tag">전체</label></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/review/list?tag=강추" id="tag2"><label class="tag">강추</label></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/review/list?tag=비추" id="tag3"><label class="tag">비추</label></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/review/list?tag=취업고민" id="tag4"><label class="tag">취업고민</label></a>
</div>
<br>

<table id="tbl">
	<tr>
		<th>No</th>
		<th>기업이름</th>
		<th>제목</th>
	</tr>
	<c:forEach items="${reviewlist }" var="i">
		<tr>
			<td id = "tagno">${i.REVIEW_NO }</td>
			<td id = "tagcor">${i.COR_NAME }</td>
			<td id = "tagtitle">${i.REVIEW_TITLE }</td>
		</tr>
		<input type="hidden" value="${pagingTag = i.REVIEW_TAG}"/> 
<!-- 	<tr> -->
<!-- 		<td id = "tagno"></td> -->
<!-- 		<td id = "tagcor"></td> -->
<!-- 		<td id = "tagtitle"></td> -->
<!-- 	</tr> -->
	</c:forEach>
</table>

<input type="hidden" id="selectTag" name="selectTag" value="전체"></input> <!-- tag 선택시 저장되는 곳 -->

<div id="pagingBox">
	<c:import url="/WEB-INF/views/layout/reviewPaging/paging.jsp" />
</div>
</body>
</html>
