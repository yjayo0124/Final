<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<link href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.css' rel='stylesheet' />
<link href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/jquery.min.js'></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script type="text/javascript">

$(document).ready(function() {
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev',
			center: 'title',
			right: 'next, today'
		},
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
 		buttonText: {today: 'today'},
 		events: function(start, end, timezone, callback){
	 			$.ajax({
	 				url: '/jobfair/list', 
	 				cache: false,
	 				type: 'GET',
	 				dataType: 'json',
	 				success:

	 					function(data){
	 					console.log("성공");
	 					console.log(data);
	 					
	 					var events = [];
	 					$.each(data, function(idx, val) { 
	 						console.log(idx + " " + val.JOBFAIR_NAME);
	 						
	 						events.push({ 
	 							no: val.JOBFAIR_NO,
	 							title: val.JOBFAIR_NAME,
	 							start: val.JOBFAIR_START,
	 							end: val.JOBFAIR_END
	 						})
	 						
	 					});

	 					callback(events);
	 				}
	 				, error: function(jqXHR, status, error){
	 					console.log("실패");
	 					console.log("--jqXHR--")
	 					console.log(jqXHR);
	 					console.log("--status--")
	 					console.log(status);
	 					console.log("--error-- ")
	 					console.log(error);
	 				}
	 			});
 			},
		eventClick: function(event){
			console.log(event);
			console.log(event.no);
			location.href = '/jobfair/adminview?jobfair_no=' + event.no;
		}
			
	});
	

	$('#btnSearch').click(function() {
		location.href="/jobfair/list?search=" + $("#search").val();
	});
	
	$('#btnRegister').click(function() {
		$(location).attr("href", "/jobfair/register");
	});
});
</script>

<style type="text/css">

.body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

</style>

<div class="wrap">

<div class="body">

<div class="form-inline">

<div class="form-group"> 
	<input type="text" id="search" name="search" class="form-control" placeholder="검색할 단어 입력"/>
	<button id="btnSearch" class="btn btn-outline-secondary">검색</button>
</div>


<sec:authorize access="hasRole('ROLE_ADMIN')">
	<button id="btnRegister" class="btn pull-right">등록</button>
</sec:authorize>
<br>
<br>


<div id="calendar"></div>

</div>

</div>
</div>


