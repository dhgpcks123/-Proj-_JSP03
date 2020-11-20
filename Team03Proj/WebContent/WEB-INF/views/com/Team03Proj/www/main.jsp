<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Team03Proj/css/w3.css">
<link rel="stylesheet" type="text/css" href="/Team03Proj/css/cls.css">
<script type="text/javascript" src="/Team03Proj/js/query-3.5.1.min.js"></script>
<script type="text/javascript" src="/Team03Proj/js/main.js"></script>
</head>

<body>
	<div class="w3-col m6 s6 w3-sand" 
			style="height: 80px;">
		<input class="w3-middle" type="text" id="place" name="place" 
				style="width: 99%; margin-top:45px" placeholder="장소를 검색해보세요">
	</div>
	
	<form method="POST" action="" id="login">
		<div class="w3-col m6 s6 w3-green w3-right " style="height: 80px">
			<div class="w3-col m6 s6" style="height: 80px">
				<div class="w3-col m12 s12 " style="height: 30px">
					<input style="margin-top: 5px; width:100%" type="text"
							id="id" placeholder="아이디">
				</div>
				<div class="w3-col m12 s12 w3-margin-top " style="height: 30px;">
					<input style="width:100%;"type="password"
							id="pw" placeholder="패스워드">
				</div>
			</div>
					
			<div class="w3-col m6 s6 w3-sand w3-hide w3-margin-left" style="height: 80px;">
				<!-- 로그인 후 회원 아이디와 등급정도의 간단한 정보띄움 -->
				<div style="height: 60px">
					<h3 class="w3-col m12 s12">ㅇㅇㅇ회원님 접속. 등급: ㅇ 등급</h3>
				</div>
			</div>
			<div class="w3-col m5 s5 w3-right " style="margin-top:10px">
				<h6 class="w3-col m5 s5 w3-blue w3-hover-aqua w3-button w3-small w3-margin-right" id="lbtn">로그인</h6>
				<h6 class="w3-col m6 s6 w3-orange w3-hover-yellow w3-button w3-small" id="jbtn">회원가입</h6>
			</div>
		</div>
	</form>
			
	<div class="w3-col m3 s3 w3-orange" style="height:700px">
		<h1>Side패널<br>Modal<br>등등 Content</h1>
	</div>
	<div class="w3-col m9 s9 w3-yellow" style="height:700px">
		<img class="w3-button" 
			src="/Team03Proj/img/Heart.png" style="width:50px; height:auto;"
				id="sos" name="sos">응급SOS
		<h1 class="w3-center">Map API</h1>
	</div>
</body>
</html>