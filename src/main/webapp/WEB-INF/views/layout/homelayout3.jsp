<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSY Academy</title>
<link rel="shortcut icon" href = "/academy/resources/files/favicon.ico">
<tiles:insertAttribute name="css"></tiles:insertAttribute>
</head>
<body>
	
<!-- 레이아웃.jsp -->
	<!-- 	<main> -->
		<tiles:insertAttribute name="header_academy"></tiles:insertAttribute>
		<tiles:insertAttribute name="aside"></tiles:insertAttribute>
		<main>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</main>
	
<!-- 	</main> -->
	
<!-- 	<script src="/academy/resources/js/jquery-3.2.1.min.js"></script>  -->
</body>
</html>