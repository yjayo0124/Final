<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

#btnCheck{
	border-radius: 3px;
	border: none;
	background-color: #011627;
	color: white;
	width: 60px;
	height: 32px;
}

#member_pw{
	
	color: #E71D36;
	padding: 15px;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin: 0 auto;
    display: inherit;
    height: 32px;
    
}
</style>
    
	<div class="container" style=" width: 500px;">
		
		<h3>비밀번호 확인</h3>
		<hr>
		<form action="/cor/memCheck" method="POST" class="form-horizontal">

		<div class="pw_container">

		<div class="input">
		<input type="password" id="member_pw" name="member_pw"maxlength="20"  placeholder="비밀번호 입력"/>
		</div>
		
		<div style="margin-top: -32px; margin-left: 324px;">
			<button  id="btnCheck" class="btn_type" type="submit">
			<span>확인</span>
			</button>
		</div>
		
		</div>
		</form>

		
	</div>    