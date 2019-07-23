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
	height: 30px;

}



.body{
	
	margin-bottom: 50px;
}

#footer{

position: fixed;
bottom: 0px;
width: 100%;
border-top: 1px solid #ccc;
background: #fff;


}


</style>

</head>
<body>

<!-- HEADER -->
<tiles:insertAttribute name="header"/>
<hr>
<!-- BODY -->


<div class="container body">
<tiles:insertAttribute name="body"/>
</div>


<!-- FOOTER -->
<div id="footer">
<tiles:insertAttribute name="footer" />
</div>



</body>
</html>