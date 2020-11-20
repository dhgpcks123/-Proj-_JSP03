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
	<div class="w3-col m7 w3-blue w3-hover-aqua w3-borer" 
			style="height: 100px; margin:0px; padding:0px;">
		<h1 style="height: 95%">Title</h1>
	</div>
	<form method="POST" action="">
		<div class="w3-col m3" style="height:50px">
			<input class="w3-right" style="margin-top: 10px" type="text">
			<h4 class="w3-right w3-margin-right" 
				style="display: inline-block"> id : </h4>
		</div>
		<h1 class="w3-pink m2 w3-right w3-button" 
			style="width: 100px; height:100px;" id="lbtn">Login</h1>
		<div class="w3-col m3" style="height:50px; text-align:left">
		<input class="w3-right" style="margin-top: 10px" type="password">
			<h4 class="w3-right w3-margin-right" 
					style="display: inline-block"> pw : </h4>
		</div>
	</form>
	<div class="w3-col m3 w3-orange" style="height:700px">
		<h1>Side패널<br>Modal<br>등등 Content</h1>
	</div>
	<div class="w3-col m9 w3-yellow" style="height:700px">
		<img class="w3-button" 
			src="/Team03Proj/img/Heart.png" style="width:50px; height:auto;"
				id="sos" name="sos">응급SOS
		<h1 class="w3-center">Map API</h1>
	</div>
</body>
</html>