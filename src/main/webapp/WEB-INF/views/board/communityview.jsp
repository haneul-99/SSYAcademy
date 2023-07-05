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
		transform:translateY(20px); 
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
	.stuinfo{
	font-size:1.2rem;}
	
	.cmattach{width:300px;height:300px;}
	.modify{border:none;}
	
	.fa-ellipsis:hover {color: cornflowerblue;}
	.ccontent{font-size:1.4rem;
	margin:10px 0;}
	.sturegdate{font-size:1rem;}
</style>
	
	<!-- -->
	<main class="board">
	
	<fieldset>
		<legend>게시판/커뮤니티</legend>
	</fieldset>
	
	<div id="writer">
	<form action="/academy/board/communityedit?" method="POST"></form>
	<div> <img src="/academy/resources/images/${cdto.stuimage}" class="img1"> ${cdto.stuname}(${cdto.stuid})</div>
	<div>${cdto.cmregdate} <span><i class="fa-solid fa-eye"></i>${cdto.cmviewcnt}</span> </div>
	</div>
		<section>	
			<div id="subject">${cdto.cmsubject}</div>
			<div id="content">${cdto.cmcontent}</div>
			<c:if test="${cdto.cmattach != null}">
			<div id="attach"> <img alt="" src="/academy/resources/files/${cdto.cmattach}" class="cmattach"></div>
			</c:if>
			
			<c:if test="${cdto.stuseq == stuseq}">
			<span class="list_modify" onclick="$('.btns_modify').toggle();"><i class="fa-solid fa-ellipsis"></i></span>
			<div class="btns_modify">
				<button class="modify" onclick="location.href='/academy/board/communityedit?cmseq=${cdto.cmseq}';">수정하기</button>
				<button class="modify" onclick="if(confirm('게시글을 삭제하시겠습니까?')){location.href='/academy/board/communitydel?cmseq=${cdto.cmseq}';}">삭제하기</button>
			</div>
			</c:if>
			
			<hr>
			
			<!-- 댓글부분 -->
			<form action="/academy/board/commucommentaddok" method="POST">
			<div>
			<span class="commentcnt">${cocnt}개의 댓글</span>
			</div>
			
			<c:if test="${not empty stuid}">
			<div class="commentbox">
			<img src="/academy/resources/files/${stuinfo.stuimage}" class="img2"> 
			<textarea class="comment" name="cccontent"></textarea>
			<div class="btns"><button type="submit" class="btn">댓글쓰기</button>
			<input type="hidden" value="${cdto.cmseq}" name="cmseq">
			</div>
			</div>
			 </c:if>
			<c:if test="${empty stuid}">
			<div class="commentbox">
			<div class="comment" style="font-size: 1.3rem;"> 댓글을 쓰시려면  <a href="/academy/account/login" style="color:cornflowerblue; text-decoration:underline;">회원 로그인</a>이 필요합니다.</div>
			<div class="btns"><button type="submit" class="btn" disabled>댓글쓰기</button>
			<input type="hidden" value="${cdto.cmseq}" name="cmseq">
			</div>
			</div>
			 </c:if>
			</form>
			
			<div class="comment_list">
			<c:forEach items="${cclist}" var="dto">
			<div class="comment_row">
				<div id="writer">
	
				<div class="stuinfo"> <img src="/academy/resources/files/${dto.stuimage}" class="img1 img3"> ${dto.stuname}(${dto.stuid})</div>
				<div class="sturegdate">${dto.ccregdate} <input type="hidden" name="cmseq" value="${dto.cmseq}"> </div>
				</div>
				<div class="ccontent">${dto.cccontent}</div>
				<c:if test="${dto.stuseq == stuseq}">
				<button class="del" onclick="if(confirm('댓글을 삭제하시겠습니까?')){location.href='/academy/board/commucommentdelok?ccseq=${dto.ccseq}&cmseq=${dto.cmseq}'};">삭제</button>
				</c:if>
			</div>
			</c:forEach>
			</div>
			
		</section>
		</main>
	<script>
	
	
	</script>
</html>