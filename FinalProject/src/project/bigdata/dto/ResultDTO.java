package project.bigdata.dto;

public class ResultDTO {
	private int sales;
	private int fc;
	private int fs;
	private int fd;
	private int fhr;
	private String trdar_cd_nm;
	private String svc_induty_cd_nm;
	private String svc_induty_cd;
	private String trdar_cd;
	
	
	
	public ResultDTO(int sales, int fhr, String trdar_cd_nm) {
		super();
		this.sales = sales;
		this.fhr = fhr;
		this.trdar_cd_nm = trdar_cd_nm;
	}
	
	public ResultDTO(int sales, int fc, int fs, int fd, int fhr, String trdar_cd_nm) {
		super();
		this.sales = sales;
		this.fc = fc;
		this.fs = fs;
		this.fd = fd;
		this.fhr = fhr;
		this.trdar_cd_nm = trdar_cd_nm;
	}
	public String getTrdar_cd_nm() {
		return trdar_cd_nm;
	}
	public void setTrdar_cd_nm(String trdar_cd_nm) {
		this.trdar_cd_nm = trdar_cd_nm;
	}
	public String getSvc_induty_cd_nm() {
		return svc_induty_cd_nm;
	}
	public void setSvc_induty_cd_nm(String svc_induty_cd_nm) {
		this.svc_induty_cd_nm = svc_induty_cd_nm;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getFc() {
		return fc;
	}
	public void setFc(int fc) {
		this.fc = fc;
	}
	public int getFs() {
		return fs;
	}
	public void setFs(int fs) {
		this.fs = fs;
	}
	public int getFd() {
		return fd;
	}
	public void setFd(int fd) {
		this.fd = fd;
	}
	public int getFhr() {
		return fhr;
	}
	public void setFhr(int fhr) {
		this.fhr = fhr;
	}
	public String getSvc_induty_cd() {
		return svc_induty_cd;
	}
	public void setSvc_induty_cd(String svc_induty_cd) {
		this.svc_induty_cd = svc_induty_cd;
	}
	public String getTrdar_cd() {
		return trdar_cd;
	}
	public void setTrdar_cd(String trdar_cd) {
		this.trdar_cd = trdar_cd;
	}
	@Override
	public String toString() {
		return "ResultDTO [sales=" + sales + ", fc=" + fc + ", fs=" + fs + ", fd=" + fd + ", fhr=" + fhr
				+ ", trdar_cd_nm=" + trdar_cd_nm + "]";
	}
	
	
}
