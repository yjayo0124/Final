<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		plugins: [ 'interaction', 'dayGrid'],
		header: {
			left: 'prev',
			center: 'title',
			right: 'next, today'
		},
		defaultView: 'month',
		lang: 'ko',
		events: function(start, end, timezone, callback) {
			$.ajax({
				type: "POST",
				url: "/jobfair/main",
				dataType: "json",
				success: function( res ) {
					console.log("성공");
					console.log(res);
					
					var events = [];
					if(!!res.result) {
						$.map( res.result, function( r ) {
							events.push({
								id: r.id,
								title: r.jobfair_title,
								start: r.jobfair_start,
								end: r.jobfair_end
							});
						});
					}
					callback(events);
				},
				error: function() {
					console.log("실패");
				}
			});
		}
// 		,eventClick: function(event) {
//			$()
//		}
	});
	
	
	$('#btnSearch').click(function() {
		
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


<div class="body">

<div class="form-inline">

<div class="form-group"> 
	<input type="text" id="search" name="search" class="form-control" placeholder="검색할 단어 입력"/>
	<button id="btnSearch" class="btn btn-outline-secondary">검색</button>
</div>

<%-- <c:if test="${login eq admin }"> --%>
<button id="btnRegister" class="btn pull-right">글쓰기</button>
<%-- </c:if> --%>
</div>
<br>
<br>

<div id="calendar">
</div>
</div>

