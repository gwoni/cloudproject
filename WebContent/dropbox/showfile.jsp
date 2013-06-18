<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="thinkonweb.bean.*" %>
<%@ page import="com.dropbox.client2.exception.*" %>
<%@ page import="com.dropbox.client2.session.*" %>

<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import= "com.dropbox.client2.DropboxAPI.DeltaEntry" %>
<%@ page import= "com.dropbox.client2.exception.*" %>
<%@ page import= "com.dropbox.client2.jsonextract.*" %>
<%@ page import= "org.json.simple.*" %>

<%@ page import= "java.io.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.util.Date" %>
<%@ page import="java.sql.*,javax.sql.*"%>
<%@ page import="org.cloudfoundry.services.*" %>


<jsp:useBean id="dataQuery" class="thinkonweb.bean.DataQuery"></jsp:useBean>

<%
	DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");

	if(mdb == null){
		
	}else{
		String main_id=(String)session.getAttribute("loginid");
		String dropbox_path=(String)session.getAttribute("Dropbox_path");

		Vector dataVector=dataQuery.getDataList(main_id, dropbox_path);
		
		for(int i=0 ; i<dataVector.size() ; i++){
			Data tempData=(Data)dataVector.elementAt(i);
			
			out.println("<tr>");
			out.println("<td>dropbox</td>");
			out.println("<td>"+tempData.getFname()+"</td>");
			out.println("<td class='td-actions'>");
		    out.println("<a href='javascript:;' class='btn btn-small btn-warning'>");
		    out.println("<i class='btn-icon-only icon-ok'></i></a>");
		    out.println("<a href='javascript:;' class='btn btn-small'>");
		    out.println("<i class='btn-icon-only icon-ok'></i></a></td>");
		    out.println("</tr>");	
		}
	}
%>