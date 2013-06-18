<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>CloudService</title>
    
    <link href="/css/bootstrap.css" rel="stylesheet" >
    <link href="/css/bootstrap-responsive.css" rel="stylesheet" >
    <link href="/css/bootstrap-modal.css" rel="stylesheet" >
    <link href="/css/base-admin.css" rel="stylesheet" >
    <link href="/css/pages/dashboard.css" rel="stylesheet" >
    
    <link href="http://wbpreview.com/previews/WB00U99JJ/css/font-awesome.css" rel="stylesheet">
    
    <link href="http://wbpreview.com/previews/WB00U99JJ/css/base-admin-responsive.css" rel="stylesheet">
   <script src="http://twitter.github.com/bootstrap/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.js"></script>
  	<script src="/js/bootstrap.js" type="text/javascript"></script>
 	<script src="/js/bootstrap-modal.js" type="text/javascript"></script>
   	<script src="/js/bootstrap-modalmanager.js" type="text/javascript"></script>
   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    
 
    	
    <style> body {padding-top: 60px;padding-bottom: 40px; } </style>
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  </head>
  

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="index.jsp">DockingCloud</a>
        
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="index.jsp"><strong>HOME</strong></a></li>
              <li><a href="about.jsp"><strong>ABOUT</strong></a></li>
              <li><a href="FAQ.jsp"><strong>FAQ</strong></a></li>
            </ul>
       <%
        String name=(String)session.getAttribute("loginid");
          if(name!=null){
		%>
	        <ul class="nav pull-right">
	          <form class="navbar-search">
  				<div class="input-append">
   				 <input type="text" class="span2 search">
   				 <button type="submit" class="btn">Search</button>
 				</div>
 			  </form>
 			  <li><a href="#"><strong>  </strong></a></li>
	          <div class="btn-group">
	          
	          
 				 <a class="btn btn-primary" href="connect.jsp"><i class="icon-user icon-white"></i> User</a>
 				 <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
 				 <ul class="dropdown-menu">
 				 		
					
  				 <li><a href="setting.jsp"><i class="icon-pencil"></i> 연결하기</a></li>
  				    
  				  <li><a href="#"><i class="icon-pencil"></i> 수정하기</a></li>
    			  <li><a href="process_logout.jsp"><i class="icon-trash"></i> 로그아웃</a></li>
    			  <li><a href="process_dropout.jsp"><i class="icon-ban-circle"></i> 탈퇴하기</a></li>
    			  <li class="divider"></li>
    			  <li><a href="#"><i class="i"></i> Make admin</a></li>
 				 </ul>
			  </div>			  
            </ul>                  
 			  
        <% } else { %>
        		<ul class="navbar-text pull-right">
             	 	<li><a href="register.jsp">회원가입</a></li>
             	 	<li><a href="register.jsp">아이디/비밀번호 찾기</a></li>
             	</ul>
        		<form class="navbar-form pull-right" action="login.jsp">
             	 	<button type="submit" class="btn">Sign in</button>
           		</form>
             	 
        <% } %>
            

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    