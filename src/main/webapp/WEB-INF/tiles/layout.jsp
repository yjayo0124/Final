<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js" >

</script>

<style type="text/css">

.header{
	width: 100%;
}

.wrap{
	
	width: 1200px;

}

</style>

</head>
<body>

<!-- HEADER -->
<div class="container">
<tiles:insertAttribute name="header"/>
</div>
<!-- BODY -->
<div class="container">
<div class="wrap">
<tiles:insertAttribute name="body"/>
</div>
</div>

<!-- FOOTER -->
<tiles:insertAttribute name="footer"/>

</body>
</html>