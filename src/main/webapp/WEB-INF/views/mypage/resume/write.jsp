<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}

aside {
	width: 240px;
}

section {
	width: 960px;
	padding: 0 10px;
}

.more_menu {
	width: 240px;
	padding: 0 14px;
	border: 1px solid #dce1eb;
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
	height:50px;
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
}
.form {
	width: 100%;
	float: left;
	
}
.head{
	font-weight: bold;
	border-bottom: 1px solid #dce1eb;
	margin-bottom: 0;
	padding-bottom: 10px;
}
.checkbox	{
	height: 40px;
	float: left;
	display:inline;	
	margin-left: 20px;
	padding-top: 5px;
}
.input_checkbox {
     width: 20px;
     height: 20px;
     top: 2px;
}
.sub_footer{
	width: 900px;
	height: 40px;
	float: left;
}
.graduation_thesis_content {
	border-radius: 4px;
	padding: 3 10px;
	overflow-x:hidden;
	overflow-y:auto";
}
</style>

<div style="background: #f0f2f4;">
	<div class="container">

		<section>
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
  							<p><input class="input_checkbox" type="checkbox" name="less_than_high">&nbsp대입검정고시</p>
						</div>						
				</div>
				<div class="new">
					<div class="row">
						<div class="info_form gender" style="margin: 0;">
							<select class="selecter_full" name="school_select">
								<option value="0">학교구분</option>
								<option value="고등학교">고등학교</option>
								<option value="대학"  selected="selected">대학(2,3년)</option>
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
  							<p><input class="input_checkbox" type="checkbox" name="less_than_high">&nbsp편입</p>
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
						<textarea class="graduation_thesis_content" rows="4" cols="118" placeholder="졸업 논문/작품"></textarea>
						
					</div>
					<div class="sub_footer">
						<button type="button" class="btn btn-default"><span>다른전공 + </span></button>
						<button type="button" class="btn btn-default"><span>졸업 논문/ 작품  + </span></button>
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
  							<p><input class="input_checkbox" type="checkbox" name="less_than_high">&nbsp편입</p>
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
						<textarea class="graduation_thesis_content" rows="4" cols="118" placeholder="졸업 논문/작품"></textarea>
						
					</div>
					<div class="sub_footer">
						<button type="button" class="btn btn-default"><span>다른전공 + </span></button>
						<button type="button" class="btn btn-default"><span>졸업 논문/ 작품  + </span></button>
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
						<div class="info_form school" style="width:219px; margin: 0;">
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
  							<p><input class="input_checkbox" type="checkbox" name="less_than_high">&nbsp편입</p>
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
						<textarea class="graduation_thesis_content" rows="4" cols="118" placeholder="졸업 논문/작품"></textarea>
						
					</div>
					<div class="sub_footer">
						<button type="button" class="btn btn-default"><span>다른전공 + </span></button>
						<button type="button" class="btn btn-default"><span>졸업 논문/ 작품  + </span></button>
					</div>
				</div>
			</div>
			<div class="new" style="text-align: center; margin-bottom: 30px;">
				<label><button class="img_button" style="width: 90px;">추가</button></label>
			</div>
			
			
		<div class="form">
			<h4 class="head">경력</h4>
			<div class="new">
				<div class="row">
						<div class="info_form school" style="width:276px; margin: 0;">
							<input type="text" name="school_name" placeholder="회사명">
						</div>
						<div class="info_form school" style="width:276px;">
							<input type="text" name="school_name" placeholder="부서명">
						</div>
						
						<div class="info_form gender" style="margin: 0;">
							<input type="text" name="graduation_date" placeholder="입사년월">
						</div>
						<div class="info_form gender">
							<input type="text" name="graduation_date" placeholder="퇴사년월">
						</div>
						<div class="checkbox">
  							<p><input class="input_checkbox" type="checkbox" name="less_than_high">&nbsp재직중</p>
						</div>	
					</div>
					<div class="row">
						<div class="info_form school" style="width:276px; margin: 0;">
							<input type="text" name="school_name" placeholder="직급/직책">
						</div>
						<div class="info_form school" style="width:276px;">
							<input type="text" name="school_name" placeholder="직무">
						</div>
						
						<div class="info_form gender" style="margin: 0;">
							<input type="text" name="graduation_date" placeholder="연봉">
						</div>
					</div>
					<div class="row" style="height: 85;">
						<textarea class="graduation_thesis_content" rows="4" cols="118" placeholder="담당업무"></textarea>
						
					</div>
					<div class="sub_footer">
						<button type="button" class="btn btn-default"><span>연봉 + </span></button>
						<button type="button" class="btn btn-default"><span>담당업무  + </span></button>
					</div>
			</div>
		</div>
		<div class="new" style="text-align: center; margin-bottom: 30px;">
				<label><button class="img_button" style="width: 90px;">추가</button></label>
			</div>
			
			
		<div class="form">
			<h4 class="head">인턴, 대외활동</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		<div class="form">
			<h4 class="head">교육이수</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		<div class="form">
			<h4 class="head">자격증</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		<div class="form">
			<h4 class="head">수상</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		<div class="form">
			<h4 class="head">해외경험</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		<div class="form">
			<h4 class="head">어학</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		<div class="form">
			<h4 class="head">포트폴리오</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		<div class="form">
			<h4 class="head">취업우대, 병역</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
		
		
		<div class="form">
			<h4 class="head">희망근무조건</h4>
			<div class="new">
				<div class="row">	
				</div>
			</div>
		</div>	
			
			
			
			
			
			
			
			
					
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
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>포트폴리오</span></a>
						</div>
						<button class="img_button"></button></li>
					<li><div class="div_menu_li">
							<a style="color: black;"><img class="menu_img"
								src="/resources/images/school.png"> <span>취업우대, 병역</span></a>
						</div>
						<button class="img_button"></button></li>
				</ul>
			</div>
			<div class=""></div>
		</aside>

	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</div>