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
var ajax;
var jbResult;

var newcommentno;
var newpw;
var newnick;
var newcontent;
var newdate;
var newrecommend;
var newno;
var newcheck;

var thisno;
var thispw;
var thisnick;
var thiscontent;
var thisdate;
var thisrecommend;
var thisno;
var thisBtn;

var dltnewno;
var dltnewpw;
var dltnewnick;
var dltnewcontent;
var dltnewdate;
var dltnewrecommend;
var dltnewBtn;

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
	
	$(document).on("click","#writecmt",function() {
		 <c:set var="pagingTag" value="전체"/>
		 <sec:authentication property="details" var="member"/>   
		     <sec:authorize access="isAuthenticated()">
				 <c:set var="mem" value="${member.member_no }"/>
		 </sec:authorize>
			 
		 /* text input null check*/
		 function isNull(elm) { 
	         //Null 체크 함수
	         var elm;
	         return (elm == null || elm == "" || elm == "undefined" || elm == " ") ? true : false
		 }

        if(isNull($('#cmtnick').val())) {
            alert("닉네임을 입력해 주세요.");
            return false;
         } else if (isNull($('#cmtcontent').val())) {
            alert("내용을 입력해 주세요.");
            return false;
         } else if (isNull($('#cmtpassword').val())) {
             alert("비밀번호를 입력해 주세요.");
             return false;
          } else {
			 ajax = $.ajax({
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
						 var recommend = document.createTextNode('\u00a0'+ item.recommend);
						 
						 var writtencmt = document.getElementById("writtencmt");
	
						 writtencmt.style.width = 100 + '%';
						 writtencmt.style.border = '3px solid #dddddd';
						 writtencmt.style.padding = 5 + 'px';
						 writtencmt.style.radius = 8 + 'px';
						 writtencmt.style.background = '#dddddd';
	
						 div.id = item.commentno + item.nick;
						 div.style.width = 133 + 'px';
						 div.style.padding = 5 + 'px';
						 div.style.display = 'inline-block';
						 
						 div2.id = item.commentno + item.content;
						 div2.style.width = 654 + 'px';
						 div2.style.padding = 5 + 'px';
						 div2.style.display = 'inline-block';
						 
						 div3.id = item.commentno + item.date;
						 div3.style.width = 154 + 'px';
						 div3.style.padding = 5 + 'px';
						 div3.style.display = 'inline-block';
						 
						 div4.id = item.commentno + item.pw;
						 div4.style.width = 80 + 'px';
						 div4.style.padding = 5 + 'px';
						 div4.style.display = 'inline-block';
						 
						 div5.id = item.commentno + item.commentno + item.content;
						 div5.style.width = 90 + 'px';
						 div5.style.padding = 5 + 'px';
						 div5.style.display = 'inline-block';
						 
						 div.appendChild(text);
						 div2.appendChild(content);
						 div3.appendChild(date);
						 div4.innerHTML = "<input type='hidden' id='newrecommendno' name='newrecommendno'/>";
						 div4.innerHTML += "<input type='hidden' id='newmemno' name='newmemno'/>";
						 div4.innerHTML += "<input type='hidden' id='newchange' name='newchange'/>";
						 div4.innerHTML += "<img id='like1' src='/resources/images/beforelike.png' style='cursor:pointer'/>";
						 div4.innerHTML += '<label>' + '\u00a0' + item.recommend + '</label>';
						 
						 div5.innerHTML = "<input type='hidden' id='deletecmtno' name='deletecmtno'/>";
						 div5.innerHTML += "<input type='hidden' id='deletecmtpw' name='deletecmtpw'/>";
						 div5.innerHTML += "<input type='hidden' id='deletecmtnick' name='deletecmtnick'/>";
						 div5.innerHTML += "<input type='hidden' id='deletecmtcontent' name='deletecmtcontent'/>";
						 div5.innerHTML += "<input type='hidden' id='deletecmtdate' name='deletecmtdate'/>";
						 div5.innerHTML += "<input type='hidden' id='deletecmtrecommend' name='deletecmtrecommend'/>";
						 div5.innerHTML += "<input type='hidden' id='deletecmtBtn' name='deletecmtBtn'/>";
						 div5.innerHTML += "<input type='button' id='deletecmt' name='deletecmt' value='댓글 삭제'/>";
						 
						 $('#writtencmt').prepend($div);
						 $div.prependTo($('#writtencmt'));
						 document.getElementById('writtencmt').insertBefore(div5, document.getElementById('writtencmt').firstChild);
						 document.getElementById('writtencmt').insertBefore(div4, document.getElementById('writtencmt').firstChild);
						 document.getElementById('writtencmt').insertBefore(div3, document.getElementById('writtencmt').firstChild);
						 document.getElementById('writtencmt').insertBefore(div2, document.getElementById('writtencmt').firstChild);
						 document.getElementById('writtencmt').insertBefore(div, document.getElementById('writtencmt').firstChild);
						 
						 newcommentno = item.commentno;
						 newnick = item.commentno + item.nick;
						 newpw = item.pw;
						 newcontent = item.commentno + item.content;
						 newdate = item.commentno + item.date;
						 newrecommend = item.commentno + item.pw;
						 newno = item.commentno + item.commentno + item.content;
						 newcheck = item.check;
					 });
					 document.getElementById('newrecommendno').value = newcommentno;
					 document.getElementById('newchange').value = newcheck;
					 <c:if test="${not empty pageContext.request.userPrincipal }">
						 document.getElementById('newmemno').value = ${mem };
					 </c:if>
					 document.getElementById('deletecmtno').value = newcommentno;
					 document.getElementById('deletecmtpw').value = newpw;
					 document.getElementById('deletecmtnick').value = newnick;
					 document.getElementById('deletecmtcontent').value = newcontent;
					 document.getElementById('deletecmtdate').value = newdate;
					 document.getElementById('deletecmtrecommend').value = newrecommend;
					 document.getElementById('deletecmtBtn').value = newno;
					 
					 $('#cmtnick').val("");
					 $('#cmtcontent').val("");
					 $('#cmtpassword').val("");
				 },
				 error : function(data) {
					 alert("에러가 발생하였습니다.");
				 }
					
			 });
          }
	});

	$(document).on("click","#deletecmt",function() {
		dltnewno = $(this).parent().children().val();
		dltnewpw = $(this).parent().children().eq(1).val();
		dltnewnick = $(this).parent().children().eq(2).val();
		dltnewcontent = $(this).parent().children().eq(3).val();
		dltnewdate = $(this).parent().children().eq(4).val();
		dltnewrecommend = $(this).parent().children().eq(5).val();
		dltnewBtn = $(this).parent().children().eq(6).val();
		
		jbResult = prompt( '비밀번호를 입력하세요', '4자리' );
	 	console.log("jbResult : " + jbResult);
	 	console.log("pw : " + dltnewpw);

	 	if(jbResult == dltnewpw) {
		 	newcommentDelete();
	 	} else {
		 	alert("비밀번호가 틀렸습니다.");
	 	}
	});
	 
	function newcommentDelete() {
		 $.ajax({
			 url: "/review/deleteNewComment",
			 type: "post",
			 dataType: "json",
			 data: { commentno : dltnewno, pw : dltnewpw},
			 success: function(data) {
				 var deletenick = document.getElementById(dltnewnick);
				 var deletecontent = document.getElementById(dltnewcontent);
				 var deletedate = document.getElementById(dltnewdate);
				 var deleterecommend = document.getElementById(dltnewrecommend);
				 var deleteno = document.getElementById(dltnewBtn);
				 
				 console.log(deletecontent);
				 deletenick.parentNode.removeChild(deletenick);
				 deletecontent.parentNode.removeChild(deletecontent);
				 deletedate.parentNode.removeChild(deletedate);
				 deleterecommend.parentNode.removeChild(deleterecommend);
				 deleteno.parentNode.removeChild(deleteno);

// 				 ajax.abort();
			 },
			 error : function(data) {
				 alert("에러가 발생하였습니다.")
			 }
		 });
	}
	
	$(document).on('click', '#deletecomment', function(){
		 var Result = prompt( '비밀번호를 입력하세요', '4자리' );
		 console.log("Result : " + Result);
		 console.log("no : " + $(this).parent().children().val());
		 console.log("pw : " + $(this).parent().children().eq(1).val());
		 
		 thisno = $(this).parent().children().val();
		 thispw = $(this).parent().children().eq(1).val();
		 thisnick = 'commentnick' + $(this).parent().children().eq(2).val();
		 thiscontent = 'commentcontent' + $(this).parent().children().eq(3).val();
		 thisdate = 'commentdate' + $(this).parent().children().eq(4).val();
		 thisrecommend = 'commentrecommend' + $(this).parent().children().eq(2).val();
		 thisBtn = 'commentBtn' + $(this).parent().children().eq(2).val();
		 
		 if(Result == thispw) {
			 commentDelete();
		 } else {
			 alert("비밀번호가 틀렸습니다.");
		 }
	});
	
	function commentDelete() {
		 $.ajax({
			 url: "/review/deleteComment",
			 type: "post",
			 dataType: "json",
			 data: { commentno : thisno, pw : thispw},
			 success: function(data) {
				 console.log(data);
				 console.log("thisnick : " + thisnick);
				 var deletenick = document.getElementById(thisnick);
				 var deletecontent = document.getElementById(thiscontent);
				 var deletedate = document.getElementById(thisdate);
				 var deleterecommend = document.getElementById(thisrecommend);
				 var deleteBtn = document.getElementById(thisBtn);

				 deletenick.parentNode.removeChild(deletenick);
				 deletecontent.parentNode.removeChild(deletecontent);
				 deletedate.parentNode.removeChild(deletedate);
				 deleterecommend.parentNode.removeChild(deleterecommend);
				 deleteBtn.parentNode.removeChild(deleteBtn);
			 },
			 error : function(data) {
				 alert("에러가 발생하였습니다.")
			 }
		 });
	}
	
	$(document).on('click', '#like', function(){
		var image = event.target;
		var change = $(this).parent();
		
		console.log($(this).parent().children().val());
		console.log($(this).parent().children().eq(1).val());
		console.log("like : " + change.children().eq(4).html());
		 $.ajax({
			 url: "/review/commentlike",
			 type: "post",
			 dataType: "json",
			 data: { recommendno : $(this).parent().children().val(), memno : $(this).parent().children().eq(1).val(), recommend : change.children().eq(2).val()},
			 success: function(data) {
				 console.log("data : " + data.data);
				 if(${empty pageContext.request.userPrincipal }) {
					 alert("로그인 후 이용가능합니다.");
				 } else {
					 if(change.children().eq(2).val() == 0) {
						 change.children().eq(4).html(data.data);
						 image.src = "/resources/images/afterlike.png";
						 change.children().eq(2).val(1);
						 console.log("change : " + change.children().eq(2).val());
						 console.log("after_change : " + change);
					 } else if(change.children().eq(2).val() == 1) {
						 change.children().eq(4).html(data.data);
						 console.log(data.data);
						 image.src = "/resources/images/beforelike.png";
						 change.children().eq(2).val(0);
						 console.log("change : " + change.children().eq(2).val());
						 console.log("before_change : " + change);
					 }
				 }
			 },
			 error : function(data) {
				 alert("로그인 후 이용가능합니다.");
			 }
		 });
		
	});
	
	$(document).on('click', '#like1', function(){
		var image = event.target;
		var change = $(this).parent();
		
		console.log($(this).parent().children().val());
		console.log($(this).parent().children().eq(1).val());
		console.log("like : " + change.children().eq(3).html());
		 $.ajax({
			 url: "/review/commentlike",
			 type: "post",
			 dataType: "json",
			 data: { recommendno : $(this).parent().children().val(), memno : $(this).parent().children().eq(1).val(), recommend : change.children().eq(2).val()},
			 success: function(data) {
				 console.log("data : " + data.data);
				 if(${empty pageContext.request.userPrincipal }) {
					 alert("로그인 후 이용가능합니다.");
				 } else {
					 if(change.children().eq(2).val() == 0) {
						 change.children().eq(4).html('\u00a0' + data.data);
						 image.src = "/resources/images/afterlike.png";
						 change.children().eq(2).val(1);
						 console.log("change : " + change.children().eq(2).val());
						 console.log("after_change : " + change);
					 } else if(change.children().eq(2).val() == 1) {
						 change.children().eq(4).html('\u00a0' + data.data);
						 console.log(data.data);
						 image.src = "/resources/images/beforelike.png";
						 change.children().eq(2).val(0);
						 console.log("change : " + change.children().eq(2).val());
						 console.log("before_change : " + change);
					 }
				 }
			 },
			 error : function(data) {
				 alert("로그인 후 이용가능합니다.");
			 }
		 });
	});
});

