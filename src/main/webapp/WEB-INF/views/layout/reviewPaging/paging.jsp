<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.pagination>.active>a{
	
	border-color: #566270;
	background-color: #566270;
	color: white;
}

</style>


<div class="text-center">
	<c:set var="beforeString" value="${fn:split(paging.curPage, ' ')}"/>
	<c:set var="lengthString" value="${beforeString[fn:length(beforeString)-1] }"/>
	
	<ul class="pagination pagination-sm">
		<!-- 처음으로 가기 -->
		<c:if test="${paging.startPage ne 1 }">
		<li>
			<a href="/review/list?tag=${paging.tag }"><span>&larr;처음</span></a>
		</li>
		</c:if>



		<c:if test="${paging.curPage < 10 }">
			<c:if test="${lengthString eq 1 }">
				<c:set var="prevPage" value="1"/>
			</c:if>
			
			<c:if test="${lengthString eq 2 }">
				<c:set var="prevPage" value="2"/>
			</c:if>
			
			<c:if test="${lengthString eq 3 }">
				<c:set var="prevPage" value="3"/>
			</c:if>
			
			<c:if test="${lengthString eq 4 }">
				<c:set var="prevPage" value="4"/>
			</c:if>
			
			<c:if test="${lengthString eq 5 }">
				<c:set var="prevPage" value="5"/>
			</c:if>
			
			<c:if test="${lengthString eq 6 }">
				<c:set var="prevPage" value="6"/>
			</c:if>
			
			<c:if test="${lengthString eq 7 }">
				<c:set var="prevPage" value="7"/>
			</c:if>
			
			<c:if test="${lengthString eq 8 }">
				<c:set var="prevPage" value="8"/>
			</c:if>
			
			<c:if test="${lengthString eq 9 }">
				<c:set var="prevPage" value="9"/>
			</c:if>
		</c:if>
		
		<c:if test="${paging.curPage >= 10 }">
			<c:set var="subString" value="${fn:substring(lengthString, 1, fn:length(lengthString) + 1)}"/>
			<c:if test="${subString eq 0 }">
				<c:set var="prevPage" value="10"/>
			</c:if>
			
			<c:if test="${subString eq 1 }">
				<c:set var="prevPage" value="1"/>
			</c:if>
			
			<c:if test="${subString eq 2 }">
				<c:set var="prevPage" value="2"/>
			</c:if>
			
			<c:if test="${subString eq 3 }">
				<c:set var="prevPage" value="3"/>
			</c:if>
			
			<c:if test="${subString eq 4 }">
				<c:set var="prevPage" value="4"/>
			</c:if>
			
			<c:if test="${subString eq 5 }">
				<c:set var="prevPage" value="5"/>
			</c:if>
			
			<c:if test="${subString eq 6 }">
				<c:set var="prevPage" value="6"/>
			</c:if>
			
			<c:if test="${subString eq 7 }">
				<c:set var="prevPage" value="7"/>
			</c:if>
			
			<c:if test="${subString eq 8 }">
				<c:set var="prevPage" value="8"/>
			</c:if>
			
			<c:if test="${subString eq 9 }">
				<c:set var="prevPage" value="9"/>
			</c:if>
		</c:if>
		
		<!-- 이전 페이지 -->
		<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
		<c:if test="${paging.curPage eq 1 }">
		<li class="disabled">
			<span>&laquo;</span>
		</li>
		</c:if>

		<c:if test="${paging.curPage ne 1 }">
		<li>
			<a href="/review/list?tag=${paging.tag }&curPage=${paging.curPage-prevPage }"><span>&laquo;</span></a>
	    </li>
	    </c:if>





		<!-- 페이징 리스트 -->
		<c:forEach
	     begin="${paging.startPage }" end="${paging.endPage }"
	     var="i">
	
			<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
			<c:if test="${paging.curPage eq i}">
			<li class="active">
				<a href="/review/list?tag=${paging.tag }&curPage=${i }">${i }</a>
			</li>
			</c:if>
			<c:if test="${paging.curPage ne i}">
			<li>
				<a href="/review/list?tag=${paging.tag }&curPage=${i }">${i }</a>
			</li>
			</c:if>
			
	    </c:forEach>




		<c:if test="${paging.curPage < 10 }">
			<c:if test="${lengthString eq 1 }">
				<c:set var="nextPage" value="10"/>
			</c:if>
			
			<c:if test="${lengthString eq 2 }">
				<c:set var="nextPage" value="9"/>
			</c:if>
			
			<c:if test="${lengthString eq 3 }">
				<c:set var="nextPage" value="8"/>
			</c:if>
			
			<c:if test="${lengthString eq 4 }">
				<c:set var="nextPage" value="7"/>
			</c:if>
			
			<c:if test="${lengthString eq 5 }">
				<c:set var="nextPage" value="6"/>
			</c:if>
			
			<c:if test="${lengthString eq 6 }">
				<c:set var="nextPage" value="5"/>
			</c:if>
			
			<c:if test="${lengthString eq 7 }">
				<c:set var="nextPage" value="4"/>
			</c:if>
			
			<c:if test="${lengthString eq 8 }">
				<c:set var="nextPage" value="3"/>
			</c:if>
			
			<c:if test="${lengthString eq 9 }">
				<c:set var="nextPage" value="2"/>
			</c:if>
		</c:if>
		
		<c:if test="${paging.curPage >= 10 }">
			<c:set var="subString" value="${fn:substring(lengthString, 1, fn:length(lengthString) + 1)}"/>
			<c:if test="${subString eq 0 }">
				<c:set var="nextPage" value="1"/>
			</c:if>
			
			<c:if test="${subString eq 1 }">
				<c:set var="nextPage" value="10"/>
			</c:if>
			
			<c:if test="${subString eq 2 }">
				<c:set var="nextPage" value="9"/>
			</c:if>
			
			<c:if test="${subString eq 3 }">
				<c:set var="nextPage" value="8"/>
			</c:if>
			
			<c:if test="${subString eq 4 }">
				<c:set var="nextPage" value="7"/>
			</c:if>
			
			<c:if test="${subString eq 5 }">
				<c:set var="nextPage" value="6"/>
			</c:if>
			
			<c:if test="${subString eq 6 }">
				<c:set var="nextPage" value="5"/>
			</c:if>
			
			<c:if test="${subString eq 7 }">
				<c:set var="nextPage" value="4"/>
			</c:if>
			
			<c:if test="${subString eq 8 }">
				<c:set var="nextPage" value="3"/>
			</c:if>
			
			<c:if test="${subString eq 9 }">
				<c:set var="nextPage" value="2"/>
			</c:if>
		</c:if>
		<!-- 다음 페이지 -->
		<c:if test="${paging.curPage eq paging.totalPage }">
		<li class="disabled">
			<span>&raquo;</span>
		</li>
		</c:if>
		<c:if test="${paging.curPage ne paging.totalPage }">
		<li>
			<a href="/review/list?tag=${paging.tag }&curPage=${paging.curPage+nextPage }">
			<span>&raquo;</span>
		</a>
		</li>
		</c:if>
	</ul>
</div>
