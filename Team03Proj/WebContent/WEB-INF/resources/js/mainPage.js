$(document).ready(function(){
  //$('.slider').slider();
	//$('#mySidebar').stop().slideLeft(500);
	
	$('.w3-button').click(function(){
		var tmp = $(this).attr('id');
		var spath = '';
		switch(tmp){
			case 'lbtn':
				//spath = '/Team03Proj/memberLogin.cls';
				var sid = $('#id').val();
				var spw = $('#pw').val();
				
				if(!(sid&&spw)){
					return;
				}
				alert(sid+" , "+spw);
				$('#frm').submit();
				//$('#mySidebar').stop().slideRight(500);
				break;
			case 'obtn':
				$(location).attr('href', '/Team03Proj/Logout.cls');
				break;
				
			case 'jbtn':
				$(location).attr('href', '/Team03Proj/memberJoin.cls');
				break;
		}
	});
});

