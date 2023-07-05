<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://kit.fontawesome.com/3af232f97f.js" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="/academy/resources/styles/navbars.css">

<style>

	#test {
		border: 1px solid black;
	}
	
	body {
		padding: 2rem 0 0 16rem;
	}
	
	.l-navbar {
		width: calc(var(--nav--width) + 9.25rem);
	} 

	table {
		border-bottom: 1px solid black;  
		border-collapse: collapse; 
		width: 800px;
		margin-left: 80px;
	}
	
	table tr {
		border: 1px solid black;
	}
	
	table th, table td {
		border-bottom: 1px solid black; 
		/* border: 1px solid black; */
	}
	
	table td:nth-child(1) { width: 70px; text-align: center; }
	table td:nth-child(2) { width: auto; }
	table td:nth-child(3) { width: 120px; text-align: center; }
	table td:nth-child(4) { width: 100px; text-align: center; }
	table td:nth-child(5) { width: 120px; text-align: center; }
	
	
	
	input {
		border: none;
	}
	
	#choice {
		width: 295px;
		float: right;
		margin: 10px;
	}
	
	select {
		width: 130px;
		height: 30px;
	}
	
	a {
		color: black;
	}

</style>
