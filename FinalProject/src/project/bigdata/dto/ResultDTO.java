package project.bigdata.dto;

public class ResultDTO {
	private String trdar_cd;
	private String trdar_cd_nm;
	private String svc_induty_cd_nm;
	private String svc_induty_cd;
	private int clsbiz_rt;
	private int danger;
	private int avg_sales;
	private int sales_degree;
	
	
	
	public ResultDTO() {
		super();
	}



	public ResultDTO(String trdar_cd, String trdar_cd_nm, int danger, int sales_degree) {
		super();
		this.trdar_cd = trdar_cd;
		this.trdar_cd_nm = trdar_cd_nm;
		this.danger = danger;
		this.sales_degree = sales_degree;
	}
	
	
	
	public ResultDTO(String trdar_cd) {
		super();
		this.trdar_cd = trdar_cd;
	}



	public String getTrdar_cd() {
		return trdar_cd;
	}
	public void setTrdar_cd(String trdar_cd) {
		this.trdar_cd = trdar_cd;
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
	public String getSvc_induty_cd() {
		return svc_induty_cd;
	}
	public void setSvc_induty_cd(String svc_induty_cd) {
		this.svc_induty_cd = svc_induty_cd;
	}
	public int getClsbiz_rt() {
		return clsbiz_rt;
	}
	public void setClsbiz_rt(int clsbiz_rt) {
		this.clsbiz_rt = clsbiz_rt;
	}
	public int getDanger() {
		return danger;
	}
	public void setDanger(int danger) {
		this.danger = danger;
	}
	public int getAvg_sales() {
		return avg_sales;
	}
	public void setAvg_sales(int avg_sales) {
		this.avg_sales = avg_sales;
	}
	public int getSales_degree() {
		return sales_degree;
	}
	public void setSales_degree(int sales_degree) {
		this.sales_degree = sales_degree;
	}
	
	
	

}
