<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
(function( $ ) {
    "use strict";
    $(function() {
        function animated_contents() {
        	$(".zt-skill-bar").each(function(i) {
                var $this  = $(this),
                skills = $this.data('width');
                
                $this.css({'width' : 100 + '%'});

        	});
            $(".zt-skill-bar > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');
                
                if(skills > 100) {
                	$this.css({'width' : 100 + '%'});
                } else {
                    $this.css({'width' : skills + '%'});
                }
            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
}(jQuery));

$(function() {
		$('#zt-span7').hide();
		$('#zt-span8').hide();
		$('#zt-span9').hide();
		$('#zt-span6').show();
	$('#membox').click(function() {
		$('#zt-span7').hide();
		$('#zt-span8').hide();
		$('#zt-span9').hide();
		$('#zt-span6').show();
		$('#hidechart').load('#zt-span6');
	});
	$('#historybox').click(function() {
		$('#zt-span6').hide();
		$('#zt-span8').hide();
		$('#zt-span9').hide();
		$('#zt-span7').show();
		$('#hidechart').load('#zt-span7');
	});
	$('#newmembox').click(function() {
		$('#zt-span7').hide();
		$('#zt-span6').hide();
		$('#zt-span9').hide();
		$('#zt-span8').show();
		$('#hidechart').load('#zt-span8');
	});
	$('#levmembox').click(function() {
		$('#zt-span7').hide();
		$('#zt-span8').hide();
		$('#zt-span6').hide();
		$('#zt-span9').show();
		$('#hidechart').load('#zt-span9');
	});
});



</script>

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
	float: left;
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

#zt-span6, #zt-span7, #zt-span8, #zt-span9 {
	width: 480px;
	float: right;
}

#zt-sapn1 {
	height: auto;
	float: left;
}

#zt-sapn2 {
	height: auto;
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
	background-color: #e9e9e9;
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
    
/*     display: var(--uismLinkDisplay); */
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
    position: relative;
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


















/*-------------------------------------------------------------------------*/
/*  Skill bar style
/*-------------------------------------------------------------------------*/

.zt-skill-bar {
    color: #fff;
    font-size: 11px;
    line-height: 25px;
    height: 25px;
    margin-bottom: 5px;
	width:auto;
	
    background-color: rgba(0,0,0,0.1);

    -webkit-border-radius: 2px;
       -moz-border-radius: 2px;
        -ms-border-radius: 2px;
            border-radius: 2px;

}

.zt-skill-bar * {
    webkit-transition: all 0.5s ease;
      -moz-transition: all 0.5s ease;
       -ms-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
           transition: all 0.5s ease;
}

.zt-skill-bar div {
    background-color: #ffc600;
    position: relative;
    padding-left: 25px;
    width: 0;

    -webkit-border-radius: 2px;
       -moz-border-radius: 2px;
       -ms- border-radius: 2px;
            border-radius: 2px;
}

.zt-skill-bar span {
    display: block;
    position: absolute;
    right: 0;
    top: 0;
    height: auto;
    padding: 0 5px 0 10px;
    background-color: #1a1a1a;

    -webkit-border-radius: 0 2px 2px 0;
       -moz-border-radius: 0 2px 2px 0;
        -ms-border-radius: 0 2px 2px 0;
            border-radius: 0 2px 2px 0;
}

.zt-skill-bar span:before {
    content: "";
    position: absolute;
    width: 6px;
    height: 6px;
    top: 50%;
    left: -3px;
    margin-top: -3px;
    background-color: #1a1a1a;

    -webkit-transform: rotate(45deg);
       -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
            transform: rotate(45deg);
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

<c:if test="${i.cor_classify eq 1}">
	<c:set var="classify" value="법인기업"/>
</c:if>
<c:if test="${i.cor_classify eq 2}">
	<c:set var="classify" value="개인기업"/>
</c:if>

<table>
	<tr>
		<th>소재지</th>
		<th>업종</th>
		<th>기업구분</th>
	</tr>
	<tr>
		<td>${i.cor_addr }</td>
		<td>${i.cor_type }</td>
		<td>${classify }</td>
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
			<h4><span id="cor_history" class="sm-link__label"></span></h4>
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

<div id="hidechart">
	<div id="zt-span6" class="zt-span6 last">
		<c:choose>
			<c:when test="${i.cor_mem > idmem}">
				<c:set var="cormem" value="${i.cor_mem }"/>
			</c:when>
			<c:when test="${i.cor_mem < idmem}">
				<c:set var="cormem" value="${idmem }"/>
			</c:when>
		</c:choose>
		
		<h3><strong>인원</strong></h3>
		현재기업<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn1" data-width="${i.cor_mem }">&nbsp;<span style="width:50px;">${i.cor_mem }명</span></div></div>
		동종산업군<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn2" data-width="${idmem }">&nbsp;<span style="width:50px;">${idmem }명</span></div></div>
	</div>
	
	<div id="zt-span7" class="zt-span6 last">
		<c:choose>
			<c:when test="${i.cor_mem > i.cor_new_mem}">
				<c:set var="cormem" value="${i.cor_mem }"/>
			</c:when>
			<c:when test="${i.cor_mem < i.cor_new_mem}">
				<c:set var="cormem" value="${i.cor_new_mem }"/>
			</c:when>
		</c:choose>
		
		<h3><strong>업력</strong></h3>
		현재기업<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn1" data-width="${i.cor_mem }">&nbsp;<span style="width:50px;">${i.cor_mem }년</span></div></div>
		동종산업군<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn2" data-width="${idmem }">&nbsp;<span style="width:50px;">${idmem }년</span></div></div>
	</div>
	
	<div id="zt-span8" class="zt-span6 last">
		<c:choose>
			<c:when test="${i.cor_new_mem > newmem}">
				<c:set var="cormem" value="${i.cor_mem }"/>
			</c:when>
			<c:when test="${i.cor_new_mem < newmem}">
				<c:set var="cormem" value="${newmem }"/>
			</c:when>
		</c:choose>
		
		<h3><strong>입사율</strong></h3>
		현재기업<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn1" data-width="${i.cor_new_mem }">&nbsp;<span style="width:50px;">${i.cor_new_mem }명</span></div></div>
		동종산업군<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn2" data-width="${newmem }">&nbsp;<span style="width:50px;">${newmem }명</span></div></div>
	</div>
	
	<div id="zt-span9" class="zt-span6 last">
		<c:choose>
			<c:when test="${i.cor_lev_mem > levmem}">
				<c:set var="cormem" value="${i.cor_mem }"/>
			</c:when>
			<c:when test="${i.cor_lev_mem < levmem}">
				<c:set var="cormem" value="${levmem }"/>
			</c:when>
		</c:choose>
		
		<h3><strong>퇴사율</strong></h3>
		현재기업<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn1" data-width="${i.cor_lev_mem }">&nbsp;<span style="width:50px;">${i.cor_lev_mem }명</span></div></div>
		동종산업군<div class="zt-skill-bar" data-width="${cormem }"><div id="zt-sapn2" data-width="${levmem }">&nbsp;<span style="width:50px;">${levmem }명</span></div></div>
	</div>
</div>

</c:forEach>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>

<script type="text/javascript">
Date.prototype.format = function(f) {
	if (!this.valueOf()) return " ";
 
	var weekName = ["일", "월", "화", "수", "목", "금", "토"];
	var d = this;
	 
	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
		switch ($1) {
			case "yyyy": return d.getFullYear();
			case "yy": return (d.getFullYear() % 1000).zf(2);
			case "MM": return (d.getMonth() + 1).zf(2);
			case "dd": return d.getDate().zf(2);
			case "E": return weekName[d.getDay()];
			case "HH": return d.getHours().zf(2);
			case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
			case "mm": return d.getMinutes().zf(2);
			case "ss": return d.getSeconds().zf(2);
			case "a/p": return d.getHours() < 12 ? "오전" : "오후";
			default: return $1;
		}
	});
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

var formatdate = new Date('${formatdate }');
formatdate = formatdate.format("yyyy");
var sysdate = new Date();
sysdate = sysdate.format("yyyy");
formatdate = sysdate-formatdate;
console.log(formatdate);
document.getElementById('cor_history').innerHTML=formatdate+"년";

</script>
</html>