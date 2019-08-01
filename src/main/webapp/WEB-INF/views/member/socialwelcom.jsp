<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#btnLogin {
	width: 110px;
	min-width: 110px;
	height: 40px;
	background: #252c41;
	font-size: 13px;
	color: #fff;
	border: solid 1px #252c41;
	border-radius: 5px;
}
</style>
    
<div style="margin-top: 80px; width: 600px; text-align: center;" class="container">
	<h2><span style="color: #A6172D;"> KHOB </span> x <span style="color: #03C75A;"> NAVER </span></h2>
	<hr>
	<p>가입이 완료되었습니다. </p>
	<p>이제 NAVER 아이디를 통해 KHOB 서비스를 이용하실 수있습니다. </p>
	
	
	<button id="btnLogin" onclick="location.href='/member/login' ">로그인하러가기</button>

</div>