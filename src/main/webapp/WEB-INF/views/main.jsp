<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<body>

<h2>메인</h2>
<hr>

<p>
로그인 객체 id : <sec:authentication property="principal"/><br>
로그인 객체 pw : <sec:authentication property="credentials"/> [null보이는거면 보안처리O, 빈칸로 보이면 비로그인]<br>
로그인 객체 details : <sec:authentication property="details"/><br>

<c:if test="${not empty pageContext.request.userPrincipal }">
	<h2>로그인한 사람이면 보이는 부분</h2>
</c:if>
</p>
</body>
</html>