<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.sql.*,javax.sql.*"%>
<%@page import="org.cloudfoundry.services.*"%>
<html>
<body>
	<%
	String msg=null;
	String sql="SELECT 'hello jspbookdb!' AS msg";
	ServiceManager services =ServiceManager.INSTANCE;
	Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
	Statement stmt =conn.createStatement();
	stmt.executeUpdate("CREATE TABLE posts(post_id bigint(20) auto_increment, post_author varchar(20), post_date datetime, post_title text, post_content longtext ,PRIMARY KEY(post_id))DEFAULT CHARSET=utf8;");
	stmt.executeUpdate("CREATE TABLE users(username varchar(20), password varchar(20), email varchar(40) ,PRIMARY KEY(username))DEFAULT CHARSET=utf8;");
	stmt.executeUpdate("CREATE TABLE comments(cmt_id bigint(20) auto_increment, post_id bigint(20), cmt_author varchar(20), cmt_email varchar(40), cmt_date datetime, cmt_comment longtext  ,PRIMARY KEY(cmt_id))DEFAULT CHARSET=utf8;");
	ResultSet rs= stmt.executeQuery("show tables;");
	while(rs.next()){
	out.println("table : " + rs.getString(1) + "<br>");
    }
	rs.close();
	stmt.close();
	conn.close();
	%>
	쿼리문: <%=sql%><br/>
	쿼리결과: <%=msg%></br>
</body>
</html>


