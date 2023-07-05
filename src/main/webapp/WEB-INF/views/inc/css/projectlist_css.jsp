<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/academy/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/academy/resources/plugins/video-js/video-js.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/blog.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/blog_responsive.css">

<script src="/academy/resources/js/jquery-3.2.1.min.js"></script>
<script src="/academy/resources/styles/bootstrap4/popper.js"></script>
<script src="/academy/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/academy/resources/plugins/easing/easing.js"></script>
<script src="/academy/resources/plugins/masonry/masonry.js"></script>
<script src="/academy/resources/plugins/video-js/video.min.js"></script>
<script src="/academy/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/academy/resources/js/blog.js"></script>

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
</style>