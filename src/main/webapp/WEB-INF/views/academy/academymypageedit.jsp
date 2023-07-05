<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <div class = "content_academy">
  	
  	<h2>학원 정보 수정 페이지</h2>
  	<div id = "first">
  	
  	
  <form method="POST" action="/academy/academy/academymypageeditok">
 
    <span class="txt">학원이름</span>
    <div class="acainput"><input type = "text" name  = "aname" id="aname" value = "${dto.aname }" ></div>
    <span class="txt">학원 전화번호</span>
    <div class="acainput"><input type = "text" name  = "atel" id="atel" value = "${dto.atel}" ></div>
    <span class="txt">학원 이미지</span>
    <div class="acainput"><input type = "text" name  = "aimage" id="aimage" value = "${dto.aimage}" ></div>
    <span class="txt">학원 이메일</span>
    <div class="acainput"><input type = "text" name  = "aemail" id="aemail" value = "${dto.aemail}" ></div>
 	<span class="txt">학원 정보</span>
    <div class="acainput"><textarea name  = "ainfo" id="ainfo">"${dto.ainfo}"</textarea></div>
 	<span class="txt">학원 주소</span>
    <div class="acainput"><input type = "text" name  = "aaddr" id="aaddr" value = "${dto.aaddr}" ></div>
	
	<div>
	<div id = "btnedit">
  <input type = "hidden" name = "aseq" id = "aseq" value = "${dto.aseq}">
  <button type = "submit" > 수정하기 </button>
  	</div>
  </div>
  </form>
  </div>
    	
    
  </div>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>

