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

function getParam(sname) {
    // 현재 페이지의 url
    var url = decodeURIComponent(location.href);
    // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
    url = decodeURIComponent(url);
    
    var params = url.substr(url.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
}
console.log(getParam("tag"));

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
	
	$("#writecmt").click(function() {
		 $.ajax({
			 url: "/review/comment",
			 type: "post",
			 dataType: "json",
			 data: { cmtnick : $('#cmtnick').val(), cmtcontent : $('#cmtcontent').val(), cmtpassword : $('#cmtpassword').val(), reviewno : $('#reviewno').val()},
			 success: function(data) {
				 $.map(data, function(item) {
					 var $div = $('<div></div>');
					 var div = document.createElement('div');
					 var div2 = document.createElement('div');
					 var div3 = document.createElement('div');
					 var div4 = document.createElement('div');
					 var div5 = document.createElement('div');
					 
					 var text = document.createTextNode(item.nick);
					 var content = document.createTextNode(item.content);
					 var date = document.createTextNode(item.date);
					 var recommend = document.createTextNode('추천수' + '\u00a0'+ item.recommend);
					 
					 var writtencmt = document.getElementById("writtencmt");

					 writtencmt.style.width = 100 + '%';
					 writtencmt.style.border = '3px solid #dddddd';
					 writtencmt.style.padding = 5 + 'px';
					 writtencmt.style.radius = 8 + 'px';
					 writtencmt.style.background = '#dddddd';

					 div.style.width = 130 + 'px';
					 div.style.padding = 5 + 'px';
					 div.style.display = 'inline-block';
					 
					 div2.style.width = 650 + 'px';
					 div2.style.padding = 5 + 'px';
					 div2.style.display = 'inline-block';
					 
					 div3.style.width = 150 + 'px';
					 div3.style.padding = 5 + 'px';
					 div3.style.display = 'inline-block';
					 
					 div4.style.width = 80 + 'px';
					 div4.style.padding = 5 + 'px';
					 div4.style.display = 'inline-block';
					 
					 div5.style.width = 90 + 'px';
					 div5.style.padding = 5 + 'px';
					 div5.style.display = 'inline-block';
					 
					 div.appendChild(text);
					 div2.appendChild(content);
					 div3.appendChild(date);
					 div4.appendChild(recommend);
					 div5.innerHTML = "<input type='button' id='deletecmt' name='deletecmt' value='댓글 삭제'/>";
					 
					 $('#writtencmt').prepend($div);
					 $div.prependTo($('#writtencmt'));
					 document.getElementById('writtencmt').insertBefore(div5, document.getElementById('writtencmt').firstChild);
					 document.getElementById('writtencmt').insertBefore(div4, document.getElementById('writtencmt').firstChild);
					 document.getElementById('writtencmt').insertBefore(div3, document.getElementById('writtencmt').firstChild);
					 document.getElementById('writtencmt').insertBefore(div2, document.getElementById('writtencmt').firstChild);
					 document.getElementById('writtencmt').insertBefore(div, document.getElementById('writtencmt').firstChild);
				 });
				 
				 $(document).on("click","#deletecmt",function() {
					 var jbResult = prompt( '비밀번호를 입력하세요', '4자리' );
				 });
			 },
			 error : function(data) {
				 alert("에러가 발생하였습니다.")
			 }
				
		 });
	});
	

	
	if(getParam("tag") == '전체') {
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

	if(getParam("tag") == '강추') {
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

	if(getParam("tag") == '비추') {
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

	if(getParam("tag") == '취업고민') {
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

table {
	width: 100%;
	border-top: 3px solid #444444;
	border-bottom: 3px solid #444444;
	border-left: 0px solid white;
	border-right: 0px solid white;
	border-collapse: collapse;
	margin: auto;
	border-radius: 8px;
}

th {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
	background-color: #e9e9e9;
	width: auto;
	border-radius: 8px;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
	border-radius: 8px;
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

#tag1 {
	color: #4B89DC;
}

#keyword {
	width: 300px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
}

#reviewBtn {
	float:right;
}

#thtitle, #threcommended, #thwrittendate, #thhit {
	width: 10%;
}

#tdtitle, #tdrecommended, #tdwrittendate, #tdhit {
	width: 40%;
}

#cmt {
	font-weight: bold;
}

#content {
	margin: 3px;
	border: 3px solid #dddddd;
	padding: 5px;
	width: 100%;
	border-radius: 8px;
	height: 500px;
}

#cmtnick {
	width: 12%;
	font-size: 13px;
	margin-top: 7px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
}

#cmtcontent {
	width: 69%;
	font-size: 13px;
	margin-top: 7px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
}

#cmtpassword {
	width: 10%;
	font-size: 13px;
	margin-top: 7px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
}

#writecmt {
	width: 7%;
}

#writtencmt {
	border-radius: 8px;
}
</style>

<body>

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
	<button id="reviewBtn" onclick="writePop()">글쓰기</button>
</div>
<br><br>
<div id="tag">
	<label class="tag" id="tag1">전체</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label class="tag" id="tag2">강추</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label class="tag" id="tag3">비추</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label class="tag" id="tag4">취업고민</label>
</div>

<c:forEach items="${viewlist }" var="i">
	<h3><b>${i.COR_NAME }</b></h3>
	<table>
		<tr>
			<th id="thtitle">제목</th>
			<td id="tdtitle">${i.REVIEW_TITLE }</td>
			<th id="threcommended">추천수</th>
			<td id="tdrecommended">${i.REVIEW_RECOMMENDED }</td>
		</tr>
		<tr>
			<th id="thwrittendate">작성일</th>
			<td id="tdwrittendate"><fmt:formatDate value="${i.REVIEW_WRITTEN_DATE }" pattern="yyyy-MM-dd"/></td>
			<th id="thhit">조회수</th>
			<td id="tdhit">${i.REVIEW_HIT }</td>
		</tr>
	</table>
	<br><br>
	
	<div id="content">
		${i.REVIEW_CONTENT }
	</div>
	
	<sec:authentication property="details" var="member"/>   
    <sec:authorize access="isAuthenticated()">
    	<c:if test="${member.member_no eq i.mem_no }" >
    		<button id="btnUpdate">수정</button>
    		<button id="btnDelete" class="btn btn-danger">삭제</button>
    	</c:if>
   	</sec:authorize>
   	
   	<input type="hidden" id="reviewno" name="reviewno" value="${i.REVIEW_NO }"/>
</c:forEach>

<br>
<hr class="review-hr">
<label id="cmt">댓글</label><br>

<div id="writtencmt">
</div>

<input type="text" id="cmtnick" name="cmtnick" maxlength="10" placeholder="닉네임(10자리까지)"/>
<input type="text" id="cmtcontent" name="cmtcontent" placeholder="내용을 입력해 주세요"/>
<input type="password" id="cmtpassword" name="cmtpassword" maxlength="4" placeholder="비밀번호(4자리)"/>
<input type="button" id="writecmt" name="writecmt" value="댓글 입력"/>
<br><br><br><br><br>
</body>
