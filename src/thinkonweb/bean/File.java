package thinkonweb.bean;

import java.util.Date;

public class File {
	private String fname;
	private int fsize;
	private String fdate;
	private String fpath;
	private String fstorage;
	private String main_id;
	private String parent;
	
	
	public File() {
		fname=null;
		fsize=0;
		fdate=null;
		fpath=null;
		fstorage=null;
		main_id=null;
		parent=null;
		
	}
	public File(String fname,int fsize,String fdate,String fpath ,String fstorage ,String main_id, String parent) {
		this.fname=fname;
		this.fsize = fsize;
		this.fdate=fdate;
		this.fpath = fpath;
		this.fstorage=fstorage;
		this.main_id=main_id;
		this.parent=parent;
	}
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getFsize() {
		return fsize;
	}

	public void setFsize(int fsize) {
		this.fsize = fsize;
	}

	public String getFdate() {
		return fdate;
	}

	public void setFdate(String fdate) {
		this.fdate = fdate;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public String getFstorage() {
		return fstorage;
	}

	public void setFstorage(String fstrorage) {
		this.fstorage = fstrorage;
	}

	public String getMain_id() {
		return main_id;
	}

	public void setMain_id(String main_id) {
		this.main_id = main_id;
	}
	
	public void setparent(String parent){
		this.parent = parent;
	}
	
	public String getparent(){
		 return this.parent;
	}
	
}
