<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="com.dropbox.client2.session.RequestTokenPair"%>
<%@ page import="com.dropbox.client2.exception.DropboxException" %>
<%@ page import="com.dropbox.client2.session.Session" %>
<%@ page import="com.dropbox.client2.exception.*" %>
<%@ page import="com.dropbox.client2.session.WebAuthSession" %>
<%@ page import="com.dropbox.client2.session.WebAuthSession.WebAuthInfo" %>
<%@ page import="com.dropbox.client2.session.AppKeyPair" %>
<%@ page import="com.dropbox.client2.session.AccessTokenPair" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import= "com.dropbox.client2.DropboxAPI.DeltaEntry" %>

<%@ page import= "com.dropbox.client2.jsonextract.*" %>
<%@ page import= "org.json.simple.JSONArray" %>
<%@ page import= "org.json.simple.JSONObject" %>
<%@ page import= "org.json.simple.parser.JSONParser" %>
<%@ page import= "org.json.simple.parser.ParseException" %>

<%@ page import= "java.io.*" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import= "java.util.Map" %>
<%@ page import= "java.awt.*" %>
<%@ page import= "java.net.*" %>


<%
try{
	final String APP_Key = "jv0xh2qyex8bbuf";
	final String APP_Secret= "izuo5z8eya4pfx8";
	
	AppKeyPair appKeyPair = new AppKeyPair(APP_Key, APP_Secret);
	WebAuthSession was = new WebAuthSession(appKeyPair, Session.AccessType.APP_FOLDER);
	WebAuthInfo info = was.getAuthInfo("http://dockingcloud.cloudfoundry.com/main_dropbox.jsp");
	RequestTokenPair pair=info.requestTokenPair;
	session.setAttribute("Token",pair);
	session.setAttribute("WebSession",was);
	
	
	
	String url=info.url;

	
	response.sendRedirect(url);
}catch(DropboxUnlinkedException e){
	out.println("DropboxUnlinked Exception");
}catch(DropboxException e){
	out.println("DropboxException");
}
	
	


  %>



