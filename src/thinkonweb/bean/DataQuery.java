package thinkonweb.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import org.cloudfoundry.services.*;

public class DataQuery {
	ServiceManager services;
	Connection conn;
	
	public DataQuery() {
		try{
			services=ServiceManager.INSTANCE;
			conn=(Connection)services.getInstance(CloudFoundryServices.MYSQL);
		}catch(Exception e){
			System.out.println("연결실패");
		}
	}
	
	public void insertData(Vector<Data> dataList) throws Exception {		
		Statement stat1=conn.createStatement();
		Statement stat2=conn.createStatement();
		
		String ID="";
		String sql="";
		String dropbox_sql="";
		
		String fPath="";
		
		ResultSet rs1=null;
		
		Vector<Data> strData=new Vector<Data>();
		
		Data IDdata=(Data)dataList.get(0);
		ID=IDdata.getMain_id();
		
		try{
			for(int i=0 ; i<dataList.size() ; i++){
				Data data=(Data)dataList.get(i);
				
				sql="select file_path from files where main_id = "+ID;
				rs1=stat1.executeQuery(sql);
				

				dropbox_sql="inserejkwoijfowejif";

				
				
		//				dropbox_sql=
			//					"INSERT INTO files(file_name, file_size, file_date, file_path, file_storage, main_id, parent) VALUES('"
			//			+data.getFname()+"', '"+data.getFsize()+"', '"+data.getFdate()+"', '"+data.getFpath()+"', '"
				//						+data.getFstorage()+"', '"+data.getMain_id()+"', '"+data.getParent()+"');";
						
						stat2.executeQuery(dropbox_sql);
				
			}	
		}catch(Exception ex){
			ex.printStackTrace();
		}
		rs1.close();
		
		stat1.close();
		stat1.close();
	}
	
	public Vector<Data> getDataList(String main_id) throws Exception {
		Statement stat=conn.createStatement();
		String sql="";
		
		Vector<Data> dataList=new Vector<Data>();
		
		ResultSet rs = null;
		
		try{
			sql="select * from files where main_id='"+main_id+"'";
			rs=stat.executeQuery(sql);

			while(rs.next())
			{
				Data vecData=new Data();
				
				vecData.setFname(rs.getString("file_name"));
				vecData.setFsize(rs.getInt("file_size"));
				vecData.setFdate(rs.getString("file_date"));
				vecData.setFpath(rs.getString("file_path"));
				vecData.setFstorage(rs.getString("file_strorage"));
				vecData.setMain_id(rs.getString("main_id"));
				vecData.setParent(rs.getString("parent"));
				
				dataList.add(vecData);
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			rs.close();
			stat.close();
		}
		
		return dataList;		
	}
}
