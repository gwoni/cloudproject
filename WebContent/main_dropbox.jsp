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
<jsp:include page="header.jsp"  />
<% 
//try{
	
DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
DropboxAPI.Account account = mdb.accountInfo();
String name=account.displayName;

String path=(String)request.getParameter("path");


DropboxAPI.Entry mainlist=mdb.metadata(path,0, null, true, null);
List<DropboxAPI.Entry> list_0=mainlist.contents;


out.println("User Name : "+name+"님 접속을 환영합니다.");
out.println("\"");


if(!path.equals("/")){
	String parent_path=mainlist.parentPath();
	out.println("<div class='post'>");
	out.println("<h2><a href='/main_dropbox.jsp?path="+parent_path+"'>"+"Go to the Parent Directory</a></h2>");
	//out.println("<p>date : "+Varsinfo.clientMtime+"</p>");
    out.println("</div>");
}
if(list_0.size()==0)
	out.println("<h2>Storage is Empty</h2>");
else{
	
	for(int i=0;i<list_0.size();i++)
	{
		DropboxAPI.Entry Varsinfo=list_0.get(i);
		String filename=Varsinfo.fileName();
		if(Varsinfo.isDir){
			String temp_path=Varsinfo.path;
			out.println("<div class='post'>");
			out.println("<h2><a href='/main_dropbox.jsp?path="+temp_path+"'>"+"DirName : "+filename+"</a></h2>");
			out.println("<p>date : "+Varsinfo.clientMtime+"</p>");
		    out.println("</div>");
			
		}
		else{
			
			java.util.Date a;
			DropboxAPI.DropboxLink filelink=mdb.share(Varsinfo.path);
			out.println("<div class='post'>");
			out.println("<h2><a href='"+filelink.url+"'>"+"fileName : "+filename+"</a></h2>");
			out.println("<p>date : "+Varsinfo.clientMtime+"</p>");
		    out.println("</div>");
	
		}
	}
	
}

//}catch(DropboxUnlinkedException e){
//	out.println("DropboxUnlinkedException");
//}catch(DropboxException e){
//	out.println("DropboxException");
//}


%>

<jsp:include page="footer.jsp"  />







