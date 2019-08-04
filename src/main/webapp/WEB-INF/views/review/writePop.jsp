<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"	type="text/javascript"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>


<script type="text/javascript">
var corname = '${corname }';

$.noConflict();
var j = jQuery;
j(document).ready(function() {
	j.noConflict();
	
	j(document).ready(function() {
	 	j("#summernote").summernote({
			tabsize: 2,
			height: 370,
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: 'ko-KR'
		});
	});
	
	$('input[name=selectTag]').attr('value','강추'); // tag default 값
	
	if(corname != null) {
		$('input[name=selectCor]').attr('value', corname);
	}
	
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
					 var search = document.getElementById('keyword').value;
					 document.getElementById('selectCor').innerHTML=search;
					 $('#selectCor').val(search);
					 $('input[name=selectCor]').attr('value',search);
				 }
			 },
			 error : function(data) {
				 alert("에러가 발생하였습니다.")
			 }
		 });
	});
	
	$('#tag1').click(function() {
		$('#tag1').css({
			color: "#4B89DC"
		});
		$('#tag2').css({
			color: "black"
		});
		$('#tag3').css({
			color: "black"
		});
		
		$('input[name=selectTag]').attr('value','강추');
	});
	
	$('#tag2').click(function() {
		$('#tag2').css({
			color: "#4B89DC"
		});
		$('#tag1').css({
			color: "black"
		});
		$('#tag3').css({
			color: "black"
		});
		
		$('input[name=selectTag]').attr('value','비추');
	});
	
	$('#tag3').click(function() {
		$('#tag3').css({
			color: "#4B89DC"
		});
		$('#tag1').css({
			color: "black"
		});
		$('#tag2').css({
			color: "black"
		});
		
		$('input[name=selectTag]').attr('value','취업고민');
	});
	
	$('#writeBtn').click(function() {
		/* text input null check*/
		function isNull(elm) { 
	        //Null 체크 함수
	        var elm;
	        return (elm == null || elm == "" || elm == "undefined" || elm == " ") ? true : false
		}
		
        var thisform = document.writeReview;
        if(isNull(thisform.title.value)) {
           alert("제목을 입력해 주세요.");
           thisform.test.value ="";
           thisform.test.focus();
           return false;
        } else if (isNull(thisform.content.value)) {
           alert("내용을 입력해 주세요.");
           thisform.test.value ="";
           thisform.test.focus();
           return false;
        } else if (isNull(thisform.selectCor.value)) {
            alert("기업을 검색해 주세요.");
            thisform.test.value ="";
            thisform.test.focus();
            return false;
         } else {
   		   // form submit 수행
   		   $("form").submit();
   		   alert("리뷰작성 완료");
   		   window.close();
           return true;
        }

	})
	
});
</script>

<style type="text/css">
body {
	width: 1000px;
	margin: 0 auto;
	background-color: #e9e9e9;
}

hr {
	border: solid 1px black;
	background-color: black;
	width: 100%;
	align: center;
}

h1 {
	font-size: 50px;
	font-weight: bold;
	margin: 0;
}

h5 {
	margin: 0;
	padding: 0;
}

.search {
	float: right;
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

#title {
	width: 100%;
	font-size: 15px;
	margin-top: 7px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
}

#content { 
 	resize: none;
 	width: 100%;
	height: 200px;
	font-size: 15px;
	margin-top: 7px;
	border: 3px solid #dddddd;
	padding: 5px;
	border-radius: 8px;
} 

#searchBtn, #writeBtn {
	float: right;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-right:-4px;
	border: 1px solid black;
	background-color: rgba(0,0,0,0);
	color: black;
	padding: 5px;
}

#searchBtn:hover, #writeBtn:hover {
    color:white;
    background-color: #0080ff;
    border: 1px solid #0080ff;
}

#selectCor {
	font-weight: bold;
	color: #4B89DC;
}

#tagcomment {
	font-weight: bold;
	font-size: 12px;
}

ul, li {
	width: 300px;
	font-size: 12px;
}
.tag {
	font-size: 17px;
	font-weight: bold;
	cursor: pointer;
	margin-top: 30px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<sec:authentication property="details" var="member"/>   
    <sec:authorize access="isAuthenticated()">
		<c:set var="mem" value="${member.member_no }"/>
</sec:authorize>

<br>
<h1>리뷰작성</h1>
<br>
<div class="search">
	<h5>*기업을 검색해 주세요</h5>
	<input type="text" name="keyword" id="keyword"/>
	<button type="button" id="searchBtn">선택</button>
</div>

<div id="tag">
	<label class="tag" id="tag1">강추</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label class="tag" id="tag2">비추</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label class="tag" id="tag3">취업고민</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label id="tagcomment">* 작성할 태그를 선택해 주세요</label>
</div>
<hr>
<label>다른 사람의 인격권을 침해하거나 명예를 훼손하게 하는 글, 불쾌감을 주는 욕설 또는 비방하는 글, 유언비어나 허위사실을 유포하는 글, 도배성 글의 경우 글이 삭제되거나 이용제재를 받을 수 있습니다.</label>

<br><br>
<form id="writeReview" name="writeReview" action="/review/writePop" method="post">
	<label>* 선택한 기업<h5>기업검색시 아래에 선택한 기업이 보여집니다.</h5></label>
	<div id="selectCor" name="selectCor">
	<c:if test="${corname ne null }">
		${corname }  <h6 style="color: black; display: inline-block">* 기업상세정보에서 글쓰기 시 기업이 자동입력됩니다.</h5>
	</c:if>
	</div>

	<br>
	<label>글 제목</label><br>
	<input type="text" name="title" id="title" placeholder="제목을 입력해주세요"/>

	<br><br>
	<label>글 내용</label><br>
	<textarea id="summernote" name="content" placeholder="내용을 입력해주세요"></textarea>
	
	<input type="hidden" name="selectTag"></input> <!-- tag 선택시 저장되는 곳 -->
	<input type="hidden" name="selectCor"></input> <!-- 기업 선택시 저장되는 곳 -->
	<input type="hidden" name="selectMem" value="${mem }"></input> <!-- 현재 로그인한 멤버no -->
	<button type="button" id="writeBtn">글쓰기</button>
</form>

</body>
</html>