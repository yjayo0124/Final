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

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.js" ></script>



<style type="text/css">

.header{
	width: 100%;
	height: 30px;
	position: absolute;
	z-index: 100;
	
}


.container{

	min-height: 850px;
	padding-bottom: 50px;
}



.l-footer{

    bottom: 0;
    left: 0;
    width: 100%;

border-top: 1px solid #ccc;
background: #fff;


}



.l-wrap{
    min-width: 1100px;
  
    position: relative;
    overflow: hidden;
}

</style>

</head>
<body>


<div class="l-wrap">
<!-- HEADER -->

<tiles:insertAttribute name="header"/>
<hr>


<!-- BODY -->
<div class="container">
<tiles:insertAttribute name="body"/>
</div>

<!-- FOOTER -->
<div class="l-footer">
<tiles:insertAttribute name="footer" />
</div>

</div>

</body>
</html>