<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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
	
	$("#searchBtn").click(function() {
		 $.ajax({
			 url: "/review/scantable",
			 type: "get",
			 dataType: "json",
			 data: { keyword : $('#keyword').val()},
			 success: function(data) {
				 console.log(data);
				 if(data.data == null) {
					 alert("                   검색결과 존재하지 않는 기업입니다.\n                   기업이름을 정확히 입력해 주세요.");
				 } else {
					 $("form").submit();
				 }
			 },
			 error : function(data) {
				 alert("에러가 발생하였습니다.")
			 }
		 });
	});
	
	$(document).on('click', '#like', function(){
		// 현재 클릭된 Row(<tr>)
		var tr = $(this).parent().parent().parent();
		var td = tr.children();
		
		var like =  $(this).parent().parent().children();
		var image = event.target;
		var change = like.eq(1).children().val();
		var memno = $(this).parent().parent().parent().children();
		
		console.log("클릭 값 : "+ memno.eq(0).children().val());

		 $.ajax({
			 url: "/review/addlike",
			 type: "post",
			 dataType: "json",
			 data: { reviewno : td.eq(0).text(), change : like.eq(1).children().val(), memno : memno.eq(0).children().val()},
			 success: function(data) {
				 console.log("data : " + data.data);
				 console.log("member : " + memno);
	
				 if(${empty pageContext.request.userPrincipal }) {
					 alert("로그인 하세요");
				 } else {
					 if(change == 0) {
						 like.eq(1).children().html(data.data);
						 image.src = "/resources/images/afterlike.png";
						 $(like.eq(1).children().val(1));
						 console.log("after_change : " + change);
					 } else if(change == 1) {
						 like.eq(1).children().html(data.data);
						 console.log(data.data);
						 image.src = "/resources/images/beforelike.png";
						 $(like.eq(1).children().val(0));
						 console.log("before_change : " + change);
					 }
				 }
			 },
			 error : function(data) {
				 alert("로그인 하세요");
			 }
		 });
		
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

h6 {
	float: right;
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
	width: auto;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
}

a:link {
	text-decoration: none;
}

.review-hr {
	border: solid 2px #e9e9e9;
	background-color: #e9e9e9;
	margin: 5px;
}

.search {
	float: right;
}

.tag {
	font-size: 17px;
	font-weight: bold;
}

.ui-menu-item, .ui-autocomplete, .ui-menu, .ui-widget, .ui-widget-content, .ui-corner-all {
	width: 300px;
	font-size: 12px;
}

.like {
	width: 13px;
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
	background-color: #011627;
	border: 1px solid #011627;
	color: white;
	border-radius: 4px;
	margin-bottom: 1.5px;
}

#tagno, #thno {
	width: 5%;
}

#reviewtag, #thtag {
	width: 10%;
}

#tagcor, #thcor {
	width: 20%;
}

#tagtitle, #thtitle {
	width: 85%;
}
</style>


<body>

<c:set var="pagingTag" value="전체"/>
<sec:authentication property="details" var="member"/>   
    <sec:authorize access="isAuthenticated()">
		<c:set var="mem" value="${member.member_no }"/>
</sec:authorize>


<br>
<h1>기업리뷰</h1>
<br>
<hr class="review-hr">
<div class="search">
	<h5>*기업을 검색해 주세요</h5>
	<form action="/review/list?tag=${tag }" method="post">
		<input type="text" name="keyword" id="keyword"/>
		<input type="button" id="searchBtn" value="검색">
	</form>
	<c:if test="${not empty pageContext.request.userPrincipal }">
		<button id="reviewBtn" onclick="writePop()">글쓰기</button>
	</c:if>
		
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
		<th id="thno">No</th>
		<th id="thtag">Tag</th>
		<th id="thcor">기업이름</th>
		<th id="thtitle">제목</th>
	</tr>
	<c:forEach items="${reviewlist }" var="i">
	<c:set var="src" value="/resources/images/beforelike.png"/>
	<input type="hidden" value="${i.REVIEW_CHECK = 0}"/>
		<c:forEach items="${reclist }" var="j">
			<c:if test="${j.mem_no eq  mem}">
				<c:set var="recno" value="${j.review_no }"/>
			</c:if>
			<c:choose>
				<c:when test="${recno eq i.REVIEW_NO }">
					<c:set var="src" value="/resources/images/afterlike.png"/>
					<input type="hidden" value="${i.REVIEW_CHECK = 1}"/>
				</c:when>
			</c:choose>
		</c:forEach>
		<tr>
			<td id="tagno"><input type="hidden" id="memno" name="memno" value="${mem }"/>${i.REVIEW_NO }</td>
			<td id="reviewtag">${i.REVIEW_TAG }</td>
			<td id="tagcor"><a href="/cor/info?cor_no=${i.COR_NO }&cor_type=${i.COR_TYPE }">${i.COR_NAME }</a></td>
			<td id="tagtitle"><a href="/review/view?reviewno=${i.REVIEW_NO }&tag=${i.REVIEW_TAG }">${i.REVIEW_TITLE }</a>
				<h6><input type="hidden" id="change" name="change" value="${i.REVIEW_CHECK }"/>
					<img id="like" src="${src }"/>&nbsp;<label id="uplike">${i.REVIEW_RECOMMENDED }</label>&nbsp;&nbsp;&nbsp;
					조회수&nbsp;${i.REVIEW_HIT }&nbsp;&nbsp;&nbsp;
					작성일&nbsp;<fmt:formatDate value="${i.REVIEW_WRITTEN_DATE}" pattern="yyyy-MM-dd"/>
				</h6>
			</td>
		</tr>
		<input type="hidden" value="${pagingTag = i.REVIEW_TAG}"/> 
	</c:forEach>
</table>

<input type="hidden" id="selectTag" name="selectTag" value="전체"></input> <!-- tag 선택시 저장되는 곳 -->
		
<div id="pagingBox">
	<c:import url="/WEB-INF/views/layout/reviewPaging/paging.jsp" />
</div>
</body>
