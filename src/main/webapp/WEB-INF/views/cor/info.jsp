<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
body {
	width: 1000px;
	margin: 0 auto;
}

h6 {
	margin-top: 50px;
	width: 300px;
	border: 0px;
}

#corname {
	float: left;
	width: 500px;
}

#corincome {
	float: right;
}

#membox, #historybox, #newmembox, #levmembox {
	margin: 3px;
	border: 3px solid #dddddd;
	padding: 5px;
	width: 200px;
	border-radius: 8px;
	text-align: right;
}

#corinfo {
	width: 520px;
}

#mem {
	float: left;
}
#history {
	float: left;
}

#newmem {
	float: left;
}
#levmem {
	float: left;
}

table {
	width: 100%;
	border-top: 3px solid #444444;
	border-bottom: 3px solid #444444;
	border-left: 0px solid white;
	border-right: 0px solid white;
	border-collapse: collapse;
	margin: auto;
}

th {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
	background-color: #dddddd;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
	padding: 10px;
}















.sm-link{
    --uismLinkDisplay: var(--smLinkDisplay, inline-flex);   
    --uismLinkTextColor: var(--smLinkTextColor);
    --uismLinkTextColorHover: var(--smLinkTextColorHover);  
    
    display: var(--uismLinkDisplay);
    color: var(--uismLinkTextColor);
    position: relative; 
    overflow: hidden;
}

a.sm-link{
    text-decoration: none;
}

.sm-link__label{
  display: block;
}

/* sm-link_padding-all */ 

.sm-link_padding-all{
    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
    --uismLinkLineColor: var(--smLinkLineColor, #000);
    --uismLinkPadding: var(--smLinkPadding, 5px);
    
    padding: var(--uismLinkPadding);
}

.sm-link_padding-all::before, 
.sm-link_padding-all::after{
  width: 100%;
  height: var(--uismLinkLineWeight);
  left: 0;
}

.sm-link_padding-all::before{
  top: 0;
}

.sm-link_padding-all::after{
  bottom: 0;
}

.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
  width: var(--uismLinkLineWeight);
  height: 100%;
  top: 0;
}

.sm-link_padding-all .sm-link__label::before{
  left: 0;
}

.sm-link_padding-all .sm-link__label::after{
  right: 0;
}

.sm-link_padding-all::before,
.sm-link_padding-all::after,
.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
  content: "";     
    background-color: var(--uismLinkLineColor);
  position: absolute; 
    opacity: 0;
    
    will-change: transform, opacity;
    transition-property: transform, opacity;
}

.sm-link_padding-all:hover::before,
.sm-link_padding-all:hover::after,
.sm-link_padding-all:hover .sm-link__label::before,
.sm-link_padding-all:hover .sm-link__label::after{
    opacity: 1;
}

/* sm-link_padding-bottom */ 

.sm-link_padding-bottom{
    --uismLinkLineWeight: var(--smLinkLineWeight, 2px);
    --uismLinkLineColor: var(--smLinkLineColor, #000);  
    
    padding-bottom: var(--uismLinkLineWeight);  
    position: relative;
}

.sm-link_padding-bottom::after{
  content: "";
  width: 100%;
  height: var(--uismLinkLineWeight);
    background-color: var(--uismLinkLineColor);
    
  position: absolute;
  left: 0;
  bottom: 0;
}

/* sm-link_bg */ 

.sm-link_bg {
    --uismLinkLineColor: var(--smLinkLineColor, #000);  
    --uismLinkTextColorHover: var(--smLinkTextColorHover, #fff);    
    --uismLinkPadding: var(--smLinkPadding, 5px);
    
    padding: var(--uismLinkPadding);
    transition: color .3s ease-out;
}

.sm-link_bg::before, 
.sm-link_bg::after{
  content: "";
    background-color: var(--uismLinkLineColor); 
  opacity: 0;
  position: absolute;
    
    transition: transform .2s ease-out, opacity .2s ease-out .03s;
}

.sm-link_bg .sm-link__label{
  position: relative;
  z-index: 2;
}

.sm-link_bg:hover::before, 
.sm-link_bg:hover::after{
  opacity: 1;
    transition-duration: .35s, .35s;
    transition-delay: 0s, 0s;
}

.sm-link_bg:hover{
    color: var(--uismLinkTextColorHover);
}

/* sm-link_text */ 

.sm-link_text::before{
  content: attr(data-sm-link-text);
    color: var(--uismLinkTextColorHover);
    position: absolute; 
}

.sm-link_text::before, 
.sm-link_text .sm-link__label{
  transition-property: transform;
    transition-timing-function: cubic-bezier(.86, .6, .08, 1.01); 
    transition-duration: .3s;
}

.sm-link_text:hover::before,
.sm-link_text:hover .sm-link__label{
    transition-duration: .4s;
}

/* effect 12 */

.sm-link12::before,
.sm-link12::after{
  width: 51%;
  height: 100%;
  top: 0; 
}

.sm-link12::before{
  left: 0;
  transform: translate3d(-100%, 0, 0) rotate(-45deg);
}

.sm-link12::after{
  right: 0;
  transform: translate3d(100%, 0, 0) rotate(-45deg);
}

.sm-link12:hover::before, 
.sm-link12:hover::after{
  transform: translate3d(0, 0, 0);
}

/*
SETTINGS
*/

.sm-link{
    --smLinkPadding: 10px 15px;
    --smLinkLineWeight: 5px;
    --smLinkLineColor: #6799FF;
    --smLinkTextColor: #6799FF;
    --smLinkTextColorHover: #1b255a;
}

.sm-link_bg{
    --smLinkTextColorHover: #fff;
}


</style>

<body>

<c:forEach items="${list }" var="i">

<h6>(${i.cor_name }) 상세보기</h6>
<br>

<div id="corname">
<h3><b>${i.cor_name }</b></h3>
</div>
<div id="corincome">
<h5>예상 평균연봉</h5>
<h5>${i.national_pension }</h5>
</div>

<br><br><br><br><br><br>
<h5>기업정보</h5>

<table>
	<tr>
		<th>소재지</th>
		<th>업종</th>
		<th>기업구분</th>
	</tr>
	<tr>
		<td>${i.cor_addr }</td>
		<td>${i.cor_type }</td>
		<td>${i.cor_classify }</td>
	</tr>
</table>
<br><br>
<div id="corinfo">
	<div id="mem" class="section">
		<h5>인원</h5>
		<div id="membox" class="sm-link sm-link_bg sm-link12">
			<span class="sm-link__label"><h4>${i.cor_mem }명</h4></span>
		</div>
	</div>
	<div id="history" class="section">
		<h5>업력</h5>
		<div id="historybox" class="sm-link sm-link_bg sm-link12">
			<span class="sm-link__label"><h4>${i.cor_history }년</h4></span>
		</div>
	</div>
	<div id="newmem" class="section">
		<h5>입사율</h5>
		<div id="newmembox" class="sm-link sm-link_bg sm-link12">
			<span class="sm-link__label"><h4>${i.cor_new_mem }명</h4></span>
		</div>
	</div>
	<div id="levmem" class="section">
		<h5>퇴사율</h5>
		<div id="levmembox" class="sm-link sm-link_bg sm-link12">
			<span class="sm-link__label"><h4>${i.cor_lev_mem }명</h4></span>
		</div>
	</div>
</div>

<div></div>

</c:forEach>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>