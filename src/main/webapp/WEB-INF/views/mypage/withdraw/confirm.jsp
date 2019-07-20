<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function() {
	$("body").on({			
		click: function() {		// click 이벤트가 발생했을 때
			$("#text").html("<a class='btn btn-danger' id='withdraw' href='/mypage/withdrawProc'>탈퇴하기</a>");
		}
	}, "#btnWithdraw");		// id가 "btn"인 요소에 이벤트 핸들러를 등록함.
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

.withdraw_container{
	text-align: center;
}


#withdraw{
	margin-top: 10px;
}

</style>
    
<div class="container">
	<div class="top_container">
	<div class="profile">
			<div class="profile_img">
				<img class="img-circle" src="/resources/images/avatar.png">
				<div class="profile_name"><strong>홍길동</strong>님</div>
				<div class="profile_btn"><button type="button" class="btn_create_resume">이력서 작성하기</button></div>
			</div>
		</div>
	</div>
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
		
		<div class="withdraw_container">
			<h4 style="margin-bottom: 7px;">버튼을 누르시면 더이상 KHOB의 서비스를 이용하실 수 없습니다.</h4>
		 <button id="btnWithdraw" type="button" class="btn btn-warning btn-lg">정말 탈퇴하시겠습니까?</button>
		 	<div id="text">
		 	</div>
		</div>
	</div>
</div>