package thinkonweb.bean;

import java.util.Date;
import java.io.Serializable;

public class Member implements java.io.Serializable{
	
	private String id;
	private String name;
	private String password;
	private String email;
	private Date registerDate;


	public String getId(){
	return id;
	}
	public String getName(){
	return name;
	}
	public String getPassword(){
	return password;
	}
	public String getEmail(){
	return email;
	}
	public Date getRegisterDate(){
	return registerDate;
	}

	public void setId(String id){
	this.id=id;
	}
	public void setName(String name){
	this.name=name;
	}
	public void setPassword(String password){
	this.password=password;
	}
	public void setEmail(String email){
	this.email=email;
	}
	public void setRegisterDate(Date registerDate){
	this.registerDate=registerDate;
	}
	
}