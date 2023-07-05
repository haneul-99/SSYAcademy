<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	
	<!--커뮤니티 글작성-->

<style>
#content{font-size: 1.3rem; padding:10px;}
#academy{width:800px;height:40px; border-radius:5px;}
	#class{width:800px; height:40px; border-radius:5px;}
</style>
<main class="board">
<h1>글 수정하기</h1>
<hr>

<section>
<form action="/academy/board/qboardeditok" method="POST">
	
	

	<div class="txt">학원</div>
	<div class="inp"> ${qdto.aname} </div>
	<div class="txt">제목</div>
	<div class="inp"><input type="text" name="qsubject" id="subject" value="${qdto.qsubject}"> </div>	
		
	<div class="txt">본문</div>
	<div class="inp"><textarea name="qcontent" id="content">${qdto.qcontent}</textarea> </div>	
		
	
<div class="btns">
<input type="hidden" name="qseq" value="${qdto.qseq}">
<button class="btn" type="button" onclick="history.back()"><i class="fa-solid fa-arrow-left"></i>돌아가기</button>
<button type="submit" class="btn"><i class="fa-solid fa-pen"></i>작성하기</button>
</div>
</form>
</section>
<script>
$('#academy').append(`
		<c:forEach items="${alist}" var="dto" varStatus="status">
		<option value="${status.count}">${dto}</option>
		</c:forEach>
		`)
</script>
</main>