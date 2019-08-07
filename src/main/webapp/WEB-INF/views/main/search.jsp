<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
h1 {
	font-size: 50px;
	font-weight: bold;
	margin: 0;
	display: inline-block;
}

h5 {
	display: inline-block;
}

a:link {
	text-decoration: none;
}

.review-hr {
	border: solid 2px #e9e9e9;
	background-color: #e9e9e9;
	margin: 5px;
	width: 99%;
	align: center;
}

table {
	width: 50%;
	border-top: 3px solid #444444;
	border-bottom: 3px solid #444444;
	border-left: 0px solid white;
  	border-right: 0px solid white;
  	border-collapse: collapse;
  	margin: auto;
}

th, td {
  	text-align: center;
  	border-bottom: 1px solid gray;
  	padding: 10px;
}
</style>

<body>
<br>
<h1>검색결과</h1>
<h5>&emsp;&emsp;*기업이름 클릭시 해당기업 상세페이지로 이동합니다.</h5>
<br>
<hr class="review-hr">
<br>
<div>
<table id="table" border="1">
<tr>
	<th>기업이름 </th>
</tr>


<c:forEach items="${list }" var="i">
<tr>
	<td><a href="/cor/info?cor_no=${i.COR_NO }&cor_type=${i.COR_TYPE }">${i.COR_NAME }</a></td>
</tr>
</c:forEach>
</table>
</div>

</body>
</html>