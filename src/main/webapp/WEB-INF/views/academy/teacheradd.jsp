<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <div class = "content_academy">
  	
  	<h2>강사 추가 페이지</h2>
  	<div id = "first">
  	
  	
  <form method="POST" action="/academy/academy/teacheraddok">

    <span class="txt">강사 이름</span>
    <div class="acainput"><input type = "text" name  = "tname" id= "tname" ></div>
   
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