function writePop() {
	window.open("http://localhost:8088/review/writePop", "글쓰기", "width=1000, height=650");
}

function deleteReview(reviewno) {
	var ok = confirm("삭제 하시겠습니까?\n삭제하실 경우 작성한글을 포함하여 댓글까지 삭제 됩니다.")
	
	if(ok) {
		alert("삭제 되었습니다.")
		location.href="/review/delete?reviewno=${i.REVIEW_NO }" + reviewno
	}
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
	margin-top: 25px;
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
	width: 99%;
	align: center;
}

.search {
	float: right;
}

.ui-menu-item, .ui-autocomplete, .ui-menu, .ui-widget, .ui-widget-content, .ui-corner-all {
	width: 300px;
	font-size: 12px;
}

#tag {
	font-size: 20px;
	font-weight: bold;
	color: #4B89DC;
	cursor: pointer;
}

#keyword {
	width: 300px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
}

#searchBtn {
	margin-left: -5px;
	height: 34px;
	width: 60px;
	background-color: #011627;
	border: 2px solid #011627;
	color: white;
	border-radius: 8px;
}

#reviewBtn {
	float: right;
	height: 33px;
	width: 60px;
	background-color: #011627;
	border: 2px solid #011627;
	color: white;
	border-radius: 8px;
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
	margin-bottom: 7px;
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
	height: 33px;
	width: 7%;
	background-color: #011627;
	border: 2px solid #011627;
	color: white;
	border-radius: 8px;
}

