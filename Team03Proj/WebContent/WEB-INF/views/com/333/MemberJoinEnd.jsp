<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/cls/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cls/css/cls333.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/cls/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/cls/js/333/memberjoin.js"></script>
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" data-search-pseudo-elements></script>
</head>
<body>
  <div class="w3-content w3-center w3-teal w3-container mw400700 radius1">

    <!-- 가입완료  -->
    <div class="w3-padding-64 w3-padding-large" id="step1">
      <h1>회원가입 완료</h1>
      <p class="w3-opacity">CONGRATULATIONS!</p> 

      <form class="w3-container w3-card w3-padding-32 w3-white w3-animate-left" action="" id="frm1">
		<div class="w3-col mb10 pb20">
			<h1 class="mt50">환영합니다!</h1>
			<i class="far fa-check-circle" style="width: 70px; height: 70px; "></i>
			<span class="input_chk mt50">
				<span class="chk_all">회원은 필수 입력사항에 대해</span><br>
				<span class="chk_all">허위 기재 시 회원가입을 취소할 수 있습니다.</span>
			</span>
	    </div>  	
				
        <button  class="w3-button w3-blue">시작하기</button>
      </form>
    </div>
</body>
</html>