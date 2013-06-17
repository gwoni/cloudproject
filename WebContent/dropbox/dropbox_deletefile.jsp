<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "com.dropbox.client2.DropboxAPI.*" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import="com.dropbox.client2.session.*" %>
<%@ page import= "com.dropbox.client2.exception.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%

try{
String filePath =URLDecoder.decode(request.getParameter("filepath"));

DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
mdb.delete(filePath);
response.sendRedirect("/connect.jsp");


}catch(DropboxUnlinkedException e){
	response.sendRedirect("/setting.jsp");
}



%>