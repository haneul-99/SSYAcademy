<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<div class = "content_academy">
	
		<h2>학원 페이지</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>pw</th>
			<th>주소</th>
			<th>이메일</th>
			
		</tr>
		<c:forEach items="${list}" var="dto">
	
			<tr>
				<td>${dto.aseq}</td>
				<td>${dto.aname}</td>
				<td>${dto.aid}</td>
				<td>${dto.apw}</td>
				<td>${dto.aaddr}</td>
				<td>${dto.aemail}</td>
				
				
			</tr>
		</c:forEach>
	</table>
	
</div>

 
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>