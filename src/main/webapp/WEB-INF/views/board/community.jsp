<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	table{
		width: 1200px;
		transfrom:translateX(100);
	}
	
	h1{
		margin-bottom: 50px;
	}
	table.tbl1 th{
		border-bottom: 3px solid #555;
		padding: 7px;
	}
	
	table.tbl1 th,table.tbl1 td {
		font-size:1.2rem;
	}
	table.tbl1 th:nth-child(1){width:90px; text-align:center}
	table.tbl1 th:nth-child(2){width:900px; }
	table.tbl1 th:nth-child(3){width:80px;text-align:center}
	table.tbl1 th:nth-child(4){width:auto;text-align:center}
	
	td:nth-child(1){text-align:center}
	td:nth-child(2){text-align:left}
	td:nth-child(3){text-align:center}
	td:nth-child(4){text-align:center}
	body {
	color: black;}
	
	.add {
		background-color:#14BDEE;
		width:100px;
		height: 40px;
		border: none;
		color: white;
		margin-bottom: 40px;
		outline:none;
		margin-right:200px;
	}
	.fa-pen {margin-right:5px;}
	hr{margin: 0px 0 30px 0;}
	.btns {padding-left: 20px;}
	.tbl1 tr:hover td {
		color:#14BDEE;
		cursor:pointer;
	}
	
	#pagebar{
		text-align:center;
		margin-top:20px;
	}
	
	.word{
		width: 500px;
		heigth:1.5rem;
		padding:10px;
		border:3px solid #14BDEE;
		border-radius: 20px;
		
	}
	form{display:inline;}
	.btn {
	background-color:transparent;
	transform:translateX(-60px);
	}
.sel_board{text-align:center;
trasform:translateY(-20px);
margin-bottom: 30px;
}
.sel:hover{color:cornflowerblue;}
.sel {
cursor:pointer;
font-size:1.2rem
}

.sel:first-child{border-right:1px solid #CCC;
padding-right:20px;
color:cornflowerblue;
text-decoration:underline;
}
.sel:last-child{
margin-left:20px;}


</style>
<main class="board">
<h1>커뮤니티  </h1>
<div class="sel_board"> <span class="sel" onclick="location.href='/academy/board/community';"> 커뮤니티 </span> <span class="sel" onclick="location.href='/academy/board/qboard';">문의게시판</span></div>

<div class="btns">
<button class="add" onclick="location.href='/academy/board/communityadd?seq=';"><i class="fa-solid fa-pen"></i>작성하기</button>
  <script></script>
  <form action="/academy/board/community" method="GET">
  <input type="text" name="word" id="word" class="word" value="${word}" placeholder="검색어를 입력해주세요."> <button type="submit" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
  </form>
</div>


	<table class="tbl1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>조회수</th>
			<th>날짜</th>
		</tr>
		<c:if test="${isSearch eq 'n'}">
		<c:forEach items="${clist}" var="dto">
		<tr onclick="location.href='/academy/board/communityview?cmseq=${dto.cmseq}';">
			<td>${dto.cmseq}</td>
			<c:if test="${dto.cocnt ==0}">
			<td>${dto.cmsubject}</td>
			</c:if>
			<c:if test="${dto.cocnt > 0}">
			<td>${dto.cmsubject}(${dto.cocnt})</td>
			</c:if>
			<td>${dto.cmviewcnt}</td>
			<td>${dto.time}</td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${isSearch eq 'y'}">
		<c:forEach items="${searchclist}" var="dto">
		<tr onclick="location.href='/academy/board/communityview?cmseq=${dto.cmseq}';">
			<td>${dto.cmseq}</td>
			<td>${dto.cmsubject}(${dto.cocnt})</td>
			<td>${dto.cmviewcnt}</td>
			<td>${dto.time}</td>
			
		</tr>
		</c:forEach>
		<script>
	
</script>
		</c:if>
	</table>
				<div id="pagebar">${pagebar}</div>
	
</main>

