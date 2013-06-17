<%@ page contentType="application/download;charset=utf-8" %>
<%@ page import= "com.dropbox.client2.DropboxAPI.*" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import="com.dropbox.client2.session.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<% 


 //String fileName = "tomcat.gif";


 String filePath =URLDecoder.decode(request.getParameter("filepath"));
 
 filePath= new String(filePath.getBytes("8859_1"), "EUC-KR");

 String fileName=URLDecoder.decode(request.getParameter("filename"));
 fileName=new String(fileName.getBytes("8859_1"), "EUC-KR");
 DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");

 
 fileName=new String(fileName.getBytes("EUC-KR"), "8859_1");
 //아래처럼 attachment 를 사용하면 브라우저는 무조건 다운로드 창을 띄우고 파일명을 보여준다.
 String vers=request.getHeader("User-Agent");
 if(vers.indexOf("MSIE 5.5")>-1){
	 response.setContentType("text/html; charset=EUC_KR");
	 response.setHeader("Content-Type","doesn/matter");
 response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
 
 }
 else{
	 response.setContentType("text/html; charset=EUC_KR");
	 response.setHeader("Content-Type","application/octet-stream");
 response.setHeader("Content-Disposition", "attachment;filename="+fileName+";");
	 
 }
 response.setHeader("Content-Transfer-Encoding", "binary;");
 


//String path="C:\\Download\\"+fileName;
// File file = new File(path);
//if(!file.exists())
//	 file.createNewFile();


  System.out.println(filePath);
 DropboxInputStream din=mdb.getFileStream(filePath, null);

 
// FileOutputStream outputStream = new FileOutputStream(file);
 BufferedOutputStream fw=new BufferedOutputStream(response.getOutputStream());
 din.copyStreamToOutput(fw, null);
 
 
 
fw.close();
 
din.close();
//outputStream.close();
 

%>