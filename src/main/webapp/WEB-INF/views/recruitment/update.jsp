<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnUpdate").click(function(){
		$("form").submit();
	});
	
	
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
})
		
</script>

<div class="container" style="position: relative; width: 1000px; margin-left:150px; "> 

<form action="/recruitment/update" method="POST" class="form-horizontal">
	
	<input type="hidden" name="recruit_no" value="${recruit.getRecruit_no() }">
	<div class="form-group">
		<div class="col-sm-12"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채용공고등록</h2></div>
	</div>

<div style="text-align: center;">
<button type="submit" id="btnUpdate">수정하기</button>
</div>

</form>



</div>