#deletecmt {
	height: 33px;
	background-color: #011627;
	border: 2px solid #011627;
	color: white;
	border-radius: 8px;
	margin-left: 5px;
}

#deletecomment {
	height: 33px;
	background-color: #011627;
	border: 2px solid #011627;
	color: white;
	border-radius: 8px;
}

#writtencmt {
	border-radius: 8px;
	width: 100%;
	border: 3px solid #dddddd;
	padding: 5px;
	radius: 8px;
	background: #dddddd;
}

#updateBtn {
	float: right;
	height: 33px;
	background-color: #0080ff;
	border: 2px solid #0080ff;
	color: white;
	border-radius: 8px;
	margin-right: 2px;
}

#deleteBtn {
	float: right;
	height: 33px;
	background-color: #FD1447;
	border: 2px solid #FD1447;
	color: white;
	border-radius: 8px;
	margin-left: 2px;
}

.commentnick {
	width: 130px;
	padding: 5px;
	display: inline-block;
}

.commentcontent {
	width: 650px;
	padding: 5px;
	display: inline-block;
}

.commentdate {
	width: 150px;
	padding: 5px;
	display: inline-block;
}

.commentrecommend {
	width: 80px;
	padding: 5px;
	display: inline-block;
}

.commentBtn {
	width: 90px;
	padding: 5px;
	display: inline-block;
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
<c:forEach items="${viewlist }" var="i">
<div class="search">
	<h5>*기업을 검색해 주세요</h5>
	<form action="/review/list?tag=${i.REVIEW_TAG }" method="post">
		<input type="text" name="keyword" id="keyword"/>
		<input type="button" id="searchBtn" value="검색">
	</form>
	<c:if test="${not empty pageContext.request.userPrincipal }">
		<button id="reviewBtn" onclick="writePop()">글쓰기</button>
	</c:if>
</div>
<br><br>

	<a href="/review/list?tag=${i.REVIEW_TAG }"><label id="tag"># ${i.REVIEW_TAG }</label></a>
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
    	<c:if test="${member.member_no eq i.MEM_NO }" >
    		<button id="deleteBtn" onclick="deleteReview(${i.REVIEW_NO })">삭제</button>
    		<a href="/review/update?reviewno=${i.REVIEW_NO }"><button id="updateBtn">수정</button></a>
    	</c:if>
   	</sec:authorize>
   	
   	<input type="hidden" id="reviewno" name="reviewno" value="${i.REVIEW_NO }"/>
</c:forEach>

<br>
<hr class="review-hr" style="margin-top: 20px;">
<label id="cmt">댓글</label><br>

<div id="writtencmt">
	<c:forEach items="${comment }" var="i">
	<c:set var="src" value="/resources/images/beforelike.png"/>
	<input type="hidden" value="${i.comment_check_recommend = 0}"/>
		<c:forEach items="${recommend }" var="j">
			<c:if test="${j.mem_no eq  mem}">
				<c:set var="recno" value="${j.comment_no }"/>
			</c:if>
			<c:choose>
				<c:when test="${recno eq i.comment_no }">
					<c:set var="src" value="/resources/images/afterlike.png"/>
					<input type="hidden" value="${i.comment_check_recommend = 1}"/>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<div id="commentnick${i.comment_nick }" class="commentnick">
			${i.comment_nick }
		</div>
		<div id="commentcontent${i.comment_content }" class="commentcontent">
			${i.comment_content }
		</div>
		<div id="commentdate${i.comment_written_date }" class="commentdate">
			<fmt:formatDate value="${i.comment_written_date }" pattern="MM-dd HH:mm:ss"/>
		</div>
		<div id="commentrecommend${i.comment_nick }" class="commentrecommend">
			<input type="hidden" id="recommendno" name="recommendno" value="${i.comment_no }"/>
			<input type="hidden" id="memno" name="memno" value="${mem }"/>
			<input type="hidden" id="change" name="change" value="${i.comment_check_recommend }"/>
			<img id="like" src="${src }" style="cursor:pointer"/>&nbsp;<label id="uplike">${i.comment_recommend }</label>
		</div>
		<div id="commentBtn${i.comment_nick }" class="commentBtn">
			<input type="hidden" id="deletecmtno" name="deletecmtno" value="${i.comment_no }"/>
			<input type="hidden" id="deletecmtpw" name="deletecmtpw" value="${i.comment_password }"/>
			<input type="hidden" id="deletecmtnick" name="deletecmtnick" value="${i.comment_nick }"/>
			<input type="hidden" id="deletecmtcontent" name="deletecmtpw" value="${i.comment_content }"/>
			<input type="hidden" id="deletecmtdate" name="deletecmtdate" value="${i.comment_written_date }"/>
			<input type="hidden" id="deletecmtrecommend" name="deletecmtrecommend" value="${i.comment_recommend }"/>
			<input type='button' id='deletecomment' name='deletecomment' value='댓글 삭제'/>
		</div>
	</c:forEach>
</div>

<div id="nullcheck">
	<input type="text" id="cmtnick" name="cmtnick" maxlength="10" placeholder="닉네임(10자리까지)"/>
	<input type="text" id="cmtcontent" name="cmtcontent" placeholder="내용을 입력해 주세요"/>
	<input type="password" id="cmtpassword" name="cmtpassword" maxlength="4" placeholder="비밀번호(4자리)"/>
	<input type="button" id="writecmt" name="writecmt" value="댓글 입력"/>
 </div>
<br><br><br><br><br>
</body>
