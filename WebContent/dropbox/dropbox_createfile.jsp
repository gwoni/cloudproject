<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "com.dropbox.client2.DropboxAPI.*" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import="com.dropbox.client2.session.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<%

String path=(String)session.getAttribute("Dropbox_path");
String name=(String)request.getParameter("name");

DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");

if(path.equals("/")){
	mdb.createFolder(path+name);
}
else{
	path=path+"/";
	mdb.createFolder(path+name);
}

response.sendRedirect("/connect.jsp");
%>