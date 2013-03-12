package thinkonweb.bean;

import java.util.Date;
import java.io.Serializable;

public class Member implements java.io.Serializable{
	
	private String main_id;
	private String main_name;
	private String main_password;
	private Date main_date;
	public Member(){
		
	}
	
	
	public String getMain_id() {
		return main_id;
	}
	public void setMain_id(String main_id) {
		this.main_id = main_id;
	}
	public String getMain_name() {
		return main_name;
	}
	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}
	public String getMain_password() {
		return main_password;
	}
	public void setMain_password(String main_password) {
		this.main_password = main_password;
	}
	public Date getMain_date() {
		return main_date;
	}
	public void setMain_date(Date main_date) {
		this.main_date = main_date;
	}	
}