<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <script type="text/javascript">
var ch_id=false;
var ch_pw=false;
var ch_pw2=false;
var ch_name=false;
var ch_email=false;
var ch_phone=false;

	//id체크
	function idcheck() {
		var memId = $('#member_id').val();
		
		$.ajax({
			type : 'POST',
			url : '/member/idCheck',
			data : {
				"member_id" : $('#member_id').val()
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if(  data ) {
					
					$('#idMsg').html("중복되거나 이미 있는 아이디입니다").css("color", "red");	
					ch_id=false;
				
				} else {
					
					$('#idMsg').html("사용가능한 아이디입니다").css("color", "blue");
					ch_id=true;
					
				}
		
			}
		})
	}
	$(function() {
		$('.error').hide();
 		$('#member_id').focus(function() {
 			$('#idMsg').html("")
 		});
 		
 		$('#member_id').blur(
				function() {
					var idok = /[a-z0-9]{5,20}$/;
				$('#idMsg').show();
					if ($('#member_id').val() === ''
							|| $('#member_id').val() === null) {
						 $('#idMsg').html("필수 정보입니다").css("color", "red");	 
						 ch_id=false;
					}else if(!idok.test($('#member_id').val())){
						$('#idMsg').html("5~20자의 영문 소문자, 숫자만 사용 가능합니다.").css("color","red");
						ch_id==false;
					}
					else {
						idcheck();
					}
				}) 
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
		$('#member_name').blur(
				function() {
					if ($('#member_name').val() === ''
							|| $('#member_name').val() === null) {
						$('#nameMsg').show();
						ch_name=false;
					} else {
						$('#nameMsg').hide();
						ch_name=true;
					}
				})


		$('#member_email').blur(
				function() {
					if ($('#member_email').val() === ''
							|| $('#member_email').val() === null) {
						$('#emailMsg').show();
						ch_email=false;
					} else {
						$('#emailMsg').hide();
						ch_email=true;
					}
				})
		$('#member_phone').blur(
				function() {
					if ($('#member_phone').val() === ''
							|| $('#member_phone').val() === null) {
						$('#phoneMsg').show();
						ch_phone=false;
					} else {
						$('#phoneMsg').hide();
						ch_phone=true;
					}
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
$(document).ready(function() {
		//가입 버튼 클릭 시 form submit
		$("#btnJoin").click(function() {
			if(ch_id==true && ch_pw==true && ch_pw2==true && 
				ch_name==true && ch_email==true && ch_phone==true){
				$(this).parents("form").submit();
			}if(ch_id==false){ $('#idMsg').show(); 
			}if(ch_pw==false){ $('#pwMsg1').show(); 
			}if(ch_pw2==false){ $('#pwMsg2').show(); 
			}if(ch_name==false){ $('#nameMsg').show();  
			}if(ch_email==false){ $('#emailMsg').show(); 
			}if(ch_phone==false){ $('#phoneMsg').show(); 
			}
		})
});	
	
	
	
function clause(){

	var f=document.forms[0];

	if(f.ch.checked)

		f.btn.disabled=false;

	else

		f.btn.disabled=true;

}


</script>

<style>
.error {
	text-align: center;
	font-size: 8px;
	color: red;
	margin-left: 40px;
}
.join_content {
	margin: 0 auto;
	max-width: 335px;
	min-width: 275px;

}
.row_group {
	overflow: hidden;
	width: 100%;
}
.join_title {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}
.inputtext {
	border: none;
	display: block;
	position: relative;
	width: 100%;
	height: 17px;
}
.intext, .genderdiv {
	display: block;
	position: relative;
	width: 75%;
	height: 40px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	background: #fff;
	box-sizing: border-box;
	vertical-align: top;
	margin: auto;
	margin-top: 15px;
	margin-bottom: 10px;
}
.gen {
	width: 100%;
	height: 29px;
	font-size: 15px;
	line-height: 18px;
	color: #000;
	border: none;
	border-radius: 0;
	height: auto;
	margin-top: 3px;
}
.btnarea {
	margin: 30px 0 9px;
}
.btn_type {
	display: block;
	width: 100%;
	background-color : #c03546;
	padding: 21px 0 17px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
	box-sizing: border-box;
	border: 1px solid #c03546;
}

.container{
	width: 350px;
}

.link{
	background-color: #ccc;
	width: 160px;
	min-width: 160px;
	height: 50px;
	min-height: 50px;
	font-size: 15px;
	padding: 14px;
	
}


.link_container{
	
	display: inline-block;
	text-align: center;
	margin-top: 40px;
	margin-bottom: 10px;
	color: black;

}


.idv{
	border-top: 1px solid black;
	border-left: 1px solid black;
	border-right: 1px solid black;
}

.cor{

	border-bottom: 1px solid black;
}

a{
	color: black;
}


</style>


<div class="container">

<h2 style="text-align: center;">KHOB</h2>

<div class="link_container">
  <div class="col-md-6 link idv" ><a href="/member/join">개인회원</a></div>
  <div class="col-md-6 link cor"><a href="/member/corJoin">기업회원</a></div>
</div>

<div>
<form action="/member/join" method="post" class="form">
	<div class="join_content">
		
		<div style="border: 1px solid #ccc; margin-top: 10px; height: 250px;">
		<h5 style="text-align: right; margin-top:20px; margin-bottom: -3px; margin-right:5px;">*는 필수정보입니다.</h5>
		
		<div class="row_group">
			<span class="intext"> <input type="text" id="member_id"
				name="member_id" class="inputtext" maxlength="20" placeholder="아이디(8자이상)*"/> <span class="error" id="idMsg">필수 정보입니다</span>
			</span>
		</div>

		<div class="row_group">
			<span class="intext"> <input type="password" id="member_pw"
				name="member_pw" class="inputtext" maxlength="20" placeholder="비밀번호(8-20자의 영문, 숫자, 특수기호)" /> <span class="error" id="pwMsg1">필수 정보입니다</span>
			</span>
			

			<span class="intext"> <input type="password" id="member_pw2"
				name="member_pw2" class="inputtext" maxlength="20" placeholder="비밀번호 확인"/> <span class="error" id="pwMsg2">필수 정보입니다</span>
			</span>
		</div>
		</div>



		<div class="row_group"  style="margin-top: 10px; ">
		<div style="border: 1px solid #ccc; margin-bottom: 6px;">
			<span class="intext"> <input type="text" id="member_name"
				name="member_name" class="inputtext" maxlength="40" placeholder="이름(실명)*"/><span class="error" id="nameMsg"> 필수 정보입니다 </span>
			</span> 
		

			<span class="intext"> <input type="email" id="member_email"
				name="member_email" class="inputtext" maxlength="100" placeholder="이메일*" /><span class="error" id="emailMsg"> 필수 정보입니다 </span>
			</span> 
			

			<span class="intext"> <input type="text" id="member_phone"
				name="member_phone" class="inputtext" maxlength="16" placeholder="휴대폰 번호*"/><span class="error" id="phoneMsg"> 필수 정보입니다 </span>
			</span> 
		</div>	
			<input type="hidden" id="member_auth" name="member_auth" value="ROLE_IDV" />
	
	
			<div class="checkbox" style="text-align: center; font-size: 18px; border: 1px solid #ccc; height: 37px; margin: 0 auto;">
  			<label style="margin-top: 5px;">
		    <input type="checkbox" name="ch" onclick="clause();" >
		 	이용약관 및 개인정보 수집 동의
		 	 </label>
			</div>
			
			<div class="btnarea">
				<button type="submit" id="btnJoin" class="btn_type" disabled="disabled" name="btn">
					<span>가입하기</span>
				</button>
			</div>
		</div>
	</div>
</form>
</div>

</div>