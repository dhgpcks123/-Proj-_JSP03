
$(document).ready(function(){
	
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	$.ajax({
			url: '/Team03Proj/markerlist.cls',
			type: 'POST',
			dataType: 'json',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(positions){

			
//#####################################replaceAll 함수

//		function replaceAll(str, searchStr, replaceStr) {
//		 return str.split(searchStr).join(replaceStr);}
//####################################################

//			var t = data;
//			var m = JSON.stringify(t);
//			var p = replaceAll(m, '"', '');
//			var positions = JSON.parse(p);

/*
//############################### StringBuffer기능 함수
var StringBuffer = function() { this.buffer = new Array(); }; StringBuffer.prototype.append = function(str) { this.buffer[this.buffer.length] = str; }; StringBuffer.prototype.toString = function() { return this.buffer.join(""); };
//####################################################
					var buff = new StringBuffer();
				
					buff.append('[ ');
				for(let j = 0 ; j<data.length-1; j++){
					var ti = data[j].title;
					var la = data[j].latlng;
					buff.append ('  { \'title\': '+ ti +','+
									' \'latlng\': \''+ la + '\' }, ');
				};
					buff.append(' { \'title\': ' + data[data.length-1].title + ', ' );
					buff.append('  \'latlng\' : \'' + data[data.length-1].latlng+ '\'} ' );
				
				
					buff.append(' ] ');
					var tmp = buff.toString();
					alert(tmp);
				var positions = JSON.stringfy(tmp);
*/
			/*
var positions = new Object();
	for( let j= 0; j<data.length; j++){
		var ti = data[j].title;
		var la = data[j].latlng;
		positions['title'] = ti;
		positions['latlng'] = la;
}
*/


	// 마커를 표시할 위치와 title 객체 배열입니다 
//	var positions= [
//			{
//		        title: '섭지코지', 
//		        latlng: new kakao.maps.LatLng(33.42437961506556, 126.93110026765497)
//		    }
//		    
//	];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (let i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(positions[i].x, positions[i].y), // 마커를 표시할 위치
					title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지
			    });
					

				// 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].title // 인포윈도우에 표시할 내용
			    });
			
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				
				
				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() {
					let ax = JSON.stringify(positions[i].x);
					let ay = JSON.stringify(positions[i].y);
					var x = ax.substring(1, ax.length-1);
					var y = ay.substring(1, ay.length-1);
					
					$('#ax').val = x;
					$('#ay').val = y;
					
					$('mfrm').submit();
					
//					alert(marker.ax);
//					alert(positions.x);
//					alert(positions.ax);
//					alert(JSON.stringify(marker.ax));
//					alert(marker.position);
//					alert(JSON.stringify(marker.position));
				});
									
				
				}
			
	
	
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
	});
	
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 	    
	});
		
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
		
		
	
});



// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}