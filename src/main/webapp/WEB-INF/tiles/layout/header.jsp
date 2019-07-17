<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    
<div class="header">
	<div style="text-align: right;"> 
	<span>

<sec:authorize access="isAnonymous()"> 
	<a href="/member/login">로그인</a>
	<a href="/member/join">회원가입하러가기</a>
</sec:authorize> 
	
<sec:authorize access="isAuthenticated()"> 
	<a href="/member/logout">로그아웃</a>
	<sec:authorize access="hasRole('ROLE_IDV')">
	<a href="/mypage/main">마이페이지</a>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_COR')">
	<a href="/cor/main">기업페이지</a>
	</sec:authorize>

</sec:authorize> 
	</span>
	</div>
	
	<div style="text-align: center;">
	<a href="/main"><h1>KHOB</h1></a>
	</div>
</div>
<br>
<br>