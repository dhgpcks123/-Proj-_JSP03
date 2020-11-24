$(document).ready(function(){
	
 //----------------------------------------------------------
// 약관(memberJoin)
//----------------------------------------------------------
   // 약관동의 진입시 체크해제  
	$("#chk_all").prop("checked",false);
		setTerms();

    // 약관동의 체크 모두동의 
    $("#chk_all").click(function(){
        setTerms();
    });	
 	
    // 약관동의 모두 체크(true), 체크해제(false) 기능
	function setTerms() {
        if ($("#chk_all").is(":checked")) {
            $("#termsService").prop("checked",true);
            $("#termsPrivacy").prop("checked",true);
            $("#termsLocation").prop("checked",true);
        } else {
            $("#termsService").prop("checked",false);
            $("#termsPrivacy").prop("checked",false);
            $("#termsLocation").prop("checked",false);
        }
        return true;
    }

    // 약관동의 필수 체크(true) 확인 기능
    function checkTerms() {
        var res = true;

        if ($("#termsService").is(":checked") == false
			 || $("#termsPrivacy").is(":checked") == false) {
            $("#agreeMsg").show();
            res = false;
        } else {
            $("#agreeMsg").hide();
        }

        return res;
    }

    // 약관동의 필수 체크(true) 전송 기능
    function submitAgree() {
        if (checkTerms() != true) {
            return false;
        }

        $("#memberJoinInfo").submit();
        return true;
    }

    // 약관동의 버튼(Send) 기능
    $("#btnAgree").click(function() {
		checkTerms();
        submitAgree();
        return false;
    });


//----------------------------------------------------------
// 개인정보입력(memberJoinInfo)	
//----------------------------------------------------------
	// id 입력확인  
	$('#id').focusout(function(){
		if($('#id').val() == ""){
			$('#idmsg').html('필수정보입니다.');
			$('#idmsg').addClass('w3-text-red');
			$('#idmsg').stop().show(500);
			return;
		}
	});
	// id 정규식검사 
	$('#id').keyup(function(){
		var spw = $(this).val();
		var pattern = /^[a-z0-9]{4,12}$/; 
		var result = pattern.test(spw);
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
		}
	});	
	// 아이디체크버튼 처리
	$('#idck').click(function(){
		var sid = $('#id').val();
		if(!sid){
			return;
		}
		
/*		// 데이터를 서버에 보내서 응답을 받는다. 비동기통신으로
		$.ajax({
			url: '/cls/member/idCheck.cls',
			type: 'POST',
			dataType: 'json',
			data: {
				id: sid
			},
			success: function(data){
				if(data.result == 'OK'){
					// 사용가능한 아이디인 경우
					$('#idmsg').html('*** 사용가능한 아이디 입니다! ***');
					$('#idmsg').removeClass('w3-text-red');
					$('#idmsg').addClass('w3-text-blue');
					$('#idmsg').stop().slideDown(500);
				} else {
					// 사용 불가능한 아이디인 경우
					$('#idmsg').html('### 사용가능할 수 없는 아이디 입니다! ###');
					$('#idmsg').removeClass('w3-text-blue');
					$('#idmsg').addClass('w3-text-red');
					$('#idmsg').stop().slideDown(500);
				}
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});*/
	});
	
//----------------------------------------------------------
	// 비밀번호 미입력 알림
	$('#pw').focusout(function(){
		if($('#pw').val() == ""){
			$('#pwmsg').html('필수정보입니다.');
			$('#pwmsg').addClass('w3-text-red');
			$('#pwmsg').stop().show(500);
			return;
		}
	});
	$('#pw2').focusout(function(){
			
		if($('#pw2').val() == ""){
			$('#pw2msg').html('필수정보입니다.');
			$('#pw2msg').addClass('w3-text-red');
			$('#pw2msg').stop().show(500);
			return;
		}
	});
	// 비밀번호, 비밀번호 확인 동일여부 확인 
	$('#pw2').keyup(function(){
		var spw = $('#pw').val();
		var spw2 = $(this).val();
		if(spw == spw2){
			$('#pwmsg').css('color', 'green');
			$('#pwmsg').html('*** 비밀번호가 일치합니다! ***');
			$('#pwmsg').stop().show();
			setTimeout(hidePwTag, 1500);
		} else {
			$('#pwmsg').css('color', 'red');
			$('#pwmsg').html('### 비밀번호가 다릅니다! ###');
			$('#pwmsg').stop().show();
		}
	});
	// 비밀번호 포커스 리셋
	$('#pw').focus(function(){
		$(this).val("");
		$('#pw2').val("");
		$('#pwmsg').hide();
		$('#repw').parent().parent().stop().slideDown(300);
	});
	// 비밀번호 정규식 검사
	$('#pw').keyup(function(){
		var spw = $(this).val();
		var pattern = /^.*(?=^[a-zA-Z0-9#@!$%&-_*]{8,})(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#@!$%&-_*]).*$/;
		var result = pattern.test(spw);
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
		}
	});
//----------------------------------------------------------
	// mail 입력확인 
	$('#mail').focusout(function(){
			
		if($('#mail').val() == ""){
			$('#mailmsg').html('필수정보입니다.');
			$('#mailmsg').addClass('w3-text-red');
			$('#mailmsg').stop().show(500);
			return;
		}
	});
	// mail 정규식
	$('#mail').change(function(){
		var sname = $(this).val();
		
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var result = pattern.test(sname);
		if(!result){
			$('#mail').removeClass('w3-pale-blue');
			$('#mail').addClass('w3-pale-red');
			$('#mail').focus();
		} else {
			$('#mail').removeClass('w3-pale-red');
			$('#mail').addClass('w3-pale-blue');
		}
	});
//----------------------------------------------------------
	// name 입력확인  
	$('#name').focusout(function(){
			
		if($('#name').val() == ""){
			$('#namemsg').html('필수정보입니다.');
			$('#namemsg').addClass('w3-text-red');
			$('#namemsg').stop().show(500);
			return;
		}
	});
	// name 정규식 검사
	$('#name').change(function(){
		var sname = $(this).val();
		
		var pattern = /^[가-힣]{2,10}$/;
		
		var result = pattern.test(sname);
		if(!result){
			$('#name').removeClass('w3-pale-blue');
			$('#name').addClass('w3-pale-red');
			$('#name').focus();
		} else {
			$('#name').removeClass('w3-pale-red');
			$('#name').addClass('w3-pale-blue');
		}
	});
//----------------------------------------------------------
	// tel 입력확인 
	$('#tel').focusout(function(){
			
		if($('#tel').val() == ""){
			$('#telmsg').html('필수정보입니다.');
			$('#telmsg').addClass('w3-text-red');
			$('#telmsg').stop().show(500);
			return;
		}
	});
	// tel 정규식검사 
	$('#tel').keyup(function(){
		var spw = $(this).val();
		var pattern = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		var result = pattern.test(spw);
		if(result){
			$(this).removeClass('w3-pale-red');
			$(this).addClass('w3-teal');
		} else {
			$(this).removeClass('w3-teal');
			$(this).addClass('w3-pale-red');
		}
	});	
//----------------------------------------------------------
	// 회원가입 step1 버튼 
	$('#reset1').click(function(){
		$('#id').val('');
		$('#pw').val('');
		$('#pw2').val('');
		$('#mail').val('');
	});
	$('#next1').click(function(){
		var sid = $('#id').val();
		var spw = $('#pw').val();
		var spw2 = $('#pw2').val();
		var smail = $('#mail').val();
		
		if(!sid || !spw || !spw2 || !smail){
			alert('빈칸을 채워주세요');
			$('#next1').stop();
		} else if (sid != ""){
			$('#step1').addClass('w3-hide');
			$('#step2').removeClass('w3-hide');
		}
	});
	// 회원가입 step2버튼 
	$('#pre2').click(function(){
		
		$('#step1').removeClass('w3-hide');
		$('#step2').addClass('w3-hide');
	});
	$('#reset2').click(function(){
		$('#name').val('');
		$('#year').val('1988');
		$('#mouth').val('6');
		$('#day').val('15');
		$('#tel').val('');
		$('#gen').val("성별");
	});
	$('#next2').click(function(){
		var sname = $('#name').val();
		var stel = $('#tel').val();
		var sgen = $('#gen').val();
		
		if(!sname || !stel || !sgen){
			alert('빈칸을 채워주세요');
			$('#next2').stop();
		} else if ( sname != ""){
			$('#step2').addClass('w3-hide');
			$('#step3').removeClass('w3-hide');
		}
	});
	// 회원가입 step3 버튼 
	$('#pre3').click(function(){
		$('#step2').removeClass('w3-hide');
		$('#step3').addClass('w3-hide');
	});
	$('#reset3').click(function(){
		$('#ph').val('모름');
		$('#abo').val('모름');
		$('#stel').val('');
		$('#stel_name').val('');
		$('#text').val('');
	});
	$('#next3').click(function(){
		joinAgree();
	});


	 // 개인정보 확인 후 가입내용 전송 
    function joinAgree() {
		var sid = $('#id').val();
		var spw = $('#pw').val();
		var smail = $('#mail').val();
		var sname = $('#name').val();
		var syear = $('#year').val();
		var smouth = $('#mouth').val();
		var sday = $('#day').val();
		var stel = $('#tel').val();
		var sgen = $('#gen:selected').val();
		var sph = $('#ph:selected').val();
		var sabo = $('#abo:selected').val();
		var sstel = $('#stel').val();
		var sstel_name = $('#stel_name').val();
		var stext = $('#text').val();
		
		alert(sid + '|' + spw + '|' + smail + '|' + 
			sname + '|' + syear + '|' + smouth + '|' + sday + '|' + stel + '|' + sgen + '|' + 
			sph + '|' + sabo + '|' + sstel + '|' + sstel_name + '|' + stext);
		if(!(sid && spw && smail && 
			sname && syear && smouth && sday && stel && sgen && 
			sph && sabo && sstel && sstel_name && stext)){
				return;
			}
		$('#memberJoinEnd').attr('action', ''); 
		
        $("#memberJoinEnd").submit();
        return true;
    }
});