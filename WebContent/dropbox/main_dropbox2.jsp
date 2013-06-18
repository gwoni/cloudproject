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

<%@ page import="thinkonweb.bean.*" %>

<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.util.List" %>
<%@ page import= "java.awt.*" %>
<%@ page import= "java.net.*" %>

<jsp:useBean id="dataQuery" class="thinkonweb.bean.DataQuery"></jsp:useBean>

<% 
	try{
		DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
		DropboxAPI.Account account = mdb.accountInfo();

		String name=account.displayName;
		String path=(String)session.getAttribute("Dropbox_path");
		
		Vector<Data> dataList=new Vector<Data>();
		String id=(String)session.getAttribute("loginid");


		DropboxAPI.Entry mainlist=mdb.metadata(path,0, null, true, null);
		List<DropboxAPI.Entry> list_0=mainlist.contents;
		
		dataQuery.insertData(dataList);
		
			
			
		
		
		//	insertData Query를 이용하여 자료를 DB에 삽입한다.
		
		Vector<Data> getDataList=new Vector<Data>();
		getDataList=dataQuery.getDataList(id);
		
		if(getDataList.size()==0)
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
		
			for(int i=0 ; i<getDataList.size() ; i++){
				Data data=new Data();
				data=getDataList.get(i);

				out.println("<tr>");
				out.println("<td>dropbox</td>");
				out.println("<td>"+data.getFname()+"</td>");
				out.println("<td class='td-actions'>");
			    out.println("<a href='javascript:;' class='btn btn-small btn-warning'>");
			    out.println("<i class='btn-icon-only icon-ok'></i></a>");
			    out.println("<a href='/dropbox/downloadfile.jsp?filepath="+data.getFpath()+"&filename="+URLEncoder.encode(data.getFname(),"euc-kr")+"' class='btn btn-small'>");
			    out.println("<i class='btn-icon-only icon-ok'></i></a></td>");
			    out.println("</tr>");
			}
		}	
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>










