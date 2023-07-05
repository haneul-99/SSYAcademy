<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	table {
		margin: 100px;
		margin-bottom: 50px;
	}
	
	h2 {
		margin-top: 200px;
		margin-left: 100px;
		
	}
	
	#btn {
		margin-bottom:200px;
		text-align: center;
		margin-left: 100px;
		color: black;
		font-size: 15px;
		border-radius: 10px;
	}
	
</style>

<h2>※ 코딩테스트 문제</h2>
<hr>

<table>

	<tr>
		<th>
			<a style="font-size:20px; color: black; font-weight: 2px"><i class="fa-duotone fa-q"></i>. ${codedto.ctsubject}</a>
			<br>
			<hr>
			<br>
			<br>
		</th>
	</tr>	
	<tr>
		<td>
			<img src="/academy/resources/images/${codedto.ctsubject}.png">	
		</td>
	</tr>
	
</table>

	<div>
		<Button type="button" id="btn" onclick="history.back();"><i class="fa-solid fa-rotate-left"></i> 돌아가기</Button>
	</div>


