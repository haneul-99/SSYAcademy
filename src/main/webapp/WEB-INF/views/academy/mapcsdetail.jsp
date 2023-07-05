<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <div class = "content_academy">

  	
  	<h2>${dto.stuname}의 정보</h2>
  	<div id = "first">
  	<div class="acainput">
    			<span class="txt">학생이미지</span>
    			${dto.stuimage}
    		</div>
  	<div class="acainput">
    			<span class="txt">학생이름</span>
    			${dto.stuname}
    		</div>
  	
  	<div class="acainput">
    			<span class="txt">학생 생일</span>
    			${dto.stubirth}
    		</div>
    <div class="acainput">
    			<span class="txt">학원아이디</span>
    			${dto.stuid}
    		</div>
    <div class="acainput">
    			<span class="txt">성별</span>
    			${dto.stugender}
    		</div>
    <div class="acainput">
    			<span class="txt">학생이메일</span>
    			"${dto.stuemail}
    		</div>
    <div class="acainput">
    			<span class="txt">학생전화번호</span>
    			${dto.stutel}
    		</div>		
 
    
  	</div>
  	
  	
  	
  
<div id="btnedit">
  <input type = "button" value="뒤로 가기" onclick = "location.href='/academy/academy/mapcs?aseq=${dto.aseq}';">
 </div>  
  </div>
    	
    
  
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>

