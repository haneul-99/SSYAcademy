<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://kit.fontawesome.com/3af232f97f.js" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="/academy/resources/styles/navbars.css">
<!-- <script src="https://code.jquery.com/jquery-3.6.1.js"></script> -->

<style>

	 #first {
    	margin-left: 135px; 
    }
    
    .stuinput {
    border-bottom: 1px solid black;
    width: 600px;
    }
    
    .txt {
    	/* border: 1px solid black; */
    	width: 100px;
    	display: inline-block;
    	margin-right: 90px;
    	margin-top: 30px;
    	margin-bottom: 10px;
    }
	
	body {
		padding: 2rem 0 0 16rem;
		margin-bottom: 100px;
	}
	
	.l-navbar {
		width: calc(var(--nav--width) + 9.25rem);
	} 

	table {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	table tr {
		border: 1px solid black;
	}
	
	table th, table td {
		border: 1px solid black;
	}
	
	#btnedit {
		width: 425px;
		margin: 10px;
		float: right;
	}
	
	input[type=text] {
		width: 200px;
	}
	
	input[type=button], button[type=submit] {
		background-color: #1BAFE9;
		border: none;
		color: white;
		height: 30px;
		border-radius: 5px;
	}

</style>

<!-- <script>
	$("#btn_delete").click(function(){
   if(confirm("정말 삭제 하시겠습니까 ?") == true){
       alert("삭제 되었습니다");
   }
   else {
     return false ;
   }
	});
</script> -->
