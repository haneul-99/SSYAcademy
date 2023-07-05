<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <div class = "content_academy">
  	
  	<h2>강의 정보 수정 페이지</h2>
  	<div id = "first">
  

  <form method="POST" action="/academy/academy/openclasseditok">
 ${dto.tseq}
    <span class="txt">강의 이름</span>
    <div class="acainput"><input type = "text" name  = "cname" id="cname" value = "${dto.cname }" ></div>
    <span class="txt">강의 기간</span>
    <div class="acainput"><input type = "text" name  = "cperiod" id="cperiod" value = "${dto.cperiod}" ></div>
    <span class="txt">강의 일수</span>
    <div class="acainput"><input type = "text" name  = "ctime" id=" ctime" value = "${dto. ctime}" ></div>
    <span class="txt">강의 학생 수 </span>
    <div class="acainput"><input type = "text" name  = "stunum" id="stunum" value = "${dto.stunum}" ></div>
 	<span class="txt">강의 내용</span>
    <div class="acainput"><textarea name  = "cinfo" id="cinfo">"${dto.cinfo}"</textarea></div>
 	<span class="txt">강의 카테고리</span>
    <div class="acainput"><input type = "text" name  = "ccategory" id="ccategory" value = "${dto.ccategory}" ></div>
	
	<div>
	<div id = "btnedit">
  <input type = "hidden" name = "tseq" id = "tseq" value = "${dto.tseq}">
  <button type = "submit" > 수정하기 </button>
  	</div>
  </div>
  </form>
  </div>
    	
    
  </div>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>

