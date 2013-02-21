<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>CloudService</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <style> body {padding-top: 60px; } </style>
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
        <%	
        String id=(String)session.getAttribute("loginid");
        if(id!=null){
        %>
          <a class="brand" href="#">AdminiStrator</a>
          <%}else{ %>
          <a class="brand" href="#">DockingCloud</a>
          <% } %>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="index.jsp">Home</a></li>
              <li><a href="about.jsp">About</a></li>
            </ul>
            <ul class="nav pull-right">
        <%
        
          if(id!=null){
        %>
              <li><a href="process_logout.jsp"><%=id%>로그아웃</a></li>
        <% } else { %>
              <li><a href="register.jsp">회원가입</a></li>
              <li><a href="login.jsp">로그인</a></li>
        <% } %>
            </ul>

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>