$(document).ready(function(){
    $("#chk_all").prop("checked",false);
		setTerms();

    $("#chk_all").click(function() {
        location.hash = 'agreeBottom';
        setTerms();
    })	
 	
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

    function submitAgree() {
        if (checkTerms() != true) {
            return false;
        }

        $("#memberJoinInfo").submit();
        return true;
    }

    $("#btnAgree").click(function() {
		checkTerms();
        submitAgree();
        return false;
    })

});