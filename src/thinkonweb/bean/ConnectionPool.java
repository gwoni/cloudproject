package thinkonweb.bean;

import java.sql.*;
import javax.sql.*;
import java.util.*;
import org.cloudfoundry.services.*;

public class ConnectionPool {
	private static ConnectionPool cp=null; 
	private Vector pool=null;
	private int initCon=0;
	private int maxCon=0;
	private int users=0;
	private ConnectionPool() {}
	
	private ConnectionPool(int initCon, int maxCon) throws Exception{
		this.initCon=initCon;
		this.maxCon=maxCon;
		
		pool=new Vector();
		for(int i=0 ; i<initCon ; i++){
			pool.add(createConnection());
		}		
	}
	
	public static synchronized ConnectionPool getInstance() throws Exception {
		if(cp==null) {
			cp=new ConnectionPool(4, 20);
		}
		
		return cp;
	}
	
	public synchronized Connection getConnection() throws Exception {
		Connection conn=null;
		
		while((conn=getPooledConnection())==null){
			try{
				wait();
			}catch(InterruptedException ie){
				
			}
		}
		
		users++;
		return conn;
	}
	
	public synchronized void releaseConnection(Connection conn) {
		pool.add(conn);
		
		users--;
		notifyAll();
	}
	
	private Connection getPooledConnection() throws Exception {
		Connection conn=null;
		int size=pool.size();
		
		if(size>0){
			conn=(Connection)(pool.elementAt(0));
			pool.removeElementAt(0);
		}else if(users<maxCon || maxCon==0) {
			conn=createConnection();
		}
		
		return conn;
	}
	
	private Connection createConnection() throws Exception {
		ServiceManager services =ServiceManager.INSTANCE;
		Connection conn = (Connection)services.getInstance(CloudFoundryServices.MYSQL);
		
		System.out.println("==a connection was created!!");
		
		return conn;
	}
}
