<%@page contentType="text/html;charset=utf-8" %>

<script language="JavaScript" src="/js/script.js"></script>
<jsp:include page="header.jsp"  />

<style type="text/css">
  body { padding-top: 80px; padding-botton: 40px; background-color: #f5f5f5;}

  .form-signin{
  	max-width : 300px; padding: 19px 29px 29px; margin: 0 auto 20px;
  	background-color: #fff; border: 1px solid #e5e5e5; border-radius: 5px;
  	box-shadow: 0 1px 2px rgba(0,0,0,.05);
  }
  .form-signin .form-signin-heading{ margin-bottom: 10px;}
  .form-signin input{ font-size: 16px; height: auto; margin-bottom: 15px; padding: 7px 9px;}
</style>

  <div class="container">
  	<form class="form-signin" name="regForm" action="process_register.jsp" method="post" onsubmit="return false">
  		<h2 class="form-signin-heading">Docking Cloud 가입</h2>
  		<input type="text" name=main_id class="input-block-level" placeholder="사용자 Email">
  			<button class="btn btn-large btn-primary" onclick="idCheck(this.regForm.main_id.value)">ID 중복확인</button>
  		<input type="password" name=main_password class="input-block-level" placeholder="사용자 비밀번호">
  		<input type="password" name=main_password_re class="input-block-level" placeholder="사용자 비밀번호 확인">
  		<input type="text" name=main_name class="input-block-level" placeholder="사용자 이름">
  			<button class="btn btn-large btn-primary" onclick="inputCheck()"> 가입 </button>
  	</form>
  </div>

    
 <jsp:include page="footer.jsp"  />