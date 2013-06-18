<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import= "com.dropbox.client2.DropboxAPI.*" %>
<%@ page import= "com.dropbox.client2.DropboxAPI" %>
<%@ page import="com.dropbox.client2.session.*" %>
<%@ page import= "com.dropbox.client2.exception.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>

<%

try{
String id = (String)session.getAttribute("loginid");
if(id == null){
	response.sendRedirect("/login.jsp");
}
else{
String path=(String)session.getAttribute("Dropbox_path");
String name=(String)request.getParameter("name");
String create="";
DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
if(mdb == null){
	
	response.sendRedirect("/setting.jsp");
}
else{
List<DropboxAPI.Entry> result = mdb.search(path,name,0,false);

int count=0;
for(int i=0;i<result.size();i++){
	DropboxAPI.Entry temp=result.get(i);
	if(temp.fileName().contains(name)){
		count++;
	}
}
if(count >0){
	name = name +"("+count+")";
}

if(path.equals("/")){
	create=path+name;
	
}
else{
	path=path+"/";
	create=path+name;
	
}

mdb.createFolder(path+name);
response.sendRedirect("/connect.jsp");
}
}
}catch(DropboxUnlinkedException e){
	response.sendRedirect("/setting.jsp");
}
%>