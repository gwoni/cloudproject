<%@page contentType="text/html;charset=utf-8" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import="com.dropbox.client2.exception.*" %>
<%@ page import="com.dropbox.client2.session.*" %>

<%
	
DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");

if(mdb!=null){
 if(mdb.getSession().isLinked()==true )
	 mdb.getSession().unlink();
}
 

	session.invalidate();
	response.sendRedirect("/login.jsp");
%>