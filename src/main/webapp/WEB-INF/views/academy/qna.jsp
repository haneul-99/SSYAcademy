<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<div class = "content_academy">
 
	<h2>질문 게시판</h2>
	
	<table class="type01">
		<tr>
			
			
			<th scope="row">질문 제목</th>
			<th scope="row">질문 내용</th>
			<th scope="row">등록 시간</th>
			<th scope="row">학생 이름</th>
			<th scope="row">답변남기기</th>
			
			
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
					
				<td>${dto.qsubject}</td>
				<td>${dto.qcontent}</td>
				<td>${dto.qregdate}</td>
				<td>${dto.stuname}</td>
				<td>
					<input type ="button" value="답변 남기기" onclick = "location.href='/academy/academy/qnadetail?aseq=${dto.aseq}';">
				</td>
				
			</tr>
		</c:forEach>
	</table>
	

 </div>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>