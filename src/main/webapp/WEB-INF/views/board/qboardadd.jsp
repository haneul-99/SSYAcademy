<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	
	<!--문의게시판 글작성-->
	<style>
	#academy{width:800px;height:40px; border-radius:5px;}
	#class{width:800px; height:40px; border-radius:5px;}
</style>
<main class="board">
<h1>글 작성하기</h1>
<hr>

<section>
<form action="/academy/board/qboardaddok" method="POST">
	<div class="txt">학원</div>
	<div class="inp"> <select name="qacademy" id="academy">
	<option value="all">전체</option>
	</select>  </div>	
	<div class="txt">과정</div>
	<div class="inp"><select name="qclass" id="class">
	<option value="all">전체</option>
	</select> </div>	
	<div class="txt">제목</div>
	<div class="inp"><input type="text" name="qsubject" id="subject"> </div>	
		
	<div class="txt">본문</div>
	<div class="inp"><textarea name="qcontent" id="content"></textarea> </div>	
	
	
		
		
	
<div class="btns">
<button class="btn" type="button" onclick="history.back()"><i class="fa-solid fa-arrow-left"></i>돌아가기</button>
<button type="submit" class="btn"><i class="fa-solid fa-pen"></i>작성하기</button>
</div>
</form>
</section>
<script>



$("#attach").on('change',function(){
	  var fileName = $("#attach").val();
	  $('.filename').val(fileName);
	});
	
	
	$('#academy').append(`
			<c:forEach items="${alist}" var="dto" varStatus="status">
			<option value="${status.count}">${dto}</option>
			</c:forEach>
			`)
	
	$('#academy').change(function(){
	$.ajax({
		url:'/academy/board/getclassok',
		method:'GET',
		data: "academy="+$('#academy').val(),
		dataType: 'JSON',
		
	    success: function(result){
	    	$('#class').html('<option value="all">전체</option>')
	    	$.each(result, function (i, item) {
	    		$('#class').append(`<option value="\${item}">` +item+ `</option>`)
	    	});
	    	
	    },
	    error: function(a,b,c) {
	    	console.log(a,b,c);
	    }
	});
	
	});
	
	
	
	
	</script>
</main>



