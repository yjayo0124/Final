<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnUpdate").click(function(){
		$("form").submit();
	});
	
	
	$("#btnDelete").click(function() {
		history.go(-1);
	});
	
})
	
	
</script>
<style type="text/css">
#btnUpdate{
	width: 80px;
	height: 40px;
	background: #1ec0ff;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
#btnDelete{
	width: 80px;
	height: 40px;
	background: #f1404b;
	font-size: 13px;
	color: #fff;
	border: solid 2px;
	border-radius: 1px;
}
</style>
<div class="container" style="background-color: #e4e7ec; width: 700px;" >

<div>

<h4>회원 정보 수정</h4>
<hr>
<form action="/cor/infoUpdate" method="POST" class="form-horizontal" >

	<input type="hidden" name="member_no" value="${member.member_no }">
	<div class="form-group">
	<label for="member_name" class="col-sm-2">이름</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="member_name" name="member_name" value="${member.member_name }" readonly/></div>
	</div>
	<div class="form-group">
	<label for="member_phone" class="col-sm-2">Phone</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="member_phone" name="member_phone" value="${member.member_phone }"/></div>
	</div>
	<div class="form-group">
	<label for="member_email" class="col-sm-2">Email</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="member_email" name="member_email" value="${member.member_email }"/></div>
	</div>
<hr>

<h4>기업 정보 수정<small>  국민연금 자료 기반 </small></h4>
	<input type="hidden" name="cor_no" id="cor_no" value="${cor.cor_no }">
	<div class="form-group">
	<label for="cor_name" class="col-sm-2">사업자명</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="cor_name" name="cor_name" value="${cor.cor_name } "/></div>
	</div>
	<div class="form-group">
	<label for="cor_addr" class="col-sm-2">주소</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="cor_addr" name="cor_addr" value="${cor.cor_addr } "/></div>
	</div>
	
	<div class="form-group">
	<label for="cor_mem" class="col-sm-2">직원수</label>
	<div class="col-sm-7"><input type="text" class="form-control" id="cor_mem" name="cor_mem" value="${cor.cor_mem } "/></div>
	</div>

<div style="text-align: center;">
<button type="submit" id="btnUpdate">수정하기</button>
<button type="button" id="btnDelete">뒤로가기</button>
</div>

</form>

</div>

</div>