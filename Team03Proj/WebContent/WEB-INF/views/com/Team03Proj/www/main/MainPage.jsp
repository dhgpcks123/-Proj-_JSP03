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

<style>
    .map_wrap {position:relative;width:100%;height:350px;}
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
                  <i class="fas fa-store-alt"></i><strong> 원할머니 보쌈</strong>
               </h2>
            </div>
            
            <!--  slide img -->
            <ul class="slides">
               <input type="radio" name="radio-btn" id="img-1" checked />
               <li class="slide-container">
                  <div class="slide">
                     <img
                        src="http://farm9.staticflickr.com/8072/8346734966_f9cd7d0941_z.jpg" />
                  </div>
                  <div class="nav">
                     <label for="img-6" class="prev">&#x2039;</label> <label
                        for="img-2" class="next">&#x203a;</label>
                  </div>
               </li>

               <input type="radio" name="radio-btn" id="img-2" />
               <li class="slide-container">
                  <div class="slide">
                     <img
                        src="http://farm9.staticflickr.com/8504/8365873811_d32571df3d_z.jpg" />
                  </div>
                  <div class="nav">
                     <label for="img-1" class="prev">&#x2039;</label> <label
                        for="img-3" class="next">&#x203a;</label>
                  </div>
               </li>

               <input type="radio" name="radio-btn" id="img-3" />
               <li class="slide-container">
                  <div class="slide">
                     <img
                        src="http://farm9.staticflickr.com/8068/8250438572_d1a5917072_z.jpg" />
                  </div>
                  <div class="nav">
                     <label for="img-2" class="prev">&#x2039;</label> <label
                        for="img-4" class="next">&#x203a;</label>
                  </div>
               </li>

               <input type="radio" name="radio-btn" id="img-4" />
               <li class="slide-container">
                  <div class="slide">
                     <img
                        src="http://farm9.staticflickr.com/8061/8237246833_54d8fa37f0_z.jpg" />
                  </div>
                  <div class="nav">
                     <label for="img-3" class="prev">&#x2039;</label> <label
                        for="img-5" class="next">&#x203a;</label>
                  </div>
               </li>

               <input type="radio" name="radio-btn" id="img-5" />
               <li class="slide-container">
                  <div class="slide">
                     <img
                        src="http://farm9.staticflickr.com/8055/8098750623_66292a35c0_z.jpg" />
                  </div>
                  <div class="nav">
                     <label for="img-4" class="prev">&#x2039;</label> <label
                        for="img-6" class="next">&#x203a;</label>
                  </div>
               </li>

               <input type="radio" name="radio-btn" id="img-6" />
               <li class="slide-container">
                  <div class="slide">
                     <img
                        src="http://farm9.staticflickr.com/8195/8098750703_797e102da2_z.jpg" />
                  </div>
                  <div class="nav">
                     <label for="img-5" class="prev">&#x2039;</label> <label
                        for="img-1" class="next">&#x203a;</label>
                  </div>
               </li>

               <li class="nav-dots"><label for="img-1" class="nav-dot"
                  id="img-dot-1"></label> <label for="img-2" class="nav-dot"
                  id="img-dot-2"></label> <label for="img-3" class="nav-dot"
                  id="img-dot-3"></label> <label for="img-4" class="nav-dot"
                  id="img-dot-4"></label> <label for="img-5" class="nav-dot"
                  id="img-dot-5"></label> <label for="img-6" class="nav-dot"
                  id="img-dot-6"></label></li>
            </ul>
            <!--  slide img -->

            <div id="text"
               style="font-size: 9pt; margin-top: 10px; padding-left: 15px; margin-top: 15px;">
               <i class="fas fa-at"></i> 
            </div>
            <div style="font-size: 9pt; padding-left: 15px;">
               <i class="fas fa-phone-volume"></i> 054-748-4487
            </div>
            <div
               style="border-top: 1px dashed gray; border-bottom: 1px dashed gray; padding: 15px 30px; margin: 30px 5px 15px 5px;">
               <div>
                  <i class="fas fa-info-circle"></i> 메뉴정보
               </div>
               <div>말제르브바게트</div>
               <div>5,500원</div>
               <div>몽쥐 바게트</div>
               <div>4,500원</div>
               <div>올리브치아바타</div>
               <div>4,000원</div>
               <div>바나나푸딩</div>
               <div>4,000원</div>
            </div>
         </div>

         <div style="padding: 15px;">

            <div style="text-align: center; margin-bottom: 9px;">이 가게의 가장
               최근리뷰</div>
            <div style="margin-bottom: 10px;">
               <div class="w3-right">2020-11-20</div>
               <div style="display: inline-block;">여기 졸맛탱</div>
               <div style="margin-bottom: 5px; display: inline-block;">★★★★☆</div>
            </div>
            <div style="margin-bottom: 30px;">
               <center>
                  <img class="reviewIMG"
                     src="/Team03Proj/img/detailBoard/store01.jpg"></img> <img
                     class="reviewIMG" src="/Team03Proj/img/detailBoard/store02.jpg"></img>
               </center>
            </div>
            <div style="padding: 3px; margin-top: 5px;">가보고 괜찮아서 주변에
               추천했더니, 일식 좋아하시는 분들이 현지 맛을 너무나 잘 살린 마제소바라며 극찬함. 사실 나는 마제소바 자체가 여기가
               처음인지라 그정도인줄은 잘 모르겠으나, 아무튼 소바 좀 먹는 사람들이 환장하는 곳인듯소바 좀 먹는 사람들이 환장하는
               곳인듯..</div>
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
                     <Strong> 원조할배국밥 수원장안구청점 </Strong>
                  </div>
               </div>
               <div style="margin-left: 80px;">
                  <div style="color: red; display: inline-block;">
                     <i class="fas fa-map-marker-alt"></i>
                  </div>
                  <div style="color: gray; display: inline-block;">제주특별자치도
                     서귀포시 색달동 일주서로 968-10</div>
                  <div style="color: gray; font-size: 8pt; margin-left: 15px;">
                     전화번호 : <span>010-7648-5555</span>
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
                           <li>
                              <div></div> <a href="/Team03Proj/img/detailBoard/store01.jpg">
                                 <img class="StoreIMG w3-padding-right"
                                 src="/Team03Proj/img/detailBoard/store01.jpg">
                           </a>
                           </li>
                           <li>
                              <div></div> <img class="StoreIMG w3-padding-right"
                              src="/Team03Proj/img/detailBoard/store02.jpg">
                           </li>

                           <li>
                              <div></div> <img class="StoreIMG"
                              src="/Team03Proj/img/detailBoard/store03.jpg">
                           </li>
                           <li>
                              <div></div> <img class="StoreIMG"
                              src="/Team03Proj/img/detailBoard/store01.jpg">
                           </li>
                           <li>
                              <div></div> <img class="StoreIMG"
                              src="/Team03Proj/img/detailBoard/store04.jpg">
                           </li>
                           <li>
                              <div></div> <img class="StoreIMG"
                              src="/Team03Proj/img/detailBoard/store01.jpg">
                           </li>
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
                     <div
                        style="background-color: #F6F6F6; margin-top: 10px; display: flex; justify-content: space-between; border-bottom: 1px solid #ECEAEB; padding: 0px 20px;">
                        <h3 style="cursor: pointer; margin-top: 15px;">원조할배국밥 안양역점
                           &gt;</h3>
                        <h3
                           style="color: yellow; margin-left: 3%; text-shadow: 2px 2px 2px gray;">★★★☆☆</h3>

                     </div>
                     <div
                        style="display: flex; border-bottom: 1px solid #ECEAEB; padding-right: 20px;">
                        <div style="padding-left: 5px; width: 70%;">> 자려고 누웠는데
                           생각나는 맛입니다..</div>
                        <div>
                           <strong>dhgpcks123</strong>
                        </div>
                        <div style="margin-left: 45px;">작성일 :</div>
                        <div>2020. 12. 13</div>
                     </div>

                     <div style="border-bottom: 1px solid #ECEAEB;">
                        <div
                           style="margin-top: 20px; padding-right: 33px; display: inline-block;">화덕피자로
                           유명한 곳인지도 모르고 갔는데 먹으면서 피자가 너무 맛있어서 검색을 해봤더니 화덕피자로 유명하다 해서 역시 유명한
                           데에는 이유가 있구나라는 생각을 했어요. 쫀득하고 간간한 도우위에 작지만 충분한 마르게리따 피자와 봉골레 파스타,
                           단호박 수프 모두 입맛에 잘 맞아서 맛있게 먹고 왔어요. 참고로 분위기도 좋았지만 접시가 너무 예뻐서 다음 요리는
                           어떤 접시에 나올까 생각해보면서 기다렸어요.</div>
                        <div
                           style="display: flex; flex-wrap: wrap; justify-content: flex-start; margin-bottom: 20px;">
                           <img class="reviewIMG"
                              src="/Team03Proj/img/detailBoard/리뷰사진1.jpg"></img> <img
                              class="reviewIMG" src="/Team03Proj/img/detailBoard/리뷰사진2.jpg"></img>
                        </div>
                     </div>
                     <!-- 2 -->
                     <div
                        style="background-color: #F6F6F6; margin-top: 30px; display: flex; justify-content: space-between; border-bottom: 1px solid #ECEAEB; padding: 0px 20px;">
                        <h3 style="cursor: pointer; margin-top: 15px;">원조할배국밥
                           구로디지털단지역 &gt;</h3>
                        <h3
                           style="color: yellow; margin-left: 3%; text-shadow: 2px 2px 2px gray;">★★★☆☆</h3>

                     </div>
                     <div
                        style="display: flex; border-bottom: 1px solid #ECEAEB; padding-right: 20px;">
                        <div style="padding-left: 5px; width: 70%;">> 여기 졸맛탱</div>
                        <div>
                           <strong>woooooooow</strong>
                        </div>
                        <div style="margin-left: 45px;">작성일 :</div>
                        <div>2020. 12. 10</div>
                     </div>

                     <div style="border-bottom: 1px solid #ECEAEB;">
                        <div
                           style="margin-top: 20px; padding-right: 33px; display: inline-block;">화덕피자로
                           유명한 곳인지도 모르고 갔는데 먹으면서 피자가 너무 맛있어서 검색을 해봤더니 가보고 괜찮아서 주변에 추천했더니,
                           일식 좋아하시는 분들이 현지 맛을 너무나 잘 살린 마제소바라며 극찬함. 사실 나는 마제소바 자체가 여기가
                           처음인지라 그정도인줄은 잘 모르겠으나, 아무튼 소바 좀 먹는 사람들이 환장하는 곳인듯..</div>
                        <div
                           style="display: flex; flex-wrap: wrap; justify-content: flex-start; margin-bottom: 20px;">
                           <img class="reviewIMG"
                              src="/Team03Proj/img/detailBoard/store01.jpg"></img> <img
                              class="reviewIMG"
                              src="/Team03Proj/img/detailBoard/store02.jpg"></img> <img
                              class="reviewIMG"
                              src="/Team03Proj/img/detailBoard/store03.jpg"></img> <img
                              class="reviewIMG"
                              src="/Team03Proj/img/detailBoard/store04.jpg"></img>
                        </div>
                     </div>

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
            <div style="position:relative; z-index:1">
            	<form method="POST" action="/Team03Proj/Login.cls" id="frm" name="frm">
	               <c:if test="${empty SID}">
		               <input type="text" style="width: 20%; padding-left: 10px; padding-left: 10px" id="id" name="id"
		               		placeholder="회원아이디"> 
		               <input type="password" style="width: 20%; padding-left: 10px;" id="pw" name="pw" placeholder="비밀번호">
	               		<div class="w3-button w3-blue w3-hover-aqua" id="lbtn">로그인</div>
	               </c:if>
	               <c:if test="${not empty SID}">
	               		<div class="w3-button w3-blue w3-hover-aqua" id="obtn">로그아웃</div>
	               </c:if>
	               <div class="w3-button w3-green w3-hover-lime" style="margin-right: 50px;" id="jbtn">회원가입</div>
            	</form>
            </div>
         </div>
      </div>

	  <div>
 	   		<div class="map_wrap">
	          <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	          <div class="hAddr"">
	              <span class="title" >지도중심기준 행정동 주소정보</span>
	              <span id="centerAddr"></span>
	          </div>
		  </div>
	      
	      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79522878be27fd519cad54cd57b6d0ba&libraries=services"></script>
	      <script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 1 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		    
		
		
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            
		            document.getElementById("text").innerHTML = detailAddr;
		           
		           
		            var content = '<div class="bAddr">' +
		                            '<span class="title"> 주소정보</span>' + 
		                            detailAddr + 
		                        '</div>';
		                        
		            //addr = result[0].road_address.address_name;            
		                                      
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
		
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});
	
	
	
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
		    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
		
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var infoDiv = document.getElementById('centerAddr');
		
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                infoDiv.innerHTML = result[i].address_name;
		                break;
		            }
		        }
		    }    
		}



		</script>
		</div>
	</div>
   	<!-- 여기까지 페이지 컨텐트 -->
   	
</body>
</html>