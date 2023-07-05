<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/academy/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/academy/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/plugins/OwlCarousel2-2.2.1/animate.css">

<link rel="stylesheet" type="text/css" href="/academy/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/academy/resources/styles/responsive.css">


<script src="/academy/resources/js/jquery-3.2.1.min.js"></script>
<script src="/academy/resources/styles/bootstrap4/popper.js"></script>
<script src="/academy/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/academy/resources/plugins/easing/easing.js"></script>
<script src="/academy/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/academy/resources/plugins/parallax-js-master/parallax.min.js"></script>

<script src="/academy/resources/plugins/greensock/TweenMax.min.js"></script>
<script src="/academy/resources/plugins/greensock/TimelineMax.min.js"></script>
<script src="/academy/resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="/academy/resources/plugins/greensock/animation.gsap.min.js"></script>
<script src="/academy/resources/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="/academy/resources/js/custom.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
}
#logo {
    width: 240px;
    height: 44px;
    cursor: pointer;
}

#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
}
#wrapper {
	margin-top:150px;
    position: relative;
    height: 240%;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}




/* 입력폼 */


h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}


.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

.box.int_id {
    padding-right: 110px;
}

.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}

.step_url {
    /*@naver.com*/
    position: absolute;
    top: 16px;
    right: 13px;
    font-size: 15px;
    color: #8e8e8e;
}

.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}

#bir_wrap {
    display: table;
    width: 100%;
}

#bir_yy {
    display: table-cell;
    width: 147px;
    
}

#bir_mm {
    display: table-cell;
    width: 147px;
    vertical-align: middle;
}

#bir_dd {
    display: table-cell;
    width: 147px;
}

#bir_mm, #bir_dd {
    padding-left: 10px;
}

select {
    width: 100%;
    height: 29px;
    font-size: 15px;
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
    background-size: 20px 8px;
    -webkit-appearance: none;
    display: inline-block;
    text-align: start;
    border: none;
    cursor: default;
}

/* 에러메세지 */

.error_next_box {
    margin-top: 9px;
    font-size: 12px;
    color: red;    
    display: none;
}

#alertTxt {
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    display: none;
}

/* 버튼 */

.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #fff;
    background-color: #14BDEE;
    font-size: 20px;
    font-weight: 400;
}

#emailbtn {
    width: 100px;
    height: 40px;
    display: inline-block;
    position: absolute;
    top: 30%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}
#email{
	width:80%;
}
.box.int_info {
    display: block;
    position: relative;
    width: 100%;
    height: 400px;
    border: none;
    background: #fff;
    font-size: 15px;
}

#ainfo{
	width:98%;
	height:375px;
	resize:none;
	border: 1px solid black;
    border-radius: 4px;
}

</style>
    