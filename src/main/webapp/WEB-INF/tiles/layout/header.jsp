<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1:500&display=swap&subset=korean" rel="stylesheet">
    
<style type="text/css">
#btnCorGo{
	width: 85px;
	height: 25px;
	background: #84B1ED;
	font-size: 12px;
	color: #fff;
	border: solid 1px;
	border-radius: 1px;
}


.utility{
	position: relative;
	width: 1020px;
	height: 45px;
	margin: 0 auto;
font-family: 'Gothic A1', sans-serif;
}


.header-home{
	
	
}

.userMenu{
	position: absolute;
	top: 11px;
	right: 0;
}

.userMenu li{
float: left;
margin-left: 14px;
}

.userMenu li a{
	display: block;
	height: 23px;
	color: #333;
	font-size: 17px;
	line-height: 23px;
}

ul,li{
	list-style: none;
}

.menu{
	margin-left: -64px;
	position: absolute;
	top: 11px;
}


.menu li{
	float: left;
}

.menu li a{
	margin-right: 15px;
	display: block;
	height: 23px;
	color: #333;
	font-size: 17px;
	line-height: 23px;
}


.header-logo{
	
	height: 40px;
}

.menu span, .userMenu span{
	display: inline-block;
	margin-top: 8px;
}

</style>    
    
   
<div class="utility">

<div class="header-home">
		<ul class="menu">
		<li><a style="margin-right: 20px;" href="/main"><img class="header-logo" src="/resources/images/logo.png"></a></li>
		<li><a href="/recruitment/main"><span>채용</span></a></li>

		<li><a href="/review/list?tag=전체"><span>리뷰</span></a></li>

		<li><a href="/jobfair/main"><span>취준</span></a></li>
		
		<sec:authorize access="hasAnyRole('ROLE_COR', 'ROLE_ADMIN')">
		<li><a href="/resume/list"><span>인재게시판</span></a></li>
		</sec:authorize>
	</ul>
	
</div> 
	
	
	<ul class="userMenu">
		<sec:authorize access="isAnonymous()"> 
			<li><a href="/member/login"><span>로그인</span></a></li>
			<li><a href="/member/join"><span>회원가입하러가기</span></a></li>
		</sec:authorize> 
			
		<sec:authorize access="isAuthenticated()"> 
		
			<sec:authorize access="hasAnyRole('ROLE_COR', 'ROLE_ADMIN')">
			<li><a href="/cor/main"><span>기업회원홈</span></a></li>
			</sec:authorize>
		
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="/admin"><span>관리자페이지</span></a></li>
			</sec:authorize>
				
		
			<sec:authorize access="hasRole('ROLE_IDV')">
			<li><a href="/mypage/main"><span>마이페이지</span></a></li>
			</sec:authorize>
		
			<li><a href="/member/logout"><span>로그아웃</span></a></li>
		</sec:authorize> 
	</ul>
</div>
