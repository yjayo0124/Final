<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$( document ).ready(function() { 		
	$('.btnlist').click(function() {  
		  location.href = "/mypage/introduction/list"; 
	 });
	
	$('.btnUpdate').click(function() {
		var num = $(this).parent().find("input[name='introduction_no']").val(); 
		  
		location.href = "/mypage/introduction/update?introduction_no=" + num; 
	 });
});

</script>
<style type="text/css">
.containers {
	margin: 0 auto;
	padding: 0;
	width: 800px;
	zoom: 1;
}

.form {
	width: 100%;
	float: left;
	/* 	border : 1px solid #dce1eb; */
/* 	border-top: 1px solid #BDBDBD; */
}

.head {
	font-weight: bold;
	margin-bottom: 0;
	padding-bottom: 10px;
}
.main {
	width: 800px;
	padding: 20px 20px 10px;
	border: 1px solid #BDBDBD;
	border-top-left-radius:8px;
	border-top-right-radius:8px;
	float: left;
	background-color: white;
	position: relative;
}

.new {
	width: 800px;
	padding: 20px 20px 10px;
	border: 1px solid #BDBDBD;
	border-top: none;
	float: left;
	background-color: white;
	position: relative;
}

.row {
	width: 100%;
	margin: 0;
	min-height: 50px;
	margin-bottom: 10px;
	float: left;
	margin-bottom: 10px;
}

.info_form {
	border: 1px solid #BDBDBD;
}

.school {
	width: 300px;
	min-height: 50px;
	float: left;
	margin-right: 10px;
}

.img_button {
	background: url( "/resources/images/plus.png" ) no-repeat;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.info {
	width: 800px;
	float: left;
	margin-bottom: 50px;
}

.textarea_content {
	padding: 10 20px;
	border-radius: 0;
	border-color: #BDBDBD;
	width: 100%;
	min-height: 30px;
	border: 1;
	overflow: hidden;
}

p {
	margin: 0;
}
</style>



<div class="containers">
	<div class="info_container" style="width: 800px;">
		<h3>${introduction.introduction_title }</h3>
		<hr>
		<div style="margin-bottom: 15px; float: right;">
			<button type="button" class="btn btn-default btnUpdate">수정하기</button>
			<input type="hidden" name="introduction_no" value="${introduction.introduction_no }">
		</div>
		<div id="form_Overseas_Experience">
			<div class="form" id="div_Introduction">
				<div class="main">
					<div class="row">
						<div class="info_form school question" style="width: 100%; padding: 20px;">
						${introduction.introduction_question }
						</div>
					</div>
					<div class="row" style="width: 100%; min-height: 100px;">
						<div class="info_form school content" style="width: 100%; min-height: 100px; padding: 20px;">
						${introduction.introduction_content }
						</div>
					</div>
				</div>
				<c:if test="${checkSub eq true }">
					<c:forEach items="${sub}" var="i">
						<div class="new">
							<div class="row">
								<div class="info_form school question" style="width: 100%; padding: 20px;">
								${i.sub_introduction_question }
								</div>
							</div>
							<div class="row" style="width: 100%; min-height: 100px;">
								<div class="info_form school content" style="width: 100%; min-height: 100px; padding: 20px;">
								${i.sub_introduction_content }
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div style="margin-top: 50px; float: right;">
			<button type="button" class="btn btn-default btnlist">목록</button>
		</div>
		
	</div>
</div>