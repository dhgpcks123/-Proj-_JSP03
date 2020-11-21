<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Team03Proj/css/w3.css">
<link rel="stylesheet" type="text/css" href="/Team03Proj/css/member/member.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/Team03Proj/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/Team03Proj/js/memberjoin.js"></script>

</head>
<body>
  <div class="w3-content w3-center w3-teal w3-container mw400700 radius1">

    <!-- STEP 1  -->
    <div class="w3-padding-64 w3-padding-large " id="step1">
      <h1>회원가입</h1>
      <p class="w3-opacity">STEP 1</p>

      <form class="w3-container w3-card w3-padding-32 w3-white w3-animate-left" action="" id="frm1">
		<div class="w3-col mb10 pb20">
				
			<span class="input_chk">
				<span class="chk_all">회원은 필수 입력사항에 대해</span><br>
				<span class="chk_all">허위 기재 시 회원가입을 취소할 수 있습니다.</span>
			</span>
	    </div>  	
	    
       	<!-- 아이디  -->
       	<div class="w3-col  pb20">
			<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="아이디" required name="id">
       	</div>
       	<!-- 비밀번호  -->
       	<div class="w3-col  pb20">
			<input class="w3-input w3-padding-16 w3-border" type="password" placeholder="비밀번호" required name="password">
       	</div>
       	<!-- 비밀번호 확인 -->
       	<div class="w3-col  pb20">
			<input class="w3-input w3-padding-16 w3-border" type="password" placeholder="비밀번호 확인" required name="password2">
       	</div>
       	<!-- 메일주소 -->
       	<div class="w3-col  mb10 pb20">
			<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="메일" required name="mail">
       	</div>
	
				
        <button  class="w3-button w3-yellow w3-left ">이전</button>
        <button  class="w3-button w3-yellow w3-right">다음</button>
      </form>
    </div>
    
    <!-- STEP 2  -->
    <div class="w3-padding-64 w3-padding-large w3-hide" id="step2">
      <h1>회원가입</h1>
      <p class="w3-opacity">STEP 2</p>

      <form class="w3-container w3-card w3-padding-32 w3-white w3-animate-left" action="" id="frm1">
		<div class="w3-col mb10 pb20">
				
			<span class="input_chk">
				<span class="chk_all">회원은 가입시 실명으로 가입해야 합니다.</span><br>
				<span class="chk_all">필수 입력사항에 대해</span><br>
				<span class="chk_all">허위 기재 시 회원가입을 취소할 수 있습니다.</span>
			</span>
	    </div>  	
	    
       	<!-- 이름  -->
       	<div class="w3-col  pb20">
			<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="이름" required name="name">
       	</div>
       	<!-- 생년월일  -->
       	<div class="w3-col  pb20">
			<input class="w3-third  w3-input w3-padding-16   w3-border" type="number" name="year" value="1988" min="1900", max="2020">
			<input class="w3-third  w3-input w3-padding-16     w3-border" type="number" name="mouth" value="1" min="1", max="12">
			<input class="w3-third  w3-input w3-padding-16   w3-border" type="number" name="day" value="1" min="1", max="31">
       	</div>
       	<!-- 전화번호 -->
       	<div class="w3-col  pb20">
			<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="전화번호" required name="tel">
       	</div>
       	<!-- 성별 -->
       	<div class="w3-col pb20">
			<select id="gen" class="w3-col m12 w3-padding-16 " >
				<option selected>성별</option>
				<option>남자</option>
				<option>여자</option>
				<option>선택 안함</option>
			</select>
       	</div>
	
				
        <button  class="w3-button w3-yellow w3-left ">이전</button>
        <button  class="w3-button w3-yellow w3-right">다음</button>
      </form>
    </div>
    
    <!-- STEP 3  -->
    <div class="w3-padding-64 w3-padding-large w3-hide" id="step3">
      <h1>회원가입</h1>
      <p class="w3-opacity">STEP 3</p>

      <form class="w3-container w3-card w3-padding-32 w3-white w3-animate-left" action="" id="frm1">
		<div class="w3-col mb10 pb20">
				
			<span class="input_chk">
				<span class="chk_all">응급알리미 서비스를 위한 항목입니다.</span><br>
				<span class="chk_all">입력사항에 대해 모르는 경우에는</span><br>
				<span class="chk_all">모름에 체크해주시기 바랍니다.</span>
			</span>
	    </div>  	
	    
       	<!-- 혈액형  -->
       	<div class="w3-col  pb20">
			<span class="w3-third w3-padding-16 w3-border" name="blood">혈액형</span>
	       	<div class="w3-third w3-padding-16 w3-border">
				<select id="ph"  >
					<option selected>모름</option>
					<option>RH+</option>
					<option>RH-</option>
				</select>
			</div>
	       	<div class="w3-third w3-padding-16 w3-border">
				<select id="abo"  >
					<option selected>모름</option>
					<option>A</option>
					<option>B</option>
					<option>AB</option>
					<option>O</option>
				</select>
	       	</div>
       	</div>
       	<!-- 긴급연락처 -->
       	<div class="w3-col  pb20">
			<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="긴급연락처"  name="stel">
       	</div>
       	<!-- 긴급연락처와의 관계  -->
       	<div class="w3-col  pb20">
			<input class="w3-input w3-padding-16 w3-border" type="text" placeholder="긴급연락처와의 관계"  name="stel_name">
       	</div>
       	<!-- 성별 -->
       	<div class="w3-col pb20">
			<input class="w3-input w3-padding-16 w3-border" type="textarea" placeholder="참고사항을 입력하세요." name="text" value="">
       	</div>
	
				
        <button  class="w3-button w3-yellow w3-left ">이전</button>
        <button  class="w3-button w3-yellow w3-right">다음</button>
      </form>
    </div>
  </div>
</body>
</html>