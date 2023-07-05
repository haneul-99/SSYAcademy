<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/academy/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/academy/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/academy/resources/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/blog_single.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/blog_single_responsive.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/course.css">

<script src="/academy/resources/js/jquery-3.2.1.min.js"></script>
<script src="/academy/resources/styles/bootstrap4/popper.js"></script>
<script src="/academy/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/academy/resources/plugins/easing/easing.js"></script>
<script src="/academy/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/academy/resources/plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="/academy/resources/js/blog_single.js"></script>

<style>

.reply_edit-btn {
	
	color: white;
	background-color: #14bdee;
	border-radius: 3px;
	border: none;
}
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
    
    .main_nav li:nth-child(3) a {
 	   color: #14bdee;
 	   background-color:transparent;
	}
	
    .main_nav li:nth-child(3)::after {
    	display: block;
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 100%;
    height: 2px;
    background: #14bdee;
    content: '';
    }
    
    .apply_btn {
	width: 320px;
    height: 100px;
    border-radius: 3px;
    background: #14bdee;	
    cursor: pointer;
    margin-bottom: 50px;
    
}

.apply_btn button {
	width: 100%;
	 cursor: pointer;
	display: block;
	outline: none;
	background: #14bdee;
    border: none;
    border-radius: 3px;
    line-height: 100px;
    font-size: 26px;
    color: #FFFFFF !important;
    text-transform: uppercase;
    font-weight: 500;
    text-align: center
}

.apply_btn a {
	display: block;
    line-height: 100px;
    font-size: 26px;
    color: #FFFFFF !important;
    text-transform: uppercase;
    font-weight: 500;
    text-align: center
}

</style>