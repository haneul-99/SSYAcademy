<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/academy/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/academy/resources/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link href="/academy/resources/styles/ssy.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/courses.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/courses_responsive.css">


<style>
	
	
	.main_nav li a:hover, .main_nav li.active a {
 	   color: black;
 	   background-color:transparent;
	}
	
	.main_nav li.active::after {
    display: block;
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 100%;
    height: 2px;
    background: transparent;
    content: '';
    }
    
    .main_nav li:nth-child(4) a {
 	   color: #14bdee;
 	   background-color:transparent;
	}
	
    .main_nav li:nth-child(4)::after {
    	display: block;
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 100%;
    height: 2px;
    background: #14bdee;
    content: '';
    }
    
    .btn {
		background-color:#14BDEE;
		width:100px;
		height: 40px;
		border: none;
		color: white;
		margin-bottom: 40px;
		outline:none;
	}
		
 #subject { width: 800px; height: 40px; padding:5px; font-size:1.2rem}
 #content { width: 800px;height: 300px;}
 #attach {width: 500px;}
.btns{
margin-top: 30px;
padding-left:580px;
}
.btn{
	margin: 0 7px;
}



.txt {
	font-size: 1.8rem;
	margin-bottom: 20px;
}
.inp { margin-bottom:20px;
		padding-left:10px;
}
section { margin-top: 30px;}


.filebox .filename{
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 30%;
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
    
</style>
    
<script src="/academy/resources/js/jquery-3.2.1.min.js"></script>
<script src="/academy/resources/styles/bootstrap4/popper.js"></script>
<script src="/academy/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/academy/resources/plugins/easing/easing.js"></script>
<script src="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/academy/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/academy/resources/plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="/academy/resources/js/courses.js"></script>