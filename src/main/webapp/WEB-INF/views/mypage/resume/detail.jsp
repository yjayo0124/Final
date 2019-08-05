<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script	type="text/javascript">
</script>

<style type="text/css">
.containers {
	margin: 0 auto;
	padding: 0;
	width: 800px;
	zoom: 1;
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
/* 	border : 1px solid #dce1eb; */
}
.head {
	font-weight: bold;
	margin-bottom: 0;
	padding-bottom: 10px;
}
.new {
	width: 800px;
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
.info{
	width: 900px;
	float: left;
	margin-bottom: 50px;
}
.textarea_content {
	border-radius: 4px;
	padding: 3 10px;
	overflow-x: hidden;
	overflow-y: auto;
	border-color: #dce1eb;
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
			<h3>이력서 제목</h3>
			<hr>
			<h4 class="head">인적사항</h4>
			<div class="form">
				
				<div style="float:left; width:200px; height: 200px; border: 1px solid; margin:30px;">
				
				</div>
				
				<div style="float:left; width:500px; height: 200px;  margin: 40 30 20 0;">
					<div style="float:left; width: 100%; height:47px; margin-bottom: 10px; padding-left: 20px;">
						<p style="font-size: 25px; display: inline;">${resume.resume_name }</p>
						<p style="font-size: 15px; display: inline; margin-left: 10px;">${resume.resume_gender }</p>
						<p style="font-size: 15px; display: inline; margin-left: 5px;">${resume.resume_birth }</p>
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
				<h4 class="head">학력</h4>
				<div class="form">
					<c:forEach items="${school}" var="i">
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${school[i].school_classification eq '고등학교'}"> --%>
<!-- 									<div style="float:left; width:100%; height: 30px; border: 1px solid; "> -->
<!-- 										<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;"> -->
<%-- 											<p style="font-size: 15px;"> ~ ${school[i].graduation_date}</p> --%>
<!-- 										</div> -->
<!-- 										<div style="float:left; width:54%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;"> -->
<%-- 											<p style="font-size: 15px;">${school[i].school_name}</p> --%>
<!-- 										</div> -->
<!-- 										<div style="float:left; width:13%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;"> -->
<!-- 											<p style="font-size: 15px;"></p> -->
<!-- 										</div> -->
<!-- 										<div style="float:left; width:13%; height: 100%;  padding-left: 20px; padding-top: 3px;"> -->
<%-- 											<p style="font-size: 15px;">${school[i].graduation_status}</p> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<div style="float:left; width:100%; height: 30px; border: 1px solid; "> -->
<!-- 									<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;"> -->
<%-- 										<p style="font-size: 15px;">${school[i].admission_date} ~ ${school[i].graduation_date}</p> --%>
<!-- 									</div> -->
<!-- 									<div style="float:left; width:54%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;"> -->
<%-- 										<p style="font-size: 15px;">${school[i].school_name} ${school[i].major_name}전공</p> --%>
<!-- 									</div> -->
<!-- 									<div style="float:left; width:13%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;"> -->
<%-- 										<p style="font-size: 15px;">${school[i].credit} / ${school[i].total_score}</p> --%>
<!-- 									</div> -->
<!-- 									<div style="float:left; width:13%; height: 100%;  padding-left: 20px; padding-top: 3px;"> -->
<%-- 										<p style="font-size: 15px;">${school[i].graduation_status}</p> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
					</c:forEach>					
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkCareer eq true }">
			<div class="info">
				<h4 class="head">경력</h4>
				<div class="form">
					<div style="float:left; width:100%; height: 30px; border: 1px solid; ">
						<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">0000.00 ~ 0000.00</p>
						</div>
						<div style="float:left; width:54%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">0000팀</p>
						</div>
						<div style="float:left; width:13%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">대리</p>
						</div>
						<div style="float:left; width:13%; height: 100%;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">정규직</p>
						</div>
					
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkActivities eq true }">
			<div class="info">
				<h4 class="head">인턴,대외활동</h4>
				<div class="form">
					<div style="float:left; width:100%; height: 30px; border-top: 1px solid; ">
						<div style="float:left; width:20%; height: 30px; border-left:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">0000.00 ~ 0000.00</p>
						</div>
						<div style="float:left; width:30%; height: 30px; border-left:1px solid; border-bottom:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">기관명</p>
						</div>
						<div style="float:left; width:50%; min-height: 30px; border-left:1px solid; border-right:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px; white-space: pre-wrap;">활동내용</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkEducation eq true }">
			<div class="info">
				<h4 class="head">교육이수</h4>
				<div class="form">
					<div style="float:left; width:100%; min-height: 30px; border-top: 1px solid; ">
						<div style="float:left; width:20%; height: 30px; border-left:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">0000.00 ~ 0000.00</p>
						</div>
						<div style="float:left; width:20%; height: 30px; border-left:1px solid; border-bottom:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">교육명</p>
						</div>
						<div style="float:left; width:20%; height: 30px; border-left:1px solid; border-bottom:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">교육기관</p>
						</div>
						<div style="float:left; width:40%; min-height: 30px; border-left:1px solid; border-right:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px; white-space: pre-wrap;">교육내용</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkCertificate eq true }">
			<div class="info">
				<h4 class="head">자격증</h4>
				<div class="form">
					<div style="float:left; width:100%; height: 30px; border: 1px solid; ">
						<div style="float:left; width:50%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">자격증 명</p>
						</div>
						<div style="float:left; width:35%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">발행처</p>
						</div>
						<div style="float:left; width:15%; height: 100%;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">취득년월</p>
						</div>
					
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkAward eq true }">
			<div class="info">
				<h4 class="head">수상</h4>
				<div class="form">
					<div style="float:left; width:100%; min-height: 30px; border-top: 1px solid; ">
						<div style="float:left; width:25%; height: 30px; border-left:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">수상명</p>
						</div>
						<div style="float:left; width:25%; height: 30px; border-left:1px solid; border-bottom:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">수여기관</p>
						</div>
						<div style="float:left; width:10%; height: 30px; border-left:1px solid; border-bottom:1px solid; padding-left: 10px; padding-top: 3px;">
							<p style="font-size: 15px;">수상년도</p>
						</div>
						<div style="float:left; width:40%; min-height: 30px; border-left:1px solid; border-right:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px; white-space: pre-wrap;">수상내용</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkOverseas_Experience eq true }">
			<div class="info">
				<h4 class="head">해외경험</h4>
				<div class="form">
					<div style="float:left; width:100%; min-height: 30px; border-top: 1px solid; ">
						<div style="float:left; width:20%; height: 30px; border-left:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">0000.00 ~ 0000.00</p>
						</div>
						<div style="float:left; width:30%; height: 30px; border-left:1px solid; border-bottom:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">국가명</p>
						</div>
						<div style="float:left; width:50%; min-height: 30px; border-left:1px solid; border-right:1px solid; border-bottom:1px solid;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px; white-space: pre-wrap;">수상내용</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${checkLanguage eq true }">
			<div class="info">
				<h4 class="head">어학</h4>
				<div class="form">
					<div style="float:left; width:100%; height: 30px; border: 1px solid; ">
						<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">구분</p>
						</div>
						<div style="float:left; width:50%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">외국어명</p>
						</div>
						<div style="float:left; width:30%; height: 100%;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">회화능력</p>
						</div>
					</div>
					
					<div style="float:left; width:100%; height: 30px; border: 1px solid; border-top: none; ">
						<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">구분</p>
						</div>
						<div style="float:left; width:50%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">외국어명</p>
						</div>
						<div style="float:left; width:15%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">000점</p>
						</div>
						<div style="float:left; width:15%; height: 100%;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">취득년월</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		
		
		<c:if test="${checkPreferential eq true }">
			<div class="info">
				<h4 class="head">취업우대, 병역</h4>
				<div class="form">
					<div style="float:left; width:100%; height: 30px; border: 1px solid; ">
						<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">보훈대상</p>
						</div>
						<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">취업보호 대상</p>
						</div>
						<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">고용지원금 대상</p>
						</div>
						<div style="float:left; width:20%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">장애 : 6급</p>
						</div>
						<div style="float:left; width:20%; height: 100%;  padding-left: 20px; padding-top: 3px;">
							<p style="font-size: 15px;">병역 : 군필</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>	
		
		<div class="info">
			<h4 class="head">취업우대, 병역</h4>
			<div class="form">
				<div style="float:left; width:100%; height: 30px; border: 1px solid;">
					<div style="float:left; width:33%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
						<p style="font-size: 15px;">고용형태</p>
					</div>
					<div style="float:left; width:33%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
						<p style="font-size: 15px;">희망근무지</p>
					</div>
					<div style="float:left; width:33%; height: 100%;  padding-left: 20px; padding-top: 3px;">
						<p style="font-size: 15px;">희망연봉</p>
					</div>
				
				</div>
				<div style="float:left; width:100%; height: 30px; border: 1px solid; border-top: none; ">
					<div style="float:left; width:33%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
						<p style="font-size: 15px;">고용형태</p>
					</div>
					<div style="float:left; width:33%; height: 100%; border-right:1px solid; padding-left: 20px; padding-top: 3px;">
						<p style="font-size: 15px;">희망근무지</p>
					</div>
					<div style="float:left; width:33%; height: 100%; padding-left: 20px; padding-top: 3px;">
						<p style="font-size: 15px;">희망연봉</p>
					</div>
				</div>
			</div>
		</div>
		
		
</div>
