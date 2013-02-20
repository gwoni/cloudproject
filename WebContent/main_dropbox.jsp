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
<jsp:include page="header.jsp" flush="false" />
<% 


try{

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


DropboxAPI<WebAuthSession> mdb = new DropboxAPI<WebAuthSession>(auth);
DropboxAPI.Account account = mdb.accountInfo();
String name=account.displayName;

DropboxAPI.Entry mainlist=mdb.metadata("/",0, null, true, null);
List<DropboxAPI.Entry> list_0=mainlist.contents;


out.println("User Name : "+name+"님 접속을 환영합니다.");
out.println("\"");

for(int i=0;i<list_0.size();i++)
{
	DropboxAPI.Entry Varsinfo=list_0.get(i);
	String filename=Varsinfo.fileName();
	if(Varsinfo.isDir){
		out.println("<div class='post'>");
		out.println("<h2>"+"fileName : "+filename+"</h2>");
		out.println("<p>date : "+Varsinfo.clientMtime+"</p>");
	    out.println("</div>");
		
	}
	else{
		 
		out.println("<div class='post'>");
		out.println("<h2>"+"fileName : "+filename+"</h2>");
		out.println("<p>date : "+Varsinfo.clientMtime+"</p>");
	    out.println("</div>");

	}
}




}catch(DropboxUnlinkedException e){
	out.println("DropboxUnlinkedException");
}catch(DropboxException e){
	out.println("DropboxException");
}


%>

<jsp:include page="footer.jsp"  />







