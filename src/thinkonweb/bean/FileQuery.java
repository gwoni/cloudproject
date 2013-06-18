package thinkonweb.bean;

import java.sql.Connection;
import java.sql.Statement;

public class FileQuery {
	ConnectionPool pool=null;
	
	public FileQuery() {
		try{
			pool=ConnectionPool.getInstance();
		}catch(Exception e){
			System.out.println("연결실패");
		}
	}
	
	public void fileInsert(File file) throws Exception {
		Connection conn=pool.getConnection();
		Statement stat=conn.createStatement();
		String sql="";
		String dropbox_sql="";
		
		try{	
			sql="INSERT INTO files(file_name, file_size, file_date, file_path, file_storage, main_id, parent) VALUES('"+file.getFname()+"', '"+file.getFsize()+"', '"+file.getFdate()+"', '"+file.getFpath()+"', '"+file.getFstorage()+"', '"+file.getMain_id()+"', '"+file.getparent()+"');";
			sql=new String(sql.getBytes("8859_1"), "euc-kr");
			
			Statement stmt =conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.executeUpdate(dropbox_sql);
			
			stat.executeQuery(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		stat.close();
		pool.releaseConnection(conn);
	}
	
}
