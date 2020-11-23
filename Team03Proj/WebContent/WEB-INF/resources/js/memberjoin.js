$(document).ready(function(){
    /* 약관동의 진입시 체크해제  */
	$("#chk_all").prop("checked",false);
		setTerms();

    /* 약관동의 체크 모두동의 */
    $("#chk_all").click(function(){
        setTerms();
    });	
 	
    /* 약관동의 모두 체크(true), 체크해제(false) 기능*/
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

    /* 약관동의 필수 체크(true) 확인 기능*/
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

    /* 약관동의 필수 체크(true) 전송 기능*/
    function submitAgree() {
        if (checkTerms() != true) {
            return false;
        }

        $("#memberJoinInfo").submit();
        return true;
    }

    /* 약관동의 버튼(Send) 기능*/
    $("#btnAgree").click(function() {
		checkTerms();
        submitAgree();
        return false;
    });
	
/*	/* 입력확인 
	$('.info').ready(function(){
		var sid = $('#id').focusout();
		var spw = $('#pw').focusout();
			
		if(!sid || !spw){
			$('#idmsg').html('필수정보입니다.');
			$('#idmsg').addClass('w3-text-red');
			$('#idmsg').stop().show(500);
			return;
		}
		
	});*/
	
    //region unreal id
    $("#id").blur(function() {
        checkId();
    });

 	function checkId() {
        var id = $("#id").val();
        var oMsg = $("#idMsg");
        var oInput = $("#id");

        if ( id == "") {
            showErrorMsg(oMsg,"필수 정보입니다.");
            return false;
        }
	}

    function showErrorMsg(obj, msg) {
        obj.attr("class", "info");
        obj.html(msg);
        obj.show();
    }





	/* 회원가입 step1 버튼 */
	$('#next1').click(function(){
		$('#step1').addClass('w3-hide');
		$('#step2').removeClass('w3-hide');
	});
	/* 회원가입 step2버튼 */
	$('#pre2').click(function(){
		$('#step1').removeClass('w3-hide');
		$('#step2').addClass('w3-hide');
	});
	$('#next2').click(function(){
		$('#step2').addClass('w3-hide');
		$('#step3').removeClass('w3-hide');
	});
	/* 회원가입 step3 버튼 */
	$('#pre3').click(function(){
		$('#step2').removeClass('w3-hide');
		$('#step3').addClass('w3-hide');
	});
	$('#next3').click(function(){
		$('#step2').addClass('w3-hide');
		$('#step3').removeClass('w3-hide');
	});
	
});