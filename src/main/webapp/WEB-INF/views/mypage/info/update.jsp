<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
}
.profile {
	width:190px;
	height: 190px;
	border: 1px solid #dce1eb;
	float: left;
	margin-right: 10px;
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

</style>
    
<div class="container">
	<div class="bottom_container">
 		<div class="page_list">
			<div class="listGroup">
				<h2 class="list_title">자기소개서 관리</h2>
				<ul>
					<li>자기소개서 등록</li>
					<li>자시소개서 관리</li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">이력서 관리</h2>
				<ul>
					<li><a href="/mypage/resume/write">이력서 등록</a></li>
					<li>이력서 관리</li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">활동 관리</h2>
				<ul>
					<li>내 스크랩</li>
					<li>내가 쓴 리뷰</li>
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
	
		<div class="form-group">
		<label for="member_phone" class="col-sm-2">휴대폰</label>
		<div class="col-sm-4"><input type="text" class="form-control" id="member_phone" name="member_phone" value="${member.member_phone }"/></div>
		</div>
	
		<div class="form-group">
		<label for="member_email" class="col-sm-2">이메일</label>
		<div class="col-sm-4"><input type="text" class="form-control" id="member_email" name="member_email" value="${member.member_email }"/></div>
		</div>
	
		<h3><small>비밀번호 수정</small></h3>
		
		</form>
	</div>
	
	</div>

</div>