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



<% 
	try{
		DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
		DropboxAPI.Account account = mdb.accountInfo();

		String name=account.displayName;
		String path=(String)session.getAttribute("Dropbox_path");


		DropboxAPI.Entry mainlist=mdb.metadata(path,0, null, true, null);
		List<DropboxAPI.Entry> list_0=mainlist.contents;
		
		if(list_0.size()==0)
		{
			out.println("<tr>");
			out.println("<td>dropbox</td>");
			out.println("<td>Storage is Empty</td>");
			out.println("<td class='td-actions'>");
		    out.println("<a href='javascript:;' class='btn btn-small btn-warning'>");
			out.println("<i class='btn-icon-only icon-ok'></i></a>");
	    	out.println("<a href='/dropbox/downloadfile.jsp' class='btn btn-small'>");
	    	out.println("<i class='btn-icon-only icon-ok'></i></a></td>");
	    	out.println("</tr>");
		}else{
		
			for(int i=0;i<list_0.size();i++){
				DropboxAPI.Entry Varsinfo=list_0.get(i);
				String filename=Varsinfo.fileName();
			
				String temp_path=URLEncoder.encode(Varsinfo.path,"euc-kr");
				out.println("<tr>");
				out.println("<td>dropbox</td>");
				out.println("<td>"+filename+"</td>");
				out.println("<td class='td-actions'>");
			    out.println("<a href='/dropbox/dropbox_downloadfile.jsp?filepath="+temp_path+"&filename="+URLEncoder.encode(filename,"euc-kr")+"' class='btn btn-small btn-warning'>");
			    out.println("<i class='btn-icon-only icon-ok'></i></a>");
			    out.println("<a href='/dropbox/dropbox_deletefile.jsp?filepath="+temp_path+"' class='btn btn-small'>");
			    out.println("<i class='btn-icon-only icon-remove'></i></a></td>");
			    out.println("</tr>");
			}
		}	
	}catch(Exception ex){
	ex.printStackTrace();
	}
%>










