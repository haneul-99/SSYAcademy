<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
	h2 {
		margin-top: 200px;
		margin-left: 300px;
	}
	
	
</style>

<h2>※ 코딩테스트 게시판</h2>
<hr>
<table id="codingtestlist">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>난이도</th>
		<th>정답률</th>
	</tr>
	
	<c:forEach items="${codingtestlist}" var="codedto">
	<tr>
		<td>${codedto.ctseq}</td>
		<td><a href="/academy/codingtest/codingtestview?ctseq=${codedto.ctseq}">${codedto.ctsubject}</a>
		<br>
			<a style="color:#999; font-size:10px;">${codedto.skname}</a>
		</td>
		<td>
			<c:choose>
				<c:when test="${codedto.ctlevel == 0}">
					<a style="color:gray;">${codedto.ctlevel}.Lv</a>
				</c:when>
				<c:when test="${codedto.ctlevel == 1}">
					<a style="color:yellowgreen;">${codedto.ctlevel}.Lv</a>
				</c:when>
				<c:when test="${codedto.ctlevel == 2}">
					<a style="color:cornflowerblue;">${codedto.ctlevel}.Lv</a>
				</c:when>
				<c:when test="${codedto.ctlevel == 3}">
					<a style="color:red;">${codedto.ctlevel}.Lv</a>
				</c:when>
			</c:choose>
		</td>
		<td><a style="color:black; border-width:2px;">${codedto.ansrate} %</a></td>
	</tr>
	</c:forEach>
</table>

