function inputCheck(){
	if(document.regForm.main_id.value==""){
		document.regForm.main_id.focus();
		return false;
	}
	
	if(document.regForm.main_password.value==""){
		document.regForm.main_password.focus();
		return false;
	}
	
	if(document.regForm.main_name.value==""){
		document.regForm.main_name.focus();
		return false;
	}
	
	if(document.regForm.main_password.value!=document.regForm.main_password_re.value){
		document.regForm.main_password_re.focus();
		return false;
	}
	
	document.regForm.submit();
}

function validate() {
    var formname=document.login_post;
    var str=formname.main_id.value;
	var str1=formname.main_password.value;
	
    if(str=="" || str1=="")
    {
    	if(str=="")
    		formname.main_id.focus();
    	else
    		formname.main_password.focus();
    	
    	return false;
    }
    else
    {
    	formname.submit();
    }
    
}
