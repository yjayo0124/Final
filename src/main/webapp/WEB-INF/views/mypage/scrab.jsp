<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
.container {
	margin: 0 auto;
	padding:0;
    width: 1200px;
    zoom: 1;
}

.bottom_container{
	width:1200px;
	margin-top:10px;
	height: auto;
	display: inline;
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
	margin-top: 15%;
}

#withdraw{
	margin-top: 10px;
}


.table th{
	
	background-color: #011627;
	color: white;

}
.table a{

	color: black;
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
					<li><a href="/mypage/info/check">회원정보 수정</a></li>
					<li><a href="/mypage/withdraw/confirm">회원 탈퇴</a></li>
				</ul>
			</div>
		</div>
		<div class="reviewList" style="margin-left: 250px; width: 800px;">

<h3>내 스크랩<img src="/resources/images/like.png" height="24px" style="margin-left:4px; margin-bottom: 1px;"></h3>
<hr>
<div class="review_table" style="border: 1px solid #ccc; height: 400px;">
<table class="table table-hover table-condensed" >
	<thead>
		<tr >
			<th style="width: 25%; text-align: center;">기업명</th>
			<th style="width: 50%; text-align: center;">제목</th>	
			<th style="width: 12.5%; text-align: center; ">형태</th>
			<th style="width: 12.5%; text-align: center;">직급</th>
		</tr>
	</thead>
	<tbody>
	
 <c:forEach items="${list }" var="i">
	<tr onclick="location.href='/recruitment/view?recruit_no=${i.RECRUIT_NO }'">
		<td style="width: 25%; font-size: 14px; text-align: center;">${i.RECRUIT_NAME }</td>
		<td style="width: 50%; text-align: center;">${i.RECRUIT_TITLE }</td>
		<td style="width: 12.5%; text-align: center;" >${i.RECRUIT_TYPE }</td>
		<td style="width: 12.5%; text-align: center;">${i.RECRUIT_POSITION }</td>
	</tr>
</c:forEach>
</tbody>
</table>
</div>


		</div>
	</div>
</div>