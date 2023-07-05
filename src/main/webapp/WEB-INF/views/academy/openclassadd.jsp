<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <div class = "content_academy">
  	
  	<h2>강좌 추가 페이지</h2>
  	<div id = "first">
 
	
  	
  <form method="POST" action="/academy/academy/openclassaddok">

    <span class="txt">강의 기간 </span>
    <div class="acainput"><input type = "text" name  = "cperiod" id= "cperiod" ></div>
     <span class="txt">강의 일수</span>
    <div class="acainput"><input type = "text" name  = "ctime" id= "ctime" ></div>
     <span class="txt">강의 명수</span>
    <div class="acainput"><input type = "text" name  = "stunum" id= "stunum" ></div>
     <span class="txt">등록 마감일</span>
    <div class="acainput"><input type = "text" name  = "period" id= "period" ></div>
     <span class="txt">강의 이름</span>
    <div class="acainput"><input type = "text" name  = "cname" id= "cname" ></div>
     <span class="txt">강의 내용</span>
    <div class="acainput"><input type = "text" name  = "cinfo" id= "cinfo" ></div>
     <span class="txt">강의 카테고리</span>
    <div class="acainput"><input type = "text" name  = "ccategory" id= "ccategory" ></div>
    <span class="txt">담당 강사 번호</span>
    <div class="acainput"><input type = "text" name  = "tseq" id= "tseq" ></div>
    
    
    
	<div>
	<div id = "btnedit">
  <input type = "hidden" name = "aseq" id = "aseq" value = "${acinfo.aseq}">
  <button type = "submit" > 추가하기 </button>
  	</div>
  </div>
  </form>
  </div>
    	
    
  </div>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>

