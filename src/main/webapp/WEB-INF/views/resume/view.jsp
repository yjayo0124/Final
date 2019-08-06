<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet">
    
<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnBack").click(function(){
		history.go(-1);
	});
	

	$.ajax({
		type : 'GET',
		url : '/resume/scrabCheck',
		data : {
			"resume_no" : ${resume.resume_no}
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
	

	//스크랩 하기
	$("#btnScrab").click(function(){
	 	$.ajax({
			type : 'POST',
			url : '/resume/scrabInsert',
			data : {
				"resume_no" : ${resume.resume_no}
			},
			dataType: 'json',
			success : function(data){
				
				$('#btnScrab').hide();
				$('#btnCancelScrab').show();	
				
				$('#scrabResult').html('관심 지정됨. <a href="/cor/resumeScrab/">기업페이지</a>에서 모아볼 수 있어요.').fadeToggle(3000);
			}
		}) 		
		
	})
	
	//스크랩 취소
	$("#btnCancelScrab").click(function(){
	 	$.ajax({
			type : 'POST',
			url : '/resume/scrabCancel',
			data : {
				"resume_no" : ${resume.resume_no}
			},
			dataType: 'json',
			success : function(data){
				
				$('#btnScrab').show();
				$('#btnCancelScrab').hide();
				
				$('#scrabResult').html('관심 지정 취소').fadeToggle(3000);
				
			}
		}) 		
		
	})
	
	
	
});



</script>    
    
<style type="text/css">

.containers {
	margin: 0 auto;
	padding: 0;
	min-width: 800px;
	width: 800px;
	zoom: 1;

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
/* 	border : 1px solid #dce1eb; */
	border-top: 1px solid; 
}
.head {
	font-weight: bold;
	margin-bottom: 0;
	padding-bottom: 10px;
}
.new {
	width: 800px;
	padding: 20px 20px 40px;
	border: 1px solid #edeef0;
	border-top: none;
	float: left;
	background-color: white;
	position: relative;
}
.row {
	width: 100%;
	margin: 0;

	float: left;
}





input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}
.info{
	width: 800px;
	float: left;
	margin-bottom: 50px;
}



p {
	margin: 0;
	font-family: 'Nanum Gothic', sans-serif;
}


.resume-view{
	margin-top: 30px;
	padding: 30px;
	background-color: #f2f4f7;
	display: inline-block;
}

.info-container{
	margin-left: 60px;
}

.containers> h4{
	color:#88888;
	font-size: 22px;
	font-weight: normal;
}

.btnList{
	background-color: #343a40;
	color: white;
	border: 1px solid #343a40;
	border-radius: 3px;
}

.form{
	background-color: #fcfcfc;
}


th{
	border-right: 1px solid #edeef0;
	width: 149px;
}


td{
	width:85%;
	text-align: left;
	padding-left: 18px;
	padding-right: 18px;
}

tr{
font-size: 17px;
font-family: 'Nanum Gothic', sans-serif;
height: 50px;
border-bottom: 1px solid #edeef0; 
}

</style>

