<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

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
	width: 350px;
	
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
</style>

<div style="text-align: center;">

<h2>로그인</h2>
<hr>
<h2><c:out value="${error }" /></h2>
<h2><c:out value="${logout }" /></h2>

<form action="/member/login" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
<div class="content" style="margin: 0 auto;">

				<div class="iddiv">
					<div class="idlabel">
						<label for="member_id">아이디</label>
					</div>
					<div class="idinput">
						<input class="inputstyle" type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요" />
					</div>
				</div>
				<div class="pwdiv">
 					<div class="pwlabel">
						<label for="member_pw">패스워드</label>
					</div>
					<div class="pwinput">
						<input class="inputstyle" type="password" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요" />
					</div>
				</div>

	
				<div class="btngroup">
					<input type="submit" id="btnLogin" value="로그인">
					<input type="button" id="btnCancel" value="취소">
				</div>


				<div>

				</div>
			</div>
</form>

<!-- 네이버 로그인 창으로 이동 -->
<div id="naver_id_login" style="text-align:center"><a href="${url}">
<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
<br>

</div>    

    
    
    
    
    