package project.bigdata.dto;

public class Dto {
	private String trdar_cd;
	private String svc_induty_cd;
	private String trdar_cd_nm;
	private String svc_induty_cd_nm;
	private String sales;
	private String danger;
	public String getSvc_induty_cd() {
		return svc_induty_cd;
	}
	public Dto(String trdar_cd_nm, String svc_induty_cd_nm, String sales, String danger) {
		super();
		this.trdar_cd_nm = trdar_cd_nm;
		this.svc_induty_cd_nm = svc_induty_cd_nm;
		this.sales = sales;
		this.danger = danger;
	}
	public void setSvc_induty_cd(String svc_induty_cd) {
		this.svc_induty_cd = svc_induty_cd;
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
	
	
	public String getTrdar_cd() {
		return trdar_cd;
	}
	public void setTrdar_cd(String trdar_cd) {
		this.trdar_cd = trdar_cd;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getDanger() {
		return danger;
	}
	public void setDanger(String danger) {
		this.danger = danger;
	}
	
	
}
