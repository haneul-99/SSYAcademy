<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<div class = "content_academy">

	<h2>수강 신청 확인</h2>
	<div class = "first">

	<table>
		<tr>
			
			<th>신청자 이름</th>
			<th>과정 이름</th>
			
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td onclick="location.href='/academy/academy/mapcsdetail?stuseq=${dto.stuseq}';">${dto.stuname}</td>
				<td>${dto.cname}</td>
				
			</tr>
		</c:forEach>
	</table>
	</div>
</div>

 
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>