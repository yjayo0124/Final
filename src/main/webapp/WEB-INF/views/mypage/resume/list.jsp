<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
$( document ).ready(function() {
   $('.btnMain').click(function() {
	var num = $(this).parent().find("input[name='resume_no']").val(); 
	  
	  location.href = "/mypage/resume/updateMain?resume_no=" + num; 
   });
   
   $('.btnUnlockMain').click(function() {
		var num = $(this).parent().find("input[name='resume_no']").val(); 
		  
		  location.href = "/mypage/resume/unlockMain?resume_no=" + num; 
	   });
   
   $('.btnDelete').click(function() {
		var num = $(this).parent().find("input[name='resume_no']").val(); 
		  
		  location.href = "/mypage/resume/delete?resume_no=" + num; 
	   });
   
   $('.btnwrite').click(function() {
		  
		  location.href = "/mypage/resume/write" 
	   });
});

</script>
<style type="text/css">
a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
.containers {
	margin: 0 auto;
	padding: 0;
	width: 1200px;
	zoom: 1;
}

.top_container {
	width: 1200px;
	height: 190px;
}

.bottom_container {
	width: 1200px;
	margin-top: 10px;
	height: auto;
	display: inline;
}

.page_list {
	width: 190px;
	float: left;
	border: 1px solid #dce1eb;
	margin-right: 10px;
}

.profile_img {
	margin: 20px auto 0;
	text-align: center;
}

.profile_img img {
	width: 86px;
	height: 86px;
}

.profile_name {
	height: 20px;
	margin: 8px 0;
}

.profile_btn {
	height: 24px;
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
	width: 190px;
	padding: 15px 20px;
	border-bottom: 1px solid #dce1eb;
	float: left;
}

.listGroup  ul {
	margin: 0;
	padding: 0;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.listGroup li {
	list-style: none;
}

.list_title {
	padding-top: 10px;
	font-size: 15px;
	font-weight: bold;
	margin: 0;
}

.form-group {
	height: 30px;
}

table, th {
	text-align: center;
}
.txt_line { 
	padding-top: 10px;
	padding-bottom: 10px;
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
}
table {
	width: 100%;
	border-top: 3px solid #444444;
	border-bottom: 3px solid #444444;
	border-left: 0px solid white;
	border-right: 0px solid white;
	border-collapse: collapse;
	margin: auto;
	margin-top: 35px;
}

th {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
	background-color: #e9e9e9;
	width: auto;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
}
</style>

<div class="containers">
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
		<div class="info_container" style="margin-left: 250px; width: 800px;">
			<h3>이력서 관리</h3>
			<hr>

			<table class="table table-striped table-hover table-condensed" style="margin-top: 50px; margin-bottom: 40px; table-layout: fixed;">
				<thead>
					<tr>
						<th style="width: 18%;"></th>
						<th style="width: 57%;">이력서 제목</th>
						<th style="width: 25%;">이력서 관리</th>
					</tr>
				</thead>

				<c:choose>
					<c:when test="${checkResume eq true}">
						<c:forEach items="${list}" var="i">
							<tr style="border-bottom: 1px solid #dce1eb;">
								<td style="font-weight: bold;">
								<c:if test="${i.main_resume eq '1'}">
								대표 이력서
								</c:if>
								</td>
								<td class="txt_line"><a href="/mypage/resume/detail?resume_no=${i.resume_no }">${i.resume_title }</a></td>
								<td>
								<input type="hidden" name="resume_no" value="${i.resume_no }">
								<c:if test="${checkMainResume eq false }">
									<c:if test="${i.main_resume eq '0'}">
									<button type="button" class="btn btn-default btnMain" style="margin-right: 5px;" >대표 등록</button>
									</c:if>
								</c:if>
									<c:if test="${i.main_resume eq '1'}">
									<button type="button" class="btn btn-default btnUnlockMain" style="margin-right: 5px;" >대표 해제</button>
									</c:if>
									<button type="button" class="btn btn-default btnDelete">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr style="border-bottom: 1px solid #dce1eb;">
							<td style="font-weight: bold;">없음</td>
							<td>이력서가 등록되어있지 않습니다.</td>
							<td>
								<button type="button" class="btn btn-default btnwrite" style="margin-right: 5px;">작성하기</button>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<div id="pagingBox">
				<c:import url="/WEB-INF/views/layout/resumePaging/paging.jsp" />
			</div>
		</div>

	</div>

</div>