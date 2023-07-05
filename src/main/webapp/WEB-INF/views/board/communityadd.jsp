<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	
	<!--커뮤니티 글작성-->


<main class="board">
<h1>글 작성하기</h1>
<hr>

<section>
<form action="/academy/board/communityaddok" method="POST" enctype="multipart/form-data">
	<div class="txt">제목</div>
	<div class="inp"><input type="text" name="subject" id="subject"> </div>	
		
	<div class="txt">본문</div>
	<div class="inp"><textarea name="content" id="content"></textarea> </div>	
	
	<div class="txt">첨부파일</div>
	<div class="filebox">
    	<input class="filename" value="첨부파일" placeholder="첨부파일" readonly>
    	<label for="attach">파일찾기</label> 
    	<input type="file" id="attach" name="attach">
	</div>
		
		
	
<div class="btns">
<button class="btn" type="button" onclick="history.back()"><i class="fa-solid fa-arrow-left"></i>돌아가기</button>
<button type="submit" class="btn"><i class="fa-solid fa-pen"></i>작성하기</button>
</div>
</form>
</section>
<script>$("#attach").on('change',function(){
	  var fileName = $("#attach").val();
	  $('.filename').val(fileName);
	});</script>
</main>