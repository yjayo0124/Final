<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<script type="text/javascript" src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/jquery.min.js'></script>
<script type="text/javascript" src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<script type="text/javascript" src='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<link href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.css' rel='stylesheet' />
<link href='https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />

<script type="text/javascript">
$(document).ready(function() {
	
	$('#calendar').fullCalendar({
		plugins: [ 'dayGrid', 'timeGrid', 'list', 'bootstrap' ],
		themeSystem: 'standard',
		header: {
			left: 'prev',
			center: 'title',
			right: 'next, today'
		},
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
 		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
 		buttonText: {today: 'today'},
 		titleFormat: 'YYYY년 MM월',
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
		},
		eventColor: 'rgba(255, 165, 52, 0.2)'

	});
	

	$('#btnSearch').click(function() {
		$("form").submit();
	});
	
	$('#btnRegister').click(function() {
		$(location).attr("href", "/jobfair/register");
	});
	
});

</script>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

.body {
	margin: 40px 10px;
	padding: 0;
	font-family: 'Nanum Gothic', 'Spoqa Han Sans', 'Jeju Gothic', sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.btn {
	background-color: #343a40;
	color: #ffffff;
}

input{
	margin-left: 10px;
}

#btnRegister {
	margin-right: 10px;
}

.fc-sun { 
	color: #e53935; 
}

.fc-sat { 
	color: #337ab7; 
}

.fc-right .fc-prev-button, .fc-right .fc-next-button {
	border: 1px solid;
    background-color: #ffffff;
    background-image: none;
    color: #1A252F;
    padding: 10px;
    font-size: medium;
}

.fc-left .fc-prev-button, .fc-left .fc-next-button {
	border: 1px solid;
    background-color: #ffffff;
    background-image: none;
    color: #1A252F;
    padding: 10px;
    font-size: medium;
}

.fc-right .fc-today-button {
	border: 1px solid;
	background-color: #ffffff;
    background-image: none;
    color: #1A252F;
	margin-left: 3px;
	font-size: medium;
}

.fc-title {
	color: #212529;
}
</style>

<div class="wrap">

<div class="body">

<div class="form-inline">

<div class="search_container">
	<form action="/jobfair/search" method="get">
		<div class="form-group"> 
			<input type="text" id="search" name="search" class="form-control" placeholder="검색할 단어 입력"/>
			<button id="btnSearch" class="btn btn-outline-secondary">검색</button>
		</div>
	</form>
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
