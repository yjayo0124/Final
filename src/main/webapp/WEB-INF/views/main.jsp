<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js">
</script>
<script src="http://code.jquery.com/jquery-1.7.js"	type="text/javascript"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


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
	
	
	
    $('.slider').slick({
    	  infinite: true,
    	  speed:300,
    	  autoplay: true, 
    	  autoplaySpeed:3000, 
    	  slidesToShow: 1,
    	  slidesToScroll: 1, 
    	  arrows: true,
    	  dots: true
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

.main_container{
	float: right;
	position: relative;
	left: -50%;	
	margin-top: 45px;
}
.recruit_table{
	
	margin-right: 5px;
	width: 450px;
	min-width: 450px;
	float: left;
	position: relative;
	left: 50%;
}

.review_table{
	
	margin-left: 5px;
	width: 450px;
	min-width: 450px;
	float: left;
	position: relative;
	left: 50%;
}


td{

font-size: 13px;

}


/* 화살표 */ 
.slick-arrow{ 
	z-index: 2; /* prev버튼은 위치 이동시 이미지 뒤로 숨겨짐 */ 
	position:absolute; /* 원하는 위치에 지정 */ 
	top: 50%; 
	width: 50px; 
	height: 50px; 
	transform: translateY(-25px); 
} 


.slick-prev.slick-arrow{ /* prev 이전 */ 
	left: 0; 
} 

.slick-next.slick-arrow{ /* next 다음 */ 
	right: 0; 
} 

/* 아래점 */ 
.slick-dots{ 
	text-align: center; 
} 

.slick-dots li{ 
	display: inline-block; 
	margin: 0 5px; 
}

.slider_container{
	margin: 0 auto;
	width: 650px;
	min-width: 600px;
	
	height: 420px;
	min-height: 420px;

}


img{
	max-width: 100%;
	height: auto;

}

</style>


<div class="row">
	<div class="col-md-3">
		
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
	
<div class="slider_container">

<div class="slider">
  <div><img src="/resources/images/images1.png"/></div>
  <div><img src="/resources/images/images2.png"/></div>
  <div><img src="/resources/images/bn1.png" width="100%"/></div>
  <div><img src="/resources/images/bn2.png" width="100%"/></div>
</div>

</div>
	
	
	
<div class="main_container">
 
 
<div class="recruit_table" style="border: 1px solid #ccc; height: 260px;">
<table class="table table-hover table-condensed" >
	<thead>
		<tr>
			<th colspan="3" style=" text-align: center;">최신 채용공고</th>	
		</tr>
	</thead>
	<tbody>
<c:forEach items="${recruit }" var="i">
	<tr>
		<td style="width:20%">${i.recruit_name }</td>
		<td style="width:60%"><a href="/recruitment/view?recruit_no=${i.recruit_title }">${i.recruit_title }</a></td>
		<td style="width:20%">${i.recruit_position }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>

 

<div class="review_table" style="border: 1px solid #ccc; height: 260px;">
<table class="table table-hover table-condensed" >
	<thead>
		<tr >
			<th colspan="3" style="text-align: center;">최신 기업리뷰</th>	
		</tr>
	</thead>
	<tbody>
<c:forEach items="${review }" var="i">
	<tr>
		<td style="width: 15%">${i.REVIEW_TAG }</td>
		<td style="width: 65%; text-align: center;"><a href="/recruitment/view?review_no=${i.REVIEW_NO }">${i.REVIEW_TITLE }</a></td>
		<td style="width: 20%">${i.COMPANY_NAME }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>


</div>



 
