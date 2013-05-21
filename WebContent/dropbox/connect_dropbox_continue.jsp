<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.dropbox.client2.session.RequestTokenPair"%>
<%@ page import="com.dropbox.client2.exception.*" %>
<%@ page import="com.dropbox.client2.session.Session" %>
<%@ page import="com.dropbox.client2.session.WebAuthSession" %>
<%@ page import="com.dropbox.client2.session.WebAuthSession.WebAuthInfo" %>
<%@ page import="com.dropbox.client2.session.AppKeyPair" %>
<%@ page import="com.dropbox.client2.session.AccessTokenPair" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import= "com.dropbox.client2.DropboxAPI.DeltaEntry" %>
<%@ page import= "com.dropbox.client2.exception.*" %>
<%@ page import= "com.dropbox.client2.jsonextract.*" %>
<%@ page import= "org.json.simple.JSONArray" %>
<%@ page import= "org.json.simple.JSONObject" %>
<%@ page import= "org.json.simple.parser.JSONParser" %>
<%@ page import= "org.json.simple.parser.ParseException" %>

<%@ page import= "java.io.*" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.util.HashMap" %>
<%@ page import= "java.util.Map" %>
<%@ page import= "java.awt.*" %>
<%@ page import= "java.net.*" %>

<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*"%>
<%@ page import="org.cloudfoundry.services.*"%>
<% 

try{
	
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	Statement stmt =conn.createStatement();
	
	final String APP_Key = "jv0xh2qyex8bbuf";
	final String APP_Secret= "izuo5z8eya4pfx8";
	RequestTokenPair Token = (RequestTokenPair)session.getAttribute("Token");
	WebAuthSession auth=(WebAuthSession)session.getAttribute("WebSession");
	auth.retrieveWebAccessToken(Token);

	//RequestTokenPair token=(RequestTokenPair)request.getParameter("oauth_token");
	//String secret=(String)request.getParameter("uid");
	//AccessTokenPair was=new AccessTokenPair(token,secret);
	//AppKeyPair appKeyPair = new AppKeyPair(APP_Key, APP_Secret);
	//WebAuthSession after = new WebAuthSession(appKeyPair, Session.AccessType.APP_FOLDER);
	//after.setAccessTokenPair(was);
	//auth.setAccessTokenPair(was);
	
	String key=auth.getAccessTokenPair().key;
	String secret=auth.getAccessTokenPair().secret;
	String id=(String)session.getAttribute("loginid");
	String sql="UPDATE dropbox SET access_key='"+key+"', access_secret='"+secret+"' where main_id='"+id+"'";
	stmt.executeUpdate(sql);
	DropboxAPI<WebAuthSession> mdb = new DropboxAPI<WebAuthSession>(auth);

	session.setAttribute("Dropbox",mdb);
	session.setAttribute("Dropbox_path","/");
	String url="/connect.jsp";
	response.sendRedirect(url);

	stmt.close();
	conn.close();

}catch(DropboxUnlinkedException e){
	out.println("DropboxUnlinkedException");
	response.sendRedirect("/setting.jsp");
}catch(DropboxException e){
	out.println("DropboxException");
}
%>