<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="com.dropbox.client2.session.RequestTokenPair"%>
<%@ page import="com.dropbox.client2.exception.DropboxException" %>
<%@ page import="com.dropbox.client2.session.Session" %>
<%@ page import="com.dropbox.client2.exception.*" %>
<%@ page import="com.dropbox.client2.session.*" %>
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

<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*,javax.sql.*"%>
<%@ page import="org.cloudfoundry.services.*"%>
<%
try{
	final String APP_Key = "jv0xh2qyex8bbuf";
	final String APP_Secret= "izuo5z8eya4pfx8";
	
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	Statement stmt =conn.createStatement();
	String id=(String)session.getAttribute("loginid");
	String sql="select access_key,access_secret from dropbox where main_id='"+id+"'";
	String key=null,secret=null;
	ResultSet rs=stmt.executeQuery(sql);
	WebAuthSession was;
	AppKeyPair appKeyPair;
	while(rs.next()){
		key=rs.getString("access_key");
		secret=rs.getString("access_secret");
	}
	out.println(key+" "+secret);
	if(key==null || secret==null)
	{
		 appKeyPair = new AppKeyPair(APP_Key, APP_Secret);
		 was = new WebAuthSession(appKeyPair, Session.AccessType.APP_FOLDER);
	}
	else{
		appKeyPair = new AppKeyPair(APP_Key, APP_Secret);
		AccessTokenPair aut=new AccessTokenPair(key,secret);
		 was = new WebAuthSession(appKeyPair, Session.AccessType.APP_FOLDER,aut);
	}
	
	out.println(was.isLinked());
	
	if(was.isLinked()==true){
		DropboxAPI<WebAuthSession> mdb = new DropboxAPI<WebAuthSession>(was);
		session.setAttribute("Dropbox",mdb);
		String path="/";
		session.setAttribute("Dropbox_path",path);
		DropboxAPI.Entry mainlist=mdb.metadata("/",0, null, true, null);
		Long total=(Long)session.getAttribute("total");
		total=total+DropboxAPI.MAX_UPLOAD_SIZE;
		Long size=(Long)session.getAttribute("use");
		size=size+mainlist.bytes;
		session.setAttribute("use",size);
		session.setAttribute("total",total);
		String url="/connect.jsp";
		response.sendRedirect(url);
	}
	else{
		was=new WebAuthSession(appKeyPair,Session.AccessType.APP_FOLDER);
		WebAuthInfo info = was.getAuthInfo("http://dockingcloud.cloudfoundry.com/dropbox/connect_dropbox_continue.jsp");
		RequestTokenPair pair=info.requestTokenPair;
		session.setAttribute("Token",pair);
		session.setAttribute("WebSession",was);
		String url=info.url;
		response.sendRedirect(url);
		//out.println(url);
	}
	
	
	stmt.close();
	conn.close();
	
	
}catch(DropboxUnlinkedException e){
	out.println("DropboxUnlinked Exception");
}catch(DropboxException e){
	out.println("DropboxException");
}
	
	


  %>



