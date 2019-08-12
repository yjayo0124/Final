<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<script type="text/javascript">
$(document).ready(function() {
	

	$.ajax({
		type : 'GET',
		url : '/mypage/scrabCheck',
		data : {
			"recruit_no" : ${viewRecruit.recruit_no}
		},
		dataType: 'json',
		success : function(data){
			console.log(data);
		
			if(data) {//true ==> 스크랩 가능 하게 만들어야함 
				
				$('#btnScrab').show();
				$('#btnCancelScrab').hide();
						
			}else{
				$('#btnScrab').hide();
				$('#btnCancelScrab').show();
				
			}
		}
	
	});
	
	
	$("#btnCor").click(function() {
// 		$(location).attr("href", "/cor/info?cor_no="+${corlist.COR_NO }+"&cor_type="+${corlist.COR_TYPE });
	});
	
	$("#btnUpdate").click(function(){
		$(location).attr("href","/recruitment/update?recruit_no="+${viewRecruit.getRecruit_no() });
	});
	
	
	$("#btnDelete").click(function(){
		$(location).attr("href","/recruitment/delete?recruit_no="+${viewRecruit.getRecruit_no() });
	});
	
	
	//스크랩 하기
	$("#btnScrab").click(function(){
	 	$.ajax({
			type : 'POST',
			url : '/mypage/scrabInsert',
			data : {
				"recruit_no" : ${viewRecruit.recruit_no }
			},
			dataType: 'json',
			success : function(data){
				
				$('#btnScrab').hide();
				$('#btnCancelScrab').show();	
				
				$('#scrabResult').html('스크랩 성공♬ <a href="/mypage/scrab/">마이페이지</a>에서 모아볼 수 있어요.').fadeToggle(3000);
			}
		}) 		
		
	})
	
	//스크랩 취소
	$("#btnCancelScrab").click(function(){
	 	$.ajax({
			type : 'POST',
			url : '/mypage/scrabCancel',
			data : {
				"recruit_no" : ${viewRecruit.recruit_no }
			},
			dataType: 'json',
			success : function(data){
				
				$('#btnScrab').show();
				$('#btnCancelScrab').hide();
				
				$('#scrabResult').html('스크랩 취소 성공♬').fadeToggle(3000);
				
			}
		}) 		
		
	})
	
	
	
});



</script>

<style type="text/css">
.readSumWrap {
	position: relative;
 }

.col_1 {
    color: #39f;
    font-weight: normal;
}
 
 h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.tbCol  {
    float: left;
    width: 320px;
    margin: 0 20px 0 0;
}  
 
.tbList {
    margin-top: 7px;
 }
.tbRow {
    padding-top: 18px;
}    
.tbList > dd {
   color: #333;
    width: 257px;
}
.tbList > dt {
    color: #999;
    width: 80px;
    vertical-align: top;
    
}
.tbList > dt, .tbList > dd {
    display: inline-block;
    font-size: 13px;
    margin: 4px 0 5px 0;
    }
    
 dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

dd {
    display: block;
    margin-inline-start: 40px;
}

.tbCoInfo {
    width: 188px;
    margin: 0 0 0 20px;
}

.divDetailWrap {
    position: relative;
    margin-top: 500px;
}
</style>

<div class="readSumWrap clear">
	<h2>채용정보</h2><hr>
	<div class="hidden"><h3>공고번호 : ${viewRecruit.recruit_no }</h3></div>

	<div><span>${viewRecruit.recruit_name }</span>
		<h3>${viewRecruit.recruit_title }</h3></div>
	<span>
		<sec:authorize access="hasRole('ROLE_IDV')">
			<button id="btnScrab" class="btn btn-default" onclick=""><img src="/resources/images/like_empty.png" height="20px"></button>
			<button id="btnCancelScrab" class="btn btn-default" onclick=""><img src="/resources/images/like.png" height="20px"></button>
			<span id="scrabResult"></span>
		</sec:authorize>
	</span>

	<div class="tbRow clear">
		<div class="tbCol">
			<h4>지원자격</h4>
				<dl class="tbList">
					<dt>경력</dt>
					<dd>
						<strong class="col_1">${viewRecruit.recruit_career }</strong>
					</dd>
					<dt>학력</dt>
					<dd>
						<strong class="col_1">${viewRecruit.recruit_educareer }</strong>
					</dd>
					<dt>우대 자격증</dt>
					<dd>
						<strong class="col_1">${viewRecruit.recruit_certificate }</strong>
					</dd>
					<dt> 우대 전공 </dt>
					<dd>
						<strong class="col_1">${viewRecruit.recruit_major }</strong>
				</dl>
		</div>
		<div class="tbCol">
			<h4>근무자격</h4>
				<dl class="tbList">
					<dt>근무지역</dt>
					<dd>
						<strong class="col_1">${viewRecruit.recruit_loc }</strong>
					</dd>
					<dt>고용형태</dt>
					<dd>
						<strong class="col_1">${viewRecruit.recruit_type }</strong>
					</dd>
					<dt>급여</dt>
					<dd>
						연봉 : <strong class="col_1">${viewRecruit.recruit_sal }</strong>만원
					</dd>
					<dt>직급</dt>
					<dd>
						<strong class="col_1">${viewRecruit.recruit_position }</strong>
					</dd>
				</dl>
		</div>

		<div class="tbCol tbCoInfo">
			<h4>기업정보</h4>
			<dl class="tbList">
				<dt>기업명</dt>
				<dd>
					<strong class="col_1">${viewRecruit.recruit_name }</strong>
				</dd>
				<dt>회사주소</dt>
				<dd>
					<strong class="col_1">${cor.cor_addr}</strong>
				</dd>
			</dl>
			<a href="/cor/info?cor_no=${cor.cor_no }&cor_type=${cor.cor_type }">
			<button id="btnCor" class="btn btn-default">기업정보 상세보기</button> </a>	
		</div>
	</div>
</div>

<div id="detailArea" class="divDetailWrap">
	<h2>상세요강</h2><hr>
	<div>${viewRecruit.recruit_content }
		<c:if test="${file ne null }">
			<img src="/upload/${file}" style="width: 100%; height: auto;">
		</c:if>
	</div>
</div>

<div class="text-right">
	<a href="/recruitment/main"><button class="btn btn-default">목록</button></a>
	<sec:authentication property="details" var="member"/>
		<sec:authorize access="isAuthenticated()">
		<c:if test="${member.member_no eq viewRecruit.member_no }" >
			<button id="btnUpdate"  class="btn btn-warning">수정</button>
			<button id="btnDelete" class="btn btn-danger">삭제</button>
		</c:if>
		</sec:authorize>
</div>
