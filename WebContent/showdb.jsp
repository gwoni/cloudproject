<%@ page contentType="text/html; charset=utf-8"%>

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

<%@ page import="thinkonweb.bean.*" %>

<html>

<body>

<%
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	Statement stmt =conn.createStatement();
	
	String msg=null;
	String sql="select * from files";
	
	ResultSet rs=null;
	
	try{
		rs=stmt.executeQuery(sql);
		
		if(!rs.next())
			out.println("111");
		
		while(rs.next()){
			out.println(rs.getString(1));
			out.println(rs.getString(2));
			out.println(rs.getString(3));
			out.println(rs.getString(4));
%>
<br/>
<%
		}		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		rs.close();
		stmt.close();
	}
%>

</body>
</html>