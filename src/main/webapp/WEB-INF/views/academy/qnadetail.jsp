<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <div class = "content_academy">

  	<h2>질문 자세히 보기</h2>
  	<div id = "first">
  	

    <div class="acainput">
    			<span class="txt">질문 제목</span>
    			${dto.qsubject}
    		</div>
    <div class="acainput">
    			<span class="txt">질문 내용</span>
    			${dto.qcontent}
    		</div>
    
  	
  	
  	<h2>답변</h2>
  		<form method= "POST"action="/academy/academy/qnaaddok">
  	<span class="txt">답변 제목 </span>
    <div class="acainput"><input type = "text" name  = "qasubject" id= "qasubject" ></div>
     <span class="txt">답변 내용</span>
    <div class="acainput"><textarea name  = "qacontent" id= " qacontent" ></textarea></div>
    
   
	<div>
	<div id = "btnedit">
  <input type = "hidden" name = "qseq" id = "qseq" value = "${dto.qseq}">
  <input type = "hidden" name = "aseq" id = "aseq" value = "${dto.aseq}">
  <button type = "submit" > 추가하기 </button>
  <input type = "button" value="뒤로 가기" onclick = "location.href='/academy/academy/qna?aseq=${dto.aseq}';">
  	</div>
  </div>
  		</form>
  
  
  </div>
  </div>
    	
    
  
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>

