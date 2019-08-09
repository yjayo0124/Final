<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:700&display=swap&subset=korean" rel="stylesheet">   
    


<style type="text/css">



.error_container{
	text-align: center;
	margin-top: 55px;
	font-family: 'Nanum Myeongjo', serif;
}


#btnBack{

	background-color: white;
	color: #FF5450;

	
}

</style>
    
   
<div class="error_container">


<div>
<img src="/resources/images/404.png" height="350px">
</div>

<div>
<br>
<h5>공사 중이거나 없어진 페이지입니다.</h5>
</div>

<div style="margin-top: 20px;">
<button id="btnBack" class="btn btn-default"  onclick="location.href='/main'">Go To Main</button>
</div>
</div>