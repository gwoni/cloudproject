<%@ page contentType="text/html;charset=utf-8" %>

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

<jsp:useBean id="File" class="thinkonweb.bean.File" />
<jsp:useBean id="FileQuery" class="thinkonweb.bean.FileQuery" ></jsp:useBean>

<%

DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");

ServiceManager services =ServiceManager.INSTANCE;
Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
Statement stmt =conn.createStatement();


if(mdb==null){
   
	
 }
else{
	String path=(String)session.getAttribute("Dropbox_path");
	String id=(String)session.getAttribute("loginid");
	String sql = "select file_path,file_size,file_date,file_name  from files where main_id='" + id + "' and file_storage='"+"Dropbox"+" and parent='"+path+"'";

	ResultSet rs=stmt.executeQuery(sql);


	while(rs.next())
	{
		String filename=rs.getString("file_name");

		String temp_path=rs.getString("file_path");
		out.println("<tr>");
		out.println("<td>dropbox</td>");
		out.println("<td>"+filename+"</td>");
		out.println("<td class='td-actions'>");
	    out.println("<a href='javascript:;' class='btn btn-small btn-warning'>");
	    out.println("<i class='btn-icon-only icon-ok'></i></a>");
	    out.println("<a href='javascript:;' class='btn btn-small'>");
	    out.println("<i class='btn-icon-only icon-ok'></i></a></td>");
	    out.println("</tr>");
	
	
	}

	rs.close();

	stmt.close();
	conn.close();
}
%>






