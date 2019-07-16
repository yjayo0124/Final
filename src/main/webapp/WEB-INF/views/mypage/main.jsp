<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function() {
	
	var a = $('#calculator').children().eq(1).find('select[name=grades]').val();
	var b = $('#calculator').children().eq(1).find('input[type="text"]').val();
	console.log(a);
	console.log(b);
	var c = $('#calculator').children().eq(2).find('select[name=grades]').val();
	var d = $('#calculator').children().eq(2).find('input[type="text"]').val();
	console.log(c);
	console.log(d);
})


function score() {
}
</script>
<style type="text/css">
.container {
	margin: 0 auto;
	padding:0;
    width: 1200px;
    zoom: 1;
}
.top_container {
	width:1200px;
	height: 190px;
}
.profile {
	width:190px;
	height: 190px;
	border: 1px solid #dce1eb;
	float: left;
	margin-right: 10px;
}
.grades {
	width:1000px;
	height:190px;
	border: 1px solid #dce1eb;
    box-sizing: border-box;
	float: left;
}
.bottom_container{
	width:1200px;
	margin-top:10px;
	height: auto;
}
.page_list{
	width:190px;
	float: left;
	border: 1px solid #dce1eb;
	margin-right: 10px;
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
.calculator {
 	padding: 15px 20px;
	width:1000px;
	float:left;
	border: 1px solid #dce1eb;
}
.calculator_table {
	border: 1px solid #d3d3d3;
}
.th_grades{
	width:130px;
}
.th_credit{
	width:130px;
}
.class_name{
	width:698px;
}
tr {
	height: 40px;
}
th {
	text-align: center;
	padding: 0;
}
td {
	text-align: center;
}
.credit_input{
	width:130px;
	height:38px;
	border: none;
	text-align: center;
}
.class_name_input{
	width:698px;
	height:38px;
	border: none;
	text-align: left;
}
.selecter {
	width:100%;
	height:38px;
	border: 0;
	padding-left: 50px;
}
.top_calculator {
	width:100%;
	height:40px;
}
.calculator_title {
	width:85%;
	height:40px;
	float: left;
}
.div_reset{
	width:15%;
	height:40px;
	text-align:right;
	float: left;
}
.calculator_title p {
	font-size: 20px;
	font-weight: bold;
}
.more_input {
	padding-left : 20px;
	text-align: left;
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
.div_radius_avg {
	width:170px;
	height:170px;
	background-coloer:white;
	line-height:50px;
	text-align:center;
	padding:10px;
	border-radius:190px;
	float:left;
	border: 1px solid;
	margin-right: 100px;
	border-color: gray;
}

.div_radius_sum {
	width:170px;
	height:170px;
	background-coloer:white;
	line-height:50px;
	text-align:center;
	padding:10px;
	border-radius:190px;
	float:left;
	border: 1px solid;
	border-color: gray;
}
.grades{
	width:1000px;
	height:190px;
	text-align: center;
	float:left;
}
.grades_div{
	width:500px;
	height:190px;
	margin: 0 auto;
	padding-top: 10px;
}
.grades_num{
	margin: 0;
}
</style>
</head>
<body>
<div class="container">
	<div class="top_container">
		<div class="profile">
			<div class="profile_img">
				<img class="img-circle" src="/resources/images/avatar.png">
				<div class="profile_name"><strong>홍길동</strong>님</div>
				<div class="profile_btn"><button type="button" class="btn_create_resume">이력서 작성하기</button></div>
			</div>
		</div>
		<div class="grades">
			<div class="grades_div">
				<div class="div_radius_avg">
					<strong>학점 평균</strong>
					<h1 class="grades_num">0</h1>
					<p style="font-size: 15px;">0 / 4.5</p>
				</div>
				<div class="div_radius_sum">
					<strong>전체 학점</strong>
					<h1 class="grades_num">0</h1>
					<p style="font-size: 15px;">총점 : 0</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="bottom_container">
		<div class="page_list">
			<div class="listGroup">
				<h2 class="list_title">자기소개서 관리</h2>
				<ul>
					<li>자기소개서 등록</li>
					<li>자시소개서 관리</li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">이력서 관리</h2>
				<ul>
					<li>이력서 등록</li>
					<li>이력서 관리</li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">활동 관리</h2>
				<ul>
					<li>내 스크랩</li>
					<li>내가 쓴 리뷰</li>
				</ul>
			</div>
			<div class="listGroup">
				<h2 class="list_title">회원정보 관리</h2>
				<ul>
					<li>회원정보 수정</li>
					<li>회원 탈퇴</li>
				</ul>
			</div>
		</div>
		<div class="calculator">
			<div class="top_calculator">
				<div class="calculator_title"><p>학점계산기</p></div>
				<div class="div_reset">
					<button type="button" class="btn btn-default">초기화</button>
				</div>
			</div>
			<table class="calculator_table"  id="calculator" border="1">
				<thead>
					<tr>
						<th class="th_grades">성적</th>
						<th class="th_credit">학점</th>
						<th class="class_name">수업</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					<tr>
						<th>
							<select class="selecter"name="grades">
  								<option value="A+" selected="selected">A+</option>
  								<option value="A">A</option>
 								<option value="B+">B+</option>
 								<option value="B">B</option>
 								<option value="C+">C+</option>
 								<option value="C">C</option>
 								<option value="D+">D+</option>
 								<option value="D">D</option>
 								<option value="F">F</option>
							</select>
						</th>
						<th><input type="text" class="credit_input" name="credit" value="0"/></th>
						<th><input type="text" class="class_name_input"name="class_name"/></th>
					</tr>
					
				</tbody>
				<tr>
					<th colspan="3" class="more_input">+ 더 입력하기</th>
				</tr>
			</table>
		</div>
	</div>



</div>