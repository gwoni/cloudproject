<%@ page contentType="text/html;charset=utf-8" %>

<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.dropbox.client2.DropboxAPI.*" %>
<%@ page import="com.dropbox.client2.DropboxAPI" %>
<%@ page import="com.dropbox.client2.session.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<%

String savePath = application.getRealPath("/file");
DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
if(mdb == null){
	
	response.sendRedirect("/connect.jsp");
}

 int sizeLimit =(int)DropboxAPI.MAX_UPLOAD_SIZE;
 
 MultipartRequest multi = new MultipartRequest(request,savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
 
 File file = multi.getFile("upfile");
 if(file ==null){
	
	 response.sendRedirect("/connect.jsp");
 }
 String fileName = file.getName();
 String Path = (String)session.getAttribute("Dropbox_path");
 Path=Path+fileName;
 long fileSize = file.length();
 
 
 FileInputStream f_in=new FileInputStream(file);
 BufferedInputStream in= new BufferedInputStream(f_in);
 DropboxAPI.UploadRequest fo = mdb.putFileRequest(Path,in,fileSize,null,null);
 fo.upload();
 
 f_in.close();
 in.close();
 file.delete();
 
 response.sendRedirect("/connect.jsp");
 
 

	
%>