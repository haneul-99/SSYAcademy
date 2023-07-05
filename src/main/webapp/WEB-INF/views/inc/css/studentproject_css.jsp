<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <script src="${pageContext.request.contextPath}/reources/js/jquery-3.2.1.min.js"></script> --%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/3af232f97f.js" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="/academy/resources/styles/navbars.css">



<style> 

	body {
		padding: 2rem 0 0 16rem;
		margin-bottom: 100px;
	}
	
	.l-navbar {
		width: calc(var(--nav--width) + 9.25rem);
	} 
    
	#tbl, #tblapply, #tblmember {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		width: 900px;
		margin: 20px 0 20px 0;
	}
	
	#tbl td,  #tblapply td, #tblmember td {
		height: 80px;
	}

	/* 
	#tblmember {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		width: 300px;
		margin: 20px 0 20px 0;
	}
	
	#tblmember td {
		height: 80px;
	}
	 */
	
	
	#tbl td:nth-child(1) { width: 190px; }
	#tbl td:nth-child(2) { width: auto; }
	#tbl td:nth-child(3) { width: 50px; padding: 5px;}
	#tbl td:nth-child(4) { width: 100px; padding: 5px;}
	
	#tblapply td:nth-child(1) { width: 200px; }
	#tblapply td:nth-child(2) { width: auto; }
	#tblapply td:nth-child(3) { width: 80px; padding: 5px;}
	
	#tblmember td:nth-child(1) { width: 200px; }
	#tblmember td:nth-child(2) { width: auto;  }
	
	
	input[type=button], input[type=submit] {
		background-color: #1BAFE9;
		border: none;
		color: white;
		height: 25px;
		border-radius: 5px;
	}
	
	#tbl input[type=button] {
		width: 60px;
	}
	
	#tblmember input[type=button] {
		width: 120px;
	}
	
	#classmain {
		margin-left: 45px;
	}
	
	.txt {
		border: 1px solid black;
		width: 150px;
		border-radius: 5px;
		text-align: center;
		padding-top: 5px;
		height: 40px;
	}
	
	
 
</style>
