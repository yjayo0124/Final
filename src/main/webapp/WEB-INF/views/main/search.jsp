<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
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

<h4>기업이름 클릭시 해당기업 상세페이지로 이동합니다.</h4>

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