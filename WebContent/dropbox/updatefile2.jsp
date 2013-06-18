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
<%@ page import="thinkonweb.bean.*" %>

<jsp:useBean id="dataQuery" class="thinkonweb.bean.DataQuery" />

<%
	DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
	
	Vector<Data> dataList=new Vector<Data>();
	String id=(String)session.getAttribute("loginid");
	
	if(mdb==null){
		
	}else{
		String path=(String)session.getAttribute("Dropbox_path");
		DropboxAPI.Entry mainlist=mdb.metadata(path,0, null, true, null);
		
		if(!mainlist.isDir)
		{
			
		}else{
			List<DropboxAPI.Entry> list_0=mainlist.contents;
			List<Integer> num=new ArrayList<Integer>();
			
			for(int i=0 ; i<list_0.size() ; i++){
				DropboxAPI.Entry now=list_0.get(i);
				Data upData;
				
				upData.setFname(now.fileName());
				upData.setFsize((int)now.bytes);
				upData.setFdate(now.modified);
				upData.setParent(now.parentPath());
				upData.setFstorage("Dropbox");
				upData.setMain_id(id);
				
				dataList.add(upData);
			}
			
			dataQuery.insertData(dataList);
		}
	}
 %>