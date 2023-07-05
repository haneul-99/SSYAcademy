<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="https://kit.fontawesome.com/3af232f97f.js" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="/academy/resources/styles/navbars.css">



<style> 

	#sturesume {
		border-top: 3px solid black; 
		width: 820px;
	}

	img {
		width: 150px;
		height: 150px;
		margin-left: 60px; 
		margin-top: 10px;
		position: relative;
		left: 0;
		top: 26px;
	}
	
    #first {
    	margin-left: 135px; 
    }
    
    .stuinput {
    border-bottom: 1px solid black;
    width: 600px;
    }
    
    .txt {
    	/* border: 1px solid black; */
    	width: 80px;
    	display: inline-block;
    	margin-right: 50px;
    	/* margin-top: 30px;
    	margin-bottom: 10px; */
    }
    
    #txtresume {
    margin-left: 100px;
    }

	body {
		padding: 2rem 0 0 16rem;
		margin-bottom: 100px;
	}
	
	.l-navbar {
		width: calc(var(--nav--width) + 9.25rem);
	} 
	

	#tbl {
		/* border: 1px solid black; */
		border-collapse: collapse;
		width: 500px;
		position: absolute;
		left: 628px;
		top: 85px;
	}
	
	#tbl tr {
		/* border: 1px solid black; */
	}
	
	#tbl th, #tbl td {
		/* border: 1px solid black; */
		border-bottom: 1px solid black;
	}
	
	#btnedit {
		width: 363px;
		margin: 10px;
		float: right;
	}
	
	input:focus {
		outline: none;
	}
	
	#stuedu {
		/* border-top: 3px solid black; 
		width: 720px; */
		position: absolute;
		left: 413px;
		top: 300px;
	}
	
	#tbledu {
		border: 1px solid black;
		border-collapse: collapse;
		width: 720px;
	}

	#tbledu th, #tbledu td {
		border: 1px solid black; 
		/* border-bottom: 1px solid black; */
	}
	
	#tbledu th {
		background-color: #EEE;
	}
	
	#tbledu td {
		 padding-left: 48px;
	}
	
	#tbledu td:nth-child(1) { width: 240px; }
	#tbledu td:nth-child(2) { width: auto; }
	#tbledu td:nth-child(2) { width: 240px; }
	
	#intro {
		width: 720px; 
		position: absolute;
		left: 413px;
		top: 380px;
	}
	 
	#introbox {
		margin-bottom: 10px;
	}
	
	#introduce {
		margin-top: 20px;
	}
	
	textarea {
	    width: 720px;
	    height: 15rem;
	    border: 1px solid black;
	    resize: none;
	    outline: none;
    }
    
    input[type=button], input[type=submit] {
		background-color: #1BAFE9;
		border: none;
		color: white;
		height: 35px;
		border-radius: 5px;
		margin-right:10px;
	}
	
	#resumebtn {
		position: absolute;
		left: 673px;
		top: 700px;
		padding-bottom: 20px;
	}
	
	#stuimg {
		border: 1px solid black;
		width: 160px;
		height: 160px;
		margin-left: 63px;
		margin-top: 33px;
		text-align: center;
	}
 
</style>
