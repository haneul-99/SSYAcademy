<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<div class = "content_academy">
 
	<h2>진행중인 강의 목록</h2>
	
	<table class="type01">
		<tr>
			
			<th scope="row">강좌이름</th>
			<th scope="row">강좌 내용</th>
			<th scope="row">강좌 기간</th>
			<th scope="row">강좌 학생 수 </th>
			<th scope="row">강좌 등록 일</th>
			<th scope="row">카테고리</th>
			<th scope="row">강좌수정</th>
			
			
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.cname}</td>
				<td>${dto.cinfo}</td>
				<td>${dto.cperiod}</td>
				<td>${dto.stunum}</td>
				<td>${dto.cregdate}</td>
				<td>${dto.ccategory}</td>
				
				<td>
				<input type = "button" value=" 강좌 정보 수정" onclick = "location.href='/academy/academy/openclassedit?tseq=${dto.tseq}';">
				</td>
				
			</tr>
		</c:forEach>
	</table>
	<input type = "button" value="강좌 추가하기" onclick = "location.href='/academy/academy/openclassadd?aseq=${acinfo.aseq}';">

 </div>
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!— JS —>
<script src="/academy/resources/js/navbars.js"></script>