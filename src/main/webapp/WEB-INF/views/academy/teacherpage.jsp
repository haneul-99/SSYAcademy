<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<div class = "content_academy">
	
	<h2>학원 강사진 페이지</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>수정</th>
			
		</tr>
		<c:forEach items="${list}" var="dto">
	
			<tr>
				<td>${dto.tseq}</td>
				<td>${dto.tname}</td>
				
				<td>
				<form method = "POST" action ="/academy/academy/delok">
				<input type = "submit" value = "삭제하기">
				<input type = "hidden" name = "tseq" value = "${dto.tseq}">
				</form>
				</td>
				
			</tr>
		</c:forEach>
	</table>
	<div id="btnedit">
	
	<input type = "button" id = "add" value = "강사 추가하기" onclick = "location.href='/academy/academy/teacheradd?aseq=${acinfo.aseq}';">
	
	</div>
</div>

 
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>