<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	
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

.container {
	margin: 0 auto;
	padding: 0;
	width: 1200px;
	zoom: 1;
	display: flex;
	position: relative;
	/* 	background-color: #e5edf0; */
}

aside {
	width: 240px;
	position: fixed;
	top: 85px;
	z-index: 99;
	float: right;
}

section {
	margin-left: 250px;
	width: 960px;
	padding: 0 10px;
}

.more_menu {
	width: 240px;
	padding: 0 14px;
	border: 1px solid #dce1eb;
	background-color: white;
}

.resume_title {
	width: 940px;
	height: 50px;
	border: 1px solid #dce1eb;
	margin-bottom: 30px;
}

.resume_title input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 20px;
	border: none;
}

.listhead {
	height: 48px;
	padding-top: 16px;
	font-size: 14px;
	color: #999;
	text-align: left;
	margin: 0;
}

.list_menu {
	border-top: 1px solid #eee;
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	margin-top: 0;
	list-style: none;
	padding-left: 0;
	padding-top: 15px;
	padding-bottom: 20px;
	margin-bottom: 0;
}

.menu_img {
	width: 22px;
	height: 22px;
	margin-right: 12px;
}

.img_button {
	background: url( "/resources/images/plus.png" ) no-repeat;
	border: none;
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.div_menu_li {
	width: 180px;
	float: left;
	cursor: pointer;
}

.info {
	width: 940px;
	padding: 20px 20px 10px;
	border: 1px solid #dce1eb;
	margin-bottom: 30px;
	float: left;
	background-color: white;
}

.info_form {
	border: 1px solid #dce1eb;
}

.name {
	width: 160px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.name input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.photo {
	width: 90px;
	height: 110px;
	float: right;
}

.photo img {
	width: 100%;
	height: 100%;
}

.gender {
	width: 113px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.selecter {
	width: 100%;
	height: 30px;
	padding-left: 10px;
	border: 0;
}

.email {
	width: 335px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.email input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.addr {
	width: 458px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

.addr input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.row {
	width: 100%;
	margin: 0;
	height: 50px;
	margin-bottom: 10px;
	float: left;
}

.selecter_full {
	width: 100%;
	height: 100%;
	padding-left: 10px;
	border: 0;
}

.school {
	width: 300px;
	height: 50px;
	float: left;
	margin-right: 10px;
}

input {
	width: 100%;
	height: 100%;
	padding: 0 20px;
	font-size: 15px;
	border: none;
}

.new {
	width: 940px;
	padding: 20px 20px 10px;
	border: 1px solid #dce1eb;
	border-top: none;
	float: left;
	background-color: white;
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

.checkbox {
	height: 40px;
	float: left;
	display: inline;
	margin-left: 20px;
	padding-top: 5px;
}

.input_checkbox {
	width: 20px;
	height: 20px;
	top: 2px;
}

.sub_footer {
	width: 900px;
	height: 40px;
	float: left;
}

.graduation_thesis_content {
	border-radius: 4px;
	padding: 3 10px;
	overflow-x: hidden;
	overflow-y: auto;
	border-color: #dce1eb;
	width: 100%;
	height: 80px;
	border: 1;
	overflow: visible;
	text-overflow: ellipsis;
}

.prefer_checkbox {
	width: 165px;
	height: 50px;
	margin-right: 10px;
	border: 1px solid #dce1eb;
	float: left;
	padding-left: 15px;
}

/* #form_Education { */
/* 	display: none; */
/* } */

/* #form_Career { */
/* 	display: none; */
/* } */

/* #form_Activities { */
/* 	display: none; */
/* } */

/* #form_Education { */
/* 	display: none; */
/* } */
/* #form_Education{ */
/* 	display: none; */
/* } */
/* #form_Certificate{ */
/* 	display: none; */
/* } */
/* #form_Award{ */
/* 	display: none; */
/* } */
/* #form_Overseas_Experience{ */
/* 	display: none; */
/* } */
/* #form_Language{ */
/* 	display: none; */
/* } */
/* #form_Preferential{ */
/* 	display: none; */
/* } */
</style>

<div style="background: #f0f2f4;">
	<div class="container">
		<section>
			<form action="/mypage/introduction/write" method="POST">
				<div class="resume_title">
					<input type="text" name="resume_title" placeholder="제목을 입력하세요.">
				</div>

				<div class="form">
					<h4 style="font-weight: bold;">인적사항</h4>
					<div class="info">
						<div class="photo info_form">
							<img alt="" src="">
						</div>
						<div
							style="width: 827px; height: 50px; margin-right: 10px; margin-bottom: 10px;">
							<div class="info_form name">
								<input type="text" name="resume_name" placeholder="이름">
							</div>
							<div class="info_form name">
								<input type="text" name="resume_birth" placeholder="생년월일">
							</div>
							<div class="info_form gender">
								<p
									style="font-size: 8px; margin: 0; padding-left: 14px; padding-top: 4px; color: #a8a8a8;">성별</p>
								<select class="selecter" name="resume_gender">
									<option value="남자" selected="selected">남자</option>
									<option value="여자">여자</option>
								</select>
							</div>
							<div class="info_form email">
								<input type="text" name="resume_email" placeholder="이메일">
							</div>
						</div>
						<div
							style="width: 827px; height: 50px; margin-right: 10px; margin-bottom: 10px;">
							<div class="info_form name">
								<input type="text" name="resume_phone" placeholder="전화번호">
							</div>
							<div class="info_form name">
								<input type="text" name="resume_cellphone" placeholder="휴대폰번호">
							</div>
							<div class="info_form addr">
								<input type="text" name="resume_addr" placeholder="주소">
							</div>
						</div>
					</div>
				</div>

				<div id="form_Education">
					<div class="form">
						<h4 class="head">학력</h4>
						<div class="new">
							<div class="row">
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">학교구분</option>
										<option value="고등학교">고등학교</option>
										<option value="대학">대학(2,3년)</option>
										<option value="대학교">대학교(4년)</option>
										<option value="대학원">대학원</option>
									</select>
								</div>

								<div class="info_form school">
									<input type="text" name="school_name" placeholder="학교이름">
								</div>
							</div>
						</div>

						<div class="new">
							<div class="info_form gender" style="margin: 0;">
								<select class="selecter_full" name="school_select">
									<option value="0">학교구분</option>
									<option value="고등학교" selected="selected">고등학교</option>
									<option value="대학">대학(2,3년)</option>
									<option value="대학교">대학교(4년)</option>
									<option value="대학원">대학원</option>
								</select>
							</div>

							<div class="info_form school">
								<input type="text" name="school_name" placeholder="학교이름">
							</div>

							<div class="info_form gender" style="margin: 0;">
								<input type="text" name="graduation_date" placeholder="졸업년도">
							</div>

							<div class="info_form gender">
								<select class="selecter_full" name="graduation_status">
									<option value="0" selected="selected">졸업상태</option>
									<option value="졸업">졸업</option>
									<option value="졸업예정">졸업예정</option>
									<option value="재학중">재학중</option>
								</select>
							</div>
							<div class="checkbox">
								<p>
									<input class="input_checkbox" type="checkbox"
										name="less_than_high"><label
										style="padding-left: 5px;">대입검정고시</label>
								</p>
							</div>
						</div>
						<div class="new">
							<div class="row">
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0">학교구분</option>
										<option value="고등학교">고등학교</option>
										<option value="대학" selected="selected">대학(2,3년)</option>
										<option value="대학교">대학교(4년)</option>
										<option value="대학원">대학원</option>
									</select>
								</div>
								<div class="info_form school">
									<input type="text" name="school_name" placeholder="학교이름">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="입학년월">
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="졸업년월">
								</div>
								<div class="info_form gender">
									<select class="selecter_full" name="graduation_status">
										<option value="0" selected="selected">졸업상태</option>
										<option value="졸업">졸업</option>
										<option value="졸업예정">졸업예정</option>
										<option value="재학중">재학중</option>
										<option value="중퇴">중퇴</option>
										<option value="수료">수료</option>
										<option value="휴학">휴학</option>
									</select>
								</div>
								<div class="checkbox">
									<p>
										<input class="input_checkbox" type="checkbox"
											name="less_than_high"><label
											style="padding-left: 5px;">편입</label>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="info_form school" style="width: 412px;">
									<input type="text" name="school_name" placeholder="전공명">
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="학점">
								</div>
								<div class="info_form gender">
									<select class="selecter_full" name="graduation_status">
										<option value="0" selected="selected">총점</option>
										<option value="4.5">4.5</option>
										<option value="4.3">4.3</option>
										<option value="4.0">4.0</option>
										<option value="100">100</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="sub_major">
									<div class="info_form gender" style="margin: 0;">
										<select class="selecter_full" name="school_select">
											<option value="0" selected="selected">전공선택</option>
											<option value="부전공">부전공</option>
											<option value="복수전공">복수전공</option>
											<option value="이중전공">이중전공</option>
										</select>
									</div>
									<div class="info_form school">
										<input type="text" name="school_name" placeholder="전공명">
									</div>
								</div>
							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" rows="4" cols="118"
									placeholder="졸업 논문/작품"></textarea>

							</div>
							<div class="sub_footer">
								<button type="button" class="btn btn-default">
									<span>다른전공 + </span>
								</button>
								<button type="button" class="btn btn-default">
									<span>졸업 논문/ 작품 + </span>
								</button>
							</div>
						</div>

						<div class="new">
							<div class="row">
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0">학교구분</option>
										<option value="고등학교">고등학교</option>
										<option value="대학">대학(2,3년)</option>
										<option value="대학교" selected="selected">대학교(4년)</option>
										<option value="대학원">대학원</option>
									</select>
								</div>
								<div class="info_form school">
									<input type="text" name="school_name" placeholder="학교이름">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="입학년월">
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="졸업년월">
								</div>
								<div class="info_form gender">
									<select class="selecter_full" name="graduation_status">
										<option value="0" selected="selected">졸업상태</option>
										<option value="졸업">졸업</option>
										<option value="졸업예정">졸업예정</option>
										<option value="재학중">재학중</option>
										<option value="중퇴">중퇴</option>
										<option value="수료">수료</option>
										<option value="휴학">휴학</option>
									</select>
								</div>
								<div class="checkbox">
									<p>
										<input class="input_checkbox" type="checkbox"
											name="less_than_high"><label
											style="padding-left: 5px;">편입</label>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="info_form school" style="width: 412px;">
									<input type="text" name="school_name" placeholder="전공명">
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="학점">
								</div>
								<div class="info_form gender">
									<select class="selecter_full" name="graduation_status">
										<option value="0" selected="selected">총점</option>
										<option value="4.5">4.5</option>
										<option value="4.3">4.3</option>
										<option value="4.0">4.0</option>
										<option value="100">100</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="sub_major">
									<div class="info_form gender" style="margin: 0;">
										<select class="selecter_full" name="school_select">
											<option value="0" selected="selected">전공선택</option>
											<option value="부전공">부전공</option>
											<option value="복수전공">복수전공</option>
											<option value="이중전공">이중전공</option>
										</select>
									</div>
									<div class="info_form school">
										<input type="text" name="school_name" placeholder="전공명">
									</div>
								</div>
							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" rows="4" cols="118"
									placeholder="졸업 논문/작품"></textarea>

							</div>
							<div class="sub_footer">
								<button type="button" class="btn btn-default">
									<span>다른전공 + </span>
								</button>
								<button type="button" class="btn btn-default">
									<span>졸업 논문/ 작품 + </span>
								</button>
							</div>
						</div>

						<div class="new">
							<div class="row">
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0">학교구분</option>
										<option value="고등학교">고등학교</option>
										<option value="대학">대학(2,3년)</option>
										<option value="대학교">대학교(4년)</option>
										<option value="대학원" selected="selected">대학원</option>
									</select>
								</div>
								<div class="info_form school" style="width: 219px; margin: 0;">
									<input type="text" name="school_name" placeholder="학교이름">
								</div>
								<div class="info_form gender" style="width: 80px;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">학위</option>
										<option value="석사">석사</option>
										<option value="박사">박사</option>
										<option value="석박사">석박사</option>
									</select>
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="입학년월">
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="졸업년월">
								</div>
								<div class="info_form gender">
									<select class="selecter_full" name="graduation_status">
										<option value="0" selected="selected">졸업상태</option>
										<option value="졸업">졸업</option>
										<option value="졸업예정">졸업예정</option>
										<option value="재학중">재학중</option>
										<option value="중퇴">중퇴</option>
										<option value="수료">수료</option>
										<option value="휴학">휴학</option>
									</select>
								</div>
								<div class="checkbox">
									<p>
										<input class="input_checkbox" type="checkbox"
											name="less_than_high"><label
											style="padding-left: 5px;">편입</label>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="info_form school" style="width: 412px;">
									<input type="text" name="school_name" placeholder="전공명">
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="학점">
								</div>
								<div class="info_form gender">
									<select class="selecter_full" name="graduation_status">
										<option value="0" selected="selected">총점</option>
										<option value="4.5">4.5</option>
										<option value="4.3">4.3</option>
										<option value="4.0">4.0</option>
										<option value="100">100</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="sub_major">
									<div class="info_form gender" style="margin: 0;">
										<select class="selecter_full" name="school_select">
											<option value="0" selected="selected">전공선택</option>
											<option value="부전공">부전공</option>
											<option value="복수전공">복수전공</option>
											<option value="이중전공">이중전공</option>
										</select>
									</div>
									<div class="info_form school">
										<input type="text" name="school_name" placeholder="전공명">
									</div>
								</div>
							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" rows="4" cols="118"
									placeholder="졸업 논문/작품"></textarea>

							</div>
							<div class="sub_footer">
								<button type="button" class="btn btn-default">
									<span>다른전공 + </span>
								</button>
								<button type="button" class="btn btn-default">
									<span>졸업 논문/ 작품 + </span>
								</button>
							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<div id="form_Career">
					<div class="form">
						<h4 class="head">경력</h4>
						<div class="new">
							<div class="row">
								<div class="info_form school" style="width: 276px; margin: 0;">
									<input type="text" name="school_name" placeholder="회사명">
								</div>
								<div class="info_form school" style="width: 276px;">
									<input type="text" name="school_name" placeholder="부서명">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="입사년월">
								</div>
								<div class="info_form gender">
									<input type="text" name="graduation_date" placeholder="퇴사년월">
								</div>
								<div class="checkbox">
									<p>
										<input class="input_checkbox" type="checkbox"
											name="less_than_high"><label
											style="padding-left: 5px;">재직중</label>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="info_form school" style="width: 276px; margin: 0;">
									<input type="text" name="school_name" placeholder="직급/직책">
								</div>
								<div class="info_form school" style="width: 276px;">
									<input type="text" name="school_name" placeholder="직무">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="연봉">
								</div>
							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" rows="4" cols="118"
									placeholder="담당업무"></textarea>

							</div>
							<div class="sub_footer">
								<button type="button" class="btn btn-default">
									<span>연봉 + </span>
								</button>
								<button type="button" class="btn btn-default">
									<span>담당업무 + </span>
								</button>
							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<div id="form_Activities">
					<div class="form">
						<h4 class="head">인턴, 대외활동</h4>
						<div class="new">
							<div class="row">
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">활동구분</option>
										<option value="인턴">인턴</option>
										<option value="아르바이트">아르바이트</option>
										<option value="동아리">동아리</option>
										<option value="자원봉사">자원봉사</option>
										<option value="사회활동">사회활동</option>
										<option value="교내활동">교내활동</option>
									</select>
								</div>

								<div class="info_form school" style="width: 510px;">
									<input type="text" name="school_name" placeholder="회사/기관/단체명">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="시작년월">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="종료년월">
								</div>
							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" rows="4" cols="118"
									placeholder="활동내용"></textarea>

							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<div id="form_Education">
					<div class="form">
						<h4 class="head">교육이수</h4>
						<div class="new">
							<div class="row">
								<div class="info_form school" style="width: 276px;">
									<input type="text" name="school_name" placeholder="교육명">
								</div>
								<div class="info_form school" style="width: 276px;">
									<input type="text" name="school_name" placeholder="교육기관">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="시작년월">
								</div>
								<div class="info_form gender">
									<input type="text" name="graduation_date" placeholder="종료년월">
								</div>
							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" rows="4" cols="118"
									placeholder="교육내용"></textarea>

							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<div id="form_Certificate">
					<div class="form">
						<h4 class="head">자격증</h4>
						<div class="new">
							<div class="row">
								<div class="info_form school" style="width: 400px;">
									<input type="text" name="school_name" placeholder="자격증 명">
								</div>
								<div class="info_form school" style="width: 276px;">
									<input type="text" name="school_name" placeholder="발행처">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="취득월">
								</div>
							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<div id="form_Award">
					<div class="form">
						<h4 class="head">수상</h4>
						<div class="new">
							<div class="row">
								<div class="info_form school" style="width: 400px;">
									<input type="text" name="school_name" placeholder="수상명">
								</div>
								<div class="info_form school" style="width: 276px;">
									<input type="text" name="school_name" placeholder="수여기관">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="수상년도">
								</div>
							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" rows="4" cols="118"
									placeholder="수여내용"></textarea>

							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<div id="form_Overseas_Experience">
					<div class="form">
						<h4 class="head">해외경험</h4>
						<div class="new">
							<div class="row">
								<div class="info_form school" style="width: 400px;">
									<input type="text" name="school_name" placeholder="국가명">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="school_name" placeholder="시작년월">
								</div>

								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="종료년월">
								</div>

							</div>
							<div class="row" style="height: 85;">
								<textarea class="graduation_thesis_content" placeholder="내용"></textarea>

							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<div id="form_Language">
					<div class="form">
						<h4 class="head">어학</h4>
						<div class="new">
							<div class="row">
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">구분</option>
										<option value="회화능력">회화능력</option>
										<option value="공인시험">공인시험</option>
									</select>
								</div>
								<div class="info_form gender" style="margin: 0; width: 200px;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">외국어명</option>
										<option value="영어">영어</option>
										<option value="일본어">일본어</option>
										<option value="중국어">중국어</option>
										<option value="독일어">독일어</option>
										<option value="프랑스어">프랑스어</option>
										<option value="스페인어">스페인어</option>
										<option value="러시아어">러시아어</option>
										<option value="이탈리아어">이탈리아어</option>
										<option value="아랍어">아랍어</option>
										<option value="태국어">태국어</option>
										<option value="마인어">마인어</option>
										<option value="그리스어">그리스어</option>
										<option value="포르투칼어">포르투칼어</option>
										<option value="베트남어">베트남어</option>
										<option value="네덜란드어">네덜란드어</option>
										<option value="힌디어">힌디어</option>
										<option value="노르웨이어">노르웨이어</option>
										<option value="유고어">유고어</option>
										<option value="히브리어">히브리어</option>
										<option value="이란(페르시아어)">이란(페르시아어)</option>
										<option value="터키어">터키어</option>
										<option value="체코어">체코어</option>
										<option value="루마니아어">루마니아어</option>
										<option value="몽골어">몽골어</option>
										<option value="스웨덴어">스웨덴어</option>
										<option value="헝가리어">헝가리어</option>
										<option value="폴란드어">폴란드어</option>
										<option value="미얀마어">미얀마어</option>
										<option value="슬로바이카어">슬로바이카어</option>
										<option value="세르비아어">세르비아어</option>
										<option value="한국어">한국어</option>
										<option value="직접입력">직접입력</option>


									</select>
								</div>
								<div class="info_form gender" style="margin: 0; width: 140px;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">회화능력</option>
										<option value="일상회화가능">일상회화 가능</option>
										<option value="비즈니스회화가능">비즈니스 회화가능</option>
										<option value="원어민수준">원어민 수준</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">구분</option>
										<option value="회화능력">회화능력</option>
										<option value="공인시험">공인시험</option>
									</select>
								</div>
								<div class="info_form gender" style="margin: 0; width: 200px;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">외국어명</option>
										<option value="영어">영어</option>
										<option value="일본어">일본어</option>
										<option value="중국어">중국어</option>
										<option value="독일어">독일어</option>
										<option value="프랑스어">프랑스어</option>
										<option value="스페인어">스페인어</option>
										<option value="러시아어">러시아어</option>
										<option value="이탈리아어">이탈리아어</option>
										<option value="아랍어">아랍어</option>
										<option value="태국어">태국어</option>
										<option value="마인어">마인어</option>
										<option value="그리스어">그리스어</option>
										<option value="포르투칼어">포르투칼어</option>
										<option value="베트남어">베트남어</option>
										<option value="네덜란드어">네덜란드어</option>
										<option value="힌디어">힌디어</option>
										<option value="노르웨이어">노르웨이어</option>
										<option value="유고어">유고어</option>
										<option value="히브리어">히브리어</option>
										<option value="이란(페르시아어)">이란(페르시아어)</option>
										<option value="터키어">터키어</option>
										<option value="체코어">체코어</option>
										<option value="루마니아어">루마니아어</option>
										<option value="몽골어">몽골어</option>
										<option value="스웨덴어">스웨덴어</option>
										<option value="헝가리어">헝가리어</option>
										<option value="폴란드어">폴란드어</option>
										<option value="미얀마어">미얀마어</option>
										<option value="슬로바이카어">슬로바이카어</option>
										<option value="세르비아어">세르비아어</option>
										<option value="한국어">한국어</option>
										<option value="직접입력">직접입력</option>


									</select>
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="급수/점수">
								</div>

								<div class="info_form gender" style="margin: 0; width: 140px;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">선택</option>
										<option value="일상회화가능">점</option>
										<option value="비즈니스회화가능">급</option>
										<option value="원어민수준">취득</option>
									</select>
								</div>
								<div class="info_form gender" style="margin: 0;">
									<input type="text" name="graduation_date" placeholder="취득년월">
								</div>
							</div>
						</div>
					</div>
					<div class="new" style="text-align: center; margin-bottom: 30px;">
						<label><button class="img_button" type="button"
								style="width: 90px;">추가</button></label>
					</div>
				</div>

				<!-- 		<div class="form"> -->
				<!-- 			<h4 class="head">포트폴리오</h4> -->
				<!-- 			<div class="new"> -->
				<!-- 				<div class="row">	 -->
				<!-- 				</div> -->
				<!-- 			</div> -->
				<!-- 		</div>	 -->

				<div id="form_Preferential">
					<div class="form" style="margin-bottom: 30px;">
						<h4 class="head">취업우대, 병역</h4>
						<div class="new">
							<div class="row" style="margin-bottom: 40px;">
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="less_than_high"><label
												style="padding-left: 5px;">보훈대상</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="less_than_high"><label
												style="padding-left: 5px;">취업보호 대상</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="less_than_high"><label
												style="padding-left: 5px;">고용지원금 대상</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="less_than_high"><label
												style="padding-left: 5px;">장애</label>
										</p>
									</div>
								</div>
								<div class="prefer_checkbox">
									<div class="checkbox">
										<p>
											<input class="input_checkbox" type="checkbox"
												name="less_than_high"><label
												style="padding-left: 5px;">병역</label>
										</p>
									</div>
								</div>
							</div>
							<div class="row">
								<div
									style="width: 50px; height: 50px; float: left; padding-top: 15px;">
									<p>장애</p>
								</div>
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">장애등급</option>
										<option value="1급">1급</option>
										<option value="2급">2급</option>
										<option value="3급">3급</option>
										<option value="4급">4급</option>
										<option value="5급">5급</option>
										<option value="6급">6급</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div
									style="width: 50px; height: 50px; float: left; padding-top: 15px;">
									<p>병역</p>
								</div>
								<div class="info_form gender" style="margin: 0;">
									<select class="selecter_full" name="school_select">
										<option value="0" selected="selected">병역</option>
										<option value="군필">군필</option>
										<option value="미필">미필</option>
										<option value="면제">면제</option>
										<option value="해당없음">해당없음</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="form" style="margin-bottom: 300px;">
					<h4 class="head">희망근무조건</h4>
					<div class="new">
						<div class="row">
							<div class="info_form gender" style="width: 200px;">
								<select class="selecter_full" name="school_select">
									<option value="0" selected="selected">고용형태</option>
									<option value="정규직">정규직</option>
									<option value="계약직">계약직</option>
									<option value="병역특례">병역특례</option>
									<option value="프리랜서">프리랜서</option>
									<option value="헤드헌팅">헤드헌팅</option>
									<option value="파견대행">파견대행</option>
									<option value="인턴직">인턴직</option>
								</select>
							</div>
							<div class="info_form gender" style="width: 200px;">
								<select class="selecter_full" name="school_select">
									<option value="0" selected="selected">희망근무지</option>
									<option value="">전국</option>
									<option value="">서울</option>
									<option value="">경기</option>
									<option value="">인천</option>
									<option value="">대전</option>
									<option value="">세종</option>
									<option value="">충남</option>
									<option value="">충북</option>
									<option value="">광주</option>
									<option value="">전남</option>
									<option value="">전북</option>
									<option value="">대구</option>
									<option value="">경북</option>
									<option value="">부산</option>
									<option value="">울산</option>
									<option value="">경남</option>
									<option value="">강원</option>
									<option value="">제주</option>
									<option value="">중국,홍콩</option>
									<option value="">미국</option>
									<option value="">일본</option>
									<option value="">아시아,중동</option>
									<option value="">북아메리카</option>
									<option value="">남아메리카</option>
									<option value="">유럽</option>
									<option value="">오세아니아</option>
									<option value="">아프리카</option>
								</select>
							</div>
							<div class="info_form gender" style="width: 200px;">
								<input type="text" name="graduation_date" placeholder="희망연봉">
							</div>
							<div class="checkbox">
								<p>
									<input class="input_checkbox" type="checkbox"
										name="less_than_high"><label
										style="padding-left: 5px;">면접 후 결정</label>
								</p>
							</div>
						</div>
					</div>
				</div>
			</form>





		</section>







		<aside>
			<div class="more_menu">
				<p class="listhead">이력서 항목</p>
				<ul class="list_menu">
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>학력</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>경력</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>인턴, 대외활동</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>교육이수</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>자격증</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>수상</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>해외경험</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>어학</span></a>
						</div>
						<button class="img_button"></button></li>
					<!-- 					<li><div class="div_menu_li"> -->
					<!-- 							<a style="color: black;"><img class="menu_img" -->
					<!-- 								src="/resources/images/school.png"> <span>포트폴리오</span></a> -->
					<!-- 						</div> -->
					<!-- 						<button class="img_button"></button></li> -->
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>취업우대, 병역</span></a>
						</div>
						<button class="img_button"></button></li>
				</ul>
			</div>
			<div class="" style="width: 240px; height: 40px; float: left;">
				<button type="button" class=" btn-primary"
					style="border: none; width: 100%; height: 100%;">작성완료</button>
			</div>
		</aside>
	</div>
</div>