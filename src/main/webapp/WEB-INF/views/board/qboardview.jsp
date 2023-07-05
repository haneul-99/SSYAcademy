<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#subject{
		font-size: 2rem;
		font-weight:bold;
		margin: 30px 0;
		margin-bottom: 50px;
	}
	#content{ 
		font-size: 1.3rem;
	}
	section {
		margin: 0 auto;
		position:relative;
	}
	.btns_modify{
		position:absolute;
		top:-10px;
		right:20px;
		display:none;
	}
	
	main.board{
	width: 1000px;}
	h1{
	margin-bottom: 30px;}
	
	legend { 
		font-size: 1rem; 
		margin-bottom:30px; 
		padding-left:20px;
		border-bottom:1px solid #999;
	}
	.fa-eye {
		margin:0 7px;
	}
	#writer div{
		margin: 3px 0;
	}
	#writer div:last-child{
		font-size:.8rem; color:#999;
	}
	#writer{
	margin-bottom:10px;}
	.img1{
		width: 2.5rem; 
		height:2.5rem; 
		float:left;
		transform:translateY(-2px); 
		border-radius:50%; 
		margin-right:7px;
	}
	
	.img2{
		width: 2.5rem; 
		height:2.5rem; 
		float:left;
		transform:translateY(1px); 
		border-radius:50%; 
		margin-right:10px;
	}
	
	.comment {
		width:700px;
		margin-top: 20px;
		height: 90px;
		margin-bottom:10px;
	
	}
	.commentcnt{
		color: #999;
	}
	.commentbox {
		width: 800px;
		padding: 20px;
		border: 1px solid #DDD;
		border-radius: 3px;
		margin: 20px auto;
		
	}
	
	 .btn {
		background-color:#14BDEE;
		width:100px;
		height: 40px;
		border: none;
		color: white;
		margin-bottom: 40px;
		outline:none;
		font-size: center;
	}
	.btns {text-align:right; padding-right:15px;}
	.img3 {
	transform:translateY(3px); 
	margin-bottom:5px;
	}
	.comment_row{
	border-top: 1px solid #DDD;
	padding: 10px 0;
	position:relative;
	}
	div.comment_list > .comment_row:first-child{
	border:none;
	}
	
	.del {
	position:absolute;
	right:10px;
	top:10px;
	font-size:.8rem;
	box-shadow: 1px 1px 0 1px #BBB;
	background-color: cornflowerblue;
	border:none;
	outline:none;
	color:white;
	}
	.list_modify{
	font-size: 1.5rem;
	position:absolute;
	right:30px;
	top:-50px;
	
	}
	
	.modify{border:none;}
	
	.fa-ellipsis:hover {color: cornflowerblue;}
	
	.aname{position:absolute;
	left:200px;
	top:0;
	color: #14BDEE;
	}
	
	.qacontent{
	font-size:1.3rem;
	}
</style>
	
	<!-- -->
	<main class="board">
	
	<fieldset>
		<legend>게시판/문의게시판</legend>
	</fieldset>
	
	<div id="writer">
	
	<div> <img src="/academy/resources/images/${qdto.stuimage}" class="img1"> ${qdto.stuname}(${qdto.stuid})</div>
	<div>${qdto.qregdate}  </div>
	<div class="aname">
	문의학원
	<div> ${qdto.aname}</div>
	</div>
	</div>
		<section>	
			
			
			<div id="subject">${qdto.qsubject}</div>
			<div id="content">${qdto.qcontent}</div>
			
			
			<c:if test="${qdto.stuseq == stuseq}">
			<span class="list_modify" onclick="$('.btns_modify').toggle();"><i class="fa-solid fa-ellipsis"></i></span>
			<div class="btns_modify">
				<button class="modify" onclick="location.href='/academy/board/qboardedit?qseq=${qdto.qseq}';">수정하기</button>
				<button class="modify" onclick="if(confirm('게시글을 삭제하시겠습니까?')){location.href='/academy/board/qboarddel?qseq=${qdto.qseq}';}">삭제하기</button>
			</div>
			</c:if>
			
			<hr>
			<form action="/academy/board/commucommentaddok" method="POST">
			
			<c:if test="${not empty acid and acinfo.acname == qdto.aname}">
			<div class="commentbox">
			<img src="/academy/resources/files/${stuinfo.stuimage}" class="img2"> 
			<textarea class="comment" name="cccontent"></textarea>
			<div class="btns"><button type="submit" class="btn">댓글쓰기</button>
			<input type="hidden" value="${qdto.qseq}" name="qseq">
			</div>
			</div>
			 </c:if>
			<c:if test="${aid == null}">
			<div class="commentbox">
			<div class="comment" style="font-size: 1.3rem;text-align:center;">  학생이 문의한 학원만 답변이 가능합니다.</div>
			</div>
			 </c:if>
			</form>
			
			<c:if test="${acinfo != null and acinfo.aseq == qdto.aseq}">
			<form action="/academy/board/qnacommentaddok" method="POST">
				<div id="writer">
				<div> <input type="hidden" name="qseq" value="${qdto.qseq}"> </div>
				</div>
					<div class="commentbox">
				<div> ${acinfo.aname}</div>
				
				<textarea class="comment" name="qacontent"></textarea>
				<div class="btns"><button type="submit" class="btn">댓글쓰기</button>
				</div>
				</div>
				</form>
			</c:if>
			
			<div class="comment_list">
			<c:forEach items="${qclist}" var="dto">
			<div class="comment_row">
				<div id="writer">
				<img src="/academy/resources/files/${dto.aimage}" class="img2">
				<div>  ${dto.aname}</div>
				<div>${dto.qaregdate} <input type="hidden" name="cmseq" value="${dto.qaseq}"> </div>
				</div>
				<div class="qacontent">${dto.qacontent}</div>
				<c:if test="${dto.aname == acinfo.aname}">
				<button class="del" onclick="if(confirm('댓글을 삭제하시겠습니까?')){location.href='/academy/board/qboardcommentdelok?qaseq=${dto.qaseq}'};">삭제</button>
				</c:if>
			</div>
			</c:forEach>
			</div>
			
		</section>
		</main>
	<script>
	
	
	</script>
</html>