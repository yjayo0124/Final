<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<script type="text/javascript">
var introduction_title;
var list_numbers = new Array();
var list_introduction_question = new Array();
var list_introduction_content = new Array();
var formData = new FormData();
var introduction_no;

function submit() {
	introduction_title =  $('.title').find("input[name='introduction_title']").val();
	if( introduction_title == ""){
		alert("제목을 입력해 주세요.")
	} else {
		introduction();	
	}
}

function introduction() {
	introduction_title =  $('.title').find("input[name='introduction_title']").val();
	var introduction_question = $('.question').find("input[name='introduction_question']").val();
	var introduction_content = $('.content').find("textarea[name='introduction_content']").val();
	
	$.ajax({
        url: "/mypage/introduction/write",
        type: "POST",
        data: {
        	introduction_title : introduction_title,
        	introduction_question : introduction_question,
        	introduction_content : introduction_content
        	},
        success: function(data){
        	introduction_no = data;
        	sub_introduction();
        	
        	$.ajax({
                url: "/mypage/introduction/writeSub",
                type: "POST",
                traditional : true,
                data: {
                	introduction_no : introduction_no,
                	list_numbers : list_numbers,
                	list_introduction_question : list_introduction_question,
                	list_introduction_content : list_introduction_content
                },
                success: function(data){
                	location.href = "/mypage/main";
                },
                error: function(){
                    alert("error");
                }
            });
        	
        },
        error: function(){
            alert("error");
        }
    });
	
}

function sub_introduction() {
	var countSub = $("#div_Introduction .add").size();
	
	if(countSub != "0") {
		for(var i=0; i<countSub; i++) {

			list_numbers.push(i+1);
			list_introduction_question.push($("#div_Introduction").children("div.add").eq(i).find("input[name='sub_introduction_question']").val());
			list_introduction_content.push($("#div_Introduction").children("div.add").eq(i).find("textarea[name='sub_introduction_content']").val());
		}
		
		formData.append("numbers",list_numbers);
		formData.append("sub_introduction_question",list_introduction_question);
		formData.append("sub_introduction_content",list_introduction_content);
	}
}

function create_Introduction() {
	$('#div_Introduction').append(
			"<div class='new add'>"+
				"<div class='row'>"+
					"<div class='info_form school' style='width: 97%;'>"+
						"<input type='text' name='sub_introduction_question' placeholder='질문'>"+
					"</div>"+
				"</div>"+
				"<div class='row' style='height: 300px;'>"+
					"<textarea class='textarea_content' placeholder='내용' name='sub_introduction_content'></textarea>"+
				"</div>"+
				"<button type='button' class='delete_btn' onclick='delete_btn()'></button>"+
			"</div>");
}
	
function delete_btn() {
	var thisEle = event.target;
	thisEle.closest("div.new").remove();		
}

</script>

<style type="text/css">

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

.form {
	width: 100%;
	float: left;
}

.head {
	font-weight: bold;
	border-bottom: 1px solid #dce1eb;
	margin-bottom: 0;
	padding-bottom: 10px;
}

.new {
	width: 940px;
	padding: 20px 20px 10px;
	border: 1px solid #dce1eb;
	border-top: none;
	float: left;
	background-color: white;
	position: relative;
}

.row {
	width: 100%;
	margin: 0;
	height: 50px;
	margin-bottom: 10px;
	float: left;
}

.info_form {
	border: 1px solid #dce1eb;
}

.school {
	width: 300px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.textarea_content {
	border-radius: 4px;
	padding: 10 20px;
	overflow-x: hidden;
	overflow-y: auto;
	border-color: #dce1eb;
	width: 97%;
	height: 300px;
	border: 1;
	overflow: visible;
	text-overflow: ellipsis;
}

.img_button {
	background: url( "/resources/images/plus.png" ) no-repeat;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.delete_btn {
	background: url( "/resources/images/delete.png" ) no-repeat;
	right: 0;
	top: 0;
	width: 32px;
	height: 32px;
	position: absolute;
	border: none;
}

input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
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
		<div class="info_container" style="margin-left: 250px; width: 940px;">
			<h3>자기소개서 등록</h3>
			<hr>
			<div id="form_Overseas_Experience">
				<h4 class="head">자기소개서 작성</h4>
					<div class="form" id="div_Introduction">
						<div class="new">
							<div class="row">
								<div class="info_form school title" style="width: 97%;">
									<input type="text" name="introduction_title" placeholder="제목">
								</div>
							</div>
							<div class="row">
								<div class="info_form school question" style="width: 97%;">
									<input type="text" name="introduction_question" placeholder="질문">
								</div>
							</div>
							<div class="row content" style="height: 300px;">
								<textarea class="textarea_content" placeholder="내용" name="introduction_content"></textarea>
							</div>
						</div>
					</div>
				<div class="new" style="text-align: center; margin-bottom: 30px;">
					<label><button class="img_button" id="new_Introduction"	type="button" style="width: 90px;"
							onclick="create_Introduction();">추가</button></label>
				</div>
			</div>
			<div style="float: right;">
				<button type="button" onclick="submit();">작성완료</button>
			</div>
		</div>

	</div>

</div>