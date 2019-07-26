<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript">

function loginException(){
	
	if($("#member_id").val().length < 1	){
		alert("아이디를 정확히 입력해주세요.");	
	}else if($("#member_pw").val().length < 1){
		alert("비밀번호를 입력하세요.")
	}
	
	
}



</script >



<style>
#btnLogin {
	width: 80px;
	height: 40px;
	background: #474e60;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
#btnCancel {
	width: 80px;
	height: 40px;
	background: #f1404b;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
.idinput,.pwinput{
	float:left;
	width: 75%;
}
.idlabel,.pwlabel{
	float:left;
	width: 25%;
	text-align: center;
}
.iddiv{
	padding-top: 30px;
	float:left;
	width: 100%;
	padding-bottom: 15px;
}
.inputstyle{
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.pwdiv{
	float:left;
	width: 100%;
	padding-bottom: 15px;
}
.content{
	width: 340px;

}
.pulldiv{
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	text-align: center;
	margin: 0 auto;
	width: 420px;
	height: 300px;
}
.btngroup{
	text-align: center;
}
.bottomdiv{
	text-align: left;
	width: 100%;
}
.btomtext{
	float:left;
	width: 75%
}
.btombtn{
	float:left;
	width: 25%;
}
.max{
	padding-top: 30px;
}
.title{
	padding-bottom: 20px;
}


.login-container{
	
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	border : 1px solid #ccc;
	width: 400px;
	height: 340px;

}

.input_row{
	position: relative;
	text-align: left;
	margin-top: 30px;
}

.btLogin{
	position: absolute;
	top: 0;
	right: 0;
	width: 100px;
	height: 96px;
	min-height: 55px;
	background: #252c41;
	border: 1px;
	color: white;
}

.inputstyle{
	width: 235px;
	padding: 0 0 0 20px;
	height: 48px;
	line-height: 46px;
	
}

.error_container{

	height: 22px;
    width: 400px;
    position: absolute;
    margin-left: -1px;
    margin-top: -32px;
    background-color: #ee2560;
    color: white;
}

</style>

<h2><c:out value="${error }" /></h2>
<h2><c:out value="${logout }" /></h2>

<div class="login-container">

<h2 style="margin-bottom: 45px;">KHOB</h2>

<c:if test="${not empty ERRORMSG }">
	<div class="error_container">
	<strong><p>${ERRORMSG }</p></strong>
	</div>
</c:if>

<form action="/member/login" method="POST" id="form">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
<div class="content" style="margin: 0 auto;">

	<div class="input_row">

		<input class="inputstyle" type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요" />
		<input class="inputstyle" type="password" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요" />
		<button type="submit" class="btLogin" id="btLogin" onclick="loginException()">로그인</button>

	</div>
</div>

</form>

<!-- 네이버 로그인 창으로 이동 -->
<div id="naver_id_login" style="text-align:left; margin-left: 29px;"><a href="${url}">
<img width="235px;" src="/resources/images/naverlogin.png.PNG"/></a></div>
<br>
<div style="margin-top:10px;"><p>아직 회원이 아니신가요? <a href="/member/join">회원가입</a> </div>

</div>   
<div style="text-align: center;">
<p>@All Right Reserved</p>
</div>
    
    
    
    