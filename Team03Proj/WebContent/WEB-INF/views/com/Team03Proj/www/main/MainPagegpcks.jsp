<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" type="text/css" href="/Team03Proj/css/cls.css">
<link rel="stylesheet" type="text/css" href="/Team03Proj/css/w3.css">
<link rel="stylesheet" type="text/css"
	href="/Team03Proj/css/detailBoard/detailBoard.css">
<link rel="stylesheet" type="text/css"
	href="/Team03Proj/css/main/mainPage.css">
<script src="https://kit.fontawesome.com/e6e9b86680.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="/Team03Proj/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/Team03Proj/js/detailBoard.js"></script>
<script type="text/javascript" src="/Team03Proj/js/mainPage.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79522878be27fd519cad54cd57b6d0ba&libraries=services"></script>
<!-- 키워드 장소 검색하고 목록으로 표출 -->
<style>
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<!-- 클릭시 주소 확인 -->
<style>
    .map_wrap2 {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>

<body>

	<!-- Side Navigation -->
	<nav
		class="w3-sidebar w3-collapse w3-animate-left w3-card"
		style="z-index: 3; width: 400px;" id="mySidebar">
		<div style="text-align: right;">
		<a href="javascript:void(0)"
			class="w3-bar-item w3-button w3-button"
			style="font-size: 10pt;"
			onclick="document.getElementById('id01').style.display='block'">
			<span>
				<Strong>> 자세히 보기 </Strong><i class="fas fa-info-circle"></i>
			</span>
		</a>
		</div>


		<section style="margin-left: 4px;">

			<div>
				<div style="background-color: #FFCD36">
					<h2 class="w3-center" style="margin-top: 0px; margin-bottom: 30px;">
						<i class="fas fa-store-alt"></i><strong> ${STORE.get(0).aname}</strong>
					</h2>
				</div>

				<!--  slide img -->
				<ul class="slides">
				<c:forEach var="data" items="${STORE}" varStatus="status">
					<input type="radio" name="radio-btn" id="img-${5-status.count}" checked />
					<li class="slide-container">
						<div class="slide">
						
							<img src="/Team03Proj${data.adir}/${data.aponame}" />
						</div>
						<div class="nav">
							<label for="img-${5-status.count-1}" class="prev">&#x2039;</label>
							<label for="img-${5-status.count+1 }" class="next">&#x203a;</label>
						</div>
					</li>
				</c:forEach>
				</ul>
				<!--  slide img -->
				<div
					style="font-size: 9pt; margin-top: 10px; padding-left: 15px; margin-top: 15px;">
					<!-- <i class="fas fa-at"></i> --> <b>현재 위치</b> 
					<div
						id="text" style="font-size: 9pt; ">
					</div>
				</div>
				
				<div
					style="font-size: 9pt; margin-top: 10px; padding-left: 15px; margin-top: 15px;">
					<!-- <i class="fas fa-at"></i> --> <b>장소 위치</b><br /> ${STORE.get(0).aloc}
				</div><br /> 
				<div style="font-size: 9pt; padding-left: 15px;">
					<i class="fas fa-phone-volume"></i> ${STORE.get(0).atel}
				</div>
				<div
					style="border-top: 1px dashed gray; border-bottom: 1px dashed gray; padding: 15px 30px; margin: 30px 5px 15px 5px;">
					<div>
						<i class="fas fa-info-circle"></i> ${STORE.get(0).abody}
					</div>

				</div>
			</div>

			<div style="padding: 15px; margin-top: 20px;">

				<div style="text-align: center; margin-bottom: 9px; background-color: #DEDEDE;">이 가게의 가장
					최근리뷰</div>
				<div style="margin-bottom: 10px;">
					<div style="display: block; font-size:14pt">${REVIEW.get(0).rtitle}</div>
					<div style="display: block; font-size: 7pt;">${REVIEW.get(0).rdate}</div>
					<div style="margin-bottom: 5px; display:block; text-align:right; font-size:16pt;">
							<c:if test="${REVIEW.get(0).rgrade==5}">
								★★★★★
							</c:if>
							<c:if test="${REVIEW.get(0).rgrade==4}">
								★★★★☆
							</c:if>
							<c:if test="${REVIEW.get(0).rgrade==3}">
								★★★☆☆
							</c:if>
							<c:if test="${REVIEW.get(0).rgrade==2}">
								★★☆☆☆
							</c:if>
							<c:if test="${REVIEW.get(0).rgrade==1}">
								★☆☆☆☆
							</c:if>
							 [${REVIEW.get(0).rgrade}/5]
					</div>
				</div>
				
				<div style="margin-bottom: 30px;">
					<center>
					<c:forEach var="data" items="${REVIEW.get(0).rphotovoList}">
						<c:if test="${REVIEW.get(0).rno == data.rno}">
							<img class="reviewIMG" src="/Team03Proj/${data.rdir}${data.rponame}"></img>
						</c:if>
					</c:forEach>
					</center>
				</div>
				<div style="padding: 3px; margin-top: 5px;">${REVIEW.get(0).rbody}</div>
				<div class="w3-right">
					<a href="javascript:void(0)" class="w3-bar-item"
						style="font-size: 10pt; margin-bottom: 30px;"
						onclick="document.getElementById('id01').style.display='block'">
						<Strong>> 후기 더보기.. </Strong>
					</a>
				</div>
			</div>
		</section>
	</nav>




	<!-- Modal that pops up when you click on "New Message" -->
	<!-- 모달창이 들어갈겁니다 -->

	<a id="myBtn" onclick="myFunc('Demo1')" href="javascript:void(0)"
		class="w3-bar-item w3-button"> </a>
	<!-- Modal that pops up -->
	<div id="id01" class="w3-modal w3-border"
		style="z-index: 3; padding-top: 4%;">
		<!-- x아이콘 -->
		<div class="w3-panel"
			style="position: fixed; z-index: 999; top: 1%; right: 6%">
			<div class="w3-section w3-right">
				<a class="w3-button w3-red" id="xbutton"><i class="fa fa-remove"></i>
				</a>
			</div>
		</div>
		<!-- 모달창 내부 -->
		<div class="w3-modal-content w3-animate-zoom" id="cModal"
			style="width: 87%; height: 90%; overflow: auto;">


			<div>
				<!-- 가게이름 및 주소 -->
				<div>
					<div style="margin-left: 80px; margin-top: 18px;">
						<div
							style="font-size: 40pt; color: red; display: inline-block; margin-right: 10px;">
							<i class="fas fa-store-alt"></i>
						</div>
						<div style="font-size: 35pt; display: inline-block;">
							<Strong> ${STORE.get(0).aname} </Strong>
						</div>
					</div>
					<div style="margin-left: 80px;">
						<div style="color: red; display: inline-block;">
							<i class="fas fa-map-marker-alt"></i> 
						</div>
						<div style="color: gray; display: inline-block;">${STORE.get(0).aloc}</div>
						<div style="color: gray; font-size: 8pt; margin-left: 15px;">
							전화번호 : <span>${STORE.get(0).atel}</span>
						</div>
					</div>
					<div>
						<div
							style="padding: 0px; margin: 30px; border-top: 1px solid #ECEAEB; border-bottom: 1px solid #ECEAEB;">
							<div style="display: flex; justify-content: space-evenly;">
								<div class="w3-button" style="font-size: 15pt;">
									<i class="fas fa-map-marked-alt"></i> 경로 찾기
								</div>
								<div class="w3-button" style="font-size: 15pt;">
									<i class="fas fa-pencil-alt"></i><a href="#wReviewfrm"> 리뷰
										쓰기</a>
								</div>
								<div class="w3-button" style="font-size: 15pt;">
									<i class="fas fa-bookmark"></i> 찜 하기
								</div>
							</div>
						</div>

						<div id="wrapper">
							<div class="w3-round-xxlarge" id="slider-wrap">
								<ul id="slider">
								<c:forEach var="data" items="${STORE}">
									<li>
										<a href="/Team03Proj${data.adir}/${data.aponame}">
										<img class="StoreIMG w3-padding-right"
										src="/Team03Proj${data.adir}/${data.aponame}" >
									</a>
									</li>
								</c:forEach>	
								</ul>

								<!--controls-->
								<div class="btns" id="next">
									<i class="fa fa-arrow-right"></i>
								</div>
								<div class="btns" id="previous">
									<i class="fa fa-arrow-left"></i>
								</div>
								<div id="counter"></div>

								<div id="pagination-wrap">
									<ul>
										<li></li>
									</ul>
								</div>
								<!--controls-->

							</div>
						</div>

						<!-- 하단페이지 구현 -->
						<section
							style="display: flex; flex-direction: column; border-top: 1px solid #ECEAEB; margin-left: 60px; margin-right: 40px;">
							<!-- 1 -->
						<c:forEach var="data" items="${REVIEW}">
							<div
								style="background-color: #F6F6F6; margin-top: 10px; display: flex; justify-content: space-between; border-bottom: 1px solid #ECEAEB; padding: 0px 20px;">
								<h3 style="cursor: pointer; margin-top: 15px;">${data.rtitle}</h3>
								<h3
									style="color: yellow; margin-left: 3%; text-shadow: 2px 2px 2px gray;">
								<c:if test="${data.rgrade==5}">
									★★★★★
								</c:if>
								<c:if test="${data.rgrade==4}">
									★★★★☆
								</c:if>
								<c:if test="${data.rgrade==3}">
									★★★☆☆
								</c:if>
								<c:if test="${data.rgrade==2}">
									★★☆☆☆
								</c:if>
								<c:if test="${data.rgrade==1}">
									★☆☆☆☆
								</c:if>
								</h3>
		
							</div>
							<div
								style="display: flex; border-bottom: 1px solid #ECEAEB; padding-right: 20px;">
								<div style="margin-left: 45px;">작성자 :</div>
								<div>${data.id}</div>
								<div style="margin-left: 45px;">작성일 :</div>
								<div>${data.rdate }</div>
							</div>
		
							<div style="border-bottom: 1px solid #ECEAEB;">
								<div
									style="margin-top: 20px; padding-right: 33px; display: inline-block;">
									${data.rbody}
									</div>
									
									<div style="display: flex; flex-wrap: wrap; justify-content: flex-start; margin-bottom: 20px;">
								<c:forEach var="data1" items="${REVIEW.get(0).rphotovoList}">
									<c:if test="${data.rno == data1.rno}">
										<img class="reviewIMG" src="/Team03Proj/${data1.rdir}${data1.rponame}"></img>
									</c:if>
								</c:forEach>
									</div>
							</div>
						</c:forEach>
						
						</section>


						<footer
							style="display: flex; flex-direction: column; margin-top: 50px; margin-left: 60px; margin-right: 40px;">
							<form method="POST" encType="multipart" action="#"
								id="wReviewfrm" name="wReviewfrm">

								<!-- 별 -->
								<div class="starRev w3-right"
									style="display: inline-block; margin-left: 15px;">
									<p id="star_grade">
										<a href="#">★</a> <a href="#">★</a> <a href="#">★</a> <a
											href="#">★</a> <a href="#">★</a>
									</p>
								</div>

								<!-- review body추가 -->
								<input type="text" placeholder="글 제목"
									style="margin-top: 40px; border: none; padding: 5px; border-top: 1px solid gray;">
								<textarea
									style="width: 100%; height: 200px; margin-bottom: 5px; padding: 20px;"
									placeholder="이 곳에 리뷰를 작성하세요 :)"></textarea>

								<div class="w3-button w3-amber w3-right" id="wsend"
									style="margin-bottom: 30px; width: 150px;">리뷰 작성</div>

								<!-- file추가 -->
								<div>
									<input type="file" style="display: inline-block; width: 500px;"
										id="file1"> <input type="file"
										style="display: none; width: 500px;" id="file2"> <input
										type="file" style="display: none; width: 500px;" id="file3">
									<input type="file" style="display: none; width: 500px;"
										id="file4">
								</div>
							</form>
						</footer>


					</div>



				</div>
			</div>
		</div>
	</div>
	<!-- 모달창 내부 끝 -->
	
	
	
	<!-- Overlay effect when opening the side navigation on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="Close Sidemenu"
		id="myOverlay"></div>

	<!-- Page content -->
	<div class="w3-main" style="margin-left: 400px;">
		<div class="w3-col" style="margin-top: 20px;">
			<div class="w3-col" style="text-align: right;">
				<div class="w3-col m12 l12 s12" style="padding-right: 60px;">
					내 정보보기 <i class="fas fa-user-cog"></i>
				</div>
				<div>
					<input type="text"
						style="width: 20%; padding-left: 10px; padding-left: 10px"
						placeholder="회원아이디"> <input type="password"
						style="width: 20%; padding-left: 10px;" placeholder="비밀번호">
					<div class="w3-button">로그인</div>
					<div class="w3-button" style="margin-right: 50px;">회원가입</div>
				</div>
			</div>
		</div>
		

	<div>
			
		
			
		<!-- 지도를 표시할 div 입니다 -->
			<div style="margin-left:30px;">
				<div class="map_wrap2">
					<div id="map" style="width:97%; height:700px;"></div>
					<div class="hAddr">
			              <span class="title">주소정보</span>
			              <span id="centerAddr"></span>
			         </div>
			         
			         <!-- 검색창 -->
			         <div class="map_wrap">
				         <div id="menu_wrap" class="bg_white">
						        <div class="option">
						            <div>
						                <form onsubmit="searchPlaces(); return false;">
						                    키워드 : <input type="text" value="섭지코지" id="keyword" size="15"> 
						                    <button type="submit">검색하기</button> 
						                </form>
						            </div>
						        </div>
						        <hr>
						        <ul id="placesList"></ul>
						        <div id="pagination"></div>
						    </div>
					 	</div>
				 	</div>
				 	
			</div>	
		</div>
	</div>
	<!-- 여기까지 페이지 컨텐트 -->



</body>
</html>