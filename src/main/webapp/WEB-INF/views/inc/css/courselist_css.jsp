<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/academy/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/academy/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/academy/resources/plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/courses.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/courses_responsive.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/blog.css">

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
    
    .main_nav li:nth-child(2) a {
 	   color: #14bdee;
 	   background-color:transparent;
	}
	
    .main_nav li:nth-child(2)::after {
    	display: block;
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 100%;
    height: 2px;
    background: #14bdee;
    content: '';
    }
	.header.scrolled {
    top: -40px !important;
}
</style>