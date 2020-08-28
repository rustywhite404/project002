package net.ivyro.zian.board;

public class SubBean {
	private String sub_title;
	private String sub_context;
	
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
	public String getSub_context() {
		return sub_context;
	}
	public void setSub_context(String sub_context) {
		this.sub_context = sub_context;
	}
	
	@Override
	public String toString() {
		return "SubDAO [sub_title=" + sub_title + ", sub_context=" + sub_context + "]";
	}
	
}
