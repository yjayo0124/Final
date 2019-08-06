<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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


$(document).ready(function() {
	//가입 버튼 클릭 시 form submit
	$("#btnUpdate").click(function() {
		if( ch_pw==true && ch_pw2==true){
			$(this).parents("form").submit();
		}if(ch_pw==false){ $('#pwMsg1').show(); 
		}if(ch_pw2==false){ $('#pwMsg2').show(); 
		}
	})
});	

</script>



<style type="text/css">
.container {
	margin: 0 auto;
	padding:0;
    width: 1200px;

    zoom: 1;
}
.top_container {
	width:1200px;
	height: 190px;
}
.bottom_container{
	width:1200px;
	margin-top:10px;
	height: auto;
	display: inline;
}

.page_list{
	width:190px;
	float: left;
	border: 1px solid #dce1eb;
	margin-right: 10px;
}
.profile_img{
	margin: 20px auto 0;
	text-align: center;
}
.profile_img img{
	width:86px;
	height:86px;
}
.profile_name{
	height:20px;
	margin: 8px 0;
}
.profile_btn{
	height:24px;
}
.btn_create_resume {
	padding: 2px;
    border: 1px solid #e7e9e9;
    font-size: 12px;
    color: #333;
    height: 24px;
    width: 97px;
    font-size: 12px;
    background: white;
}

.listGroup {
	width:190px;
	padding: 15px 20px;
	border-bottom: 1px solid #dce1eb;
	float:left;
}


.listGroup  ul {
	margin:0;
	padding:0;
	list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.listGroup li {
	list-style: none;
}
.list_title{
	padding-top: 10px;
    font-size: 15px;
    font-weight: bold;
    margin:0;
}

.form-group{
	height: 30px;
}


#btnUpdate{
	
	
	background-color: #a6172d;
	border: none;
	border-radius: 4px;
	color: white;

}

</style>
    
<div class="container">
	<div class="bottom_container">
 		<div class="page_list">
			<div class="listGroup">
				<h2 class="list_title">자기소개서 관리</h2>
				<ul>
					<li><a href="/mypage/introduction/write">자기소개서 등록</a></li>
					<li><a href="/mypage/introduction/list">자기소개서 관리</a></li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">이력서 관리</h2>
				<ul>
					<li><a href="/mypage/resume/write">이력서 등록</a></li>
					<li><a href="/mypage/resume/list">이력서 관리</a></li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">활동 관리</h2>
				<ul>
					<li><a href="/mypage/scrab">내 스크랩</a></li>
					<li><a href="/mypage/myReview">내가 쓴 리뷰</a></li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">회원정보 관리</h2>
				<ul>
					<li><a href="/mypage/info/update">회원정보 수정</a></li>
					<li><a href="/mypage/withdraw/confirm">회원 탈퇴</a></li>
				</ul>
			</div>
		</div>    
	<div class="info_container" style="margin-left: 250px; width: 700px;">
		<h3>회원정보 수정</h3>
		<hr>
		<form action="/mypage/info/update" method="POST" class="form-horizontal">
			<input type="hidden" name="member_no" value="${member.member_no }">
	
		<div class="form-group">
		<label for="member_id" class="col-sm-2">ID</label>
		<div class="col-sm-4"><input type="text" class="form-control" id="member_id" name="member_id" value="${member.member_id }" readonly/></div>
		</div>
		
		<div class="form-group">
		<label for="member_name" class="col-sm-2">이름</label>
		<div class="col-sm-4"><input type="text" class="form-control" id="member_name" name="member_name" value="${member.member_name }" readonly/></div>
		</div>
		
		
		<div class="form-group has-error">
		<label for="member_pw" class="col-sm-2">비밀번호</label>
		<div class="col-sm-4"><input type="password" id="member_pw" name="member_pw" class="inputtext form-control" maxlength="20"  /></div>
		</div>
			
		<div class="form-group has-error">
		<label for="member_pw2" class="col-sm-2">비밀번호 확인</label>
		<div class="col-sm-4"><input type="password" id="member_pw2" name="member_pw2" class="inputtext form-control" maxlength="20" onkeyup="checkPwd()" /></div>
		<div class="col-sm-4"> <span class="error" id="pwMsg2" role="alert"> 필수 정보입니다 </span></div>
		</div>
		
	
		<div class="form-group">
		<label for="member_phone" class="col-sm-2">휴대폰</label>
		<div class="col-sm-4"><input type="text" class="form-control" id="member_phone" name="member_phone" value="${member.member_phone }"/></div>
		</div>
	
		<div class="form-group">
		<label for="member_email" class="col-sm-2">이메일</label>
		<div class="col-sm-4"><input type="text" class="form-control" id="member_email" name="member_email" value="${member.member_email }"/></div>
		</div>

	<div style="margin-left: 190px;">
		<button  id="btnUpdate" class="btn_type">
		<span>변경하기</span>
		</button>
	</div>

		</form>
		
		
	</div>
	
	</div>

</div>