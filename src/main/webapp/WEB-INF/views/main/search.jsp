<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>

<div>
<table id="table" border="1">
<tr>
	<th>기업이름 </th>
</tr>


<c:forEach items="${list }" var="i">
<tr>
	<td>${i.COR_NAME }</td>
</tr>
</c:forEach>
</table>
</div>

</body>
</html>