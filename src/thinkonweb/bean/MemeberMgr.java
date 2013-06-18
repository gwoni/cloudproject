package thinkonweb.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import org.cloudfoundry.services.CloudFoundryServices;
import org.cloudfoundry.services.ServiceManager;


public class MemeberMgr {
	public Vector getMemberList() {
		ServiceManager services =ServiceManager.INSTANCE;
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		Vector vecList=new Vector();
		
		try{
			conn=(Connection)services.getInstance(CloudFoundryServices.MYSQL);
			String strQuery="select * from Member";
			stmt =conn.createStatement();
			rs=stmt.executeQuery(strQuery);
			
			while(rs.next()){
				Member member=new Member();
				member.setMain_id(rs.getString("main_id"));
				member.setMain_name(rs.getString("main_name"));
				vecList.add(member);
			}			
		}catch(Exception ex){
			System.out.println("Exception: "+ex);
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(SQLException ex){}
			}
			if(stmt!=null){
				try{
					stmt.close();
				}catch(SQLException ex){}
			}
			if(conn!=null){
				try{
					conn.close();
				}catch(SQLException ex){}
			}
		}
		
		return vecList;
	}
}
