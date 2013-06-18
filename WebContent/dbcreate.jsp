<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*"%>
<%@ page import="org.cloudfoundry.services.*" %>

<html>
<body>

<%
	String msg=null;
	String sql="show tables";
	//String sql="CREATE TABLE dropbox(main_id varchar(20), access_key varchar(16), access_secret varchar(16), PRIMARY KEY(main_id)) DEFAULT CHARSET=utf8;";
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	Statement stmt =conn.createStatement();


	
	
<<<<<<< HEAD
	stmt.executeUpdate(sql);
=======
	//stmt.executeUpdate("CREATE TABLE files(file_name varchar(20), file_size bigint(20), file_date varchar(35), file_path varchar(20), file_storage varchar(20) ,main_id varchar(20),parent varchar(20), FOREIGN KEY(main_id) REFERENCES users, PRIMARY KEY(main_id, file_path)) DEFAULT CHARSET=utf8;");
	
		
	

	//stmt.executeUpdate("DROP TABLE files");
>>>>>>> upstream/master
	ResultSet rs=stmt.executeQuery("show tables");
	while(rs.next()){
		out.println("table : " + rs.getString(1) + "<br>");	
	}
	
	
	//while(rs.next()){
	//	out.println("table : " + rs.getString(1) + "<br>");
    //}
	
	//rs=stmt.executeQuery("desc users;");
	
	//while(rs.next()){
	//	out.println("table : " + rs.getString(1) + "<br>");
    //}
	
	rs.close();
	stmt.close();
	conn.close();
	
%>

	쿼리문: <%=sql %><br/>
	쿼리결과: <%=msg %></br>
</body>
</html>


