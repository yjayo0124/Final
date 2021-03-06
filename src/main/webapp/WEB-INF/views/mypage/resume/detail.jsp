<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script	type="text/javascript">
$( document ).ready(function() { 		
	$('.btnlist').click(function() {  
		  location.href = "/mypage/resume/list"; 
	 });	 
	
	$('.btnUpdate').click(function() {
		var num = $(this).parent().find("input[name='resume_no']").val(); 
		  
		location.href = "/mypage/resume/update?resume_no=" + num; 
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
	width: 800px;
	zoom: 1;
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
	border: 1px solid #A4A4A4;
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
	border-bottom: 1px solid #A4A4A4;
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
/* 	border : 1px solid #A4A4A4; */
	border-top: 1px solid #A4A4A4; 
	text-align: center;
	padding-left: 0;
}
.head {
	font-weight: bold;
	margin-bottom: 0;
	padding-bottom: 10px;
}
.new {
	width: 800px;
	padding: 20px 20px 10px;
	border: 1px solid #A4A4A4;
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
	border: 1px solid #A4A4A4;
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
	border-color: #A4A4A4;
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
.info{
	width: 800px;
	float: left;
	margin-bottom: 50px;
}
.textarea_content {
	border-radius: 4px;
	padding: 3 10px;
	overflow-x: hidden;
	overflow-y: auto;
	border-color: #A4A4A4;
	width: 100%;
	min-height: 30px;
	border: 1;
	overflow: visible;
	text-overflow: ellipsis;
}
p {
	margin: 0;
}

</style>

<div class="containers">
		<div class="info">
			<h3>${resume.resume_title }</h3>
			<hr>
			<div style="margin-bottom: 15px; float: right;">
				<button type="button" class="btn btn-default btnUpdate">수정하기</button>
				<input type="hidden" name="resume_no" value="${resume.resume_no }">
			</div>
			<h4 class="head">인적사항</h4>
			<div class="form" style="border:1px solid #A4A4A4; text-align: left;">
				
				<div style="float:left; width:200px; height: 200px; border: 1px solid #A4A4A4; margin:30px;">
					<img style=" width:100%; height: 100%;"src="/upload/${resume.resume_stored_name }">
				</div>
				
				<div style="float:left; width:500px; height: 200px;  margin: 40 30 20 0;">
					<div style="float:left; width: 100%; height:47px; margin-bottom: 10px; padding-left: 20px;">
						<p style="font-size: 25px; display: inline;">${resume.resume_name }</p>
						<p style="font-size: 15px; display: inline; margin-left: 10px;">${resume.resume_gender }</p>
						<p style="font-size: 15px; display: inline; margin-left: 5px;">${resume.resume_birth }세</p>
					</div>
					<div style="float:left; width: 100%; height:37px; margin-bottom: 10px;  padding-left: 20px;">
						<div style="float:left; width: 10%; height:37px;">
							<p>휴대폰</p>
						</div>
						<div style="float:left; width: 90%; height:37px;">
							<p>${resume.resume_cellphone }</p>
						</div>
					</div>
					<div style="float:left; width: 100%; height:37px; margin-bottom: 10px; padding-left: 20px;">
						<div style="float:left; width: 10%; height:37px;">
							<p>E-mail</p>
						</div>
						<div style="float:left; width: 90%; height:37px;">
							<p>${resume.resume_email }</p>
						</div>
					</div>
					<div style="float:left; width: 100%; height:37px; margin-bottom: 10px; padding-left: 20px;">
						<div style="float:left; width: 10%; height:37px;">
							<p>주소</p>
						</div>
						<div style="float:left; width: 90%; height:37px;">
							<p>${resume.resume_addr }</p>
						</div>
					</div>
				</div>	
			</div>
		</div>
		
		<c:if test="${checkSchool eq true }">
			<div class="info">
				<h4 class="head">학력사항</h4>
				<div class="form">
					<c:forEach items="${school}" var="i">
						<c:choose>
							<c:when test="${i.school_classification eq '고등학교'}">
									<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none;">
										<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
											<p style="font-size: 15px;"><c:if test="${i.graduation_date ne '0'}">${i.graduation_date}</c:if>
											</p>
										</div>
										<div style="float:left; width:54%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
											<p style="font-size: 15px;"><c:if test="${i.school_name ne '0'}">${i.school_name}</c:if></p>
										</div>
										<div style="float:left; width:13%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
											<p style="font-size: 15px;"></p>
										</div>
										<div style="float:left; width:13%; height: 100%;    padding-top: 3px;">
											<p style="font-size: 15px;"><c:if test="${i.graduation_status ne '0'}">${i.graduation_status}</c:if></p>
										</div>
									</div>
							</c:when>
							<c:otherwise>
								<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none;">
									<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.admission_date ne '0'}">${i.admission_date}</c:if> ~ 
										<c:if test="${i.graduation_date ne '0'}">${i.graduation_date}</c:if></p>
									</div>
									<div style="float:left; width:54%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.school_name ne '0'}">${i.school_name}</c:if>
										 <c:if test="${i.major_name ne '0'}">${i.major_name}</c:if></p>
									</div>
									<div style="float:left; width:13%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;">
										<c:if test="${i.credit ne '0'}">${i.credit}</c:if> / <c:if test="${i.total_score ne '0'}">${i.total_score}</c:if></p>
									</div>
									<div style="float:left; width:13%; height: 100%;    padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.graduation_status ne '0'}">${i.graduation_status}</c:if></p>
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
				<h4 class="head">경력사항</h4>
				<div class="form">
					<c:forEach items="${career}" var="i">
						<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none;">
							<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;">
								<c:if test="${i.hire_date ne '0'}">${i.hire_date}</c:if> ~ <c:if test="${i.retirement_date ne '0'}">${i.retirement_date}</c:if></p>
							</div>
							<div style="float:left; width:54%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.company_name ne '0'}">${i.company_name}</c:if></p>
							</div>
							<div style="float:left; width:13%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.position ne '0'}">${i.position}</c:if></p>
							</div>
							<div style="float:left; width:13%; height: 100%;    padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.job_work ne '0'}">${i.job_work}</c:if></p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkActivities eq true }">
			<div class="info">
				<h4 class="head">대외활동</h4>
				<div class="form">
					<c:forEach items="${activities}" var="i">
						<div style="float:left; width:100%; height: 30px; border-top: 1px solid #A4A4A4; border-top: none;">
							<div style="float:left; width:20%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.start_date ne '0'}">${i.start_date}</c:if> ~ <c:if test="${i.end_date ne '0'}">${i.end_date}</c:if></p>
							</div>
							<div style="float:left; width:30%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.institution_name ne '0'}">${i.institution_name}</c:if></p>
							</div>
							<div style="float:left; width:50%; min-height: 30px; border-left:1px solid #A4A4A4; border-right:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px; white-space: pre-wrap;"><c:if test="${i.activity_content ne '0'}">${i.activity_content}</c:if></p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkEducation eq true }">
			<div class="info">
				<h4 class="head">교육사항</h4>
				<div class="form">
					<c:forEach items="${education}" var="i">
						<div style="float:left; width:100%; min-height: 30px; border-top: 1px solid #A4A4A4; border-top: none;">
							<div style="float:left; width:20%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px;">
								<c:if test="${i.start_date ne '0'}">${i.start_date}</c:if> ~ <c:if test="${i.end_date ne '0'}">${i.end_date}</c:if></p>
							</div>
							<div style="float:left; width:20%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.training_title ne '0'}">${i.training_title}</c:if></p>
							</div>
							<div style="float:left; width:20%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.educational_facilities ne '0'}">${i.educational_facilities}</c:if></p>
							</div>
							<div style="float:left; width:40%; min-height: 30px; border-left:1px solid #A4A4A4; border-right:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px; white-space: pre-wrap;"><c:if test="${i.training_content ne '0'}">${i.training_content}</c:if></p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkCertificate eq true }">
			<div class="info">
				<h4 class="head">자격면허</h4>
				<div class="form">
				<c:forEach items="${certificate}" var="i">
						<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none;">
							<div style="float:left; width:50%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.certificate_name ne '0'}">${i.certificate_name}</c:if></p>
							</div>
							<div style="float:left; width:35%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.place_issue ne '0'}">${i.place_issue}</c:if></p>
							</div>
							<div style="float:left; width:15%; height: 100%;    padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.acquisition_date ne '0'}">${i.acquisition_date}</c:if></p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkAward eq true }">
			<div class="info">
				<h4 class="head">수상경력</h4>
				<div class="form">
					<c:forEach items="${award}" var="i">
						<div style="float:left; width:100%; min-height: 30px; border-top: 1px solid #A4A4A4; border-top: none;">
							<div style="float:left; width:25%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.award_name ne '0'}">${i.award_name}</c:if></p>
							</div>
							<div style="float:left; width:25%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.award_service ne '0'}">${i.award_service}</c:if></p>
							</div>
							<div style="float:left; width:10%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4; padding-left: 10px; padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.award_date ne '0'}">${i.award_date}</c:if></p>
							</div>
							<div style="float:left; width:40%; min-height: 30px; border-left:1px solid #A4A4A4; border-right:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px; white-space: pre-wrap;"><c:if test="${i.award_content ne '0'}">${i.award_content}</c:if></p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkOverseas_Experience eq true }">
			<div class="info">
				<h4 class="head">해외경험</h4>
				<div class="form">
					<c:forEach items="${overseas_Experience}" var="i">
						<div style="float:left; width:100%; min-height: 30px; border-top: 1px solid #A4A4A4; border-top: none;">
							<div style="float:left; width:20%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px;">
								<c:if test="${i.start_date ne '0'}">${i.start_date}</c:if> ~ <c:if test="${i.end_date ne '0'}">${i.end_date}</c:if></p>
							</div>
							<div style="float:left; width:30%; height: 30px; border-left:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;"><c:if test="${i.country_name ne '0'}">${i.country_name}</c:if></p>
							</div>
							<div style="float:left; width:50%; min-height: 30px; border-left:1px solid #A4A4A4; border-right:1px solid #A4A4A4; border-bottom:1px solid #A4A4A4;    padding-top: 3px;">
								<p style="font-size: 15px; white-space: pre-wrap;"><c:if test="${i.overseas_experience_content ne '0'}">${i.overseas_experience_content}</c:if></p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkLanguage eq true }">
			<div class="info">
				<h4 class="head">어학능력</h4>
				<div class="form">
					<c:forEach items="${language}" var="i">
						<c:choose>
							<c:when test="${i.language_classification eq '회화능력'}">
								<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none;">
									<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.language_classification ne '0'}">${i.language_classification}</c:if></p>
									</div>
									<div style="float:left; width:50%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.language_name ne '0'}">${i.language_name}</c:if></p>
									</div>
									<div style="float:left; width:30%; height: 100%;    padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.conversational_ability ne '0'}">${i.conversational_ability}</c:if></p>
									</div>
								</div>
							</c:when>
							
							<c:when test="${i.language_classification eq '공인시험'}">
								<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none; ">
									<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.language_classification ne '0'}">${i.language_classification}</c:if></p>
									</div>
									<div style="float:left; width:50%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.language_name ne '0'}">${i.language_name}</c:if></p>
									</div>
									<div style="float:left; width:15%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
										<p style="font-size: 15px;">
										<c:if test="${i.language_score ne '0'}">${i.language_score}</c:if><c:if test="${i.conversational_ability ne '0'}">${i.conversational_ability}</c:if></p>
									</div>
									<div style="float:left; width:15%; height: 100%;    padding-top: 3px;">
										<p style="font-size: 15px;"><c:if test="${i.acquisition_date ne '0'}">${i.acquisition_date}</c:if></p>
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
				<h4 class="head">우대사항, 병역</h4>
				<div class="form">
					<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none;">
						<c:if test="${preferential.veterans eq true }">
							<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;">보훈대상</p>
							</div>
						</c:if>
						<c:if test="${preferential.protect eq true }">
							<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;">취업보호 대상</p>
							</div>
						</c:if>
						<c:if test="${preferential.funding eq true }">
							<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;">고용지원금 대상</p>
							</div>
						</c:if>
						<c:if test="${preferential.disorder ne '0' }">
							<div style="float:left; width:20%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
								<p style="font-size: 15px;">장애 : ${preferential.disorder}</p>
							</div>
						</c:if>
						<c:if test="${preferential.military ne '0' }">
							<div style="float:left; width:20%; height: 100%;    padding-top: 3px;">
								<p style="font-size: 15px;">병역 : ${preferential.military}</p>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</c:if>	
		
		<div class="info">
			<h4 class="head">희망취업조건</h4>
			<div class="form">
				<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none;">
					<div style="float:left; width:33%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
						<p style="font-size: 15px;">고용형태</p>
					</div>
					<div style="float:left; width:33%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
						<p style="font-size: 15px;">희망근무지</p>
					</div>
					<div style="float:left; width:33%; height: 100%;    padding-top: 3px;">
						<p style="font-size: 15px;">희망연봉</p>
					</div>
				</div>
				
				<div style="float:left; width:100%; height: 30px; border: 1px solid #A4A4A4; border-top: none; ">
					<div style="float:left; width:33%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
						<p style="font-size: 15px;"><c:if test="${resume.forms_employment ne '0'}">${resume.forms_employment }</c:if></p>
					</div>
					<div style="float:left; width:33%; height: 100%; border-right:1px solid #A4A4A4;   padding-top: 3px;">
						<p style="font-size: 15px;"><c:if test="${resume.desired_work_place ne '0'}">${resume.desired_work_place }</c:if></p>
					</div>
					<div style="float:left; width:33%; height: 100%;   padding-top: 3px;">
						<p style="font-size: 15px;"><c:if test="${resume.salary ne null}">${resume.salary }만원 이상</c:if></p>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 50px; float: right;">
			<button type="button" class="btn btn-default btnlist">목록</button>
		</div>
		
		
</div>
