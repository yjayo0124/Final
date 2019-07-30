<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

var ch_pw=false;
var ch_pw2=false;

$(function() {
	
	$('.error').hide();
	
	$('#member_pw').blur(
			function() {
				var pwok1  = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
					$('#pwMsg1').show();
				if ($('#member_pw').val() === ''
						|| $('#member_pw').val() === null) {
					$('#pwMsg1').html("필수 정보입니다").css("color", "red");
					ch_pw=false;
				}else if(!pwok1.test($('#member_pw').val())){
					$('#pwMsg1').html("8~20자의 특수문자, 영문 소문자, 숫자만 사용 가능합니다.").css("color","red");
					ch_pw=false;
				} 
				else {
					$('#pwMsg1').hide();
					ch_pw=true;
				}
			})
	$('#member_pw2').blur(function() {
		$('#pwMsg2').show();
	})


			
});
$(function() {
	//비밀번호 확인
	$('#member_pw2').blur(
					function() {
						var pwok2  = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
						if ($('#member_pw').val() != $('#member_pw2')
								.val()) {
							$('#pwMsg2').html("위 비밀번호와 일치하지 않습니다").css(
									"color", "red");
							$('#member_pw2').val('');
							ch_pw2=false;
						} else if ($('#member_pw2').val() === ''
								|| $('#member_pw2').val() === null) {
							$('#pwMsg2').html("필수 정보입니다").css("color",
									"red");
							ch_pw2=false;
						}else if(!pwok2.test($('#member_pw').val())){
							$('#pwMsg2').html("8~20자의 특수문자, 영문 소문자, 숫자만 사용 가능합니다.").css("color","red");
							$('#member_pw2').val('');
							ch_pw2=false;
						}  
						else {
							$('#pwMsg2').html("두 비밀번호가 일치합니다").css("color","blue");
							ch_pw2=true;
						}
					})
});

$(document).ready(function(){
	
	//가입 버튼 클릭 시 form submit
	$("#btnUpdate").click(function() {
		if( ch_pw==true && ch_pw2==true){
			$(this).parents("form").submit();
		}if(ch_pw==false){ $('#pwMsg1').show(); 
		}if(ch_pw2==false){ $('#pwMsg2').show(); 
		}
	})
	
	
})
	
	
</script>
<style type="text/css">
#btnUpdate{
	width: 80px;
	height: 40px;
	background: #E71D36;
	font-size: 13px;
	color: white;
	border: solid 2px;
	border-radius: 1px;
}
#btnGoMain{
	width: 80px;
	height: 40px;
	background: white;
	font-size: 13px;
	color: #011627;
	border: solid 2px #ccc;
	border-radius: 1px;
}
</style>
<div class="container" style="background-color: #e4e7ec; width: 700px;" >

<div>

<h4>회원 정보 수정</h4>
<hr>
<form action="/cor/memUpdate" method="POST" class="form-horizontal" >

	<input type="hidden" name="member_no" value="${member.member_no }">
	<input type="hidden" name="member_id" value="${member.member_id }">
	
	<div class="form-group">
	<label for="member_name" class="col-sm-2">이름</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="member_name" name="member_name" value="${member.member_name }" readonly/></div>
	</div>
	<div class="form-group">
	<label for="member_phone" class="col-sm-2">Phone</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="member_phone" name="member_phone" value="${member.member_phone }"/></div>
	</div>
	<div class="form-group">
	<label for="member_email" class="col-sm-2">Email</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="member_email" name="member_email" value="${member.member_email }"/></div>
	</div>
	
	
	<div class="form-group has-error">
		<label for="member_pw" class="col-sm-2">비밀번호</label>
		<div class="col-sm-7"><input type="password" id="member_pw" name="member_pw" class="inputtext form-control" maxlength="20"  /></div>
	</div>
			
	<div class="form-group has-error">
		<label for="member_pw2" class="col-sm-2" style="font-size: 13px">비밀번호 확인</label>
		<div class="col-sm-7"><input type="password" id="member_pw2" name="member_pw2" class="inputtext form-control" maxlength="20" onkeyup="checkPwd()" /></div>
		<div class="col-sm-4"> <span class="error" id="pwMsg2" role="alert"> 필수 정보입니다 </span></div>
	</div>
<hr>

<h4>기업 정보 수정<small>  국민연금 자료 기반 </small></h4>
	<input type="hidden" name="cor_no" id="cor_no" value="${cor.cor_no }">
	<div class="form-group">
	<label for="cor_name" class="col-sm-2">사업자명</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="cor_name" name="cor_name" value="${cor.cor_name } "/></div>
	</div>
	<div class="form-group">
	<label for="cor_addr" class="col-sm-2">주소</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="cor_addr" name="cor_addr" value="${cor.cor_addr } "/></div>
	</div>
	
	<div class="form-group">
	<label for="cor_mem" class="col-sm-2">직원수</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="cor_mem" name="cor_mem" value="${cor.cor_mem } "/></div>
	</div>

<div style="text-align: center;">
<button type="submit" id="btnUpdate">수정하기</button>
<button type="button" id="btnGoMain" onclick="location='/cor/main'">뒤로가기</button>
</div>

</form>

</div>

</div>