<div class="containers">
		<div class="info-container">
			<h3><strong>${resume.resume_title }</strong></h3>
		<span style="float: right;  margin-top: -31px; position: relative;">
		<sec:authorize access="hasRole('ROLE_COR')">
			<button id="btnScrab" class="btn btn-default" onclick=""><img src="/resources/images/emptystar.png" height="20px"></button>
			<button id="btnCancelScrab" class="btn btn-default" onclick=""><img src="/resources/images/star.png" height="20px"></button>
		</sec:authorize>
		</span>
			<hr>
			<h4 class="head">인적사항</h4>
			<div class="form" style="border:1px solid #dce1eb;;">
				
				<div style="float:left; width:140px; height: 182px; border: 1px solid ; margin:30px; overflow: hidden;">
					<img style=" width:100%; height: 100%;"src="/upload/${resume.resume_stored_name }">
				</div>
				
				<div style="float:left; width:500px; height: 200px;  margin: 40 30 20 0;">
					<div style="float:left; width: 100%; height:47px; margin-bottom: 10px; padding-left: 20px;">
						<p style="font-size: 25px; display: inline;">${resume.resume_name }</p>
						<p style="font-size: 15px; display: inline; margin-left: 10px;">(${resume.resume_gender })</p>
						<p style="font-size: 15px; display: inline; margin-left: 5px;">${resume.resume_birth }세</p>
					</div>
					<div style="float:left; width: 100%; height:37px; margin-bottom: 10px;  padding-left: 20px;">
						<div style="float:left; width: 10%; height:37px; color: #888;">
							<p>휴대폰</p>
						</div>
						<div style="float:left; width: 90%; height:37px;">
							<p>${resume.resume_cellphone }</p>
						</div>
					</div>
					<div style="float:left; width: 100%; height:37px; margin-bottom: 10px; padding-left: 20px;">
						<div style="float:left; width: 10%; height:37px; color: #888;">
							<p>E-mail</p>
						</div>
						<div style="float:left; width: 90%; height:37px;">
							<p>${resume.resume_email }</p>
						</div>
					</div>
					<div style="float:left; width: 100%; height:37px; margin-bottom: 10px; padding-left: 20px;">
						<div style="float:left; width: 10%; height:37px; color: #888;">
							<p>주소</p>
						</div>
						<div style="float:left; width: 90%; height:37px;">
							<p>${resume.resume_addr }</p>
						</div>
					</div>
				</div>	
			</div>
		</div>
		
		
		
	<div class="resume-view">	
		<c:if test="${checkSchool eq true }">
			<div class="info">
				<h4 class="head">학력</h4>
				<div class="form data">
					<c:forEach items="${school}" var="i">
						<c:choose>
							<c:when test="${i.school_classification eq '고등학교'}">
									<div style="float:left; width:100%; height: 30px;  border-bottom: 1px solid #edeef0;">
										<div style="float:left; width:20%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
											<p style="font-size: 15px;">${i.graduation_date}</p>
										</div>
										<div style="float:left; width:54%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
											<p style="font-size: 15px; font-weight: bold;">${i.school_name}</p>
										</div>
										<div style="float:left; width:13%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
											<p style="font-size: 15px;"></p>
										</div>
										<div style="float:left; width:13%; height: 100%; padding-top: 3px;">
											<p style="font-size: 15px; color:#3399ff;">${i.graduation_status}</p>
										</div>
									</div>
							</c:when>
							<c:otherwise>
								<div style="float:left; width:100%; height: 30px;  border-bottom: 1px solid #edeef0;">
									<div style="float:left; width:20%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px;">${i.admission_date} ~ ${i.graduation_date}</p>
									</div>
									<div style="float:left; width:54%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px; font-weight: bold;">${i.school_name} <small>${i.major_name}전공 </small></p>
									</div>
									<div style="float:left; width:13%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px;">${i.credit} / ${i.total_score}</p>
									</div>
									<div style="float:left; width:13%; height: 100%;  padding-left: 20px; padding-top: 3px;">
										<p style="font-size: 15px; color:#3399ff;">${i.graduation_status}</p>
									</div>
								</div>
					</c:otherwise>
					</c:choose>
					</c:forEach>					
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkCareer eq true }">
			<div class="info">
				<h4 class="head">경력</h4>
				<div class="form data">
					<c:forEach items="${career}" var="i">
						<div style="float:left; width:100%; height: 30px;  border-bottom: 1px solid #edeef0;">
							<div style="float:left; width:20%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.hire_date} ~ ${i.retirement_date}</p>
							</div>
							<div style="float:left; width:54%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.company_name}</p>
							</div>
							<div style="float:left; width:13%; height: 100%;padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.position}</p>
							</div>
							<div style="float:left; width:13%; height: 100%;  padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px;">${i.job_work}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkActivities eq true }">
			<div class="info">
				<h4 class="head">인턴,대외활동</h4>
				<div class="form data">
					<c:forEach items="${activities}" var="i">
						<div style="float:left; width:100%; height: 30px; border-bottom: 1px solid #edeef0;">
							<div style="float:left; width:20%; height: 30px; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.start_date} ~ ${i.end_date}</p>
							</div>
							<div style="float:left; width:30%; height: 30px; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.institution_name}</p>
							</div>
							<div style="float:left; width:50%; min-height: 30px; padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px; white-space: pre-wrap;">${i.activity_content}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkEducation eq true }">
			<div class="info">
				<h4 class="head">교육이수</h4>
				<div class="form data">
					<c:forEach items="${education}" var="i">
						<div style="float:left; width:100%; min-height: 45px; border-bottom: 1px solid #edeef0;">
							<div style="float:left; width:20%; height: 45px; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.start_date} ~ ${i.end_date}</p>
							</div>
							<div style="float:left; width:20%; height: 45px; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 13px;">${i.training_title}</p>
							</div>
							<div style="float:left; width:20%; height: 45px; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.educational_facilities}</p>
							</div>
							<div style="float:left; width:40%; min-height: 45px; padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px; white-space: pre-wrap;">${i.training_content}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkCertificate eq true }">
			<div class="info">
				<h4 class="head">자격증</h4>
				<div class="form data">
				<c:forEach items="${certificate}" var="i">
						<div style="float:left; width:100%; height: 30px; border-bottom: 1px solid #edeef0;">
							<div style="float:left; width:50%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px; font-weight: bold;">${i.certificate_name}</p>
							</div>
							<div style="float:left; width:35%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.place_issue}</p>
							</div>
							<div style="float:left; width:15%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.acquisition_date}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkAward eq true }">
			<div class="info">
				<h4 class="head">수상</h4>
				<div class="form data">
					<c:forEach items="${award}" var="i">
						<div style="float:left; width:100%; min-height: 30px; border-bottom: 1px solid #edeef0;">
							<div style="float:left; width:25%; height: 30px;padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.award_name}</p>
							</div>
							<div style="float:left; width:25%; height: 30px; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.award_service}</p>
							</div>
							<div style="float:left; width:10%; height: 30px;  padding-left: 10px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.award_date}</p>
							</div>
							<div style="float:left; width:40%; min-height: 30px; padding-left: 20px; padding-top: 3px; ">
								<p style="font-size: 15px; white-space: pre-wrap;">${i.award_content}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkOverseas_Experience eq true }">
			<div class="info">
				<h4 class="head">해외경험</h4>
				<div class="form data">
					<c:forEach items="${overseas_Experience}" var="i">
						<div style="float:left; width:100%; min-height: 30px; border-bottom: 1px solid #edeef0">
							<div style="float:left; width:20%; height: 30px;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.start_date} ~ ${i.end_date}</p>
							</div>
							<div style="float:left; width:30%; height: 30px; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
								<p style="font-size: 15px;">${i.country_name}</p>
							</div>
							<div style="float:left; width:50%; min-height: 30px;  padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px; white-space: pre-wrap;">${i.overseas_experience_content}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkLanguage eq true }">
			<div class="info">
				<h4 class="head">어학</h4>
				<div class="form data">
					<c:forEach items="${language}" var="i">
						<c:choose>
							<c:when test="${i.language_classification eq '회화능력'}">
								<div style="float:left; width:100%; height: 30px; border-bottom: 1px solid #edeef0;">
									<div style="float:left; width:20%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px;">${i.language_classification}</p>
									</div>
									<div style="float:left; width:50%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px; color:#3399ff;">${i.language_name}</p>
									</div>
									<div style="float:left; width:30%; height: 100%;  padding-left: 20px; padding-top: 3px;">
										<p style="font-size: 15px;">${i.conversational_ability}</p>
									</div>
								</div>
							</c:when>
							
							<c:when test="${i.language_classification eq '공인시험'}">
								<div style="float:left; width:100%; height: 30px; border-bottom: 1px solid #edeef0;">
									<div style="float:left; width:20%; height: 100%; padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px;">${i.language_classification}</p>
									</div>
									<div style="float:left; width:50%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px; color:#3399ff;">${i.language_name}</p>
									</div>
									<div style="float:left; width:15%; height: 100%;  padding-left: 20px; padding-top: 3px; border-right: 1px solid #edeef0;">
										<p style="font-size: 15px; font-weight: bold;">${i.language_score}${i.conversational_ability}</p>
									</div>
									<div style="float:left; width:15%; height: 100%;  padding-left: 20px; padding-top: 3px;">
										<p style="font-size: 15px;">${i.acquisition_date}</p>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		
		<c:if test="${checkPreferential eq true }">
			<div class="info">
				<h4 class="head">취업우대, 병역</h4>
				<div class="form data">
					<div style="float:left; width:100%; height: 35px; border-bottom: 1px solid #edeef0">
						<c:if test="${preferential.veterans eq true }">
							<div style="float:left; width:20%; height: 100%; padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px;"><u>보훈대상</u></p>
							</div>
						</c:if>
						<c:if test="${preferential.protect eq true }">
							<div style="float:left; width:20%; height: 100%;  padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px;"><u>취업보호 대상</u></p>
							</div>
						</c:if>
						<c:if test="${preferential.funding eq true }">
							<div style="float:left; width:20%; height: 100%;  padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px;"><u>고용지원금 대상</u></p>
							</div>
						</c:if>
						<c:if test="${preferential.disorder ne '0' }">
							<div style="float:left; width:20%; height: 100%; padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px;">장애 : <span style="color:#E71D36;"> ${preferential.disorder} </span></p>
							</div>
						</c:if>
						<c:if test="${preferential.military ne '0' }">
							<div style="float:left; width:20%; height: 100%;  padding-left: 20px; padding-top: 3px;">
								<p style="font-size: 15px;">병역 : ${preferential.military}</p>
							</div>
						</c:if>

					</div>
				</div>
			</div>
		</c:if>	
		
		<div class="info">
			<h4 class="head">희망근무조건</h4>
			<div class="form data">
				<table>
				<tr>
					<th>고용형태</th>
					<td>${resume.forms_employment }</td>
				</tr>
				<tr>
					<th>희망근무지</th>
					<td>${resume.desired_work_place }</td>				
				</tr>
				<tr>
					<th>희망연봉</th>
					<td>${resume.salary }만원 이상</td>			
				</tr>			
				</table>
			
			</div>
		</div>
		
		<c:if test="${introduction ne null }">
		
	<div class="info_container" style="width: 800px;">
		<h3 style="font-weight: bold;">${introduction.introduction_title }</h3>
		<hr>
		<div>
			<div class="div_Introduction">
				<div class="new">
					<div class="row">
						<div class="info_form" style="width: 100%; padding: 20px; font-weight: bold;">
						${introduction.introduction_question }
						</div>
					</div>
					<div class="row" style="width: 100%; ">
						<div class="info_form" style="width: 100%; padding: 20px;">
						${introduction.introduction_content }
						</div>
					</div>
				</div>
				<c:if test="${checkSub eq true }">
					<c:forEach items="${sub}" var="i">
						<div class="new">
							<div class="row">
								<div class="info_form" style="width: 100%; padding: 20px; font-weight: bold;">
								${i.sub_introduction_question }
								</div>
							</div>
							<div class="row" style="width: 100%; ">
								<div class="info_form" style="width: 100%;  padding: 20px;">
								${i.sub_introduction_content }
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>	
	</div>
		
		</c:if>
		
		</div>
		
		<div style="margin-top: 50px; text-align: center;">
			<button type="button" class="btnList" id="btnBack">목록</button>
		</div>
		
	
</div>    
    
    
    