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

<%

DropboxAPI<WebAuthSession> mdb=(DropboxAPI<WebAuthSession>)session.getAttribute("Dropbox");
ServiceManager services =ServiceManager.INSTANCE;
Connection conn = (Connection) services.getInstance(CloudFoundryServices.MYSQL);
Statement stmt =conn.createStatement();

	File file=new File();
	thinkonweb.bean.FileQuery filequery=new thinkonweb.bean.FileQuery();
	if(mdb==null){
	
   ;
   
 }
else{
	
	String path=(String)session.getAttribute("Dropbox_path");
	DropboxAPI.Entry mainlist=mdb.metadata(path,0, null, true, null);

	if(!mainlist.isDir)
	{
		;
	}
	else{

		List<DropboxAPI.Entry> list_0=mainlist.contents;
		List<Integer> num=new ArrayList<Integer>();
		String id=(String)session.getAttribute("loginid");
		String sql = "select file_path from files where main_id='" + id + "' and file_storage='"+"Dropbox"+" and parent='"+mainlist.path+"'";
		ResultSet rs=stmt.executeQuery(sql);

		while(rs.next()){
			for(int i=0;i<list_0.size();i++)
			{
				DropboxAPI.Entry now=list_0.get(i);
				if(rs.getString("file_path").equals(now.path)){
					String upsql="UPDATE files SET file_name='"+now.fileName()+"', file_size='"+(int)now.bytes+"', file_date='"+now.modified+"', parent='"+now.parentPath()+"' where main_id='"+id+"' and file_path='"+now.path+"'";
					stmt.executeUpdate(upsql);
					num.add(i);
					//stmt.executeUpdate("CREATE TABLE files(file_name varchar(20), file_size bigint(20), file_date datetime, file_path varchar(20), file_storage varchar(20) ,main_id varchar(20),parent varchar(20), FOREIGN KEY(main_id) REFERENCES users, PRIMARY KEY(main_id, file_path)) DEFAULT CHARSET=utf8;");
				}
			}
		}

		for(int i=0;i<list_0.size();i++)
		{
			DropboxAPI.Entry now=list_0.get(i);
			if(!num.contains(i))
			{
				now=list_0.get(i);
				file.setFname(now.fileName());
				file.setFsize((int)now.bytes);
				file.setFdate(now.modified);
				file.setFpath(now.path);
				file.setparent(now.parentPath());
				file.setFstorage("Dropbox");
				file.setMain_id(id);
				filequery.fileInsert(file);
			}
	
		}


		rs.close();
		stmt.close();
		conn.close();

	
	}
}
 %>