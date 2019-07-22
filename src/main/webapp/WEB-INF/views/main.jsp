<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js">
</script>
<script src="http://code.jquery.com/jquery-1.7.js"	type="text/javascript"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function() {
	
	// 검색 자동완성 기능
	$('#keyword').autocomplete({
		source:function(request,response){
			$.ajax({
				url: "/main/autocomplete",
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
	
	// 검색버튼 동작
	$("#searchBtn").click(function() {
		// form submit 수행
		$("form").submit();
	});
});

</script>

<style type="text/css">
/* 메인 검색엔진 css */
.search {
	padding-right: 10px;
}
#keyword {
	width: 630px;
}




</style>





<!-- <!-- 검색기능 --> 
<!-- <form action="/main/search" method="get"> -->
<!-- 	<div class="search"> -->
<!-- 		<input type="text" name="keyword" id="keyword"/> -->
<!-- 		<button type="button" id="searchBtn">검색</button> -->

<div class="row">
	<div class="col-md-3">
		<h3>KHOB</h3>
	</div>
	
	<div class="col-md-9">
		<!-- 검색기능 -->
		<form action="/main/search" method="get">
			<div class="search">
				<input type="text" name="keyword" id="keyword" width="90%">
				<button type="button" id="searchBtn">검색</button>
			</div>
		</form>
	</div>
</div>
	
	

<%-- <p>
로그인 객체 id : <sec:authentication property="principal"/><br>
로그인 객체 pw : <sec:authentication property="credentials"/> [null보이는거면 보안처리O, 빈칸로 보이면 비로그인]<br>
로그인 객체 details : <sec:authentication property="details"/><br>
<c:if test="${not empty pageContext.request.userPrincipal }">
	<h2>로그인한 사람이면 보이는 부분</h2>
</c:if>
</p>
 --%>
 
