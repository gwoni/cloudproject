package thinkonweb.bean;

import java.sql.*;
import java.util.*;
import thinkonweb.bean.*;

public class MemberQuery {

	ConnectionPool pool=null;
	
	public MemberQuery(){
		try{
			pool=ConnectionPool.getInstance();
		}catch(Exception e){
			System.out.println("연결실패");
		}
	}
	
	public void memberInsert(Member member) throws Exception {
		Connection conn=pool.getConnection();
		Statement stat=conn.createStatement();
		String sql="";
		String dropbox_sql="";
		
		try{	
			sql="INSERT INTO users(main_id, main_password, main_name) VALUES('"+member.getMain_id() + "','"+member.getMain_password() + "','" +member.getMain_name() + "');";
			sql=new String(sql.getBytes("8859_1"), "euc-kr");
			
			dropbox_sql="INSERT INTO dropbox(main_id, access_key, access_secret) VALUES('"+member.getMain_id() + "','"+member.getMain_password()+"','" + member.getMain_name() + "');";
			dropbox_sql=sql=new String(sql.getBytes("8859_1"), "euc-kr");
			
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
	
	public void memberDelete(String main_id) throws Exception {
		Connection conn=pool.getConnection();
		Statement stmt1=conn.createStatement();
		Statement stmt2=conn.createStatement();
		
		String sql;
		String dropbox_sql;		
		
		try{
			String drop_id=main_id;
			
			sql="delete from users where main_id='"+drop_id+"';";
					
			sql=new String(sql.getBytes("8859_1"), "euc-kr");
			
			dropbox_sql="delete from dropbox where main_id='"+drop_id+"';";
			dropbox_sql=new String(sql.getBytes("8859_1"), "euc-kr");
			
			
			stmt1.executeUpdate(sql);
			stmt1.executeUpdate(dropbox_sql);
			
			stmt2.executeQuery(sql);
			stmt2.executeQuery(dropbox_sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		stmt1.close();
		stmt2.close();
		pool.releaseConnection(conn);
	}
}
