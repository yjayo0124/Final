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
<img src="/resources/images/error.png" height="350px">
</div>

<div>
<h2>흠? 잘못된 접근입니다.</h2>
</div>

<div style="margin-top: 20px;">
<button id="btnBack" class="btn btn-default"  onclick="location.href='/main'">Go To Main</button>
</div>
</div>